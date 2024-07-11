---
title: "GitLab Patch Release: 13.7.3"
categories: releases
author: Alessio Caiazza
author_gitlab: nolith
author_twitter: nolith
description: "GitLab releases 13.7.3"
tags: patch releases, releases
---
Today we are releasing version 13.7.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.7 release](/releases/2020/12/22/gitlab-13-7-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

* [Fix Canary Ingress weight is not reflected on UI immediately](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/50246)
* [Change pages deployments size column to bigint](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/50262)
* [Set registry fields to nullable](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/50362)
* [Update Helm 2 version to 2.17.0](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/50547)
* [Follow-up from "Fix project access token regression"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/50800)
* [Note feature flag for user cap](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/50806)
* [Job Trace polling solution](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/49982)

## Important notes on upgrading

This version does include new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

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
