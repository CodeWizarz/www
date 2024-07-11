---
title: "GitLab Patch Release: 9.4.2"
categories: releases
date: 2017-07-28
author: Mike Greiling
author_gitlab: mikegreiling
author_twitter: mikegreiling
description: "GitLab 9.4.2 patch release resolves a number of regressions and bugs in 9.4.1"
tags: patch releases, releases
---

Today we are releasing version 9.4.2 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[this month's 9.4.0 release](/releases/2017/07/22/gitlab-9-4-released/) and
prior versions.

<!-- more -->

It includes the following fixes:

- **CE/EE:** Fix job merge request link to a forked source project. ([!12965])
- **CE/EE:** Improve redirect route query performance. ([!13062])
- **CE/EE:** Allow admin to `read_users_list` even if it's restricted. ([!13066])
- **CE/EE:** Fix 500 error caused by pending delete projects in admin dashboard. ([!13067])
- **CE/EE:** Add instrumentation to `MarkupHelper#link_to_gfm`. ([!13069])
- **CE/EE:** Pending delete projects should not show in deploy keys. ([!13088])
- **CE/EE:** Fix sizing of custom header logo in new navigation.
- **CE/EE:** Fix crash on /help/ui.
- **CE/EE:** Fix creating merge request diffs when diff contains bytes that are invalid in UTF-8.
- **CE/EE:** Fix vertical alignment of New Project button.
- **CE/EE:** Add LDAP SSL certificate verification option.
- **CE/EE:** Fix vertical alignment in Firefox and Safari for pipeline mini graph.
- **EE:** Add lower bound to pull mirror scheduling feature. ([!2366])
- **EE:** Add warning and option toggle when rebuilding authorized_keys. ([!2508])
- **EE:** Fix CSS for mini graph with downstream pipeline.
- **EE:** Rename board to boards in new project sidebar.
- **EE:** Fix Rebasing not working with Merge Requests.
- **EE:** Fix issue boards focus mode when new navigation is turned on.
- **Omnibus:** Update LDAP SSL config: Rename method to encryption. Add ca_cert, ssl_version and verify_certificates

[!12965]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12965
[!13062]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13062
[!13066]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13066
[!13067]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13067
[!13069]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13069
[!13088]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13088
[!2366]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2366
[!2508]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2508

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
