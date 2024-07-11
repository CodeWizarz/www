---
title: "GitLab Patch Release: 9.2.7"
author: Timothy Andrew
author_gitlab: timothyandrew
author_twitter: timothyandrew
categories: releases
description: The GitLab 9.2.7 patch release resolves a number of regressions in 9.2.6
tags: patch releases, releases
---

Today we're releasing version 9.2.7 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in [this month's 9.2.6 release](/releases/2017/06/15/gitlab-9-dot-2-dot-6-released/).

Please read on for more details.

<!-- more -->

- **CE/EE**: Re-instate is_admin flag in users API is current user is an admin ([!12211])
- **CE/EE**: Fix omniauth-google-oauth2 dependencies in Gemfile.lock ([!11787])
- **CE/EE**: Fix milestone page assignees when dropped in ongoing list ([!12076])
- **EE**: Backport Geo: Dynamic Backoff strategy to 9 2 ([!2135])
- **EE**: Don't disable Rebase button for MR without Approvals ([!2031])
- **EE**: Refresh LDAP-users project authorizations on group sync ([!2145])
- **Omnibus**: Only use gitlab-monitor for postgres databases ([!1618])

[!12211]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12211
[!2135]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2135
[!12076]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12076
[!1618]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1618
[!2031]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2031
[!2145]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2145
[!11787]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11787


## Upgrade barometer

Upgrading to `9.2.7` requires no downtime.

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
