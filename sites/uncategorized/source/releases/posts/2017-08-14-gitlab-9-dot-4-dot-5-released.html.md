---
title: "GitLab Patch Release: 9.4.5"
categories: releases
date: 2017-08-14
author: James Edwards-Jones
author_gitlab: jamedjo
author_twitter: jamedjo
description: "GitLab 9.4.5 patch release resolves a number of regressions and bugs in 9.4.4"
tags: patch releases, releases
---

Today we are releasing version 9.4.5 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[the 9.4.4 release](/releases/2017/08/10/gitlab-9-dot-4-dot-4-released/) and
prior versions.

<!-- more -->

It includes the following fixes:

- **CE/EE:** Ensure language files are compiled before webpack to prevent broken Javascript ([!13122])
- **CE/EE:** Fix deletion of deploy keys linked to other projects ([!13162])
- **CE/EE:** Allow any logged in users to read_users_list even if it's restricted ([!13201])
- **CE/EE:** Make Delete Merged Branches handle wildcard protected branches correctly ([!13251])
- **CE/EE:** Fix an order of operations for CI connection error message in merge request widget ([!13252])
- **CE/EE:** Fix pipeline_schedules pages when active schedule has an abnormal state ([!13286])
- **CE/EE:** Add missing validation error for username change with container registry tags ([!13356])
- **CE/EE:** Fix destroy of case-insensitive conflicting redirects ([!13357])
- **CE/EE:** Project pending delete no longer return 500 error in admins projects view ([!13389])
- **CE/EE:** Fix search box losing focus when typing ([!13221])
- **CE/EE:** Use jQuery to control scroll behavior in job log for cross browser consistency ([!13203])
- **CE/EE:** Use project_ref_path to create the link to a branch to fix links that 404 ([!13459])
- **CE/EE:** Improve file upload/replace experience ([!12863])
- **CE/EE:** Fix jump to next discussion button ([!13076])
- **CE/EE:** Fixes new issue button for failed job returning 404 ([!13450])
- **CE/EE:** Fix links to group milestones from issue and merge request sidebar ([!13199])
- **CE/EE:** Fix Mattermost integration by handling cookie in OAuth2 flow ([!13305])
- **CE/EE:** Change project FK migration to skip existing FKs ([!13235])
- **CE/EE:** Fixed sign-in restrictions buttons not toggling active state ([!13270])
- **EE:** Ensure artifacts are moved locally within the filesystem to prevent timeouts ([!2572])
- **EE:** Fix rebase from fork when upstream has protected branches ([!2640])
- **EE:** Present Related Issues add badge only when user can manage related issues ([!2583])
- **EE:** Fix accessing individual files on Object Storage ([!2564])
- **Omnibus:** Fix Mattermost setting teammate_name_display not working ([!1813])
- **Omnibus:** Fix LDAP SSL config: Use ca_file, not ca_cert ([!1810])
- **Omnibus:** Fix over-nesting of artifacts object store settings ([!1816])

[!13130]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13130
[!13122]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13122
[!13162]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13162
[!13201]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13201
[!13251]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13251
[!13252]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13252
[!13286]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13286
[!13356]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13356
[!13357]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13357
[!13389]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13389
[!13221]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13221
[!13203]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13203
[!13459]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13459
[!12863]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12863
[!13076]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13076
[!13450]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13450
[!13199]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13199
[!13305]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13305
[!13235]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13235
[!13270]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13270
[!2572]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2572
[!2640]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2640
[!2583]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2583
[!2564]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2564
[!1813]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1813
[!1810]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1810
[!1816]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1816


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
