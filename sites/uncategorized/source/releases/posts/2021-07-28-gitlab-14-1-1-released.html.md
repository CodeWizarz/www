---
title: "GitLab Patch Release: 14.1.1"
categories: releases
author: Henri Philipps
author_gitlab: hphilipps
author_twitter: gitlab
description: "GitLab releases 14.1.1"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.1.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 14.1 release](/releases/2021/07/22/gitlab-14-1-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Free, Premium, and Ultimate:

- [Extend RackAttack basic authentication detection for rate limiting](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/63287)
- [Enable bulk dismissal checkboxes on group vulnerability report"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/66312)
- [Fix syntax highlighting inline background on darkmode](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/66410)
- [Fix: Sidekiq workers delete each other's metrics](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/66432)
- [Prevent terms from being created if blank](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/66437)
- [Remove backfill migration for ci_build_trace_sections](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/66627)
- [Geo: Fix snippet verification by replicating the HEAD ref](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/65783)
- [Remove securityScansSucceeded from DevOps adoption](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/66291)
- [Fix markdown in development docs](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5481)
- [Fix deployer task](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5484)
- [Don't ask users to upgrade to PG 13 yet](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5488)

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
