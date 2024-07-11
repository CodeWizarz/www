---
title: "GitLab Patch Release: 10.8.4"
categories: releases
author: Filipa Lacerda
author_gitlab: filipa
author_twitter: FilipaLacerda
description: "GitLab 10.8.4 patch release resolves a number of regresssions and bugs in 10.8 release."
tags: patch releases, releases
---

Today we are releasing version 10.8.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 10.8 release](/releases/2018/05/22/gitlab-10-8-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition
- No new changes.

## Available in [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/):

- [Treat external authorization service 403 response status as failure](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5909)
- [Display 403 error and response message when access is denied by external authorization service](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5964)
- [Validate external authorization classification label exists when updating project classification](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5976)
- [Fix breadcrumb and external authorization classification label being hidden by system message](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5997)

## Upgrade barometer

This version includes a new migration that should not require any downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
