---
title: "GitLab Patch Release: 9.0.3"
author: DJ Mountney
author_gitlab: twk3
author_twitter: twk3
categories: releases
description: "GitLab 9.0.3 patch release resolves a number of regressions and bugs in 9.0"
---

Today we're releasing version 9.0.3 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in [this month's 9.0 release](/releases/2017/03/22/gitlab-9-0-released/).

Please read on for more details.

<!-- more -->

- **CE/EE:** Allow users to import GitHub projects to subgroups. ([!10344])
- **CE/EE:** Remove unnecessary ORDER BY clause from forked_to_project_id subquery. ([!10334])
- **CE/EE:** Fixed sidebar causes vertical scroll to stutter. ([!10262])
- **CE/EE:** Make the api /notes endpoint work with noteable iid instead of id. ([!10258])
- **CE/EE:** Improve Markdown rendering when a lot of merge requests are referenced. ([!10252])
- **CE/EE:** Fix environment folder route when special chars present. ([!10250])
- **CE/EE:** Support wider range of monitored environments with Prometheus ([!10159])
- **CE/EE:** Fix linking to new issue with selected template via url parameter. ([!10155])
- **CE/EE:** Make CI build to use optimistic locking only on status change. ([!10152])
- **CE/EE:** Fixed labels icon being hidden in collapsed issuable sidebar. ([!10107])
- **CE/EE:** Remove unnecessary ORDER BY clause when updating todos. ([!10399])
- **CE/EE:** Fix race condition where a namespace would be deleted before a project was deleted. ([!10389])
- **CE/EE:** Fixes method not replacing URL parameters correctly and breaking pipelines. ([!10351])
- **CE/EE:** Fix name collision when importing GitHub pull requests from forked repositories. ([!9719])
- **CE/EE:** Fix GitHub importer for PRs of deleted forked repositories. ([!9992])
- **EE:** Changed titles in board switcher. ([!1390])
- **EE:** Fixed issue boards milestone toggle text not updating when filtering. ([!1516])
- **EE:** Fixed the mirror user dropdown not displaying. ([!1554])
- **EE:** Fixed label resetting when sorting by weight. ([!1558])
- **EE:** Add the ability to edit shared runners quota on per-user basis. ([!1535])
- **EE:** Fix sticking of the database load balancer. ([!1502])
- **Omnibus GitLab:** Add configuration support for new Mattermost 3.7 settings ([!1432])
- **Omnibus GitLab:** Added support for postgres hot_standby_feedback option ([!1416])
- **Omnibus GitLab:** Fix ability to disable postgres and redis exporters ([!1435])
- **Omnibus GitLab:** Fix 'template1 being accessed by other users' error ([!1431])
- **Omnibus GitLab:** Start new services after they are enabled ([!1427])

[!10347]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10347
[!10344]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10344
[!10334]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10334
[!10262]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10262
[!10258]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10258
[!10252]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10252
[!10250]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10250
[!10159]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10159
[!10155]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10155
[!10152]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10152
[!10107]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10107
[!10399]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10399
[!10389]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10389
[!10351]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10351
[!9719]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9719
[!9992]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9992
[!1390]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1390
[!1516]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1516
[!1554]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1554
[!1558]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1558
[!1535]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1535
[!1502]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1502
[!1432]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1432
[!1416]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1416
[!1435]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1435
[!1431]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1431
[!1427]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1427

## Upgrade barometer

This version does not include any migrations and will not require downtime.

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
