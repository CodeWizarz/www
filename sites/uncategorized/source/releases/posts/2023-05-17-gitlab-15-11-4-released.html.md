---
title: "GitLab Patch Release: 15.11.4"
categories: releases
author: Steve Abrams
author_gitlab: sabrams
author_twitter: gitlab
description: "GitLab releases 15.11.4"
tags: patch releases, releases
---

Today we are releasing versions 15.11.4 for GitLab Community Edition and Enterprise Edition.

These versions resolve a number of regressions and bugs.

## GitLab Community Edition and Enterprise Edition

### 15.11.4

* [[15.11] Update redis-namespace dependency in MailRoom](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1396)
* [Do not autofocus the description field](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/120306)
* [Adapt MR widget to support fail-closed approval rules](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/120131)
* [Fix group blobs search permission when migration is not complete](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/120159)
* [Use correct migration finalisation method](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/120683)
* [[15.11] Add SMTP timeout configuration options](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6888)
* [[15.11] Validate that SMTP settings do not enable both TLS and STARTTLS](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6876)

## Important notes on upgrading

This version does not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

Publishing of the AWS Marketplace listing for GitLab Enterprise Edition Premium version 15.11.4 was delayed, but is now available.

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Premium and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
