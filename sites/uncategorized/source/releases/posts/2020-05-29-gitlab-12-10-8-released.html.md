---
title: "GitLab Patch Release: 12.10.8"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "GitLab releases 12.10.8"
tags: patch releases, releases
---

Today we are releasing version 12.10.8 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[last month's 12.10 release](/releases/2020/04/22/gitlab-12-10-released/) and
prior versions.

* [Resolve "Geo: Design thumbnails are not replicated"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/32703)
* [Fix 404s downloading latest build artifacts](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/32741)
* [Fix dbvacuum on pgupgrade](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4227)
* [Geo: Fix empty synchronisation status when nothing is synchronised](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/30710)

## Important notes on upgrading

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
