---
title: "GitLab Patch Release: 14.4.3"
categories: releases
author: Henri Philipps
author_gitlab: hphilipps
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 14.4.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.4.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[October's 14.4 release](/releases/2021/10/22/gitlab-14-4-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Fix 2FA setup for LDAP users](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/73538)
* [Allow SSO callbacks through maintenance mode](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/73550)
* [Prevent Git operations from checking replication lag on non-Geo-secondary sites](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/73952)
* [Geo - Fix no repo error message for group-level wikis](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/74133)
* [Fix for hexadecimal branch deletion](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/75344)
* [Add praefect prometheus_exclude_database_from_default_metrics config value](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5740)
* [Check validation only if new record of license](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/75523)
* [Wrap Sidekiq scheduler threads in Rails reloader](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/74778)
* [Materialize valid_primaries view ](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/4090)
* [praefect: Backport separate endpoint for datastore collector](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/4094)
* [sql-migrate: Update storage_repositories table](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/4113)
* [datastore: Revert use of materialized views](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/4117)
* [list-untracked-repositories: Praefect sub-command to show untracked repositories](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/4115)

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
