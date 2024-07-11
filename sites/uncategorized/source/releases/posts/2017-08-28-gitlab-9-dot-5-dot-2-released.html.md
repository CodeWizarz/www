---
title: "GitLab Patch Release: 9.5.2"
categories: releases
date: 2017-08-28
author: Jose Ivan Vargas
author_gitlab: jivanvl
author_twitter: jivanvl
description: "GitLab 9.5.2 patch release resolves a number of regressions and bugs in 9.5.1"
tags: patch releases, releases
---

Today we are releasing version 9.5.2 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[this month's 9.5.1 release](/releases/2017/08/24/gitlab-9-dot-5-dot-1-released/) and
prior versions.

<!-- more -->

It includes the following fixes:

- **CE/EE** Badges are no longer huge. ([!13635])
- **CE/EE** Fix signing in using LDAP when attribute mapping uses simple strings instead of arrays. ([!13776])
- **CE/EE** Show un-highlighted text diffs when we do not have references to the correct blobs. ([!13744])
- **CE/EE** Fix display of push events for removed refs. ([!13721])
- **CE/EE** Testing of some integrations were broken due to missing ServiceHook record. ([!13729])
- **CE/EE** Fire system hooks when a user is created via LDAP. ([!13846])
- **CE/EE** Fix new project form not resetting the template value. ([!13757])
- **EE:** Fix `Geo::ProjectRegistry.failed` scope to count projects where wiki sync failed. ([!2747])
- **EE:** Display 'Check namespace plan' checkbox in admin area on GitLab.com, staging, or in development ([!2750])
- **EE:** Remove duplicated items from admin sidebar ([!2769])
- **EE:** Fix LDAP backwards-compatibility when using "method" or when "verify_certificates" is not defined ([!2690])

[!13635]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13635
[!13721]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13721
[!13729]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13729
[!13744]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13744
[!13757]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13757
[!13776]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13776
[!13846]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13846
[!2746]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2746
[!2747]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2747
[!2750]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2750
[!2769]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2769
[!2690]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2690

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
