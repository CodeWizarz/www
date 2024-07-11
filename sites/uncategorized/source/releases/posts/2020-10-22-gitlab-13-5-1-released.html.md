---
title: "GitLab Patch Release: 13.5.1"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: gitlab
description: "GitLab releases 13.5.1"
tags: patch releases, releases
---

Today we are releasing version 13.5.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.5 release](/releases/2020/10/22/gitlab-13-5-released/).

## GitLab Community Edition and Enterprise Edition

* [Add docs on the inclusion of LFS files in archives](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/45448)
* [Update GitLab Shell to v13.11.0](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/45660)
* [Revert clickable links on logs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/45690)
* [Resolve "QA tests failing after group was explicitly set for repositories_storages"](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4661)

## Important notes on upgrading

This version does not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

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
