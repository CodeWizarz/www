---
title: "GitLab Patch Release: 15.6.2"
categories: releases
author: Jenny Kim
author_gitlab: jennykim-gitlab
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 15.6.2"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.6.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.6 release](/releases/2022/11/22/gitlab-15-6-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Add docs for work item description](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/104189)
* [Fix deleting protected branch](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/104259)
* [Fix release number for internal notes](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/104261)
* [Doc: Remove stray comma in /link example](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/104351)
* [Potential fix for flaky spec in resolve discussions spec](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/104503)
* [Update GitLab Migration doc about projects migration on .com](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/104566)
* [Fix memory limit for RssMemoryLimit monitor](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/104747)
* [feat: This updates labkit to version 0.29.0](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/105072)
* [Hide marketing-related entries](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/105220)
* [Finalize group member namespace id migration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/105288)
* [Revert refactor #98971](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/105360)
* [Conditionally disable fastupdate on GIN indexes (issues, merge_requests)](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/105375)
* [Consolidate database cleaner code for migrations](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/105600)
* [Potential fix for flaky user_edit_profile_spec.rb](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/105889)
* [gitaly: Fix migration of gitconfig with subsections](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6512)
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
