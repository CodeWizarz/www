---
title: "GitLab Patch Release: 13.4.1"
categories: releases
author: John Jarvis
author_gitlab: jarv
author_twitter: gitlab
description: "GitLab releases 13.4.1"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 13.4.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.4 release](/releases/2020/09/22/gitlab-13-4-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Revert required encryption on CI runner tokens](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/42623)
* [Fix missing VSA request parameters](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/42655)
* [Notification icons: Render empty string for "custom" setting](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/42848)
* [Add missing fa- icons for file_type_icon_class](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/43091)
* [Allow Unleash Clients to Request Feature Flags for Private Repositories](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/43059)

## Important notes on upgrading

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
