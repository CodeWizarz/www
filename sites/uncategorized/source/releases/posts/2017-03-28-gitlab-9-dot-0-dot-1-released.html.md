---
title: "GitLab Patch Release: 9.0.1"
author: DJ Mountney
author_gitlab: twk3
author_twitter: twk3
categories: releases
description: "GitLab 9.0.1 patch release resolves a number of regressions and bugs in 9.0"
---

Today we're releasing version 9.0.1 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in [this month's 9.0 release](/releases/2017/03/22/gitlab-9-0-released/).

Please read on for more details.

<!-- more -->

- **CE/EE:** Fix empty clones when Gitaly process is not running. ([!145])
- **CE/EE:** Resolve "404 when requesting build trace". ([!9759])
- **CE/EE:** Simplify projects, merge requests search queries. ([!10053])
- **CE/EE:** Fix after_script processing for Runners APIv4. ([!10185])
- **CE/EE:** Fix escaped html appearing in milestone page. ([!10224])
- **CE/EE:** Fix bug that caused jobs that already had been retried to be retried again. ([!10249])
- **CE/EE:** Allow filtering by all started milestones. ([!9938])
- **CE/EE:** Allow sorting by due date and priority. ([!9938])
- **CE/EE:** Fixed branches pagination not displaying. ([!10145])
- **CE/EE:** Fixed filtered search not working in IE. ([!10149])
- **CE/EE:** Optimize labels finder query when searching for a project with a group. ([!10248])
- **EE:** Fixed issues not getting milestone on an issue board with associated milestone. ([!1445])
- **EE:** Fix failing Elasticsearch migration. ([!1453])
- **EE:** Allow downgrade when no users were added in previous period. ([!1490])
- **Omnibus GitLab:** Allow configuration of prepared statement caching in Rails. ([!1414])
- **Omnibus GitLab:** Default redis Prometheus exporter to off if redis is not managed locally. ([!1428])
- **Omnibus GitLab:** Default postgres Prometheus exporter to off if postgres is not managed locally. ([!1428])
- **Omnibus GitLab:** Default pages http to https redirect to off. ([!1425])
- **Omnibus GitLab:** Make HSTS easier to configure, and the docs on it accurate. ([!1423])
- **Omnibus GitLab:** Move the automatic PG Upgrade to happen after migrations have run. ([!1429])


[!145]: https://gitlab.com/gitlab-org/gitlab-workhorse/merge_requests/145
[!9759]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9759
[!10053]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10053
[!10185]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10185
[!10224]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10224
[!10249]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10249
[!9938]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9938
[!10145]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10145
[!10149]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10149
[!10248]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10248
[!1445]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1445
[!1453]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1453
[!1490]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1490
[!1414]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1414
[!1428]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1428
[!1425]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1425
[!1423]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1423
[!1429]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1429


## Upgrade barometer

This version includes a fix to a Elasticsearch migration, which only impacts EE
with Elasticsearch enabled, and should not require any downtime.

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
