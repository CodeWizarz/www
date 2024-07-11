# Wrangler by Cloudflare

Wrangler is a CLI for building with Cloudflare developer products. You can use it to manage Workers KV, R2
buckets & objects, secrets and for deploying workers, which is what we mainly use it for.

## Setup

1. Run `npm install` locally to install the necessary packages to run wrangler.
1. Export `CLOUDFLARE_API_TOKEN` with a token that has access to workers, KV, etc in the zone you're targeting:

   ```sh
   export CLOUDFLARE_API_TOKEN=xxx
   ```

1. Trigger the desired `npx` commands below.

## Running in development mode

You can run in development mode with local resources (ie. temporary KV local store using SQLite):

```sh
npx wrangler dev -e review --host add-cloudflare-wrangler.about-cf.gitlab-review.app
```

... but it's more useful to run in development mode with `--remote`, which uses remote resources and data stored on Cloudflare's network. This will use
the `preview_id` KV namespace:

```sh
npx wrangler dev --remote -e review --host add-cloudflare-wrangler.about-cf.gitlab-review.app
```

The `--host` argument is required to override the default host of the site name (`about-cf.gitlab-review.app`).

Any request you make to `http://127.0.0.1:8787` will be as if you were making the request to `https://add-cloudflare-wrangler.about-cf.gitlab-review.app`.

Using `--remote` is extremely useful for testing redirects locally!

## Deployment

To deploy, you need to run a command like the following:

```sh
npx wrangler deploy -e review
```

## Links

For more info on how `about.gitlab.com` (and the review app) works, head to: <https://gitlab.com/gitlab-com/runbooks/-/blob/master/docs/uncategorized/about-gitlab-com.md>.
