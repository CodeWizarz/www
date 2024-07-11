---
title: "GitLab Patch Release: 9.5.3"
categories: releases
date: 2017-09-04
author: Jose Ivan Vargas
author_gitlab: jivanvl
author_twitter: jivanvl
description: "GitLab 9.5.3 patch release resolves a number of regressions and bugs in 9.5.2"
tags: patch releases, releases
---

Today we are releasing version 9.5.3 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[this month's 9.5.2 release](/releases/2017/08/28/gitlab-9-dot-5-dot-2-released/) and
prior versions.

It includes the following fixes:

- **CE/EE** Filter additional secrets from Rails logs. ([!13945])
- **CE/EE** Make username update fail if the namespace update fails. ([!13642])
- **CE/EE** Fix failure when issue is authored by a deleted user. ([!13807])
- **CE/EE** Reverts changes made to signin_enabled. ([!13956])
- **CE/EE** Fix Merge when pipeline succeeds button dropdown caret icon horizontal alignment. ([!13965])
- **CE/EE** Fixed diff changes bar buttons from showing/hiding whilst scrolling.
- **CE/EE** Fix events error importing GitLab projects. ([!13868])
- **CE/EE** Fix pipeline trigger via API fails with 500 Internal Server Error in 9.5. ([!13861])
- **CE/EE** Fixed fly-out nav flashing in & out. ([!13929])
- **CE/EE** Remove closing external issues by reference error. ([!13910])
- **CE/EE** Re-allow appearances.description_html to be NULL. ([!13806])
- **CE/EE** Update and fix resolvable note icons for easier recognition. ([!13821])
- **CE/EE** Eager load head pipeline projects for MRs index. ([!13877])
- **CE/EE** Instrument MergeRequest#fetch_ref. ([!13980])
- **CE/EE** Instrument MergeRequest#ensure_ref_fetched. ([!13876])
- **CE/EE** Notifications weren't sending to participating users with a `Custom` notification setting. ([!13680])
- **CE/EE** Simplify system hook testing and guarantee test will fire ([!13858])
- **CE/EE** Update templates to include header in the README. ([!13785])
- **CE/EE** Add dynamic navigation tunnel to fly-out menus. ([!13315])
- **CE/EE** Fix transient dropdown test failures. ([!13862])
- **CE/EE** Fixes the diff changes buttons from toggling when scrolling. ([!13894])
- **CE/EE** Adds position fixed to right sidebar. ([!13494])
- **CE/EE** Update backup_restore.md documentation regarding S3 and IAM profiles. ([!13871])
- **CE/EE** Increase z-index of dropdowns. ([!13889])
- **CE/EE** Resolve "README.md: Header image scale not limited". ([!13869])
- **CE/EE** Fixed fly-out nav jumping. ([!13690])
- **CE/EE** Update Gitaly version to v0.35.0. ([!13950])
- **CE/EE** Remove skipped examples in filtered issues feature spec. ([!13845])
- **CE/EE** Update Prometheus Client MMAP gem to version that fixes performance degradation. ([!13898])
- **CE/EE** Improve migrations / background migrations testing strategy ([!13589])
- **EE** Add event metrics to mirrors and remote mirrors. ([!2744])
- **EE** Remove skipped examples in filtered issues weight feature spec. ([!2773])
- **EE** Check if `licenses` table exists before loading the current license. ([!2783])
- **Omnibus CE/EE** Fix Mattermost log location. ([!1881])

[!13642]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13642
[!13807]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13807
[!13956]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13642
[!13806]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13806
[!13680]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13680
[!13858]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13858
[!13876]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13876
[!13785]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13785
[!13821]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13821
[!13870]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13870
[!13315]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13315
[!13861]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13861
[!13862]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13862
[!13894]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13894
[!13494]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13494
[!13877]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13877
[!13871]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13871
[!13889]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13889
[!13869]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13869
[!13690]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13690
[!13945]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13945
[!13868]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13868
[!13950]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13950
[!13845]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13845
[!13898]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13898
[!13965]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13965
[!13910]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13910
[!13929]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13929
[!13980]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13980
[!13589]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13589
[!2744]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2744
[!2773]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2773
[!2783]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2783
[!1881]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1881

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`
file](http://doc.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/pricing/).

Access to GitLab Enterprise Edition is granted by a [subscription](/stages-devops-lifecycle/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
