---
title: "GitLab Patch Release: 13.11.3"
categories: releases
author: Alessio Caiazza
author_gitlab: nolith
author_twitter: nolith
description: "GitLab releases 13.11.3"
tags: patch releases, releases
---
Today we are releasing version 13.11.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.11 release](/releases/2021/04/22/gitlab-13-11-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

- [Fix broken build job for Auto DevOps](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/59775)
- [Fix Instance-level Project Integration Management page for GitLab FOSS](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/60354)

## Important notes on upgrading

This version does not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/) features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
