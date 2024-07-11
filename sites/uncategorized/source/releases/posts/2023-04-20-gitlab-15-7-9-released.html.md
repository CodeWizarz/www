---
title: "GitLab Patch Release: 15.7.9"
categories: releases
author: Vladimir Glafirov
author_gitlab: vglafirov
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 15.7.9"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.7.9 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.7 release](/releases/2022/12/22/gitlab-15-7-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

- [Fix automatically-retried jobs stuck in pending state](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/117284)

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
