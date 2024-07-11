---
title: "GitLab Patch Release: 14.7.2"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: gitlab
description: "GitLab releases 14.7.2"
tags: patch releases, releases
---

Today we are releasing version 14.7.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 14.7 release](/releases/2022/01/22/gitlab-14-7-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Create 14.7 What's New entry](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/78733)
* [Fix cluster integration HTTP adapter](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/78737)
* [Revert "Merge branch 'wc-gitaly-keepalive-limit' into 'master'"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/78966)
* [Fix broken mermaid diagrams](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/79043)
* [GitLab Version - CE Admin Dashboard [RUN ALL RSPEC] [RUN AS-IF-FOSS]](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/79258)
* [Geo: Fix verification failures of remote stored files](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/79303)
* [Update to ruby-magic v0.5.4](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/79388)
* [Geo: Fix reverify object stored files](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/79469)
* [Update PG runtime conf before restarting](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5848)
* [Ensure EE services are added when gitlab-ee::config recipe is included](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5861)
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
