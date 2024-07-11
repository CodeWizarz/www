---
title: "GitLab Patch Release: 10.0.3"
categories: releases
date: 2017-10-05
author: Jaroslava Kadlecová
author_gitlab: jarka
description: "Gitlab 10.0.3 patch release resolves a number of regressions and bugs in 10.0.2"
tags: patch releases, releases
---

Today we are releasing version 10.0.3 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[the 10.0.2 release](/releases/2017/09/27/gitlab-10-dot-0-dot-2-released/) and
prior versions.

<!-- more -->

It includes the following fixes:

- **CE/EE:** Fix merge request counter updates after merge ([!14563])
- **CE/EE:** Make sure API responds with 401 when invalid authentication info is provided ([!14525])
- **CE/EE:** Fix 500 error on merged merge requests when GitLab is restored from a backup ([!14547])
- **CE/EE:** Fix commenting on side-by-side commit diff ([!14529])
- **CE/EE:** Gitaly RepositoryExists remains opt-in for all method calls ([!14513])
- **CE/EE:** Adjust MRs being stuck on "process of being merged" for more than 2 hours ([!14540])
- **CE/EE:** `find_user` Users helper method no longer overrides `find_user` API helper method ([!14418])
- **CE/EE:** Improve UX of autodevops popover to match gpg one ([!14582])
- **CE/EE:** Fix CSRF validation issue when closing/opening merge requests from the UI ([!14555])
- **CE/EE:** Make `Repository#has_visible_content` more efficient ([!14554])
- **CE/EE:** Fix Auto DevOps banner feature flag ([!14576])
- **CE/EE:** Fix data parameter not being sent in ajax request for jobs log ([!14564])
- **CE/EE:** Fix pushes to an empty repository not invalidating `has_visible_content?` cache ([!14613])
- **CE/EE:** Ensure all refs are restored on a backup/restore ([!14595])
- **CE/EE:** Fix Admin -> License selector for GitLab QA specs ([!14599])
- **CE/EE:** Fix gitlab-rake gitlab:import:repos task ([!14597])
- **CE/EE:** Fix broken certificate-authority-data with kubectl >= 1.8.0 ([!14635])
- **EE:** Show group tab if member lock is enabled ([!3025])
- **EE:** Only show Turn on Service Desk button when user has permissions ([!3020])
- **EE:** Add basic documentation on the consul cluster ([!3013])
- **EE:** File uploaders do not perform hard check, only soft check ([!2960])
- **EE:** Fix EE delta size check handling with annotated tags ([!3041])
- **EE:** Rewrite Geo database rake tasks so they operate on the correct database ([!3052])

[!14563]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14563
[!14525]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14525
[!14547]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14547
[!14529]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14529
[!14513]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14513
[!14540]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14540
[!14418]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14418
[!14582]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14582
[!14555]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14555
[!14554]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14554
[!14576]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14576
[!14564]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14564
[!14613]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14613
[!14595]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14595
[!14599]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14599
[!14597]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14597
[!14635]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14635
[!3025]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3025
[!3020]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3020
[!3013]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3013
[!2960]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2960
[!3041]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3041
[!3052]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3052

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
