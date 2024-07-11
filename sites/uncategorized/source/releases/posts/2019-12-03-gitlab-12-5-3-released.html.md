---
title: "GitLab Patch Release: 12.5.3"
categories: releases
author: Marin Jankovski
author_gitlab: marin
author_twitter: gitlab
description: "12.5.3 resolves several issues in the 12.5 release"
tags: patch releases, releases
---

Today we are releasing version 12.5.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[the 12.5.0 release](/2019/11/22/gitlab-12-5-released/) and
prior versions.

* [Fix `ci_cd_settings`, `project_feature` Import](https://gitlab.com/gitlab-org/gitlab/merge_requests/20174)
* [Ensure the proj route is correct for error details](https://gitlab.com/gitlab-org/gitlab/merge_requests/20320)
* [Update EKS help links](https://gitlab.com/gitlab-org/gitlab/merge_requests/20328)
* [Flatten exception details in API and controller logs](https://gitlab.com/gitlab-org/gitlab/merge_requests/20434)
* [Remove auto height on clone button](https://gitlab.com/gitlab-org/gitlab/merge_requests/20572)
* [Fix project creation with templates using /projects/user/:id API](https://gitlab.com/gitlab-org/gitlab/merge_requests/20590)
* [Set the SHA to be merged from push options](https://gitlab.com/gitlab-org/gitlab/merge_requests/20639)
* [Fix Crossplane help link](https://gitlab.com/gitlab-org/gitlab/merge_requests/20668)
* [Fix autoscrolling in job logs](https://gitlab.com/gitlab-org/gitlab/merge_requests/20772)
* [Remove extra index on snippets.project_id](https://gitlab.com/gitlab-org/gitlab/merge_requests/20834)
* [Geo - Improve query to determine job artifacts to sync when selective sync is enabled](https://gitlab.com/gitlab-org/gitlab/merge_requests/19583)
* [Geo - Update limitations on replication/verification](https://gitlab.com/gitlab-org/gitlab/merge_requests/20171)
* [Geo - Does not schedule duplicated jobs while backfilling uploads, LFS objects and job artifacts](https://gitlab.com/gitlab-org/gitlab/merge_requests/20324)


## Upgrade barometer

This version includes a new migration, but should not require any
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
