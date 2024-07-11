---
title: "GitLab Patch Release: 14.1.8"
categories: releases
author: Reuben Pereira
author_gitlab: rpereira2
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 14.1.8"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.1.8 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[July's 14.1 release](/releases/2021/07/22/gitlab-14-1-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Backport praefect sub-commands to 14.1](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/4061)
* [Geo: Reduce frequency of redownload attempts](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/70329)
* [Prevent Git operations from checking replication lag on non-Geo-secondary sites](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/73952)
* [Delay praefect database_*_no_proxy removals](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5647)
* [Conditionally generate public_attributes.json](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5674)
* [Update gitlab-mail_room to 0.0.14](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5687)

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
