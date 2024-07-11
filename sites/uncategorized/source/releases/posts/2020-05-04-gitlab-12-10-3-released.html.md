---
title: "GitLab Patch Release: 12.10.3"
categories: releases
author: Alessio Caiazza
author_gitlab: nolith
author_twitter: gitlab
description: "GitLab releases 12.10.3"
tags: patch releases, releases
---

Today we are releasing version 12.10.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 12.10 release](/releases/2020/04/22/gitlab-12-10-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Disable schema dumping after migrations in production](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/30812)
- [Fix a CI failure where no jobs can be requested by and assigned to runners based on certain instance settings](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/30702)
- [Escape branch name on backend](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/30696)
- [Add LFS badge feature flag to RefsController#logs_tree](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/30442)
- [Fix second 500 error with NULL restricted visibility levels](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/30414)
- [Fix incorrect commits number in commits list](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/30412)
- [Fix errors creating project with active Prometheus service template](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/30340)
- [Enable expiring license banner](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/30304)
- [Fix CaptureDiffNotePositionService when position is nil](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/30269)
- [Fix terraform state init failure](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/30223)
- [Move deploy keys section back to repository settings](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/29184)
- [Update pagination and limits documentation for projects API](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/30687/diffs)

Available in [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/):

- [Fixes the file row not showing commits for certain projects](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/30647)

## Important notes on upgrading

This version does not include any new migrations, and should not require any
downtime.

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
