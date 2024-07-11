---
title: "GitLab Patch Release: 10.1.3"
categories: releases
date: 2017-11-10
author: Lin Jen-Shin
author_gitlab: godfat-gitlab
description: "GitLab 10.1.3 patch release resolves a number of regressions and bugs in 10.1.2"
tags: patch releases, releases
---

Today we are releasing version 10.1.3 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[the 10.1.2 release](/releases/2017/11/08/gitlab-10-dot-1-dot-2-security-release/) and
prior versions.

<!-- more -->

It includes the following fixes:

- **CE/EE:** Fix diff parser so it tolerates to diff special markers in the content ([!14848])
- **CE/EE:** Fix cancel button not working while uploading on the new issue page ([!15137])
- **CE/EE:** Render 404 when polling commit notes without having permissions ([!15140])
- **CE/EE:** Fix webhooks recent deliveries ([!15146])
- **CE/EE:** Fix issues with forked projects of which the source was deleted ([!15150])
- **CE/EE:** Remove Filesystem check metrics that use too much CPU to handle requests ([!15158])
- **CE/EE:** Avoid regenerating the ref path for the environment ([!15167])
- **CE/EE:** Fix a migration that adds merge_requests_ff_only_enabled column to MR table ([!15195])
- **CE/EE:** Make sure group and project creation is blocked for new users that are external by default ([!15212])
- **CE/EE:** Fix GPG signature popup info in Safari and Firefox ([!15228])
- **CE/EE:** Fix arguments Import/Export error importing project merge requests ([!15241])
- **CE/EE:** Show error message when fast-forward merge is not possible ([!15296])
- **CE/EE:** Prevent OAuth phishing attack by presenting detailed wording about app to user during authorization ([!15311])
- **EE:** Fix: Failed to rebase MR from forked repo ([!3258])

[!14848]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14848
[!15137]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15137
[!15140]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15140
[!15146]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15146
[!15150]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15150
[!15158]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15158
[!15167]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15167
[!15195]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15195
[!15212]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15212
[!15228]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15228
[!15241]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15241
[!15296]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15296
[!15311]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15311
[!3258]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3258

## Upgrade barometer

This version fixes an existing migration but did not introduce new ones.

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
