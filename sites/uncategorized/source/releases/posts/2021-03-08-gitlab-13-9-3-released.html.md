---
title: "GitLab Patch Release: 13.9.3"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: gitlab
description: "GitLab releases 13.9.3"
tags: patch releases, releases
---

Today we are releasing version 13.9.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.9 release](/releases/2021/02/22/gitlab-13-9-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Upgrade gitlab-shell to v13.17.0](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/55295)
* [Use new temp index for backfilling artifact expiry](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/55091)
* [Fix disabling of Kroki optional formats](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/55665)
* [Rename asset_proxy_allowlist column](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/55884)
* [Document how to disable S3 multi-threaded copying](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/55252)

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
