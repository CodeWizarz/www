---
title: "GitLab Patch Release: 13.8.3"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
description: "GitLab releases 13.8.3"
tags: patch releases, releases
---

Today we are releasing version 13.8.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.8 release](/releases/2021/01/22/gitlab-13-8-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Fix Geo replication status for replicables with no data to sync](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/52253)
* [Use the shells background feature to put it into background](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/52404)
* [Revert multipart URL optimization for AWS S3](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/52561)
* [Fix regression with old wiki image uploads](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/52656)
* [Wait up to 60 seconds instead of 30 seconds till PIDs should exist](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/53153)
* [Handle unreachable ES host in settings check](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/52586)
* [Ensure the packagecloud binary is available for the raspberry pi release](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4966)
* [Fix a nil error when workhorse is set to use tcp](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4978)

## Important notes on upgrading

For multi-node deployments, this version [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).
