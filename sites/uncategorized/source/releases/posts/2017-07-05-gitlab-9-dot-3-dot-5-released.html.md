---
title: "GitLab Patch Release: 9.3.5"
categories: releases
author: James Edwards-Jones
author_gitlab: jamedjo
author_twitter: jamedjo
description: "GitLab 9.3.5 patch release resolves a number of regressions and bugs in 9.3.4"
tags: patch releases, releases
---

Today we are releasing version 9.3.5 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[this month's 9.3.4 release](/releases/2017/07/04/gitlab-9-dot-3-dot-4-released/) and
prior versions.

It includes the following fixes:

- **CE/EE:** Resolve "More actions dropdown hidden by end of diff" ([!12380])
- **CE/EE:** Remove "Remove from board" button from backlog and closed list ([!12430])
- **CE/EE:** Fix a bug where an invalid sort param value was passed to Gitaly ([!12534])
- **CE/EE:** Set default for Remove source branch to false ([!12576])
- **CE/EE:** Do not delete protected branches when deleting all merged branches ([!12624])
- **CE/EE:** Document that GitLab 9.3 requires the TRIGGER permission on MySQL ([!12573])
- **CE/EE:** Prevent accidental deletion of protected MR source branch by repeating checks before actual deletion ([!12574])
- **CE/EE:** Rebuild the dynamic path before validating it ([!12213])
- **CE/EE:** Make clear that Go 1.8 is required since GitLab 9.2 ([!12564])
- **CE/EE:** Expire full_path cache after a repository is renamed/transferred ([!12575])
- **CE/EE:** Remove placeholder note when award emoji slash command is applied ([!12545])
- **CE/EE:** Update prometheus client gem ([!12632])
- **EE:** Make admin mirror application setting Gitlab.com exclusive ([!2307])
- **EE:** Fix approvals request throwing 400 in IE 11 ([!2306])
- **EE:** Add more logging to repository mirror feature ([!2292])
- **EE:** Make `Geo::RepositorySyncService` force create a repo ([!2316])
- **Omnibus:** Update `gitlab-monitor` to `1.9.0` ([omnibus-gitlab!1703])
- **Omnibus:** Fix port not being passed to pg_basebackup in replicate-geo-database script ([omnibus-gitlab!1697])

[!12213]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12213
[!12380]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12380
[!12430]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12430
[!12475]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12475
[!12534]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12534
[!12545]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12545
[!12564]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12564
[!12573]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12573
[!12574]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12574
[!12575]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12575
[!12576]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12576
[!12624]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12624
[!12632]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12632
[!2292]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2292
[!2306]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2306
[!2307]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2307
[!2316]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2316
[omnibus-gitlab!1697]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1697
[omnibus-gitlab!1703]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1703

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
