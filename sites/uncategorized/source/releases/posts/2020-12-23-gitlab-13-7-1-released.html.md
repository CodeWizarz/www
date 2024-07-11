---
title: "GitLab Patch Release: 13.7.1"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
description: "GitLab releases 13.7.1"
tags: patch releases, releases
---

Today we are releasing version 13.7.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.7 release](/releases/2020/12/22/gitlab-13-7-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

- [Fix project transfer corrupting shared runners state](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/47316)
- [Add roadmap filters to docs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/50202)
- [Fix DAST profiles deletion](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/50271)
- [Update automation instructions for DB setup](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/50333)
- [Improve AWS EKS troubleshooting documentation](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/50336)
- [Fix Redis HLL weekly keys](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/50358)
- [Geo: Fix LFS for location-aware Git URL](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/50415)
- [Fix error for projects without security setting](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/50490)
- [Ensure patroni and consul remain up during upgrade migrations](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4854)

## Important notes on upgrading

For multi-node deployments, this version [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

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
