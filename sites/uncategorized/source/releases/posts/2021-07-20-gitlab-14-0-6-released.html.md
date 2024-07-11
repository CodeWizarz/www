---
title: "GitLab Patch Release: 14.0.6"
categories: releases
author: Amy Phillips
author_gitlab: amyphillips
author_twitter: GitLab
description: "GitLab releases 14.0.6"
tags: patch releases, releases
---

Today we are releasing version 14.0.6 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 14.0 release](/releases/2021/06/22/gitlab-14-0-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Free, Premium, and Ultimate:

- [Replace Excon with Faraday for requesting object storage](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64192)
- [Fix LFS objects not downloading with Bitbucket](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/65380)
- [Resolve "Terraform module usage instructions are incorrect"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/65581)
- [Geo: Fix snippet verification by replicating the HEAD ref](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/65783)
- [Fix validation method regarding MIME type keys](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/65954)
- [coordinator: Fix repo creation/removal race for up-to-date secondaries for 14-0-stable](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/3675)

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
