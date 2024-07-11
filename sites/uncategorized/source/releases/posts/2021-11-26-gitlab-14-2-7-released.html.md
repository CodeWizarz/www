---
title: "GitLab Patch Release: 14.2.7"
categories: releases
author: Henri Philipps
author_gitlab: hphilipps
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 14.2.7"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.2.7 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[August's 14.2 release](/releases/2021/08/22/gitlab-14-2-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Free, Premium, and Ultimate:

- [Let non-members set confidential flag when creating an issue in public project](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/68459)
- [Geo: Reduce frequency of redownload attempts](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/70329)
- [Remove defaultAuthors from MR Analytics and VSA](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/72492)
- [Prevent Git operations from checking replication lag on non-Geo-secondary sites](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/73952)
- [Delay praefect database_no_proxy removals](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5647)
- [Conditionally generate public_attributes.json](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5674)
- [Fix URL for unzip v6.0 download](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5705)
- [Add praefect prometheus_exclude_database_from_default_metrics config value](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5740)
- [Symlink OpenSSL default cert file to Debian cert path](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/784)
- [ubi8: Install Ruby binstubs for Gitaly gems](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/808)
- [Update GitLab MailRoom to v0.0.14](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/802)
- [Praefect: Backport separate endpoint for datastore collector](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/4096)
- [Materialize valid_primaries view](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/4088)
- [Fix for regression with Postgres 11 due to MATERIALIZED views](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/4119)
- [Backport praefect sub-commands to 14.2](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/4072)

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
