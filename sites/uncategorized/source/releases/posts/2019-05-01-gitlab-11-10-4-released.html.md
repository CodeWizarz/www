---
title: "GitLab Patch Release: 11.10.4"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "This version resolves regressions and bugs in 11.10.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 11.10.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in [this month's 11.10.3
release](/releases/2019/04/30/security-release-gitlab-11-dot-10-dot-3-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [`on_stop` is not automatically triggered with pipelines for merge requests](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27618)
* [Fix pipelines for merge requests does not show pipeline page when source branch   is removed](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27803)
* [Resolve "Merge Request Popover is not working on the To Do page"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27382)
* [Resolve "500 error on save of general pipeline settings timeout"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27416)
* [Add feature flag to disable LFS check](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27451)
* [Fix Metrics environments dropdown](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27586)
* [Resolve "MR Popover is not attached in system notes"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27589)
* [Fix bug when project export to remote url fails](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27614)
* [Use wiki partial in search results](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27634)
* [CE: Adds missing prop](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27671)
* [Resolve "Deployment jobs broken as of 11.10.0"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27687)
* [Prevent text selection when dragging in issue boards](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27724)
* [Resolve "Masked Variable still printed in log output on gitlab.com"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27768)
* [Prevent concurrent execution of PipelineScheduleWorker](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27781)
* [Fix slow performance with compiling HAML templates](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27782)

## GitLab Enterprise Edition

* [[Insights] Change the default weeks period limit to 12](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/11498)
* [Adds missing prop in pipelines graph](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/11591)
* [Fix license app with relative url](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/11717)

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
