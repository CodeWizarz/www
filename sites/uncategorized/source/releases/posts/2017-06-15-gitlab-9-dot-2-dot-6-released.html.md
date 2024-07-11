---
title: "GitLab Patch Release: 9.2.6"
author: Timothy Andrew
author_gitlab: timothyandrew
author_twitter: timothyandrew
categories: releases
description: The GitLab 9.2.6 patch release resolves a number of regressions in 9.2.5
tags: patch releases, releases
---

Today we're releasing version 9.2.6 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in [this month's 9.2.5 release](/releases/2017/06/07/gitlab-9-dot-2-dot-5-security-release/).

Please read on for more details.

<!-- more -->

- **CE/EE**: Assignee dropdown does not display selected assignee ([!11744])
- **CE/EE**: Resolve "pipeline_schedules pages throwing error 500" ([!11706])
- **CE/EE**: Fix error thrown with missing note fragment in DOM ([!11700])
- **CE/EE**: Fix incorrect ETag cache key when relative instance URL is used ([!11964])
- **CE/EE**: Make sure reCAPTCHA configuration is loaded when spam checks are initiated ([!12080])
- **CE/EE**: Fix math rendering on blob pages ([!11793])
- **CE/EE**: Fix note header author and time ago wrapping in parallel diff ([!11702])
- **CE/EE**: nil-check Repository::is_ancestor? ([!11976])
- **CE/EE**: Fix backup task to continue on corrupt repositories ([!11962])
- **CE/EE**: Backport from EE: Fix '/unassign' slash command ([!11926])
- **CE/EE**: Fix filtered search issuable empty state exception ([!11347])
- **CE/EE**: Use headless Google Chrome browser in GitLab QA ([!11680])
- **CE/EE**: Fixed issue boards not filtering when URL params are encoded ([!11320])
- **CE/EE**: Fix LFS timeouts when trying to save large files ([!11866])
- **CE/EE**: Only remove FK if it exists ([!11828])
- **CE/EE**: Fix alignment of tree symbols in merge requests ([!11761])
- **CE/EE**: Resolve "User autocomplete per_page does not work" ([!11742])
- **CE/EE**: Fix issue realtime title/description change CSS transition ([!11731])
- **CE/EE**: Remove 0 margin bottom for last paragraph on note text ([!11699])
- **CE/EE**: Fix alignment of hover state on emoji button ([!11691])
- **CE/EE**: Show private subgroups if member of parent group ([!11773])
- **CE/EE**: Fix description flash with newline differences (HTML entities) ([!11946])
- **CE/EE**: Center loading spinner in issuable filters ([!11818])
- **CE/EE**: Remove extra bottom padding on Job log page ([!11791])
- **CE/EE**: Fix alignment of tree symbols in merge requests ([!11761])
- **CE/EE**: Fix: Milestone - Participants list is showing duplicate assignees ([!11758])
- **CE/EE**: Strip trailing whitespaces in submodule URLs ([!11753])
- **CE/EE**: Fix counter cache invalidation ([!11736])
- **CE/EE**: Displays loading icon in async buttons inline ([!11735])
- **CE/EE**: Resolve "Browser notifications for pipeline running in a MR is gone" ([!11734])
- **CE/EE**: Resolve "Resolved discussions icon is misaligned" ([!11711])
- **CE/EE**: Set emoji-menu z-index to 200 ([!11686])
- **CE/EE**: Provide default for calculating label text color ([!11681])
- **CE/EE**: Use #real_next_run in pipelines table ([!11660])
- **CE/EE**: Fix terminals support for Kubernetes service ([!11653])
- **CE/EE**: Check only a merge ability for protected actions ([!11648])
- **CE/EE**: Disable "Remove source branch" in MR Widget for users who can't remove, and re-add checkbox to MR form ([!11558])
- **CE/EE**: Return the last coverage in trace stream ([!11128])
- **EE**: Geo - Properly set tracking database connection and cron jobs on secondary node ([!1987])
- **EE**: Fix locked milestone in boards being remove-able - 9.2 merge edition ([!1977])
- **EE**: Check if database_geo.yml exist before setting the tracking DB config ([!2071])
- **EE**: Resolve "Approvers don't appear when MR is created from a fork" ([!2035])
- **EE**: Fixed header being over issue boards in focus mode ([!2002])
- **EE**: Fix Error 500 when viewing a merge request with a deleted source project ([!1996])
- **EE**: Fix bug where files over 2 GB would not be saved in Geo tracking DB ([!1992])
- **EE**: Add per page to user autocomplete (EE) ([!1991])
- **EE**: Fix '/unassign' slash command ([!1986])
- **EE**: re-add avatar url to approver avatar ([!2034])
- **EE**: Ee fix kubernetes namespace ([!2014])
- **EE**: MR approval placeholders same size as images ([!2007])
- **EE**: Resolve "Deploy boards won't stop spinning on 9.2.1-ee" ([!1983])
- **Omnibus**: Add default values to GitLab Geo roles ([!1608])
- **Omnibus**: Fix gitlab-ctl replicate-geo-database when run in a Docker container ([!1612])
- **Omnibus**: Resolve "Permission denied when mounting volume for /var/opt/gitlab" ([!1603])

[!11744]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11744
[!1968]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1968
[!11706]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11706
[!11700]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11700
[!11964]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11964
[!12080]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12080
[!11793]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11793
[!1987]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1987
[!11702]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11702
[!1977]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1977
[!1608]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1608
[!2071]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2071
[!11976]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11976
[!11962]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11962
[!1612]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1612
[!11926]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11926
[!11347]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11347
[!11680]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11680
[!11320]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11320
[!2035]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2035
[!1603]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1603
[!11866]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11866
[!11828]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11828
[!2002]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2002
[!11761]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11761
[!1996]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1996
[!1992]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1992
[!1991]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1991
[!11742]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11742
[!11731]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11731
[!1986]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1986
[!11699]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11699
[!11691]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11691
[!11773]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11773
[!11946]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11946
[!2034]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2034
[!2014]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2014
[!11818]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11818
[!2007]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2007
[!11791]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11791
[!11761]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11761
[!11758]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11758
[!11753]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11753
[!11736]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11736
[!11735]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11735
[!11734]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11734
[!1983]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1983
[!11711]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11711
[!11686]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11686
[!11681]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11681
[!11660]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11660
[!11653]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11653
[!11648]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11648
[!11558]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11558
[!11128]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11128

## Upgrade barometer

Upgrading to `9.2.6` requires no downtime.

GitLab EE contains a single migration only used by Geo secondary nodes. We're
adding a database-level limit to an integer field for the Geo tracking database.

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
