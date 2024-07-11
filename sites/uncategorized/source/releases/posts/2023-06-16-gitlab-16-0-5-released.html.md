---
title: "GitLab Patch Release: 16.0.5"
categories: releases
author: Alessio Caiazza
author_gitlab: nolith
author_twitter: gitlab
description: "GitLab releases 16.0.5"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/-/blob/master/general/patch/blog-post.md -->

Today we are releasing versions 16.0.5 for GitLab Community Edition and Enterprise Edition.

These versions resolve a number of regressions and bugs.

## GitLab Community Edition and Enterprise Edition

### 16.0.5

* [Update gitlab-elasticsearch-indexer version](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/122335)
* [Add Metrics Dashboard menu](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/122995)
* [Fix HllRedisCounter overwriting know events aggregation with symbol instead of string (backport)](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/123155)
* [Slowly iterate MigrateSharedVulnerabilityIdentifiers](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/122859)
* [Do not run bulk cron indexer when cluster is unhealthy](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/123699)
* [Use root_ref to index commits](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/123524)

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
