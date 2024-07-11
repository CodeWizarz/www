---
title: "GitLab Patch Release: 16.1.4"
categories: releases
author: Steve Abrams
author_gitlab: sabrams
author_twitter: gitlab
description: "GitLab releases 16.1.4"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/-/blob/master/general/patch/blog-post.md -->

Today we are releasing version 16.1.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs.

## GitLab Community Edition and Enterprise Edition

### 16.1.4

* [Backport "Fix artifacts object storage geo replication" to 16.1](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/128291)

## Important notes on upgrading

This version does not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](https://docs.gitlab.com/ee/update/zero_downtime.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Premium and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
