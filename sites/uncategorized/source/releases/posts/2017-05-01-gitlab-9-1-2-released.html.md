---
title: "GitLab Patch Release 9.1.2"
author: Timothy Andrew
author_gitlab: timothyandrew
author_twitter: timothyandrew
description: "The GitLab 9.1.2 patch release resolves a number of regressions and bugs in 9.1"
categories: releases
---

Today we're releasing version 9.1.2 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in [the 9.1 release](/releases/2017/04/22/gitlab-9-1-released/).

Please read on for more details.

<!-- more -->

- **CE/EE:** Lazily set UUID in ApplicationSetting for new installations. ([!10893]/[!1733])
- **CE/EE:** Remove description for build_events, add pipeline_events. ([!10908])
- **CE/EE:** Resolve "Milestone sidebar display incorrect number of MR when minimized". ([!10933])
- **CE/EE:** Add index on ci_runners.contacted_at. ([!10876])
- **CE/EE:** Fix ordering of commits in the network graph. ([!10936])
- **CE/EE:** Skip validation when creating internal (ghost, Service Desk) users. ([!10949])
- **CE/EE:** Refactoring rake task to import GitHub repositories. ([!10695])
- **CE/EE:** Accept default branch param on notification services. ([!10959])
- **CE/EE:** correct documentation on opt-out-ness of usage ping. ([!10945])
- **EE:** Fix commit search on some elasticsearch indexes. ([!1745])
- **EE:** Fix bug where Geo secondary Sidekiq cron jobs would not be activated if settings changed. ([!1754])
- **EE:** Fix creating issues by email with Service Desk on. ([!1743])

[!10893]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10893
[!1733]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1733
[!10908]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10908
[!10933]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10933
[!10936]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10936
[!10876]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10876
[!10980]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10980
[!10949]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10949
[!10695]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10695
[!10959]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10959
[!10945]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10945
[!1745]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1745
[!1754]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1754
[!1743]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1743

## Upgrade barometer

This version does not require downtime. It includes two migrations:

  1. Fill in missing UUIDs in application settings, which fixes
     [a regression](https://gitlab.com/gitlab-org/gitlab-ee/issues/2246)

  2. Add an index for the column `contacted_at` in the table `ci_runners`, which
     addresses [a performance concern](https://gitlab.com/gitlab-org/gitlab-ce/issues/31229).

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
