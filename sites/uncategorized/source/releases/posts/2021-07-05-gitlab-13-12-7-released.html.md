---
title: "GitLab Patch Release: 13.12.7"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: gitlab
description: "GitLab releases 13.12.7"
tags: patch releases, releases
---

Today we are releasing version 13.12.7 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.12 release](/releases/2021/05/22/gitlab-13-12-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Free, Premium, and Ultimate:

- [Fix pages deployment storage migration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64697)
- [Reintroduce recursive_approach_for_all_projects default-enabled](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64632)
- [Exempt unicorn['svlogd_prefix'] from deprecation check](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5399)
- [Gitaly: fixes to issues with strong consistency/transactional voting](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/3632)
- [Geo - Fix state value in the lfs_object_registry table](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/65466)

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
