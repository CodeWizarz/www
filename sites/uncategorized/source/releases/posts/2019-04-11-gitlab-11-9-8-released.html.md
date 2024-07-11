---
title: "GitLab Patch Release: 11.9.8"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "GitLab 11.9.8 Released"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 11.9.8 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[previous month's 11.9.0 release](/releases/2019/03/22/gitlab-11-9-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

### Performance (2 changes)

- [Improve performance of Pull Request importer.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27121)
- [Disable method instrumentation for diffs.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27235)

### Other (1 change)

- [Allow use of untrusted Regexp via feature flag.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26905)
- [Restore HipChat project service.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27172)

## GitLab Enterprise Edition

### Fixed (1 change)

- [Fix sorting by priority with filtering by approvers.](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/10446)

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
