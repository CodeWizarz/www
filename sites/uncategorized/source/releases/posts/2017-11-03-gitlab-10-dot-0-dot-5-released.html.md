---
title: "GitLab Patch Release: 10.0.5"
categories: releases
date: 2017-11-03
author: Jaroslava Kadlecová
author_gitlab: jarka
description: "Gitlab 10.0.5 patch release resolves a number of regressions and bugs in 10.0.4"
tags: patch releases, releases
---

Today we are releasing version 10.0.5 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[10.0.4 release](/releases/2017/10/17/gitlab-10-dot-0-dot-4-security-release/) and
prior versions.

<!-- more -->

It includes the following fixes:

- **CE/EE:** Fix monitoring graph axes labels that were inaccurate and inconsistent ([!14258])
- **CE/EE:** Fix broken Y-axis scaling in some Prometheus graphs ([!14693])
- **CE/EE:** Fix group milestones breadcrumb links ([!14689])
- **CE/EE:** Fix GitLab QA: increase window size to ensure License link shows ([!14674])
- **CE/EE:** Fix `rake gitlab:incoming_email:check` ([!14423])
- **CE/EE:** Fix the import :milestone from adding the group_id ([!14657])
- **CE/EE:** Fix missing issue assignees ([!15109])
- **CE/EE:** Trigger change event of the markdown textarea to allow Vue catch the programmatic changes ([!14539])
- **CE/EE:** Fix multiple notifications from being sent for multiple labels ([!14798])
- **CE/EE:** Add docs for `api_json.log` file ([!14950])
- **CE/EE:** Prevent ApplicationSetting to cache nil value ([!14952])
- **CE/EE:** Don't rename paths that were freed up when upgrading ([!15029])
- **CE/EE:** Fix merge request widget date tooltip inconsistencies ([!14578])
- **CE/EE:** Fix bottom spacing for dropdowns that open upwards ([!14535])
- **CE/EE:** Disable comment textarea while submitting a new comment ([!14541])
- **CE/EE:** Remove auto devops callout from repo editor view ([!14616])
- **CE/EE:** Improve merge request widget status icon UX ([!14200])
- **CE/EE:** Include RevList error messages in exceptions ([!14658])
- **CE/EE:** Update Prometheus gem to fix problems with other Processes overwriting current metrics file ([!14827])
- **CE/EE:** Update Prometheus Gem to fix problem caused by using wrong data offsets ([!15081])
- **CE/EE:** Remove "boards" from TOP_LEVEL_ROUTES ([!14861])
- **CE/EE:** Fix renaming a hashed project ([!14428])
- **CE/EE:** Fix breadcrumb title not linking ([!14532])
- **EE:** Move group boards routes under '-' and remove "boards" from reserved paths ([!3078])
- **EE:** Fix base link for issues on group boards ([!3099])
- **EE:** Add scheduled import jobs to the stuck import jobs detection worker ([!3055])
- **EE:** GitLab QA fix: Adjust license key add for GitLab 10.0 changes ([!3059])
- **EE:** Fix removing the username from the git repository URL for pull mirroring ([!3060])
- **EE:** Geo: Fix attachments/avatars saving to the wrong directory ([!3068])
- **EE:** Fix breaking sidebar when navigating to another group board ([!3010])
- **EE:** Fix creating labels from Group Boards sidebar ([!2869])

[!14258]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14258
[!14693]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14693
[!14689]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14689
[!14674]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14674
[!14423]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14423
[!14657]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14657
[!15109]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15109
[!14539]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14539
[!14798]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14798
[!14950]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14950
[!14952]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14952
[!15029]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15029
[!14578]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14578
[!14535]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14535
[!14541]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14541
[!14616]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14616
[!14200]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14200
[!14658]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14658
[!14827]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14827
[!14861]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14861
[!15081]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15081
[!14428]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14428
[!14532]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14532
[!3078]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3078
[!3099]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3099
[!3055]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3055
[!3059]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3059
[!3060]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3060
[!3068]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3068
[!3010]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3010
[!2869]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2869

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
