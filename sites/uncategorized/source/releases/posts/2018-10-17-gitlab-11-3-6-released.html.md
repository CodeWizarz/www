---
title: "GitLab Patch Release: 11.3.6"
categories: releases
author: Bob Van Landuyt
author_gitlab: reprazent
author_twitter: bobvlanduyt
image_title: '/images/default-blog-image.png'
description: "GitLab 11.3.6 patch release resolves a number of regressions and bugs in 11.3"
---

Today we are releasing version 11.3.6 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 11.3 release](/releases/2018/09/22/gitlab-11-3-released/) and
prior versions.

## GitLab Enterprise Edition

Available in Starter, Premium, and Ultimate:

- [Fix issue where the default branch is being reset when repository mirroring is enabled](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/7944). This regression was never introduced in Core.

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](https://docs.gitlab.com/ee/update/patch_versions.html).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](/pricing/#gitlab-com)
to use GitLab's own infrastructure.
