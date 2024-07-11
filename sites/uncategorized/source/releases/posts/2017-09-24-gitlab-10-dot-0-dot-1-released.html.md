---
title: "GitLab Patch Release: 10.0.1"
categories: releases
date: 2017-09-24
author: Stan Hu
author_gitlab: stanhu
author_twitter: stanhu
description: "GitLab 10.0.1 patch release resolves one migration issue in 10.0.0"
tags: patch releases, releases
---

Today we are releasing version 10.0.1 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a migration issue in [this month's 10.0.0
release](/releases/2017/09/22/gitlab-10-0-released/) that [affected instances with
inactive LDAP accounts](https://gitlab.com/gitlab-org/gitlab-ce/issues/38246#note_41171108).
Other than that, this update contains no changes to functionality from 10.0.0.

<!-- more -->

It includes the following fix:

- **CE/EE** Fix duplicate key errors in PostDeployMigrateUserExternalMailData migration. ([!14460])

[!14460]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14460

Thanks to Ian Yang for suggesting a solution.

## Upgrade barometer

This version includes a revision to a single migration, but does not require
any downtime. If you have already successfully upgraded to 10.0.0, this
upgrade will not affect you.

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
