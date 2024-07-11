---
title: "GitLab Patch Release: 15.9.3"
categories: releases
author: Alessio Caiazza
author_gitlab: nolith
author_twitter: gitlab
description: "GitLab releases 15.9.3"
tags: patch releases, releases
---

Today we are releasing version 15.9.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.9 release](/releases/2023/02/22/gitlab-15-9-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Removing markdown checklist task feature flag](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/112259)
* [Add group merge checks settings document](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/112649)
* [Fix object deletion not working with Azure Blob Storage](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/113032)
* [Note that Kerberos headers are needed to build GitLab shell now](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/113079)
* [Fix BackfillUserDetailsFields migration finalization](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/113152)
* [Guard against dropped columns when finalizing user details migration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/113253)
* [Enable Geo::RepositoryRegistrySyncWorker on Geo secondary site](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/113320)
* [Docs for marking a batched BG migration finished](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/113628)
* [Fix foreign_key_exists? migration helper](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/113797)

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
