---
title: "GitLab Patch Release: 9.5.1"
categories: releases
date: 2017-08-24
author: Simon Knox
author_gitlab: psimyn
author_twitter: psimyn
description: "GitLab 9.5.1 patch release resolves a number of regressions and bugs in 9.5.0"
---

Today we are releasing version 9.5.1 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[this month's 9.5.0 release](/releases/2017/08/22/gitlab-9-5-released/) and
prior versions.

<!-- more -->

It includes the following fixes:

- **CE/EE:** Ensure Rugged methods are called with a Rugged Commit ([!13723])
- **CE/EE** Commit rows would occasionally render with the wrong language ([!13664])
- **CE/EE** Fixed issue boards closed list displaying empty label ([!13667])
- **CE/EE** User profile activity feed contains broken image links ([!13722])
- **CE/EE** Only require Sidekiq throttling library when enabled, to reduce cache misses ([!13718])
- **CE/EE** Correctly encode string params for Gitaly's TreeEntries RPC ([!13719])
- **CE/EE** Raise Git GC Housekeeping timeout to 24 hours ([!13724])
- **CE/EE** Remove incorrect paragraph regarding renaming repos in settings ([!13715])
- **CE/EE** Fix path in import projects form ([!13606])
- **CE/EE** Fix caching of future broadcast messages ([!13658])
- **CE/EE** Fix merge request head pipeline when pipeline has errors ([!13669])
- **EE:** Fix url for object store artifacts ([!2705])
- **EE:** Fix button spacing on Merge Request widget ([!2693])
- **EE:** Ensure all database queries are routed through load balancer when load balancing is enabled ([!2707])
- **EE:** Hide admin Audit Log in sidebar when not licensed ([!2726])
- **EE:** Fix page flicker when sidebar is collapsed ([!2738])
- **EE:** Fix new nav sidebar item layout issues

[!13723]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13723
[!13664]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13669
[!13667]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13658
[!13722]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13606
[!13718]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13715
[!13719]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13724
[!13724]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13719
[!13715]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13718
[!13606]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13722
[!13658]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13667
[!13669]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13664
[!2705]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2705
[!2693]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2693
[!2707]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2707
[!2726]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2726
[!2738]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2738


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
