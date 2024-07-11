---
title: "GitLab Patch Release: 14.0.5"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: GitLab
description: "GitLab releases 14.0.5"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.0.5 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 14.0 release](/releases/2021/06/22/gitlab-14-0-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Resolve "404 for package details link under Infrastructure Registry for projects nested under 2 group levels"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64553)
* [Resolve "Terraform module usage instructions are incorrect"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/64660)
* [Add documentation for boards epic create](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/65454)
* [Initialize conversion of ci_builds_metadata.id for bigint migration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/65477)
* [Fix git clone for projects with a trailing dot over HTTP](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/65489)
* [Do not create audit event for failed logins on read-only DB](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/65504)
* [Add prefix to autocomplete path](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/65508)
* [Return empty strings for Jira links when URL is not set](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/65547)
* [Fix libmagic not being able to find magic files](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/699)

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

