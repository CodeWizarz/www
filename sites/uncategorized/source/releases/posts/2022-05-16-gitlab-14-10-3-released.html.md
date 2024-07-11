---
title: "GitLab Patch Release: 14.10.3"
categories: releases
author: Graeme Gillies
author_gitlab: ggillies
author_twitter: gitlab
description: "GitLab releases 14.10.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.10.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 14.10 release](/releases/2022/04/22/gitlab-14-10-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition


* [Resolve "Batched background migrations - Add steal method"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/86551)
* [Add upgrade note from the 14.10 Release Post](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/86614)
* [Add Git SSH / Shell limits](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/87088)
* [Fix assignee filtering on group/project issues list](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/87164)
* [Fix gin index detection on routes table](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/87648)
* [Fix gin index detection on background_migration/project_namespaces](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/87374)
* [Remove Geo database settings only if some services are enabled](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6072)
* [Add object storage configuration key deprecations](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6098)
* [Add option to disable separated caches](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/88016)

## Important notes on upgrading

For multi-node deployments, this version [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

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
