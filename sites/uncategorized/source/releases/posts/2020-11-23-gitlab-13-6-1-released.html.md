---
title: "GitLab Patch Release: 13.6.1"
categories: releases
author: John Jarvis
author_gitlab: jarv
author_twitter: gitlab
description: "GitLab releases 13.6.1"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 13.6.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.6 release](/releases/2020/11/22/gitlab-13-6-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Add documentation for SSE image upload config](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/47480)
* [Fixes this bug on the group cluster page](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/47992)
* [Fix `project` attribute of `StoreScanService` class](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/48013)
* [Fixes issue with broken runner installation instructions](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/48026)
* [Fix project transfer corrupting shared runners state](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/48032)
* [Fix gap on project select dropdown](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/48065)
* [Resolve "Mentioning users is now very slow"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/48217)
* [Enable alert management for configured http integrations](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/48247)
* [Update docs to remove an issue board list and filter issues](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/48252)
* [Does not track package events on a read-only instance](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/48257)
* [Fix link to correct epic](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/48295)
* [Re-name Instance Statistics as Usage Trends](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/48183)
* [Fix tags pages erroring for projects with private pipelines](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/47735)

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
