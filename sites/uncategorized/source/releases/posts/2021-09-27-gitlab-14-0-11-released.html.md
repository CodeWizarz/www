---
title: "GitLab Patch Release: 14.0.11"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: gitlab
description: "GitLab releases 14.0.11"
tags: patch releases, releases
---

Today we are releasing version 14.0.11 GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[the 14.0 release](/releases/2021/06/22/gitlab-14-0-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

- [Derive virtual storage's filesystem id from its name](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/3834)
- [Fix Elastic::MigrationWorker current_migration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/70429)

## Important notes on upgrading

These versions do not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/) features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.

