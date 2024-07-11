---
title: "GitLab Patch Release: 16.3.3"
categories: releases
author: Vladimir Glafirov
author_gitlab: vglafirov
author_twitter: gitlab
description: "GitLab releases 16.3.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/-/blob/master/general/patch/blog-post.md -->

Today we are releasing versions 16.3.3 for GitLab Community Edition and Enterprise Edition.

These versions resolve a number of regressions and bugs.

## GitLab Community Edition and Enterprise Edition

### 16.3.3

* [Pin redis-client to v0.17.0](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1529)
* [Backport !6251 to 16-3-stable](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/6339)
* [Backport create ci_pipelines iid sequence on new projects to 16.3](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/130835)
* [Backport 16.3  Fix cluster service reindexing params](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/130576)
* [Patch UpdateCiMaxTotalYamlSizeBytesDefaultValue - stable branch](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/130823)
* [Remove gdk base image and pin gdk sha](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/131121)
* [Backport Enable sync with package metadata db by default](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/131070)
* [Backport "Prevent pipeline creation while import is running" to 16.3](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/131156)

## Important notes on upgrading

This version does not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](https://docs.gitlab.com/ee/update/zero_downtime.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Premium and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
