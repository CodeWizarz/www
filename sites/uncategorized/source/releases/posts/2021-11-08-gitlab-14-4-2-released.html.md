---
title: "GitLab Patch Release: 14.4.2"
categories: releases
author: Reuben Pereira
author_gitlab: rpereira2
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 14.4.2"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.4.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[last month's 14.4 release](/releases/2021/10/22/gitlab-14-4-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Fix focus mode on boards](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/72382)
* [Prevent Sidekiq size limiter middleware from running multiple times on the same job](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/72435)
* [Skip st_diff callback setting on LegacyDiffNote when importing](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/72897)
* [Create 14.4 What's New entry](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/72900)
* [Fix error 500 loading branch with UTF-8 characters with performance bar](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/72925)
* [Fix issue_metrics index creation error](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/72928)
* [Remove skip_legacy_diff_note_callback_on_import from legacy diff note](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/73207)
* [Document track-repository praefect subcommand](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/73488)
* [Skip retrying for reads on connection errors if primary only](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/73715)
* [Bump Go dependency to 1.16](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/73829)
* [Build and publish ARM64 AMIs](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5682)
* [Fix URL for unzip v6.0 download](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5705)
* [ubi8: Install Ruby binstubs for Gitaly gems](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/808)

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
