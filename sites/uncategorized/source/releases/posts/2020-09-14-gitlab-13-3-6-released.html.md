---
title: "GitLab Patch Release: 13.3.6"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: gitlab
description: "GitLab releases 13.3.6"
tags: patch releases, releases
---

Today we are releasing version 13.3.6 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.3 release](/releases/2020/08/22/gitlab-13-3-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [More verbose error message when creating extension](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/40956)
* [Fixes Auto DevOps multiple hosts with comma and space split](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/41404)
* [Enable secret detection in MR Widget](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/41582)
* [Atomically create table and its partitions](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/41773)
* [Use 'read' method to get request body in Conan](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/41801)

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
