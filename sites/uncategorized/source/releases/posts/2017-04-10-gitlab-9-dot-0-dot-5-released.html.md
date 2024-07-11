---
title: "GitLab Patch Release: 9.0.5"
author: James Lopez
author_gitlab: jameslopez
author_twitter: jlopezofficial
categories: releases
description: "GitLab 9.0.5 patch release resolves a number of regressions and bugs in 9.0"
---

Today we're releasing version 9.0.5 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in [this month's 9.0 release](/releases/2017/03/22/gitlab-9-0-released/).

Please read on for more details.

<!-- more -->

- **CE/EE:** Handle SSH keys that have multiple spaces between each marker ([!10466])
- **CE/EE:** Disable invalid service templates ([!10339])
- **CE/EE:** Fixed issue boards having a vertical scrollbar ([!10312])
- **CE/EE:** Add shortcuts and counters to MRs and issues in navbar ([!10497])
- **EE:** Return 404 instead of a 500 error on API status endpoint if Geo tracking DB is not enabled ([!1571])
- **EE:** Reset container width when switching to pipelines MR tab ([!1528])
- **Omnibus GitLab:** Added quotes to GITLAB_SKIP_PG_UPGRADE ([!1452])
- **Omnibus GitLab:** Updated documentation for external PostgreSQL usage ([!1438])
- **Omnibus GitLab:** Fix AWS build errors ([!1430])
- **Omnibus GitLab:** Build SLES 12 EE package at the same time as others ([!1444])

[!10466]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10466
[!10339]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10339
[!10312]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10312
[!10497]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10497
[!1571]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1571
[!1528]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1528
[!1452]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1452
[!1438]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1438
[!1430]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1430
[!1444]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1444

## Upgrade barometer

This version does not require downtime. It includes a single migration that
disables invalid service templates.

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
