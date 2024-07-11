---
title: "GitLab Patch Release: 12.1.11"
categories: releases
author: John Jarvis
author_gitlab: jarv
author_twitter: gitlab
description: "This version resolves regressions and bugs in 12.1.9"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 12.1.11 for GitLab Community Edition and Enterprise Edition.

This version resolves a critical regression in
[the 12.1.9 release](/releases/2019/09/10/critical-security-release-gitlab-12-dot-2-dot-5-released/).

## GitLab Community and Enterprise Edition

* [Fixes an issue that prevents no-downtime upgrades](https://gitlab.com/gitlab-org/gitlab/merge_requests/17029)


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
