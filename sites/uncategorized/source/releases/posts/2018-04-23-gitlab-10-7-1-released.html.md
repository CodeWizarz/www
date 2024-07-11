---
title: "GitLab Patch Release: 10.7.1"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: may_cabrera
description: "GitLab 10.7.1 patch release resolves a number of regressions and bugs in 10.7 release."
tags: patch releases, releases
---

Today we are releasing version 10.7.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 10.7 release](/releases/2018/04/22/gitlab-10-7-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Retry icon is misaligned in pipelines graph actions](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18345)
- [Changes the ID for the performance bar to correctly sticky the stat bar to the top](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18359)
- [Fixed IDE sidebar not being scrollable in FireFox](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18350)
- [Remove confirm box when redirecting to new merge request form in IDE](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18362)
- [Fix raw HTML being shown on the MR page from Performance widget](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18370)
- [Validate project path prior to hitting the database.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18322)
- [Fix skeleton placeholder on diff has white background](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17792)
- [Optimise rendering of Markdown documents that belong to different projects](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18157)
- [Fix regularly error message (_Error getting performance bar results_) seeing in production](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18419)
- [Fix a case with empty secret CI/CD variables](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18400)
- [Fix URLs in the link header for `GET /projects/:id/repository/contributors` when no value is passed for `order_by` or `sort`](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18393)
- [Fix loading state not showing in IDE tree list](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18421)
- [Add product badges to docs](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18408)
- [Fix `Trace::HttpIO` can not render multi-byte chars](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18417)
- [Fix regression around new SHA widget in "New Merge Request" Screen](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18422)
- [Fix Markdown typo in Web IDE docs](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18443)
- [Fixed web IDE not working for sub-groups](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18404)
- [Fix N+1 queries when loading participants for a commit note](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18471)
- [Fix specifying a non-default ref when requesting an archive using the legacy URL](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18468)
- [Fix direct_upload for old records](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18360)
- [Respect visibility options and description when importing project from template](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18473)
- [Fix issues without links when added from boards new issue  modal](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18460)
- [Fix text from the diff is showing within a table header inside the discussion after the discussion is resolved](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18492)
- [Add an API endpoint to download git repository snapshots](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18173)
- [Fix gitaly-proto version for gitlab-ce v10.7.1](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18510)
- [Removes  'Job log message' from build trace](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18523)
- [Update doorkeeper](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18543)

Available in GitLab Starter, Premium, and Ultimate:

- [Fix missing border top in codeclimate report](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5340)
- [Avoid wrong closing dates being caught by the query on Burndown charts](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5400)
- [Fix Epic timeline bar misalignment when start date is in last timeframe month and end date is out of range](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5360)

Available in [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/):

- [Geo: Fix statement timeout counting local job artifacts](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18444)
- [Geo: Document steps to enable FDW if running from before 10.4](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5356)
- [Geo: Improve SSH key replication step documentation](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5319)
- [Geo: Fixes high number of sequential scans in project_repository_states](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5348)
- [Geo: Add extra reconfigure step in docs to enable FDW](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5385)
- [Geo: Add back job artifacts sync status to /admin/geo_nodes](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5411)
- [Geo: Fix `NULL` insert attempts for `missing_on_primary`](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5428)
- [Geo: Fix enabled wiki counts with FDW enabled (impacts synced, out-of-sync, and verified wiki counts)](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5352)

## Upgrade barometer

This version includes a new migration that should not require any downtime.
GitLab.com migrations took approximately 12 minutes. There are no background
migrations.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/stages-devops-lifecycle/).

Alternatively, [sign up for GitLab.com](/pricing/#gitlab-com)
to use GitLab's own infrastructure.
