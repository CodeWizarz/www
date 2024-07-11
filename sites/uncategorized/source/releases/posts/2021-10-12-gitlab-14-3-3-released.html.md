---
title: "GitLab Patch Release: 14.3.3"
categories: releases
author: Reuben Pereira
author_gitlab: rpereira2
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 14.3.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.3.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 14.3 release](/releases/2021/09/22/gitlab-14-3-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Fix dependency proxy image prefix](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/71511)
* [Drop taggings index if exists during migration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/71606)
* [Fix 2FA setup for users with no password](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/71694)
* [Disable caching of MergeToRefService call in mergeability check](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/71909)
* [Delay praefect database_*_no_proxy removals](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5647)
* [Update cacerts to 2021-09-30](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5650)
* [Symlink OpenSSL default cert file to Debian cert path](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/784)

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
