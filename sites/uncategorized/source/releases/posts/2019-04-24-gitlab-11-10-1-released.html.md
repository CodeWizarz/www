---
title: "GitLab Patch Release: 11.10.1"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "GitLab Patch Release 11.10.1"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 11.10.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 11.10.0 release](/releases/2019/04/22/gitlab-11-10-released/).

## GitLab Community Edition and Enterprise Edition

* [Only check abilities on rendered GraphQL nodes](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27273)
* [Disable JIT Kubernetes resource creation for project level clusters](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27352)
* [Bring back Rugged implementation of ListCommitsByOid](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27441)
* [Resolve cluster metrics regression](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27442)
* [Fix related merge requests not working with relative URL root](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27475)

## GitLab Enterprise Edition

* [Improve SAML settings with validation, design, and help text](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/10450)
* [Fix approval rules when used with relative url root.](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/10819)
* [Fix add/remove pipeline dashboard issue.](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/11029)
* [Fix JWT token check when repository does not exist](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/11033)
* [Clear local drafts after submitting merge request review](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/11063)
* [Use a single color for the Insights time series bar charts](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/11076)
* [Fix preventing approval of merge requests by an author](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/11263)


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
