---
title: "GitLab Patch Release: 9.3.2"
author: Clement Ho
author_gitlab: ClemMakesApps
author_twitter: ClemMakesApps
categories: releases
description: "GitLab 9.3.2 patch release resolves a number of regressions and bugs in 9.3.1"
tags: patch releases, releases
---

Today we're releasing version 9.3.2 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in [this month's 9.3.1 release](/releases/2017/06/27/gitlab-9-dot-3-dot-1-released/).

Please read on for more details.

<!-- more -->

- **CE/EE:** Resolve "Submitting reply to existing diff discussion using Cmd/Ctrl+Enter submits twice and refreshes page" ([!12352])
- **CE/EE:** Resolve "Unable to access edit comment from dropdown menu in certain screen sizes" ([!12421])
- **CE/EE:** Revert "Annotate" to "Blame" ([!12401])
- **CE/EE:** Fix optional arguments for POST :id/variables ([!12474])
- **CE/EE:** Fixes problem with the Action Buttons on a Label Item Line ([!12473])
- **CE/EE:** Fix application error when Project#last_activity_at is nil ([!12443])
- **CE/EE:** Truncate long job names in environment view; wrap author to next line ([!12455])
- **CE/EE:** Bump premailer-rails gem to 1.9.7 and its dependencies to prevent network retrieval of assets ([!12456])
- **CE/EE:** Fix bug where Service `created_at` time was used instead of deployment time. ([!12395])
- **CE/EE:** Update mmap2 gem to fix missing symbol error that happens on some installations from source ([!12492])
- **EE:** Fix `gitlab:check` Rake task when Elasticsearch used ([!2278])
- **EE:** Resolve "LDAP group link select dropdown error" ([!2277])
- **Omnibus:** Update gitlab-monitor to 1.8.0 ([!1685])

[!12352]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12352
[!12421]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12421
[!12401]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12401
[!12474]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12474
[!12473]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12473
[!12443]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12443
[!12455]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12455
[!12456]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12456
[!12395]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12395
[!12492]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12492
[!2278]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2278
[!2277]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2277
[!1685]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1685

## Upgrade barometer

These versions have no migrations and should not require any downtime.

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
