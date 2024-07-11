---
title: "GitLab Patch Release: 9.5.7"
categories: releases
date: 2017-10-03
author: Jose Ivan Vargas
author_gitlab: jivanvl
author_twitter: jivanvl
description: "GitLab 9.5.7 patch release resolves a number of regressions and bugs in 9.5.6"
tags: patch releases, releases
---

Today we are releasing version 9.5.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a single regression introduced in 9.5.4, which prevented admins from importing repositories from the command line.

<!-- more -->

It includes the following fix:

- **CE/EE** Fix gitlab rake:import:repos task for 9.5.x ([!14639])

[!14639]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14639

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
