---
title: "GitLab Patch Release: 12.0.1"
categories: releases
author: Marin Jankovski
author_gitlab: marin
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "12.0.1 resolves an upgrade related regression"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 12.0.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a bug discovered in
[this month's 12.0.0 release](/releases/2019/06/22/gitlab-12-0-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Upgrade version check should enforce the upgrade path correctly](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/3369)


## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
