---
title: "GitLab Patch Release: 12.8.1"
categories: releases
author: Yorick Peterse
author_gitlab: yorickpeterse
author_twitter: yorickpeterse # please use gitlab if you don't want to use your own
description: "GitLab releases 12.8.1"
tags: patch releases, releases
---

Today we are releasing version 12.8.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 12.8 release](/releases/2020/02/22/gitlab-12-8-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Added technical evaluation issue template](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/23636)
* [Documentation for Pages configuration file](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/24690)
* [Fixes 'tags' support in 'default'](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/24741)
* [Doc update monitoring dashboard](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/24929)
* [Fixes markdown layout of incident issues](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25352)
* [Update GitLab version for duplicating dashboards](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25366)
* [Fixes query to retrieve Job Artifacts always use the selective sync version on Geo](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25388)
* [Fixes broken chart in Monitor dashboards](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25399)
* [Correctly render GFM in README files](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25445)
* [Fixes unknown action type: `setInitialState` error on Release edit page](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25469)
* [Add `scheduling_type` to tags entry with default values](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25545)
* [Correctly handle hash for README's in Vue file listing](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25594)
* [Fixes upgrade failure in EE displaying license](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25788)

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
