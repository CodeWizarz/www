---
title: "GitLab Patch Release: 9.3.7"
categories: releases
author: Kushal Pandya
author_gitlab: kushalpandya
author_twitter: kushal_pandya
description: "GitLab 9.3.7 patch release resolves a number of regressions and bugs in 9.3.6"
tags: patch releases, releases
---

Today we are releasing version 9.3.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[this month's 9.3.6 release](/releases/2017/07/11/gitlab-9-dot-3-dot-6-released/) and
prior versions.

It includes the following fixes:

- **CE/EE:** Prevent bad data being added to application settings when Redis is unavailable ([!12750]) - Update: this fix also addresses a security vulnerability as described in this [addendum](/releases/2017/08/03/recent-bug-could-enable-signups/).
- **CE/EE:** Return `is_admin` attribute in the GET /user endpoint for admins ([!12811])
- **EE:** Fixes Project EE specific logic port error ([!2251])
- **EE:** Reset available mirror capacity to 0 when it falls below 0 ([!2409])


[!12750]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12750
[!12811]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12811
[!2251]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2251
[!2409]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2409


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
