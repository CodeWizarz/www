---
title: "GitLab Patch Release: 13.0.7"
categories: releases
author: Yorick Peterse
author_gitlab: yorickpeterse
author_twitter: yorickpeterse # please use gitlab if you don't want to use your own
description: "GitLab releases 13.0.7"
tags: patch releases, releases
---

Today we are releasing version 13.0.7 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[last month's 13.0 release](/releases/2020/05/22/gitlab-13-0-released/) and
prior versions.

* [Group authorization refresh to consider shared groups](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/31204)
* [Pass int when getting I18n VSA stage summary title](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/33717)
* [Use ProxyVariableSubstitutionService for variable substitution in alerts](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/33772)
* [Fix relative URL root in wiki_base_path](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/33841)
* [Adjust wrong column reference for ResetMergeStatus (background job)](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/33899)
* [Fix geo timeout issue with pg-upgrade](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4148)
* [Manually disable copy_file_range() on RedHat kernels](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4346)
* [Fix Auto DevOps Postgresql PVC deletion](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/34657)
* [Periodically recompute project authorizations](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/34071)
* [Load user before logging git http-requests](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/34923)

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
