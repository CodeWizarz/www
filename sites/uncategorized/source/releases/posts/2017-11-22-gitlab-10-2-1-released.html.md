---
title: "GitLab Patch Release: 10.2.1"
categories: releases
author: Michael Teiva Kozono
author_gitlab: mkozono
author_twitter: mozonok
description: "GitLab 10.2.1 patch release resolves a regression in 10.2.0"
tags: patch releases, releases
---

Today we are releasing version 10.2.1 for GitLab Community Edition (CE) and Enterprise Editions (EES, EEP).

This version resolves a regression in
[this month's 10.2.0 release](/releases/2017/11/22/gitlab-10-2-released/).

<!-- more -->

It includes the following fixes:

- **CE/EES/EEP:** Disable Prometheus to allow GitLab to start, until [the permanent fix] is ready. [!15549]

[!15549]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15549
[the permanent fix]: https://gitlab.com/gitlab-org/prometheus-client-mmap/merge_requests/11

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://doc.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Editions

Interested in GitLab Enterprise Editions? Check out the [features exclusive to
EE](/pricing/).

Access to GitLab Enterprise Editions is granted by a [subscription](/stages-devops-lifecycle/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
