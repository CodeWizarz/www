---
title: "GitLab Patch Release: 14.5.1"
categories: releases
author: Henri Philipps
author_gitlab: hphilipps
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 14.5.1"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.5.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[last month's 14.5 release](/releases/2021/11/22/gitlab-14-5-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Support Action Cable on GCP Memorystore](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/75173)
* [Fix the SSL_CERT_DIR logging on git operations](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/75196)
* [Fix for hexadecimal branch deletion](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/75344)
* [Check validation for license only if new record](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/75352)
* [Fix Google Memorystore support for Action Cable](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5753)
* [catfile: Ensure structs are properly aligned in memory for 32-bit CPUs](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/4142)
* [praefect: Backport separate endpoint for datastore collector](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/4107)

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
