---
title: "GitLab Patch Release: 9.2.1"
author: Clement Ho
author_gitlab: ClemMakesApps
author_twitter: ClemMakesApps
categories: releases
description: "GitLab 9.2.1 patch release resolves a number of regressions and bugs in 9.2"
---

Today we're releasing version 9.2.1 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in [this month's 9.2 release](/releases/2017/05/22/gitlab-9-2-released/).

Please read on for more details.

<!-- more -->

- **CE/EE:** MR widget styling fixes ([!11591])
- **CE/EE:** Adds "comments on snippets" to doc ([!11563])
- **CE/EE:** Add to docs: issues multiple assignees ([!11556])
- **CE/EE:** Fix jQuery data attribute caching issue causing expanding issues ([!11609])
- **CE/EE:** Fix placement of note emoji on hover ([!11605])
- **CE/EE:** Change pipelines schedules help page path ([!11592])
- **CE/EE:** Move environment monitoring to environments doc ([!11583])
- **CE/EE:** Fix spacing of issue emojis ([!11567])
- **CE/EE:** Add docs for change of Cache/Artifact restore order" ([!11545])
- **CE/EE:** Add note about artifacts previewing in docs ([!11539])
- **CE/EE:** Auto update docs ([!11552])
- **CE/EE:** New doc topic: issues ([!11075])
- **CE/EE:** Fix migrations for older PostgreSQL versions ([!11620])
- **CE/EE:** Add missing regex to backup manager ([!11635])
- **EE:** Fix the elasticsearch advanced search syntax link and edition details ([!1958])
- **EE:** Fix "Remove your approval" button visibility for merged MRs ([!1936])
- **EE:** Refactor advanced search syntax docs ([!1953])
- **EE:** Remove redundant documented steps for Geo Setup ([!1737])
- **Omnibus:** Mattermost: Fix config.json template for sql_data_source_search_replicas ([!1575])
- **Omnibus:** Disable proxy_request_buffering for LFS endpoints ([!1569])
- **Omnibus:** Splitting postgresql.conf into two separate configuration files ([!1555])
- **Omnibus:** Fix sshd startup errors upon a full Docker restart ([!1577])

[!11591]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11591
[!11563]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11563
[!11556]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11556
[!11635]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11635
[!11609]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11609
[!11605]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11605
[!11592]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11592
[!11583]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11583
[!11567]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11567
[!11545]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11545
[!11539]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11539
[!11552]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11552
[!11075]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11075
[!11620]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11620
[!1958]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1958
[!1936]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1936
[!1953]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1953
[!1737]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1737
[!1575]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1575
[!1569]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1569
[!1555]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1555
[!1577]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1577

## Upgrade barometer

These versions have no migrations and should not require any downtime.

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
