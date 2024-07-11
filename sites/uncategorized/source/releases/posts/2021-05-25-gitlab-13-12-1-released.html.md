---
title: "GitLab Patch Release: 13.12.1"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "GitLab releases 13.12.1"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 13.12.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.12 release](/releases/2021/05/22/gitlab-13-12-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Add deprecation notice for implicit grant flow](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/62061)
* [Fix pipeline security tab scanner filter not working](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/62276)
* [Fix the Create new cluster feature](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/62341)
* [Handle nil Content-Type in Service Desk emails](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/62408)

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
