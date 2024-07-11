---
title: "GitLab Patch Release: 10.6.2"
categories: releases
author: Filipa Lacerda
author_gitlab: filipa
author_twitter: FilipaLacerda
description: "GitLab 10.6.2 patch release resolves one regression in 10.6 release."
tags: patch releases
---

Today we are releasing version 10.6.2 for GitLab Community Edition and Enterprise Edition.

This version resolves one regression in
[this month's 10.6 release](/releases/2018/03/22/gitlab-10-6-released/) and
prior versions.

<!-- more -->

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Cloning a repository over HTTPS with LDAP credentials causes a HTTP 401 Access denied](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17988)
- [Don't capture trailing punctuation when autolinking](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17965)
  - Note: This was released in GitLab Premium and Ultimate in [10.6.1](https://gitlab.com/gitlab-org/gitlab-ce/tags/v10.6.1) by mistake. We are now including it in GitLab Core.

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](/pricing/#gitlab-com)
to use GitLab's own infrastructure.
