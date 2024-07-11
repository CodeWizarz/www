---
title: "GitLab Patch Release: 15.4.2"
categories: releases
author: Jenny Kim
author_gitlab: jennykim-gitlab
author_twitter: gitlab
description: "GitLab releases 15.4.2"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.4.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.4 release](/releases/2022/09/22/gitlab-15-4-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Docs for Suggested Reviewers](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/95128)
* [Feat(doc): docs on Gitaly GPG signing](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/96098)
* [Update work item tasks user docs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/98218)
* [Add What's New for 15.4](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/98480)
* [Ensure that stage name and record are in sync for page deployments](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/98506)
* [Gitaly: remove config.toml, unneeded, problematic.](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1145)
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
