---
title: "GitLab Patch Release: 10.3.2"
categories: releases
author: Tiago Nuno Lopes Sarmento Botelho
author_gitlab: tiagonbotelho
author_twitter: tiagonbotelho
description: "GitLab 10.3.2 patch release resolves a bug related to upgrading using MySQL introduced in 10.3.0"
tags: patch releases, releases
---

Today we are releasing version 10.3.2 for GitLab Community Edition (CE) and Enterprise Editions (EES, EEP).

This version resolves a migration issue introduced in
[this month's 10.3.0 release](/releases/2017/12/22/gitlab-10-3-released/).

<!-- more -->

## Bug fixes for Community and Enterprise Editions

- **CE/EES/EEP:** [Fix migration for removing orphaned issues.moved_to_id values in MySQL and PostgreSQL.][!16141]

[!16141]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16141

## Upgrade barometer

This version fixes an existing migration that failed for instances running
MySQL, but this version should not require additional downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Editions

Interested in GitLab Enterprise Editions? Check out the [features exclusive to
EE](/pricing/).

Access to GitLab Enterprise Editions is granted by a [subscription](/stages-devops-lifecycle/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
