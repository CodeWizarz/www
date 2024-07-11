---
title: "GitLab Patch Release: 12.4.2"
categories: releases
author: Yorick Peterse
author_gitlab: yorickpeterse
author_twitter: yorickpeterse # please use gitlab if you don't want to use your own
description: "GitLab 12.4.2 has been released"
tags: patch releases, releases
---

Today we are releasing version 12.4.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in [this month's 12.4.0
release](/releases/2019/10/22/gitlab-12-4-released/) and prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

* [Update feature tier for CI_JOB_TOKEN](https://gitlab.com/gitlab-org/gitlab/merge_requests/18810)
* [Add param to catch fo fix failing SAST job](https://gitlab.com/gitlab-org/gitlab/merge_requests/18847)
* [Increased deactivation threshold to 180 days](https://gitlab.com/gitlab-org/gitlab/merge_requests/18902)
* [Use long_timeout for fetch_internal_remote GRPC](https://gitlab.com/gitlab-org/gitlab/merge_requests/18908)
* [Clarify available feature flags for productivity analytics](https://gitlab.com/gitlab-org/gitlab/merge_requests/18926)
* [Removes old collapsible classes](https://gitlab.com/gitlab-org/gitlab/merge_requests/18948)
* [Fix feature flag check for productivity analytics](https://gitlab.com/gitlab-org/gitlab/merge_requests/19025)
* [Clean up duplicate indexes on ci_trigger_requests](https://gitlab.com/gitlab-org/gitlab/merge_requests/19053)
* [Add extra sentence about registry to AutoDevOps popup](https://gitlab.com/gitlab-org/gitlab/merge_requests/19092)
* [Fix project imports not working with serialized data](https://gitlab.com/gitlab-org/gitlab/merge_requests/19124)
* [Fixes welcome icons not showing](https://gitlab.com/gitlab-org/gitlab/merge_requests/19148)
* [Fix Prometheus duplicate metrics](https://gitlab.com/gitlab-org/gitlab/merge_requests/19327)
* [Fix ref switcher not working on Microsoft Edge](https://gitlab.com/gitlab-org/gitlab/merge_requests/19335)
* [Fix migration to sync issuables with unknown states](https://gitlab.com/gitlab-org/gitlab/merge_requests/19373)
* [Extend gRPC timeouts for Rake tasks](https://gitlab.com/gitlab-org/gitlab/merge_requests/19461)
* [Resolve "images stopped loading: signed URLs of uploads expire earlier than redirect cache"](https://gitlab.com/gitlab-org/gitlab/merge_requests/19494)

## Upgrade barometer

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
