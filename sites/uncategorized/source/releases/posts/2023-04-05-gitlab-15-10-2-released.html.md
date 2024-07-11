---
title: "GitLab Patch Release: 15.10.2"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: gitlab
description: "GitLab releases 15.10.2"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing versions 15.10.2 for GitLab Community Edition and Enterprise Edition.

These versions resolve a number of regressions and bugs.

## GitLab Community Edition and Enterprise Edition

### 15.10.2

* [Update mail gem to v2.8.1](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/116173)
* [Add sync_name check to Gitlab::Auth::Ldap::Access](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/115820)
* [Backport Admin role fix to 15.10](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/116455)
* [Fix openapi viewer for relative url instances](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/115480)
* [Migrate RedisHLL keys to default slot](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/116604)

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
