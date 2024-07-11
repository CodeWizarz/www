---
title: "GitLab Patch Release: 14.6.3"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: gitlab
description: "GitLab releases 14.6.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.6.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[last month's 14.6 release](/releases/2021/12/22/gitlab-14-6-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Geo: adapt verification timed out query to use state table](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/77364)
* [Fix migration for cases with empty strings](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/77506)
* [Fix the order of subsequent jobs when requeuing a job](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/77528)
* [Geo: Resolve "undefined method each_batch"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/77676)
* [Fix destruction of projects with pipelines](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/77941)
* [Revert chef-acme cookbook update](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5819)
* [Update golang to 1.16.12](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/853)
* [Pass knapsack generate report var to gitlab-qa](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5818)
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
