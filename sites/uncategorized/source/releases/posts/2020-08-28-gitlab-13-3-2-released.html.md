---
title: "GitLab Patch Release: 13.3.2"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "GitLab releases 13.3.2"
tags: patch releases, releases
---

Today we are releasing version 13.3.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.3 release](/releases/2020/08/22/gitlab-13-3-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Prevent accidental group deletion if path rename fails](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/40353)
* [Fix create snippet disabled on empty file path](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/40412)
* [Fix race condition in concurrent backups](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/39894)
* [Fix exception handling when a concurrent backup fails](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/40451)
* [Fix hanging info refs cache when error occurs](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/2497)

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
