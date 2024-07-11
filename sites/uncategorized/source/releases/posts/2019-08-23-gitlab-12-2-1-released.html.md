---
title: "GitLab Patch Release: 12.2.1"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "12.2.1 resolves several issues in the 12.2 release"
tags: patch releases, releases
---

Today we are releasing version 12.2.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 12.2.0 release](/releases/2019/08/22/gitlab-12-2-released/).

## GitLab Community Edition and Enterprise Edition

* [Removes duplicate button from job log page](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31544)
* [Rename License Management to License Compliance](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31590)
* [Link more issues in Design Management Limitations](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31697)
* [Embed specific metrics chart in issue docs](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31900)
* [Fix Gitaly N+1 calls with listing issues/MRs via API](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31938)
* [Clarify when new values are valid](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31951)
* [Embed metrics undefined param fix](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31975)
* [Fix "ERR value is not an integer or out of range" errors](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/32126)

## Omnibus GitLab

* [Fix Error 500s when loading repositories with license files](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/3542)

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

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
