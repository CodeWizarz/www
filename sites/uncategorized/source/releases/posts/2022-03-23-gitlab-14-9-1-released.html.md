---
title: "GitLab Patch Release: 14.9.1"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 14.9.1"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.9.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 14.9 release](/releases/2022/03/22/gitlab-14-9-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Fix backups not working when feature_flags table does not exist](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/83101)
* [Add deprecation notices that missed the 14.9.0 release tag](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/83451)
* [Alias user_email_lookup_limit to search_rate_limit](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/83213)
* [Reverts '353995-feature-flag-enable-geo_job_artifact_replication'](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/83302)
* [Geo Upgrade warning for 14.9](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/83309)
<!-- {{ MERGE_REQUEST_LIST }} -->

## Important notes on upgrading

This version does not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/README.html#upgrading-without-downtime).

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
