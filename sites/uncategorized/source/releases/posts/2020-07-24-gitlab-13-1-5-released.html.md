---
title: "GitLab Patch Release: 13.1.5"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: gitlab
description: "GitLab releases 13.1.5"
tags: patch releases, releases
---

Today we are releasing version 13.1.5 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in [last month's 13.1
release](/releases/2020/06/22/gitlab-13-1-released/) and prior versions.

## GitLab Community Edition and Enterprise Edition

* [Fix: Geo file downloads can block Sidekiq threads](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/36012)
* [Geo: Fix inaccurate "Synchronization disabled" progress bars](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/36492)
* [Fix location of k3d install script in QA dockerfile](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/36947)

## Omnibus GitLab

* [Fix: Sidekiq will now fail to configure if sidekiq_cluster config is used](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4337)
* [Fix: Implement a version check for docker](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4381)
* [Use gitlab-depscan script from specific commit](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4418)
* [Make actioncable recipe and control files match new runit requirement](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4419)

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
