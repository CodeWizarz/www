---
title: "GitLab Patch Release: 14.2.1"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: gitlab
description: "GitLab releases 14.2.1"
tags: patch releases, releases
---

Today we are releasing version 14.2.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 14.2 release](/releases/2021/08/22/gitlab-14-2-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Adding upgrade messaging for PK migrations](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/68088)
* [Don't override vulnerability feedback UUID anymore](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/68313)
* [Reorder vulnerability check criteria](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/68503)
* [Fix "getAction is undefined" bug](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/68583)
* [Drop un-used db/ci_migrate symlink](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/68710)
* [Fix migration NameError in rails env helper](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5552)
* [Bump Container Registry to v3.9.0-gitlab](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/740)

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
