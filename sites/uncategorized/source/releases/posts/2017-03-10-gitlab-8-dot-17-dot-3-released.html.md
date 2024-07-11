---
title: "GitLab Patch Release: 8.17.3"
author: Felipe Artur
author_gitlab: felipe_artur
author_twitter: FelipeArtur
categories: releases
description: "GitLab 8.17.3 patch release resolves a number of regressions and bugs in 8.17"
---

Today we're releasing version 8.17.3 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in the [last month's 8.17 release](/releases/2017/02/22/gitlab-8-17-released/).

Please read on for more details.

<!-- more -->

- **CE/EE:** Fix the redirect to custom home page URL. ([!9518])
- **CE/EE:** Fix broken migration when upgrading straight to 8.17.1. ([!9613])
- **CE/EE:** Make projects dropdown only show projects you are a member of. ([!9614])
- **CE/EE:** Fix creating a file in an empty repository using the API. ([!9632])
- **CE/EE:** Don't copy tooltip when copying GFM.([!9563])
- **CE/EE:** Fix cherry-picking or reverting through an MR.([!9640])

[!9518]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9518
[!9613]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9613
[!9614]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9614
[!9632]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9632
[!9563]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9563
[!9640]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9640

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`
file](http://doc.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/pricing/).

Access to GitLab Enterprise Edition is granted by a [subscription](/stages-devops-lifecycle/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
