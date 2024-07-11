---
title: "GitLab Patch Release: 12.3.4"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: rspeicher
description: "GitLab 12.3.4 has been released"
tags: patch releases, releases
---

Today we are releasing version 12.3.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in [this month's 12.3.0
release](/releases/2019/09/22/gitlab-12-3-released/) and its previous patches.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

* [Fix "cannot merge" icon showing in dropdown when user can merge](https://gitlab.com/gitlab-org/gitlab/merge_requests/17306)
* [Fix CI detection of GitLab and GitLab FOSS projects](https://gitlab.com/gitlab-org/gitlab/merge_requests/17490)
* [Fix pipelines for merge requests in project exports](https://gitlab.com/gitlab-org/gitlab/merge_requests/17844)
* [Update documentation for License-Check rule](https://gitlab.com/gitlab-org/gitlab/merge_requests/16674)

## GitLab Enterprise Edition

Available in GitLab Starter, Premium, and Ultimate:

* [Hide All members rule from approvers list](https://gitlab.com/gitlab-org/gitlab/merge_requests/17556)
* [Service Desk reply emails rejected when project issues set to "Only Project Members"](https://gitlab.com/gitlab-org/gitlab/merge_requests/17401)
* [Resolve "Geo: LFS not being synced"](https://gitlab.com/gitlab-org/gitlab/merge_requests/17633)

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
