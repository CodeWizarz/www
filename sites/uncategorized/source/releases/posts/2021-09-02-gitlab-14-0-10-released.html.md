---
title: "GitLab Patch Release: 14.0.10 and 14.1.5"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: gitlab
description: "GitLab releases 14.0.10 and 14.1.5"
tags: patch releases, releases
---

Today we are releasing versions 14.0.10 and 14.1.5 for GitLab Community Edition and Enterprise Edition.

These versions resolve a number of regressions and bugs in the
[14.0](/releases/2021/06/22/gitlab-14-0-released/) and
[14.1](/releases/2021/07/22/gitlab-14-1-released/) releases.

## GitLab Community Edition and Enterprise Edition

The main purpose of these two releases is to resolve [high CPU usage by the
Gitaly server](https://gitlab.com/gitlab-org/gitaly/-/issues/3754):

- [Only activate Git pack-objects hook if cache is enabled](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/3807)
- [Backport improved replication logic](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/3825)

Additionally, 14.1.5 includes the following fixes:

* [Geo: Replicate multi-arch containers](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/67624)
* [Run AWS Release rake task only if on latest stable tag](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5575)

## Important notes on upgrading

These versions do not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

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
