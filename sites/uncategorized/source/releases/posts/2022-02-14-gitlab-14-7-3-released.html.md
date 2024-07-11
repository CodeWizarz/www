---
title: "GitLab Patch Release: 14.7.3"
categories: releases
author: Ahmad Tolba
author_gitlab: ahyield
author_twitter: gitlab
description: "GitLab releases 14.7.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.7.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 14.7 release](/releases/2022/01/22/gitlab-14-7-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Properly exclude pending_destruction packages when creating one](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/79868)
* [Update Import/Export ObjectBuilder for merge requests](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/80278)
* [Fix Geo checksummable check failing when file is nil](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/80280)
* [Update GitHub PRs Importer to force update repository](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/80379)
* [Update Mattermost to 6.2.2 (GitLab 14.7)](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5872)
* [Specify fetch_workers config option to omnibus](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5860)
* [Update Omnibus to v8.2.1.7](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5902)
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
