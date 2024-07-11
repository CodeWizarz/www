---
title: "GitLab Patch Release: 9.1.1"
author: Lin Jen-Shin
author_gitlab: godfat-gitlab
author_twitter: godfat
categories: releases
description: "GitLab 9.1.1 patch release resolves a number of regressions and bugs in 9.1"
---

Today we're releasing version 9.1.1 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in [this month's 9.1 release](/releases/2017/04/22/gitlab-9-1-released/).

Please read on for more details.

<!-- more -->

- **CE/EE:** Add a transaction around move_issues_to_ghost_user. ([!10465])
- **CE/EE:** Properly expire cache for all MRs of a pipeline. ([!10770])
- **CE/EE:** Add sub-nav for Project Integration Services edit page. ([!10813])
- **CE/EE:** Fix missing duration for blocked pipelines. ([!10856])
- **CE/EE:** Fix lastest commit status text on main project page. ([!10863])
- **CE/EE:** Add index on ci_builds.updated_at. ([!10870]) (blackst0ne)
- **CE/EE:** Fix 500 error due to trying to show issues from pending deleting projects. ([!10906])
- **CE/EE:** Ensure replying to an individual note by email creates a note with its own discussion ID. ([!10890])
- **CE/EE:** Fix OAuth, LDAP and SAML SSO when regular sign-ups are disabled.  ([!10904])
- **CE/EE:** Fix usage ping docs link from empty cohorts page. ([!10907])
- **CE/EE:** Eliminate N+1 queries in loading namespaces for every issuable in milestones. ([!10871])

[!10465]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10465
[!10770]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10770
[!10813]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10813
[!10856]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10856
[!10863]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10863
[!10870]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10870
[!10906]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10906
[!10890]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10890
[!10904]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10904
[!10907]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10907
[!10871]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10871

## Upgrade barometer

This version does not require downtime. It includes a single migration that
adds an index for the column `updated_at` in the table `ci_builds`, which
addresses [a performance concern
](https://gitlab.com/gitlab-org/gitlab-ce/issues/31251).

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
