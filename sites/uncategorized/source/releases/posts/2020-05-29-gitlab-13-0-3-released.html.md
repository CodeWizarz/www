---
title: "GitLab Patch Release: 13.0.3"
categories: releases
author: Alessio Caiazza
author_gitlab: nolith
author_twitter: gitlab
description: "GitLab releases 13.0.3"
tags: patch releases, releases
---

Today we are releasing version 13.0.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.0 release](/releases/2020/05/22/gitlab-13-0-released/) and
prior versions.

* [Suggestion to add more details to DAST_EXCLUDE_RULES variable.](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/32088)
* [Add support for including user/groups from parent/ancestors](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/32353)
* [Fixed redirection to project snippets](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/32530)
* [Resolve "Geo: Design thumbnails are not replicated"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/32703)
* [Fix 404s downloading latest build artifacts](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/32741)
* [Update deprecated routes in irker integration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/32923)
* [Fix Auto DevOps manual rollout jobs not being allowed to fail](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/32865)
* [Change format of variables parameter in Prometheus proxy API for metrics dashboard](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/33062)
* [Update Ruby to 2.6.6](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4239)
* [Update Praefect Grafana dashboards](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4241)
* [Fix warning message in nginx](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4251)
* [Do not run Grafana reset during docker startup](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4264)
* [Fix API performance regression in issues API](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/33235)
* [Fix "Close Issue" button by changing target selector](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/33294)
* [Confirm protected branch before running checks](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/33310)

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
