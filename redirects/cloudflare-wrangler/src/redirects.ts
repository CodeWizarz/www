interface Redirect {
  sources: string | Array<string>;
  comp_op: string;
  target: string;
}

function absoluteUrl(redirect: string, prefix: string): string {
  if (!redirect.startsWith('http')) {
    return `${prefix}${redirect}`;
  }

  return redirect;
}

export class Redirects {
  private exactMatchRedirects = new Map<string, string>();
  private startsWithRedirects = new Array<StartsWithRedirect>();
  private appendRedirects = new Array<AppendRedirect>();

  constructor(redirects: Array<Redirect>) {
    for (const redirect of redirects) {
      redirect.sources = [redirect.sources].flat();

      switch (redirect.comp_op) {
        // Exact match
        case '=':
          for (const source of redirect.sources) {
            this.exactMatchRedirects.set(source, redirect.target);
          }
          break;

        // [EXAMPLE] source: /source => target: /destination
        // [RESULT]  redirects /source<anything> to /destination
        case '^~':
          for (const source of redirect.sources) {
            this.startsWithRedirects.push(new StartsWithRedirect(source, redirect.target));
          }
          break;

        // [EXAMPLE] source: /2011/ => target: /blog/2011/
        // [RESULT]  redirects /2011/<anything> to /blog/2011/<anything>
        case '~':
          for (const source of redirect.sources) {
            this.appendRedirects.push(new AppendRedirect(source, redirect.target));
          }
          break;

        default:
          console.log(`Unsupported comparison operator: ${redirect.comp_op}`);
      }
    }

    if (DEBUG) {
      console.debug(
        `Loaded: ${this.exactMatchRedirects.size} exact match + ${this.startsWithRedirects.length} starts with + ${this.appendRedirects.length} append redirects`
      );
    }
  }

  public getExactMatch(path: string, prefix: string): string {
    const redirect = this.exactMatchRedirects.get(path) || '';
    if (redirect) {
      return absoluteUrl(redirect, prefix);
    }

    return redirect;
  }

  public getStartsWithMatch(path: string, hostname: string, search: string, prefix: string): string {
    for (const redirect of this.startsWithRedirects) {
      const match = redirect.match(path);
      if (match) {
        return absoluteUrl(redirect.destination(match, hostname, search), prefix);
      }
    }

    return '';
  }

  public getAppendMatch(path: string, hostname: string, search: string, prefix: string): string {
    for (const redirect of this.appendRedirects) {
      const match = redirect.match(path);
      if (match) {
        return absoluteUrl(redirect.destination(match, hostname, search), prefix);
      }
    }

    return '';
  }
}

abstract class BaseRedirect {
  source: string;
  target: string;

  constructor(source: string, target: string) {
    this.source = source;
    this.target = target;
  }

  abstract match(path: string): RegExpMatchArray | null;
  abstract destination(match: RegExpMatchArray, hostname: string, search: string): string;
}

export class StartsWithRedirect extends BaseRedirect {
  match(path: string): RegExpMatchArray | null {
    return path.match(`^${this.source}`);
  }

  destination(match: RegExpMatchArray, hostname: string, search: string): string {
    return `${this.target}${search}`;
  }
}

export class AppendRedirect extends BaseRedirect {
  match(path: string): RegExpMatchArray | null {
    return path.match(`^${this.source}(.*)`);
  }

  destination(match: RegExpMatchArray, hostname: string, search: string): string {
    return `${this.target}${match[1]}${search}`;
  }
}
