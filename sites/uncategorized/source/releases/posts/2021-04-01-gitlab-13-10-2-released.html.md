---
title: "GitLab Patch Release: 13.10.2"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: gitlab
description: "GitLab releases 13.10.2"
tags: patch releases, releases
---

Today we are releasing version 13.10.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.10 release](/releases/2021/03/22/gitlab-13-10-released/).

## GitLab Community Edition and Enterprise Edition

* [Fixes the old emoji menu showing a undefined category](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/56860)
* [Added frequently used emojis to new picker](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/56332)
* [Improve performance for composer v2 clients](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/55169)
* [Epic boards documentation](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/56725)
* [Remove incorrect and misleading statement in SAST documentation](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/56965)
* [Document configuring external KAS with GitLab](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/56972)
* [Create 13.10 What's New entry](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/57119)
* [Remove admin mode entry from What's New](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/57146)
* [Fix Deploy Keys text in What's New](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/56971)
* [Fix epic boards tier in docs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/57404)
* [Fixed rendering of the image blobs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/57479)
* [Revert "Fix long polling to default to 50 s instead of 50 ns"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/57903)
* [Update gitlab-org/gitlab-exporter from 10.0.0 to 10.1.0](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5123)

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
