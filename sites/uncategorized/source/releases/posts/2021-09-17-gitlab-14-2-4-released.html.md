---
title: "GitLab Patch Release: 14.2.4"
categories: releases
author: Reuben Pereira
author_gitlab: rpereira2
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 14.2.4"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.2.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[last month's 14.2 release](/releases/2021/08/22/gitlab-14-2-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Free, Premium, and Ultimate:

* [Removes cleanup job from Terraform.latest](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/70383)
* [Run AWS Release rake task only if on latest stable tag](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5575)
* [Fix Elastic::MigrationWorker current_migration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/70429)
* [Derive virtual storage's filesystem id from its name](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/3838)

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
