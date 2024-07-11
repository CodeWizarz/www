---
title: "GitLab Patch Release: 13.7.5"
categories: releases
author: Alessio Caiazza
author_gitlab: nolith
author_twitter: nolith
description: "GitLab releases 13.7.5"
tags: patch releases, releases
---

Today we are releasing version 13.7.5 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.7 release](/releases/2020/12/22/gitlab-13-7-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Disable ref tx hooks for FetchRemote calls](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/3002)
- [Fix brand_new_project_guidelines not being displayed](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/50736)
- [Resolve "The `gitlab-ctl patroni failover` command does not work"](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4909)
- [Fix https pages settings](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4919)
- [Convert external_http pages setting to bool for rails](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4929)
- [Fix LFS not working with S3 specific-storage settings](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/52296)
- [Only use top level groups in devops adoption](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/51565)

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
