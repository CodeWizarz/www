## Overview

With the evolution of `about.gitlab.com`, paths are becoming obsolete or are being
moved to other locations. For some of those paths we want to configure 301 HTTP
redirects. 301 redirects are managed using a YAML config file which can be found
in this repo under [`data/redirects.yml`](/data/redirects.yml). This YAML file
is read by an automated script which configures `about.gitlab.com`.

Here's a snippet from the YAML file:

```yaml
- sources: /pdfs/resources/gitlab-scaled-ci-cd-whitepaper.pdf
  target: /resources/whitepaper-scaled-ci-cd/
  comp_op: '='
- sources:
    - /webcast/gitlab-enterprise-demo
    - /eep-demo
  target: /webcast/monthly-release/
  comp_op: ^~
- sources: /roles/
  target: /job-families/
  comp_op: '~'
```

UTMs should not be used, for sources or target URLs. Including a UTM will cause a redirect to fail.

Any pages moved with active campaigns need to use regex redirects to maintain UTM setup and avoid sending traffic to pages that 404.

## Target types

The target field in the YAML file can contain two types of values: URIs that are
appended to the local server hostname and external URLs. The criteria for differentiating
between the two are the first four characters of the target field, i.e. if it
starts with `http`, then it will be treated as an external URL, if not, it will
be appended to the request's host value.

### local server

For example, `target: /resources/` will result in a redirection to `https://about.gitlab.com/resources/`.

### external URLs

For example, `target: https://docs.gitlab.com/ee/user/gitlab_com/` will result
in a redirection to `https://docs.gitlab.com/ee/user/gitlab_com/`.

## Comparison operators

You can use three comparison operators when configuring redirects. They are
described in detail below.

### exact match `=`

`=` will create a redirect that requires the user's request to match exactly the expression in `sources`.

For example, if a user clicks on a link that points to the following address or
types in their browser: `https://about.gitlab.com/pdfs/resources/gitlab-scaled-ci-cd-whitepaper.pdf`,
our website will return a 301 redirect which tells the browser to go to
`https://about.gitlab.com/resources/whitepaper-scaled-ci-cd/` instead. If the user
goes to `https://about.gitlab.com/pdfs/resources/` or
`https://about.gitlab.com/pdfs/resources/gitlab-scaled-ci-cd-whitepaper` nothing
will happen (they might get a 404 error).

### literal regex `^~`

`^~` creates a redirect that is based on very simple regex expressions
(literal regex expressions). These expressions are evaluated against the beginning
of the request path. As soon as a match is found, the redirect happens, which
means that if there is a better match below, it will not be evaluated.

For example, when a user goes to `https://about.gitlab.com/webcast/gitlab-enterprise-demo`
they will be redirected to `https://about.gitlab.com/eep-demo`. If a user goes to
`https://about.gitlab.com/webcast/gitlab-enterprise-demo/2019-03-29`, they will
be redirected to `https://about.gitlab.com/eep-demo` (`/2019-03-29` will be ignored).
When a user goes to `https://about.gitlab.com/other/webcast/gitlab-enterprise-demo`,
nothing will happen.

### regex `~`

`~` is used for more complex regex expressions. The script that reads the YAML
file will create redirects that will try to match at the beginning of the path
and will append anything after the match to the target URL. In simple words,
they will "replace" part of the path.

When using `~` use a single source URL with a closing slash. For example, `/handbook/marketing/revenue-marketing/digital-marketing-programs/digital-marketing-management/`, not `/handbook/marketing/revenue-marketing/digital-marketing-programs/digital-marketing-management`

For example, `https://about.gitlab.com/roles/engineering/site-reliability-engineer/`
will be redirected to `https://handbook.gitlab.com/job-families/engineering/site-reliability-engineer/`.

## Workflow/testing

In order to add or delete a redirect you should follow the GitLab flow,
i.e. create a branch from master and use it for development. Once you're happy
with your change, merge it to master. Here's an example workflow:

1. Branch from master of this repo.
1. On your branch, edit `data/redirects.yml`, git add, commit, push.
1. In the web UI, go to the pipeline created for your commit and trigger the
   manual step called `apply-redirects-review`.
1. You can verify your redirect by using a web browser or curl:

   ```bash
   curl -D - https://<branch-name>.about.gitlab-review.app/<old-url>

   HTTP/1.1 301 Moved Permanently
   Server: Varnish
   Retry-After: 0
   Location: https://<branch-name>.about.gitlab-review.app/<new-url>
   Content-Length: 0
   Accept-Ranges: bytes
   Date: Thu, 28 Mar 2019 14:50:50 GMT
   Via: 1.1 varnish
   Connection: close
   X-Served-By: cache-ams21031-AMS
   X-Cache: HIT
   X-Cache-Hits: 0
   X-Timer: S1553784651.537614,VS0,VE1
   ```

   Notice the return code is 301, which confirms the redirect took place, and server
   is Varnish which confirms the redirect happened on Fastly (our CDN) and
   Location is the desired target URL.

1. You might need to go through a few iterations until you get your redirects just right.
1. So far, nothing has changed on `about.gitlab.com`. After you're happy with your
   change, submit a merge request and when it's approved, merge it to master.
1. GitLab CI is configured to automatically trigger an `apply-redirects-prod` job
   for commits on master. In other words, `data/redirects.yml` from the master
   branch is automatically applied to `about.gitlab.com`.
