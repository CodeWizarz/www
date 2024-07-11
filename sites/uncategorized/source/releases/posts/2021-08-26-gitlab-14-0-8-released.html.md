---
title: "GitLab Patch Release: 14.0.8"
categories: releases
author: Reuben Pereira
author_gitlab: rpereira2
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 14.0.8"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.0.8 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[the 14.0 release](/releases/2021/06/22/gitlab-14-0-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Revert backfill on ci_build_trace_sections](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/66627)
* [Resolve "operator does not exist: integer[] \|\| bigint in app/models/namespace/traversal_hierarchy.rb"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/67288)
* [Fix Sidekiq workers delete each other's metrics](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/68771)
* [Geo 2.0 Regression - Add ability to remove primary](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/68867)
* [Backport fix for flaky spec to 14.0](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/68959)

## Important notes on upgrading

This version includes a post deploy migration. For multi-node deployments, [it should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

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
