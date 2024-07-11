---
title: "GitLab Patch Release: 12.8.7"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: rspeicher
description: "GitLab releases 12.8.7"
tags: patch releases, releases
---

Today we are releasing version 12.8.7 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 12.8 release](/releases/2020/02/22/gitlab-12-8-released/).

## GitLab Community Edition and Enterprise Edition

* [Fix/x509 signed commit](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25876)
* [Allow packages multipart uploads](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/26387)

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
