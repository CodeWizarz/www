---
title: "GitLab Patch Release: 13.4.4"
categories: releases
author: John Jarvis
author_gitlab: jarv
author_twitter: gitlab
description: "GitLab releases 13.4.4"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 13.4.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.4 release](/releases/2020/09/22/gitlab-13-4-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Geo: Fix "Project/wiki/design repo not able to resync after storage move"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/44172)
* [Fix rollback of migration that adds temporary index for container scanning findings](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/44593)
* [Improve merge error when pre-receive hooks fail in fast-forward merge](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/44843)
* [Resolve "gitlab-ctl patroni members results in error with prettytable"](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4628)
* [Fix resolution of Gitlab::AppLogger in EE kerberos_spnego_helper](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/44822)


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
