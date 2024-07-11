---
title: "GitLab Patch Release: 11.5.11, 11.6.11, 11.7.12, 11.8.8, 11.9.9"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: skarbek
description: "GitLab Patch Release: 11.5.11, 11.6.11, 11.7.12, 11.8.8, 11.9.9"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 11.5.11, 11.6.11, 11.7.12, 11.8.8, 11.9.9 for GitLab Community Edition and Enterprise Edition.

## GitLab Community Edition and Enterprise Edition

These set of patches are geared towards improved performance of accessing git
data when using NFS for file storage of git data.  This feature sits behind a
feature flag discussed here:
[https://docs.gitlab.com/ee/administration/nfs.html#improving-nfs-performance-with-gitlab](https://docs.gitlab.com/ee/administration/nfs.html#improving-nfs-performance-with-gitlab)

### Performance

* [Bring back a subset of Rugged calls under a feature flag](https://gitlab.com/gitlab-org/gitlab-ce/issues/57317)

### 11.8.8

* [Backport Kerberos clone URL to CE](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/25750)
* [Backports EE change for expanded pipelines](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26043)
* [Fix Bitbucket import](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26050)
* [Fix health checks not working behind load balancers](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26055)
* [Fix error creating a merge request when diff includes a null byte](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26190)
* [Renders inline downstream & upstream pipelines](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/9627)

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
