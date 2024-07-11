---
title: "GitLab Patch Release: 12.3.1"
categories: releases
author: Yorick Peterse
author_gitlab: yorickpeterse
author_twitter: yorickpeterse # please use gitlab if you don't want to use your own
description: "GitLab 12.3.1 has been released"
tags: patch releases, releases
---

Today we are releasing version 12.3.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in [this month's 12.3.0
release](/releases/2019/09/22/gitlab-12-3-released/) and prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Fix ordering of issue board lists not being persisted.](https://gitlab.com/gitlab-org/gitlab/merge_requests/17356)
- [Fix error when duplicate users are merged in approvers list.](https://gitlab.com/gitlab-org/gitlab/merge_requests/17406)
- [Fix bug that caused a merge to show an error message.](https://gitlab.com/gitlab-org/gitlab/merge_requests/17466)
- [Fix CSS leak in job log.](https://gitlab.com/gitlab-org/gitlab/merge_requests/17484)

## Upgrade barometer

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
