---
title: "GitLab Patch Release: 11.1.1"
categories: releases
author: Felipe Artur
author_gitlab: felipe_artur
author_twitter: FelipeArtur
description: "GitLab 11.1.1 patch release resolves a number of regresssions and bugs in 11.1.0 release."
---

Today we are releasing version 11.1.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 11.1 release](/releases/2018/07/22/gitlab-11-1-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, GitLab.com Free and higher tiers:

- [Add missing Gitaly `branch_update` `nil` checks](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20711)

Available in [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/):
- [Resolve "Geo: Unable to disable verification on the secondary"](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/6599)
- [Resolve "Geo: Uninitialized constant `Gitlab::Geo::ImportExportDownloader`"](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/6567)

## Omnibus GitLab

- [Export PYTHONPATH and ICU_DATA to gitaly](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2650)

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](https://docs.gitlab.com/omnibus/update/#zero-downtime-updates) file,
which is only used for updates.

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.