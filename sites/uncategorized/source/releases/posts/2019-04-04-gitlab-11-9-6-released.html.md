---
title: "GitLab Patch Release: 11.9.6"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "GitLab 11.9.6 is released"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 11.9.6 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[last month's 11.9.0 release](/releases/2019/03/22/gitlab-11-9-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition


### Fixed (6 changes)

- [Avoid excessive recursive calls with Rugged TreeEntries](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26813)
- [Fix API /project/:id/branches not returning correct merge status](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26785)
- [Force to recreate all MR diffs on import](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26480)

### Added (1 change)

- [Add Insights frontend to retrieve and render chart](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26284)

### Performance (1 change)

- [Force a full GC after importing a project](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26803)

## GitLab Enterprise Edition

### Fixed (3 changes)
- [Fix project approval rule with only private group being considered as approved when override is allowed](https://gitlab.com/gitlab-org/gitlab-ee/issues/10356)
- [Fix approval rule sourcing from forked MR](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/10474)
- [Guard against ldap_sync_last_sync_at being nil](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/10507)

## Upgrade barometer

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
