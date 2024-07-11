---
title: "GitLab Patch Release: 14.9.3"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "GitLab releases 14.9.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.9.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[last month's 14.9 release](/releases/2022/03/22/gitlab-14-9-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Change mp4 to image](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/83435)
* [Fix null argument handling in background migration Rake task](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/84318)
* [Remove pending builds from the queue on conflict](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/84359)
* [Fix URL blocker when object storage enabled but type is disabled](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/84511)
* [Fixing regex on grep for cleanup function.](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/943)
* [kubectl: set HOME to /tmp/kube, speed up kubectl](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/946)
* [Revert Protected Environment group access inheritence](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/84685)
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
