---
title: "GitLab Patch Release: 12.8.5"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: gitlab
description: "GitLab releases 12.8.5"
tags: patch releases, releases
---

Today we are releasing version 12.8.5 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 12.8 release](/releases/2020/02/22/gitlab-12-8-released/) and
prior versions.

*Note:* Versions 12.8.3 and 12.8.4 were not released due to challenges encountered while preparing the release.  

## GitLab Community Edition and Enterprise Edition

* [Documentation of logs link in embedded panels](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25319)
* [Update ImportExportUploader workhorse_local_upload_path](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25715)
* [Check for existence of last commit sha](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25799)
* [Fix Web IDE fork modal showing no text](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25842)
* [Fixes Vue file list for paths with non-ascii characters](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25877)
* [Fix GraphQL tree query erroring when using tags](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25923)
* [Fixes search for error tracking list](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/26129)
* [Disable Marginalia line backtrace in production](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/26199)
* [Send credentials with GraphQL fetch requests](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/26386)
* [Revert removal of CI status in project dashboards](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/26403)
* [Rescue invalid URLs during badge retrieval in asset proxy](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/26524)
* [Remove unnecessary Redis deletes for broadcast messages](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/26541)
* [Fixed regression when URL was encoded in a loop](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/25849)

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
