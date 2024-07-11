---
title: "GitLab Patch Release: 12.10.6"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "GitLab releases 12.10.6"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 12.10.6 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 12.10 release](/releases/2020/04/22/gitlab-12-10-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Remove index by name on ci_pipelines](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/31043)
* [Extract pages_domain_presenter into a helper fixing related bugs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/31190)
* [GraphQL: ExternallyPaginatedArrayConnection can return incorrect number of items](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/31252)
* [Update Epics badge in Issues doc](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/31623)
* [Fix incorrect regex used in FileUploader#extract_dynamic_path](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/32271)
* [Fix tracking db revert from pg-upgrade](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4116)
* [Ignore the PG_VERSION value if database is not enabled](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4136)
* [Do not set a default value for client side database statement timeout](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4154)
* [Raise using the proper error format](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4189)
* [Ensure we only print the postgres upgrade message when pg is enabled](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4209)
* [Add instance column to services table if it's missing](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/31631)

## Important notes on upgrading

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
