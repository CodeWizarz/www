---
title: "GitLab Patch Release: 15.0.2"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 15.0.2"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.0.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[last month's 15.0 release](/releases/2022/05/22/gitlab-15-0-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Restore DS_ANALYZER_NAME for deprecated jobs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/87851)
* [Hide internal note checkbox on unsupported issuable types](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/87899)
* [Fix drag and drop list item bugs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/87904)
* [Move LFK scheduling out from EE check](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/87983)
* [Remove existing repository backups when creating a full backup](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/88088)
* [docs: Fix DS_DEFAULT_ANALYZERS variable docs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/88132)
* [Fix copy in what's new entry](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/88181)
* [Fix focus for linked issues input field & IDE cursor](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/88270)
* [Fix issue description list item styling](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/88423)
* [Include inherited owners when calculating User#solo_owned_groups](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/88486)
* [Add event type in audit event streaming](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/88509)
* [Fix Service Ping payload hash key shadowing](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/88648)
* [Fix 500 on issues list page](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/88656)
* [Fix PG version mentioned for package upgrades](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/88739)
* [Fix Advanced Search Opensearch detection](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/88840)
* [Update auto-deploy-image to v2.28.2](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/89191)
* [Skip auto-restart of PG during reconfigure as part of pg-upgrade](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6122)
* [UBI: fix gitlab-exporter artifact to include libpq](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1037)
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
