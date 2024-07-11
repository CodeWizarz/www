---
title: "GitLab Patch Release: 14.0.3"
categories: releases
author: Amy Phillips
author_gitlab: amyphillips
author_twitter: GitLab
description: "GitLab releases 14.0.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.0.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 14.0 release](/releases/2021/06/22/gitlab-14-0-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

- [Reintroduce recursive_approach_for_all_projects default-enabled](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64632)
- [Fix pages deployment storage migration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64697)
- [Fix frequent items timestamps not updated](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64737)
- [Fix bug where Milestone page led to console error](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64775)
- [Fix broken Time Tracking Reports on Issuable sidebar](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64797)
- [Geo - Fix state value in the lfs_object_registry table](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64801)
- [Revert a 14.0 change in the deployments API](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64845)
- [DevOps Adoption - ensure displayNamespaceId is included](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64904)
- [Geo - Move migration to a pre-deployment migration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64948)
- [Run batched migrations on self-managed instances](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/65106)
- [Fix deploy keys not working with LFS auth check](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/65205)
- [Repository: Fix repo replication with transactions](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/3631)
- [Repository: Fix excessive voting in CreateRepositoryFromBundle](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/3621)

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
