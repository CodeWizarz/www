---
title: "GitLab Patch Release: 14.3.2"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: gitlab
description: "GitLab releases 14.3.2"
tags: patch releases, releases
---

Today we are releasing version 14.3.2 GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[the 14.3 release](/releases/2021/09/22/gitlab-14-3-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

- [Add OR REPLACE when creating function](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/70726)
- [Top 7 Highlight items for 14.3](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/70751)
- [Update GitLab Shell to v13.21.1](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/71037)
- [Remove feature flag check for candece finder](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/71192)
- [Remove unexpected FK prior to swapping columns](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/71311)
- [Allow ee images to be skipped on CE pipelines](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/768)
- [Bump kas to v14.3.3](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/70750)

## Important notes on upgrading

These versions do not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

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


