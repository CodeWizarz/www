---
title: "GitLab Patch Release: 13.2.1"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: gitlab
description: "GitLab releases 13.2.1"
tags: patch releases, releases
---

Today we are releasing version 13.2.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in [this month's 13.2
release](/releases/2020/07/22/gitlab-13-2-released/) and prior versions.

## GitLab Community Edition and Enterprise Edition

* [Geo: Fix package file backfill with sync object storage disabled](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/36771)
* [Limit database deprecation notice window](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/37009)
* [Enables diff file-by-file navigation by default](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/37090)
* [Fix merge request approvals for EE without license](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/37246)
* [Disable security scanner alerts](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/37354)
* [DAG visualization FF: Update default to true in HAML](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/37435)
* [Fix local tiller default enabled inconsistency](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/37494)
* [Fix JS error when discussion has no diff_file](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/37569)
* [Resolve "Fix missing path for avatars of bots"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/37671)
* [Resolve "Pasting an image into a comment also uploads design"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/37171)
* [Shorten "enable LFS" message for design management](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/37385)
* [Add "more information" to Design Management LFS message](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/37538)

## Omnibus GitLab

* [Make actioncable recipe and control files match new runit requirement](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4337)

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

