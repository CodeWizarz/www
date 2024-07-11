---
title: "GitLab Patch Release: 13.3.8"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: gitlab
description: "GitLab releases 13.3.8"
tags: patch releases, releases
---

Today we are releasing version 13.3.8 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[August's 13.3 release](/releases/2020/08/22/gitlab-13-3-released/).

## GitLab Community Edition and Enterprise Edition

* [Update object_storage.md to fix the object store connection using iam](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/42165)
* [Make SSH keys publicly accessible](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/42288)
* [Add missing fa- icons for file_type_icon_class](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/43091)
* [Handle 500 error for GraphQL "configureSast" mutation](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/43936)
* [Use our mirror of Helm stable repo](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/44875)
* [Geo: Fix documentation typo](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/41365)
* [Geo: Fix "Project/wiki/design repo not able to resync after storage move"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/44172)

## Important notes on upgrading

This version does not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

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
