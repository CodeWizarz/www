---
title: "GitLab Patch Release: 15.7.3"
categories: releases
author: Ahmad Tolba
author_gitlab: ahyield
author_twitter: gitlab
description: "GitLab releases 15.7.3"
tags: patch releases, releases
---


Today we are releasing version 15.7.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.7 release](/releases/2022/12/22/gitlab-15-7-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Update GitHub for cancelling GitHub project import](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/107440)
* [Geo: Container Repository push events don't work](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/107842)
* [Enforce memory-watchdog by default](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/108112)
* [Reset Container Repository Sync status on secondary](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/108153)
* [Ensure Elasticsearch index is clean before wildcard test](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/108393)

## Important notes on upgrading

This version does not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Premium and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
