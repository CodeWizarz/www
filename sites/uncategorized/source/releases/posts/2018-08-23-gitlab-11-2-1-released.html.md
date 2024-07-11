---
title: "GitLab Patch Release: 11.2.1"
categories: releases
author: Jose Ivan Vargas
author_gitlab: jivanvl
author_twitter: jivanvl
description: "GitLab 11.2.1 patch release resolves a number of regressions and bugs in 11.2 release"
---

Today we are releasing version 11.2.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 11.2 release](/releases/2018/08/22/gitlab-11-2-released/) and
prior versions.

<!-- more -->

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Fix broken Git over HTTP clones with LDAP users](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/21352)
- [Fix wrong commit count in push event payload](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/21338)
- [Eliminate unnecessary and duplicate system hook fires](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/21337)

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

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
