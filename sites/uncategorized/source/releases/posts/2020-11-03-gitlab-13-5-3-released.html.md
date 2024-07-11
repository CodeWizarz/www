---
title: "GitLab Patch Release: 13.5.3 and 13.4.6"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "GitLab releases 13.5.3 and 13.4.6"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 13.5.3 and 13.4.6 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[last month's 13.5 release](/releases/2020/10/22/gitlab-13-5-released/) and
the [previous month's 13.4 release](/releases/2020/09/22/gitlab-13-4-released/).

## GitLab Community Edition and Enterprise Edition

### 13.4.6

* [Use our mirror of Helm stable repo](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/44875)
* [Implementation of PITR recovery before promotion](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4636)
* [Fix PG password error when enabling extensions during DB init](https://gitlab.com/gitlab-org/charts/gitlab/-/merge_requests/1593)

### 13.5.3

* [Add environment variables to override backup/restore DB settings](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/45855)
* [Fix incorrect S3 KMS key id ARN in object storage](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/46107)
* [Fix cloud native job logs not finalizing with Azure](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/46209)
* [Downgrade vue-router to fix IDE issue with special characters](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/46398)
* [Ensure that copy to clipboard button is visible](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/46466)
* [Add ci_new_artifact_file_reader FF again](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/46552)
* [Enable ci_trace_new_fog_store feature flag by default](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/46577)
* [Implementation of PITR recovery before promotion](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4636)
* [Set net.core.somaxconn kernel parameter for Puma](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4688)

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
