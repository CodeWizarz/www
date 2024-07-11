---
title: "GitLab Patch Release: 13.9.1"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: gitlab
description: "GitLab releases 13.9.1"
tags: patch releases, releases
---

Today we are releasing version 13.9.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.9 release](/releases/2021/02/22/gitlab-13-9-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Fix N+1 SQL regression in exporting issues to CSV](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/54287)
* [Fix issue email participants migration version](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/54346)
* [Send SIGINT instead of SIGQUIT to puma](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/54446)
* [Updates authorization for lint](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/54492)
* [Log disk_path instead of path for importer](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/54568)
* [Reset templates cache key](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/54614)
* [Restore missing scrollbar on boards](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/54634)
* [Fix: keep latest artifacts checkbox shows always disabled](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/54669)
* [Fix 'Open in your IDE' buttons don’t open the IDE](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/54671)
* [Fix Metric tab not showing up on operations page](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/54736)
* [Fix S3 object storage failing when endpoint is not specified](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/54868)
* [Fix broken What's New image](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/54921)
* [Fix duplicate text in What's New](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/54945)
* [Ensure Marketplace AMIs have licenses embedded](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5031)

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
