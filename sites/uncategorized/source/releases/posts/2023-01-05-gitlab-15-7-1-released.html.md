---
title: "GitLab Patch Release: 15.7.1"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: gitlab
description: "GitLab releases 15.7.1"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.7.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.7 release](/releases/2022/12/22/gitlab-15-7-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Fix flaky CI builds count metric test](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/107505)
* [Update dependency proxy details in Geo data types table](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/107641)
* [Remove vulnerability state migration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/107689)
* [Workaround a segfault due to array GC bug](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/107706)
* [Relax FIPS constraints on PyPi packages](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/107773)
* [Update curl to 7.87.0](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6589)
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
