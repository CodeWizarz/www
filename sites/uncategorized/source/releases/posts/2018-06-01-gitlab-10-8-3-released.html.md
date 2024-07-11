---
title: "GitLab Patch Release: 10.8.3"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: may_cabrera
description: "GitLab 10.8.3 patch release resolves a number of regresssions and bugs in 10.8 release."
tags: patch releases, releases
---

Today we are releasing version 10.8.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 10.8 release](/releases/2018/05/22/gitlab-10-8-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Optimize database version method](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19021)
- [Adds migration to ensure all remote mirror columns get created](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19196)
- [Upgrade workhorse to v4.2.1](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19087)
- [Bump rugged to 0.27.1 for security fixes](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19222)
- [Fix local storage not being cleared after creating a new issue](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19226)
- [Fix encoding of branch names on compare and new merge request page](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19143)
- [Fix assumption of GitLab installation as a git working copy](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19125)
- [Upgrades Gitaly to 0.100.1](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19151)

Available in [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/):

- [Geo: Fixes repository verification getting stuck when all projects have been verified at least once](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5772)
- [Geo: Make `Geo::PruneEventLogWorker` delete rows more gently](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5835)

## Upgrade barometer

This version includes a new migration that should not require any downtime.
This migration should only affect users who went from EE to CE and had issues upgrading to `10.8.0` to `10.8.2`.
GitLab.com migrations took approximately 0 minutes.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
