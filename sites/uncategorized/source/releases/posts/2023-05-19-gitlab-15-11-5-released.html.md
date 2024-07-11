---
title: "GitLab Patch Release: 15.11.5"
categories: releases
author: Reuben Pereira
author_gitlab: rpereira2
author_twitter: gitlab
description: "GitLab releases 15.11.5"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/-/blob/master/general/patch/blog-post.md -->

Today we are releasing versions 15.11.5 for GitLab Community Edition and Enterprise Edition.

These versions resolve a number of regressions and bugs.

## GitLab Community Edition and Enterprise Edition

### 15.11.5

* [[15.11] Fix no_proxy not working when DNS rebinding protection enabled](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/120809)
* [Remove epic date fields authorization](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/120290)
* [Update by_parent filter in EpicsFinder](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/120966)
* [Fix Roadmap frontend glitches and timeline bar placement](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/120965)
* [Makes roadmap current day indicator & timeline locale aware](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/121104)

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
