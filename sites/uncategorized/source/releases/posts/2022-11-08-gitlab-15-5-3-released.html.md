---
title: "GitLab Patch Release: 15.5.3"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 15.5.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.5.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.5 release](/releases/2022/10/22/gitlab-15-5-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Mentioned FF in WI iteration docs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/101977)
* [Fix Opensearch compatibility check](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/102285)
* [Add support to AWS encryption with KMS key + S3 endpoint URL](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1085)
* [gitlab-base: set /tmp sticky, RH bug 2138434](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1184)
* [Container Registry: Return 404 Not Found when the metadata DB is not enabled](https://gitlab.com/gitlab-org/container-registry/-/issues/815)
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
