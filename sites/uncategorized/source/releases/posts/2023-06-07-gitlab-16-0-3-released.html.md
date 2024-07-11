---
title: "GitLab Patch Release: 16.0.3"
categories: releases
author: Jenny Kim
author_gitlab: gitlab
author_twitter: gitlab
description: "GitLab releases 16.0.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/-/blob/master/general/patch/blog-post.md -->

Today we are releasing versions 16.0.3 for GitLab Community Edition and Enterprise Edition.

These versions resolve a number of regressions and bugs.

## GitLab Community Edition and Enterprise Edition

### 16.0.3

* [Fix serialization of pull_requests in Bitbucket Server Import](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/122395)
* [Fix memory leak in CI config includes entry](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/122539)
* [Fix MR approval rules sync when disabling scan result policy](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/122466)
* [LFS: Serve pre-signed URLs in `/lfs/objects/batch`](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/122349)

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
