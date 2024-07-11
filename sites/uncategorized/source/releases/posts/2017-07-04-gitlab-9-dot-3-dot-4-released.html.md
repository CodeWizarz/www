---
title: "GitLab Patch Release: 9.3.4"
categories: releases
author: James Edwards-Jones
author_gitlab: jamedjo
author_twitter: jamedjo
description: "GitLab 9.3.4 patch release resolves a number of regressions and bugs in 9.3.2, as well as a single fix for 9.3.3"
tags: patch releases, releases
---

Today we are releasing version 9.3.4 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[this month's 9.3.2 release](/releases/2017/06/28/gitlab-9-dot-3-dot-2-released/) and
prior versions. A fix is also included for the 9.3.3 release which we decided
not to announce, and is [described below](#what-happened-to-933).

It includes the following fixes:

- **CE/EE:** Fix head pipeline stored in merge request for external pipelines ([!12478])
- **CE/EE:** Bring back branches badge to main project page ([!12548])
- **CE/EE:** Fix diff of requirements.txt file by not matching newlines as part of package names ([!12495])
- **CE/EE:** Perform housekeeping only when an import of a fresh project is completed ([!12529])
- **CE/EE:** Fix issue boards closed list not showing all closed issues ([!12271])
- **CE/EE:** Fix multi-line markdown tooltip buttons in issue edit form ([!12549])
- **CE/EE:** Display no error message if user is not logged in when using issuable search bar ([!12415])
- **CE/EE:** Adds missing encoding coercion calls on Gitaly ref responses ([!12522])
- **CE/EE:** Fix scroll flicker on pages with a sidebar where viewport overflows ([!12501])
- **CE/EE:** Prevent top of Job trace page being obscured when a banner is active ([!12556])
- **CE/EE:** Update `gitlab-shell` to `5.1.1` ([gitlab-shell!142])
- **EE:** Add metrics to both remote and non remote mirroring ([!2118])
- **EE:** Force import worker with mirror to insert mirror in front of queue ([!2231])
- **EE:** Fix locked and stale SSH keys file from `9.3.0` upgrade ([!2240])
- **EE:** Fix crash in LDAP sync when user was removed ([!2289])
- **EE:** Allow rebase for unapproved merge requests ([!2273])
- **EE:** Geo - Fix `path_with_namespace` for instances of `Geo::DeletedProject` ([!2267])
- **EE:** Fix shared runners minutes query to update only projects with used allowance ([!2275])
- **Omnibus:** Allow sidekiq-cluster to run without having sidekiq enabled ([omnibus-gitlab!1691])
- **Omnibus:** Remove outdated Mattermost v2 DB upgrade code ([omnibus-gitlab!1689])
- **Omnibus:** Switch `postgresql['custom_pg_hba_entries']` from Array to Hash ([omnibus-gitlab!1682])

[!12271]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12271
[!12415]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12415
[!12458]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12458
[!12478]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12478
[!12495]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12495
[!12501]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12501
[!12505]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12505
[!12522]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12522
[!12529]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12529
[!12548]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12548
[!12549]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12549
[!12556]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12556
[!2118]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2118
[!2231]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2231
[!2240]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2240
[!2267]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2267
[!2273]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2273
[!2275]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2275
[!2289]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2289
[omnibus-gitlab!1691]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1691
[omnibus-gitlab!1689]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1689
[omnibus-gitlab!1682]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1682
[gitlab-shell!142]: https://gitlab.com/gitlab-org/gitlab-shell/merge_requests/142

## What happened to 9.3.3?

The `9.3.3` packages were automatically released before we'd installed them on
Gitlab.com, and upon noticing errors with Post Receive processing ([#2822]) we
advised users to continue using `9.3.2`. Only `9.3.3-ee` was affected.

This `9.3.4` release updates gitlab-shell to include the fix for both CE and
EE.

Going forward we are changing our build process so packages are not made
public until we're ready to announce them here ([!1683]).

[!1683]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1683
[#2822]: https://gitlab.com/gitlab-org/gitlab-ee/issues/2822

## Upgrade barometer

This version includes two small migrations and a background migration.
These relate to `authorized_keys_enabled` for ([!2240]) and should not require
any downtime.

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
