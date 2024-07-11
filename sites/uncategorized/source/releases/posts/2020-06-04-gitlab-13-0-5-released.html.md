---
title: "GitLab Patch Release: 13.0.5"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "GitLab releases 13.0.5"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 13.0.5 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.0 release](/releases/2020/05/22/gitlab-13-0-released/) and
prior versions.

* [Fix NoMethodError when reporting exceptions to Sentry](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/33260)
* [Fix ambiguous string concatenation on CleanupProjectsWithMissingNamespace](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/33497)
* [Fix multiple issue creation for Generic Alerts](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/33647)
* [Fix bug in snippets updating only file_name or content](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/33375)
* [Disable compression for open archive](https://gitlab.com/gitlab-org/gitlab-workhorse/-/merge_requests/508)
* [Fix Content-Length set prior to SendUrl injection](https://gitlab.com/gitlab-org/gitlab-workhorse/-/merge_requests/496)

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
