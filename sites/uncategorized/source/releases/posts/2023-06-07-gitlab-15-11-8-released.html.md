---
title: "GitLab Patch Release: 15.11.8"
categories: releases
author: Jenny Kim
author_gitlab: gitlab
author_twitter: gitlab
description: "GitLab releases 15.11.8"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/-/blob/master/general/patch/blog-post.md -->

Today we are releasing versions 15.11.8 for GitLab Community Edition and Enterprise Edition.

These versions resolve a number of regressions and bugs.

## GitLab Community Edition and Enterprise Edition

### 15.11.8

* [Fix serialization of pull requests in BitbucketServer Import](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/122396)
* [Update stable branch with security](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/122697)
* [LFS: Serve pre-signed URLs in `/lfs/objects/batch`](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/122348)
* [Fix memory leak in CI config includes entry](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/122540)

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
