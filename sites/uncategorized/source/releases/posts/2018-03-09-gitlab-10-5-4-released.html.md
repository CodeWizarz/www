---
title: "GitLab Patch Release: 10.5.4"
categories: releases
author: Mark Fletcher
author_gitlab: markglenfletcher
description: "GitLab 10.5.4 patch release resolves a number of regressions and bugs in 10.5 release"
tags: patch releases
---

Today we are releasing version 10.5.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 10.5 release](/releases/2018/02/22/gitlab-10-5-released/).

<!-- more -->

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Fix for "Leave Group" functionality](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17183)
- [Fix encoding error when copying Git attributes](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17291)
- [Gitaly fix for when `GRPC::Unavailable` encountered](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17293)
- [Fix bug for displaying issues and merge requests in groups](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17312)
- [Fix issue with trace artifact migration](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17313)
- [Fix bug for issue edit shortcut](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17360)
- [Fix for Prometheus Cluster application](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17372)
- [Fix bug when editing Prometheus Service template](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17377)
- [Fix bug when searching for code or wiki files containing non-ASCII data](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17413)
- [Fix for open-ended parameter's in lograge causing elastic memory issues](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17419)
- [Performance improvements for Todos](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17462)
- [Fix performance regression introduced by Snippets changes](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17476)

Available in GitLab Starter, Premium, and Ultimate:

- [Fix bug for Merge Request approvals](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4495)
- [Resolve "`RepositoryRemoveRemoteWorker.perform_async` being called from transaction"](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4747)

Available in [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/):

- [Fix for object storage migrate](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4624)
- [Mark empty repos as synced in Geo](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4757)
- [Updates for Geo file transfer log](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4761)
- [Fix bug for Geo WikiSyncService when attempting to sync projects that have no Wiki](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4677)
- [Synchronisation fixes for Geo](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4727)

## Omnibus GitLab

- [Fix bug where Let's Encrypt integration does not serve intermediate certificate](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2327)

## Upgrade barometer

This version does not include new migrations.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/stages-devops-lifecycle/).

Alternatively, [sign up for GitLab.com](/pricing/#gitlab-com)
to use GitLab's own infrastructure.
