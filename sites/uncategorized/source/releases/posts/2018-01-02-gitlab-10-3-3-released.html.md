---
title: "GitLab Patch Release: 10.3.3"
categories: releases
author: Oswaldo Ferreira
author_gitlab: oswaldo
author_twitter: olsfer
description: "GitLab 10.3.3 patch release resolves a number of regressions and bugs in 10.3.0"
tags: patch releases
---

Today we are releasing version 10.3.3 for GitLab Community Edition (CE) and Enterprise Editions (EES, EEP).

This version resolves a number of regressions and bugs in
[this month's 10.3.0 release](/releases/2017/12/22/gitlab-10-3-released/).

<!-- more -->

## Bug fixes for Community and Enterprise Editions

- **CE/EES/EEP:** Fix 404 errors after a user edits an issue description and solves the reCAPTCHA ([!16167])
- **CE/EES/EEP:** Fix links to old commits in merge request comments ([!16152])
- **CE/EES/EEP:** Gracefully handle orphaned write deploy keys in /internal/post_receive ([!16127])
- **CE/EES/EEP:** Unmark Gitaly features as OPT_OUT until the gRPC proxy issue is fixed ([!16155])

[!16167]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16167
[!16152]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16152
[!16127]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16127
[!16155]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16155

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Editions

Interested in GitLab Enterprise Editions? Check out the [features exclusive to
EE](/pricing/).

Access to GitLab Enterprise Editions is granted by a [subscription](/stages-devops-lifecycle/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
