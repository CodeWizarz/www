---
title: "GitLab Patch Release: 13.0.10"
categories: releases
author: Yorick Peterse
author_gitlab: yorickpeterse
author_twitter: yorickpeterse # please use gitlab if you don't want to use your own
description: "GitLab releases 13.0.10"
tags: patch releases, releases
---

Today we are releasing version 13.0.10 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in [May's 13.0
release](/releases/2020/05/22/gitlab-13-0-released/) and prior versions.

## GitLab Community Edition and Enterprise Edition

* [Fix gitlab:\*:check Rake tasks](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/35944)
* [Run vacuumdb with 2 commands simultaneously](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4373)
* [Geo - Does not sync LFS objects from fork networks](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/35692)

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
