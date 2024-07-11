---
title: "GitLab Patch Release: 13.5.4"
categories: releases
author: John Jarvis
author_gitlab: jarv
author_twitter: gitlab
description: "GitLab releases 13.5.4"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 13.5.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.5 release](/releases/2020/10/22/gitlab-13-5-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Fixes keyboard navigation of labels list](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/43874)
* [Hashed Storage: make migration and rollback resilient to exceptions](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/46178)
* [Fix compliance framework migration on CE](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/46761)
* [Resolve "undefined method error after upgrading to 13.5.1"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/46875)
* [Enforce instance-level MR approval settings](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/46637)

## Important notes on upgrading

This version upgrade does not require any downtime.

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
