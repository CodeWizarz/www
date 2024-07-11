---
title: "GitLab Patch Release: 15.0.3"
categories: releases
author: Alessio Caiazza
author_gitlab: nolith
author_twitter: nolith
description: "GitLab releases 15.0.3"
tags: patch releases, releases
---

Today we are releasing version 15.0.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.0 release](/releases/2022/05/22/gitlab-15-0-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Add GitLab agent image tag to install command](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/88188)
* [Resolve "Add documentation for Opensearch Indexing paused."](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/89033)
* [Disconnect alternates when unlinking from a repository pool](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/89195)
* [Add version information for new fields in members API](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/89306)
* [Upgrade to bundler v2.3.15](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6139)
* [cgroups: Handle nil repo](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/4635)
* [catfile: Backport patches to fix leaking catfile processes](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/4638)
<!-- {{ MERGE_REQUEST_LIST }} -->

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
