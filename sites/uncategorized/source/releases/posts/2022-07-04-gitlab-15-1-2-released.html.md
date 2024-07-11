---
title: "GitLab Patch Release: 15.1.2"
categories: releases
author: Ahmad Tolba
author_gitlab: ahyield
author_twitter: gitlab
description: "GitLab releases 15.1.2"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.1.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.1 release](/releases/2022/06/22/gitlab-15-1-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition


* [Refactor add populate commit permission migration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/90282)
* [Resolve "Gitlab doesn't detect the deployment pods after K8s cluster upgrade to v1.22"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/90448)
* [Fix agent token modal](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/90644)
* [Geo Sites Form - Remove Beta Badge](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/90707)
* [Update gitaly_cgroups metric name in docs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/90751)
* [Geo: Update object storage replication documentation for GA](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/90760)
* [Resolve "White screen of death on creating new project"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/91282)
* [Add support for object storage bucket prefixes](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/91307)
* [Revert "Merge branch 'use-until_executed-for-ci-sync-events-workers' into 'master'"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/91429)
* [Fix owner of public/uploads directory in UBI-8 Sidekiq image](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1063)
<!-- {{ MERGE_REQUEST_LIST }} -->

## Important notes on upgrading

This version does not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/) features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
