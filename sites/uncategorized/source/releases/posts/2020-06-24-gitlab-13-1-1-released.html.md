---
title: "GitLab Patch Release: 13.1.1"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra_cabrera
author_twitter: gitlab
description: "GitLab releases 13.1.1"
tags: patch releases, releases
---

Today we are releasing version 13.1.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.1 release](/releases/2020/06/22/gitlab-13-1-released/) and
prior versions.

* [Bump gitlab-mail_room to 0.0.6](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/34787)
* [Load user before logging git http-requests](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/34923)
* [Do not mask key comments for DeployKeys](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/35014)
* [Fix templating vars set from URL in Metrics Dashboards](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/34668)
* [Periodically recompute project authorizations](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/34071)
* [Fixes status dropdown](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/34775)
* [Update to Grafana 7](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4297)
* [Manually disable copy_file_range() on RedHat kernels](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4346)

## Important notes on upgrading

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

