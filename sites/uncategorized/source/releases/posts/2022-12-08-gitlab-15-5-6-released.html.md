---
title: "GitLab Patch Release: 15.5.6"
categories: releases
author: Jenny Kim
author_gitlab: jennykim-gitlab
author_twitter: gitlab
description: "GitLab releases 15.5.6"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.5.6 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[last month's 15.5 release](/releases/2022/10/22/gitlab-15-5-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition


* [Gitaly: Fix migration of gitconfig with subsections](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6512)
* [Conditionally enable FIPS auto-detection](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6480)
* [Remove resource_group usage for package releases](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6492)
* [Bump Container Registry to v3.60.1-gitlab](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1185)
* [Fix flaky PostgreSQL builds](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1178)
* [Revert refactor #98971](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/105854)
* [Revert Sidekiq default routing rules](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/103643)



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

Access to GitLab Premium and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
