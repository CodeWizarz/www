---
title: "GitLab Patch Release: 14.10.2"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: gitlab
description: "GitLab releases 14.10.2"
tags: patch releases, releases
---

Today we are releasing version 14.10.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 14.10 release](/releases/2022/04/22/gitlab-14-10-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition


* [Fixes HTML browsing for CI artifacts](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/83917)
* [Update CI job artifacts verification status](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/85587)
* [What's New 14.10](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/85625)
* [Fix mappings errors for ES6.8](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/85633)
* [Fix: unexpected escaped HTML tag](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/85770)
* [doc: Extend Gitaly /tmp workaround to cover Git execution path](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/85779)
* [Add documentation for mr settings audit events part 1](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/85796)
* [Fix a broken image link in 14.10 What's New](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/85836)
* [Clarify cluster deletion behavior in APIs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/85913)
* [Resolve "Fork relationship is not respected for certain projects"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/86102)
* [Add documentation for pending migration in 14.9](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/85888)
* [Update deprecations for 15.0](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6040)
* [Fix deprecation of gitlab_rails keys](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6078)

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
