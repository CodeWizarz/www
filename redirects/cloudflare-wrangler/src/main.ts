import { Redirects } from './redirects';
import redirectsYaml from '../../../data/redirects.yml';
import yaml from 'js-yaml';

declare const DEBUG: boolean;

export interface Env {
  REDIRECTS: KVNamespace;
  ENVIRONMENT: string;
  BUCKET: string;
  DEFAULT_CACHE_TTL: number;
}

const DEFAULT_CACHE_TTL = 60;

function needsEarlyRedirect(clientRequestURL: URL, clientRequest: Request): boolean {
  const { pathname, hostname } = clientRequestURL;

  // If hostname starts with "www.", redirect minus this part
  if (hostname.startsWith('www.')) {
    clientRequestURL.hostname = hostname.slice(4);
    return true;
  }

  // Redirect paths ending in /index/? to the same path minus this part
  if (pathname.match(/\/index\/?$/)) {
    clientRequestURL.pathname = pathname.replace(/\/index\/?$/, '/');
    return true;
  }

  // If URL ends with `/index.html` then redirect to the same path minus the `/index.html`
  if (pathname.endsWith('/index.html')) {
    clientRequestURL.pathname = pathname.replace(/\/index.html$/, '/');
    return true;
  }

  // Redirect requests from China to the Chinese version of the site
  if (clientRequest.cf?.country === 'CN' && pathname.startsWith('/install')) {
    clientRequestURL.hostname = 'about.gitlab.cn';
    return true;
  }

  return false;
}

function updateClientHeaders(headers: Headers, origin: string | null): void {
  headers.append('Vary', 'Origin');

  if (origin && /^https?:\/\/about\.gitlab\.com$/.test(origin)) {
    headers.set('Access-Control-Allow-Origin', origin);
  }
}

export default {
  async fetch(clientRequest: Request, env: Env, ctx: ExecutionContext): Promise<Response> {
    const clientRequestURL = new URL(clientRequest.url);
    const { pathname, search, hostname } = clientRequestURL;

    if (needsEarlyRedirect(clientRequestURL, clientRequest)) {
      return Response.redirect(clientRequestURL.toString(), 301);
    }

    let redirects;
    let basePath;

    if (env.ENVIRONMENT === 'review') {
      // Prefix path with subdomain for review app
      const subdomain = hostname.split('.', 1)[0];
      const originPathPrefix = `/${env.BUCKET}/${subdomain}`;
      basePath = originPathPrefix;

      // Check if we have a redirect key for this MR
      if (env.REDIRECTS) {
        const mrRedirects = await env.REDIRECTS.get(subdomain);

        if (mrRedirects !== null) {
          if (DEBUG) {
            console.debug(`Using redirects from KV key '${subdomain}' for ${clientRequest.url}...`);
          }

          redirects = new Redirects(yaml.load(mrRedirects));
        }
      }

      let path = pathname;
      if (path.endsWith('/')) {
        // eg: / => /index.html
        // eg: /get-started/ => /get-started/index.html
        path += 'index.html';
      } else if (/^(.*)\/([^.]+)$/.test(path)) {
        // eg: /search => /search/index.html
        path += '/index.html';
      }

      clientRequestURL.pathname = `${originPathPrefix}${path}`;
    }

    if (!redirects) {
      if (DEBUG) {
        console.debug(`Using redirects from the worker for ${clientRequest.url}...`);
      }
      redirects = new Redirects(yaml.load(redirectsYaml));
    }

    let redirect = redirects.getExactMatch(pathname, `https://${hostname}`);
    if (redirect) {
      if (DEBUG) {
        console.debug(`FOUND - exact match redirect for '${pathname}' => redirecting to: ${redirect}`);
      }

      return Response.redirect(redirect, 301);
    }

    redirect = redirects.getStartsWithMatch(pathname, hostname, search, `https://${hostname}`);
    if (redirect) {
      if (DEBUG) {
        console.debug(`FOUND - 'starts with' regex match for '${pathname}' => redirecting to: ${redirect}`);
      }
      return Response.redirect(redirect, 301);
    }

    redirect = redirects.getAppendMatch(pathname, hostname, search, `https://${hostname}`);
    if (redirect) {
      if (DEBUG) {
        console.debug(`FOUND - 'append' regex match for '${pathname}' => redirecting to: ${redirect}`);
      }
      return Response.redirect(redirect, 301);
    }

    // Add trailing slash if needed (if there is no query string)
    if (search === '' && /\/[^./]+$/.test(pathname)) {
      if (DEBUG) {
        console.debug(`Missing trailing slash => redirecting to: ${clientRequest.url}/`);
      }
      return Response.redirect(`${clientRequest.url}/`, 301);
    }

    const cache = caches.default;
    const cacheKey = new Request(clientRequestURL.toString(), clientRequest);

    const cacheResponse = await cache.match(cacheKey);
    if (cacheResponse) {
      if (DEBUG) {
        console.log(`CACHE HIT: ${clientRequest.url}`);
      }

      const clientResponse = new Response(cacheResponse.body, cacheResponse);
      updateClientHeaders(clientResponse.headers, clientRequest.headers.get('Origin'));

      return clientResponse;
    } else {
      if (DEBUG) {
        console.log(`CACHE MISS: ${clientRequest.url} -- fetching from origin`);
      }

      const beResponseRaw = await fetch(clientRequestURL, {
        cf: {
          cacheEverything: true,
          cacheTtlByStatus: {
            '200-299': env.DEFAULT_CACHE_TTL || DEFAULT_CACHE_TTL,
            404: 1,
            '500-599': 0,
          },
        },
        redirect: 'manual',
        headers: clientRequest.headers,
      });
      const beResponse = new Response(beResponseRaw.body, beResponseRaw);

      if (beResponse.status === 404 && env.ENVIRONMENT === 'review') {
        clientRequestURL.pathname = `${basePath}/404.html`;

        if (DEBUG) {
          console.debug(`Fetching 404 page: ${clientRequestURL.toString()}`);
        }

        const fetchNotFound = await fetch(clientRequestURL);

        return new Response(fetchNotFound.body, {
          status: beResponse.status,
          statusText: beResponse.statusText,
          headers: fetchNotFound.headers,
        });
      }

      if (DEBUG) {
        console.debug(`Received ${beResponse.status} from the origin`);
      }

      updateClientHeaders(beResponse.headers, clientRequest.headers.get('Origin'));

      return beResponse;
    }
  },
};
