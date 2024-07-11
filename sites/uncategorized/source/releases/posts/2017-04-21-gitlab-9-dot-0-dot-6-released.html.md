---
title: "GitLab Patch Release: 9.0.6"
author: James Lopez
author_gitlab: jameslopez
author_twitter: jlopezofficial
categories: releases
description: "GitLab 9.0.6 patch release resolves a number of regressions and bugs in 9.0"
---

Today we're releasing version 9.0.6 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in [this month's 9.0 release](/releases/2017/03/22/gitlab-9-0-released/).

Please read on for more details.

<!-- more -->

- **CE/EE:** Fix filtered search input width for IE ([!10662])
- **CE/EE:** Fix issue's note cache expiration after delete ([!10461])
- **CE/EE:** POST /projects/:id/hooks and PUT /projects/:id/hook/:hook_id no longer ignore the job_events param in the V4 API ([!10586])
- **CE/EE:** Fix the MR widget that merged any MR when choosing the option "Merge when pipeline succeeds" from the dropdown ([!10611])
- **CE/EE:** Fix restricted visibility project setting ([!10622])
- **CE/EE:** Fix orphaned notification settings ([!10763])
- **CE/EE:** Show sub-nav under Merge Requests when issue tracker is non-default ([!10658])
- **CE/EE:** Fix PlantUML integration in GFM ([!10651])
- **EE:** Cache Gitlab::Geo queries ([!1507])
- **EE:** Fix 500 when selecting a mirror user ([!1404])
- **EE:** Ignore internal users on user counts ([!1659])
- **EE:** Move clauses from query to filter stage for elasticsearch notes ([!1675])
- **EE:** Display custom hook error messages when automatic merge is enabled ([!1670])

[!10662]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10662
[!10461]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10461
[!10586]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10586
[!10611]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10611
[!10622]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10622
[!10763]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10763
[!10658]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10658
[!10796]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10796
[!10651]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10651
[!1507]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1507
[!1404]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1404
[!1659]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1659
[!1675]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1675
[!1670]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1670

## Upgrade barometer

This version does not require downtime. It includes a single migration that
removes notification settings that no longer have an existing namespace.

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
