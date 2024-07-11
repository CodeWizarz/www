---
title: "GitLab Patch Release: 10.1.4"
categories: releases
author: Felipe Artur Cardozo
author_gitlab: felipe_artur
author_twitter: FelipeArtur
description: "GitLab 10.1.4 patch release resolves a number of regressions and bugs in 10.1.3"
tags: patch releases, releases
---

Today we are releasing version 10.1.4 for GitLab Community Edition (CE) and Enterprise Editions (EES, EEP).

This version resolves a number of regressions and bugs in
[the 10.1.3 release](/releases/2017/11/10/gitlab-10-dot-1-dot-3-released/) and
prior versions.

<!-- more -->

It includes the following fixes:

- **CE/EES/EEP:** Format bytes to human readable number in registry table ([!15359])
- **CE/EES/EEP:** Prevent position update for image diff notes page ([!15357])
- **CE/EES/EEP:** Avoid creating fork network memberships for forks with a missing source ([!15366])
- **CE/EES/EEP:** Prevent error when authorizing an admin-created OAuth application without a set owner ([!15349])

[!15359]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15359
[!15357]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15357
[!15366]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15366
[!15349]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15349

## Upgrade barometer

This version does not contain any database migrations therefore
[no downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime)
should be needed.

Please be aware that by default the Omnibus packages will restart
by themselves, no matter how “big” or “small” the upgrade is. This
behavior can be changed by adding a
[`/etc/gitlab/skip-auto-migrations`file](http://doc.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Editions

Interested in GitLab Enterprise Editions? Check out the [features exclusive to
EE](/pricing/).

Access to GitLab Enterprise Editions are granted by a [subscription](/stages-devops-lifecycle/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
