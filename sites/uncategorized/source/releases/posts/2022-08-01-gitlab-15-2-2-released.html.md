---
title: "GitLab Patch Release: 15.2.2"
categories: releases
author: Reuben Pereira
author_gitlab: rpereira2
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 15.2.2"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.2.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.2 release](/releases/2022/07/22/gitlab-15-2-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Add password complexity doc again](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/92641)
* [Use `CREATE OR REPLACE FUNCTION` to define vulnerability reads triggers](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/92941)
* [Fixes CI/CD settings error when Secure Files feature flag is disabled](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/93050)
* [Resolve "Illegal instruction in json.rb after upgrade to 15.2.0-ce"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/93171)
* [Fix ES client for nil password](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/93184)
* [Fix RescheduleBackfillImportedIssueSearchData migration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/93311)
* [Fix CI artifact sizes not logged for some runner endpoints](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/93502)
* [Gracefully handle nil created_at values in CI pipelines](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/93589)
* [Upgrade Oj to v3.13.19 to fix a seg fault](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/93611)
* [Gracefully handle blank CPU information](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6230)
* [Add security mirrors of GitLab projects](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6223)
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
