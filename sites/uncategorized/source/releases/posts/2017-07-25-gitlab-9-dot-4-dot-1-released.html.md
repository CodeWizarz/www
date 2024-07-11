---
title: "GitLab Patch Release: 9.4.1"
categories: releases
date: 2017-07-25
author: Mike Greiling
author_gitlab: mikegreiling
author_twitter: mikegreiling
description: "GitLab 9.4.1 patch release resolves a number of regressions and bugs in 9.4.0"
tags: patch releases, releases
---

Today we are releasing version 9.4.1 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[this month's 9.4.0 release](/releases/2017/07/22/gitlab-9-4-released/) and
prior versions.

<!-- more -->

It includes the following fixes:

- **CE/EE:** Fix pipeline_schedules pages throwing error 500 (when ref is empty). ([!12983])
- **CE/EE:** Fix editing project with container images present. ([!13028])
- **CE/EE:** Fix some invalid entries in PO files. ([!13032])
- **CE/EE:** Fix cross site request protection when logging in as a regular user when LDAP is enabled. ([!13049])
- **CE/EE:** Fix bug causing metrics files to be truncated. ([!35420])
- **CE/EE:** Fix anonymous access to public projects in groups with pending invites. ([!13037])
- **CE/EE:** Fix issue boards sidebar close icon size. ([!12991])
- **CE/EE:** Fix duplicate new milestone buttons when new navigation is turned on. ([!13033])
- **CE/EE:** Fix margins in the mini graph for pipeline in commits box. ([!13014])
- **EE:** Clean up mirror capacity in project destroy service if project is a scheduled mirror. ([!2445])
- **EE:** Fix unscoping of imposed capacity limit by find_each method on Mirror scheduler. ([!2460])
- **EE:** Remove text underline from suggested approvers. ([!2487])

[!12983]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12983
[!12991]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12991
[!13014]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13014
[!13028]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13028
[!13032]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13032
[!13033]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13033
[!13037]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13037
[!13049]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13049
[!35420]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/35420
[!2445]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2445
[!2460]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2460
[!2487]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2487

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
