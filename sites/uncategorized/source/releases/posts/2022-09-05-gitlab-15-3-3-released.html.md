---
title: "GitLab Patch Release: 15.3.3"
categories: releases
author: Jenny Kim
author_gitlab: jennykim-gitlab
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 15.3.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.3.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.3 release](/releases/2022/08/22/gitlab-15-3-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Change Tasks documentation to describe the widget experience](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/95094)
* [Changed POST API saml_group_links to accept acccess_level as integer](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/95607)
* [Add documentation for dormant user period](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/95704)
* [Fix user recent activity links for work item actions](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/95738)
* [Fix flaky SSH remote mirror spec](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/95778)
* [Revert "Merge branch 'tor/feature/interrupt-leaving-pending-review' into 'master'"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/95833)
* [Add Whats New for 15.3](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/95868)
* [Bypass earliest date validation in importing of iteration cadences](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/95872)
* [Improve blame link feature](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/95962)
* [Remove the GIT_CLONE_PATH variable](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/96123)
* [Updating image urls to indicate release](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/96368)
* [Improve error message when omnibus_gitconfig is not set properly](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6298)
* [Geo: Fix redirects of LFS transfer downloads](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/95974)
* [Geo: Do not delete object stored files when not GitLab managed](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/96556)
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

Access to GitLab Premium and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
