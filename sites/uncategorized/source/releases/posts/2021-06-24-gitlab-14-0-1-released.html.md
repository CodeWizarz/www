---
title: "GitLab Patch Release: 14.0.1"
categories: releases
author: Amy Phillips
author_gitlab: amyphillips
author_twitter: gitlab
description: "GitLab releases 14.0.1"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.0.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 14.0 release](/releases/2021/06/22/gitlab-14-0-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Free, Premium, and Ultimate:

- [Update Geo UI screenshots in docs page](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64080)
- [Update admin docs with new admin area access info](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64317)
- [Add Helm-2to3.gitlab-ci.yml to Auto DevOps](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64330)
- [Update docs for new Members page location on GitLab navigation](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64368)
- [DevOps Adoption - ensure displayNamespaceId is included](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64397)
- [Remove add button from Devops Adoption](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64400)
- [Geo: Add Terraform Module to datatypes doc](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64458)
- [Create 14.0 What's New entry](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64525)
- [Toggle codequality diff annotations flag](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64536)
- [Bump kas to v14.0.1](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64566)
- [Exempt unicorn 'svlogd_prefix' from deprecation check](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5395)

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
