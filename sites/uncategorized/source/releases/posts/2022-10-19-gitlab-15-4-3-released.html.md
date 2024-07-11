---
title: "GitLab Patch Release: 15.4.3"
categories: releases
author: Jenny Kim
author_gitlab: jennykim-gitlab
author_twitter: gitlab
description: "GitLab releases 15.4.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.4.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.4 release](/releases/2022/09/22/gitlab-15-4-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Restore caching for License.current logic](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/101434)
* [Fix closing of external issues](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/101278)
* [Gitaly: add config.toml back, as mock template](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1149)
* [Fix REST/GRAPHQL APIs handling TODOs WorkItem target](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/100081)
* [Sign in: use custom logo again](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/98898)
* [Sign in: use custom logo again](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/98898)
* [Gitaly: add config.toml back, as mock template](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1149)


## Important notes on upgrading

This version does not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Premium and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
