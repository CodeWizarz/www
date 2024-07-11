---
title: "GitLab Patch Release: 14.2.3"
categories: releases
author: Henri Philipps
author_gitlab: hphilipps
author_twitter: gitlab
description: "GitLab releases 14.2.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.2.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[last month's 14.2 release](/releases/2021/08/22/gitlab-14-2-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Free, Premium, and Ultimate:

- [Geo: Replicate multi-arch containers](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/67624)
- [Reset severity_levels default](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/68586)
- [Create 14.2 In-app top 7 product highlights](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/68601)
- [Fix OrphanedInviteTokensCleanup migration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/68784)
- [Fix Live Markdown Preview in personal and subgroup projects](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/68803)
- [Downgrade grpc from 1.38.0 to 1.30.2 for compatibility with older CPUs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/68865)
- [Restore proper contents to toolbox ubi8 image](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/742)
- [Only activate Git pack-objects hook if cache is enabled](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/3815)

## Important notes on upgrading

This version does include post deploy db migrations. For multi-node deployments, [it should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

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
