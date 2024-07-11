---
title: "GitLab Patch Release: 13.12.4"
categories: releases
author: Alessio Caiazza
author_gitlab: nolith
author_twitter: nolith
description: "GitLab releases 13.12.4"
tags: patch releases, releases
---
Today we are releasing version 13.12.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.12 release](/releases/2021/05/22/gitlab-13-12-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Free, Premium, and Ultimate:

- [Fix double render in project's git URL redirect](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/62053)
- [Fix MR diff compare with previous version](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/62535)
- [Add alias method usage_ping_enabled?](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/63784)
- [Do not show Praefect deprecation if Praefect is disabled](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5350)
- [Update Mattermost to 5.34.4](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5361)

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
