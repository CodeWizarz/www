---
title: "GitLab Patch Release: 14.8.3"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 14.8.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.8.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[last month's 14.8 release](/releases/2022/02/22/gitlab-14-8-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->
* [Ensure cleanup job artifacts task does not include pipeline artifacts](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/81022)
* [Be specific that default.md is not case-sensitive](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/81548)
* [Fix handling of resource iteration events when deleting a User](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/82060)
* [Fix rake task to setup the Geo tracking database](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/82340)
* [Fix startup crash in Puma single mode](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/82817)
* [Removes advice not to mix p/c with compliance pipes](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/82383)
* [Move postcss to dependencies](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/82418)
* [Doc: Update repository signing key expriation date](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5943)

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
