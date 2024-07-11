---
title: "GitLab Patch Release: 15.10.3"
categories: releases
author: Vladimir Glafirov
author_gitlab: vglafirov
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 15.10.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing versions 15.10.3 for GitLab Community Edition and Enterprise Edition.

These versions resolve a number of regressions and bugs.

## GitLab Community Edition and Enterprise Edition

### 15.10.3

* [Change the order of vulnerability creation](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/116851)
* [Resolve ambiguous references for archive metadata (backport)](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/116824)
* [Verify deploy keys settings for protected tags (backport)](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/116952)
* [Backport Broadcast messages fix for firefox dates and relative root url](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/117276)
* [[15.10] Fix automatically-retried jobs stuck in pending state](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/117280)
* [[15.10 Backport] Fix suggested_reviewers runs when rails is disabled](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6794)

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
