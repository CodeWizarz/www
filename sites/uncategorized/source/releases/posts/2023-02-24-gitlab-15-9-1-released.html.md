---
title: "GitLab Patch Release: 15.9.1"
categories: releases
author: Alessio Caiazza
author_gitlab: nolith
author_twitter: gitlab
description: "GitLab releases 15.9.1"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.9.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.9 release](/releases/2023/02/22/gitlab-15-9-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

- [Resolve "Deprecate legacy praefect config structure in Omnibus"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/110945)
- [Fix dependency check in license approval policies](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/112110)
- [Fix LDAP config `sync_name` problem](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/112389)
- [Document rate limit for Direct transfer](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/112488)
- [Missaligned ref-selector dropdown button on search page status bar](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/112555)
- [Fix Broadcast messages not showing in admin console](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/112595)
- [Bump omniauth_openid_connect to v0.6.1](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/112781)
<!-- {{ MERGE_REQUEST_LIST }} -->

## Important notes on upgrading

This version does not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Premium and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
