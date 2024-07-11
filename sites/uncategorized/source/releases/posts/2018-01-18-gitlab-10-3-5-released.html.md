---
title: "GitLab 10.3.5, 10.2.7, and 10.1.7 released"
categories: releases
author: Oswaldo Ferreira
author_gitlab: oswaldo
author_twitter: olsfer
description: "GitLab 10.3.5 patch release resolves a regression which affects MySQL customers"
tags: patch releases, releases
---

Today we are releasing versions 10.3.5, 10.2.7, and 10.1.7 for GitLab Community Edition (CE) and Enterprise Editions (EES, EEP).

These versions resolve a regression causing an error when running migrations on MySQL database, which was introduced
on [the latest security release patch](/releases/2018/01/16/gitlab-10-dot-3-dot-4-released).

<!-- more -->

## Bug fixes for Community and Enterprise Editions

- **CE/EES/EEP:** Fix bug in security release with deploy keys migration ([!16531])

[!16531]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16531

## Upgrade barometer

These versions include a fix for an existing migration, which adds and updates a column on `deploy_keys` table.

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
