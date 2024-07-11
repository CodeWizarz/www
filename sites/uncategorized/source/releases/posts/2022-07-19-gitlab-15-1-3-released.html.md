---
title: "GitLab Patch Release: 15.1.3"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: gitlab
description: "GitLab releases 15.1.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.1.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.1 release](/releases/2022/06/22/gitlab-15-1-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Add praefect list virtual storages subcommand documentation](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/89936)
* [Fix flaky feature specs for "user awards emoji"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/91630)
* [Fix flaky repository settings spec](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/92178)
* [Fix group access dropdown failure if no subgroups are available](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/91635)
* [Fix worker processes not starting up due to 0 processes](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6192)
* [Ensure Ruby platform is set globally for arm64 based operating systems](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6208)
* [Adjust worker processes to use real CPUs instead of cores](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6210)
* [Set force_ruby_platform to true locally for Gitaly and GitLab Rails](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6212)
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
