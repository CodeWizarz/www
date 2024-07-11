---
title: "GitLab Patch Release: 13.3.1"
categories: releases
author: Amy Phillips
author_gitlab: amyphillips
author_twitter: gitlab
description: "GitLab releases 13.3.1"
tags: patch releases, releases
---

Today we are releasing version 13.3.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.3 release](/releases/2020/08/22/gitlab-13-3-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

- [Fix a bug with promoting Issues with attachments to Epics](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/39654)
- [Geo: Apply selective sync to container repo updates](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/3966)
- [Geo: Apply selective sync to design repo updates](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/39916)
- [Avoid creating diff position when line-code is nil](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/40089)

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
