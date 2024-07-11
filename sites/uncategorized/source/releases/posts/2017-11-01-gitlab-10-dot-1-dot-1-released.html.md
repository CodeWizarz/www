---
title: "GitLab Patch Release: 10.1.1"
categories: releases
date: 2017-11-01
author: Lin Jen-Shin
author_gitlab: godfat-gitlab
description: "GitLab 10.1.1 patch release resolves a number of regressions and bugs in 10.1.0"
tags: patch releases, releases
---

Today we are releasing version 10.1.1 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[the 10.1.0 release](/releases/2017/10/22/gitlab-10-1-released/) and
prior versions.

<!-- more -->

It includes the following fixes:

- **CE/EE:** Auto Devops Kubernetes default namespace is now correctly built out of GitLab ([!14642])
- **CE/EE:** Store circuitbreaker settings in the database instead of config ([!14842])
- **CE/EE:** Allow boards as top level route ([!14861])
- **CE/EE:** Forbid the usage of `Redis#keys` ([!14889])
- **CE/EE:** Make the circuitbreaker more robust by adding higher thresholds, and multiple access attempts. ([!14933])
- **CE/EE:** Update default disabled merge request widget message to reflect a general failure ([!14960])
- **CE/EE:** Only cache last push event for existing projects when pushing to a fork ([!14989])
- **CE/EE:** Fix deletion of container registry or images returning an error ([!14992])
- **CE/EE:** Fix the writing of invalid environment refs ([!14993])
- **CE/EE:** Fix bug preventing secondary emails from being confirmed ([!15010])
- **CE/EE:** Fix broken wiki pages that link to a wiki file ([!15019])
- **CE/EE:** Don't rename paths that were freed up when upgrading ([!15029])
- **CE/EE:** Fix editing issue description in mobile view ([!15049])
- **CE/EE:** Fix Bitbucket login ([!15051])
- **CE/EE:** Update Gitaly in GitLab 10.1 to 0.43.1 for temp file cleanup ([!15055])
- **CE/EE:** Stop merge requests with thousands of commits from timing out ([!15063])
- **CE/EE:** Use the correct visibility attribute for projects in system hooks ([!15065])
- **CE/EE:** Fix widget of locked merge requests not being presented ([!15069])
- **CE/EE:** Normalize LDAP DN when looking up identity ([!15103])
- **CE/EE:** Add callback functions for initial request in clusters page ([!15105])
- **CE/EE:** Fix missing Import/Export issue assignees ([!15109])
- **EE:** Move group boards routes under - and remove "boards" from reserved paths ([!3078])
- **EE:** Fix height of rebase and approve buttons ([!3210])
- **EE:** Fix LDAP group sync for nested groups e.g. when base has uppercase or extraneous spaces ([!3217])
- **EE:** Geo: read-only safeguards was not working on Secondary node ([!3227])

[!14642]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14642
[!14842]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14842
[!14861]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14861
[!14889]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14889
[!14933]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14933
[!14960]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14960
[!14989]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14989
[!14992]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14992
[!14993]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14993
[!15010]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15010
[!15019]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15019
[!15029]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15029
[!15049]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15049
[!15051]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15051
[!15055]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15055
[!15063]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15063
[!15065]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15065
[!15069]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15069
[!15103]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15103
[!15105]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15105
[!15109]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15109
[!3078]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3078
[!3210]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3210
[!3217]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3217
[!3227]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3227

## Upgrade barometer

This version includes two migrations and no downtime would be required.

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
