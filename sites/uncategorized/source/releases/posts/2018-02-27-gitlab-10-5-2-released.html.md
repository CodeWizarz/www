---
title: "GitLab Patch Release: 10.5.2"
categories: releases
author: Mark Fletcher
author_gitlab: markglenfletcher
description: "GitLab 10.5.2 patch release resolves a number of regressions and bugs in 10.5 release"
tags: patch releases
---

Today we are releasing version 10.5.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 10.5 release](/releases/2018/02/22/gitlab-10-5-released/).

<!-- more -->

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Avoid slow File Lock checks when not used](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17140)
- [Only check LFS integrity for first branch in push](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17098)
- [Fix bug for MR stating "Could not connect to the CI server"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17053)
- [Fix bug when loading an invalid upload URL](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17267)
- [Fix bug when checking for a repo in GitAccessWiki](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17268)
- [Enable "Legacy Authorization" by default when creating a Cluster on GCP](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17302)
- [Fix stacked progress bar bug](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17217)
- [Fix bug when attempting to update tracked field for read-only DB](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17200)
- [Fix bug to allow branchnames to be named the same as the commit it points to](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17231)
- [Fix bug for sidekiq metrics](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17235)
- [Fix issue with CI cache key being empty when variable used as the key](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17260)
- [Fix bug where diff errors displayed unnecessarily](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17228)
- [Improve query performance for `Dashboard::SnippetsController#index`](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17088)
- [Performance improvements when searching for Project members](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17190)
- [Improve performance of searching for and auto completing of users](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17158)
- [Performance improvements regarding feature flags](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17213)

Available in GitLab Starter, Premium, and Ultimate:

- [Fix performance bar bug](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4621)

Available in [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/):

- [Fix Geo bug uninitialized constant `Gitlab::Geo::SignatureTimeInvalidError`](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4588)

## Omnibus GitLab

- [Fix bug where `nginx['redirect_http_to_https'` is ignored](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2309)
- [Geo: Support a custom database login for PostgreSQL FDW to work with pgbouncer](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2292)

## Upgrade barometer

This version does include new migrations, but should not require any
downtime.

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
