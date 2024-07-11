---
title: "GitLab Patch Release: 10.2.2"
categories: releases
author: Winnie Hellmann
author_gitlab: winh
description: "GitLab 10.2.2 patch release resolves a number of regressions and bugs in 10.2.1"
tags: patch releases, releases
---

Today we are releasing version 10.2.2 for GitLab Community Edition (CE) and Enterprise Editions (EES, EEP).

This version resolves a number of regressions and bugs in [this month's 10.2.0 release](/releases/2017/11/22/gitlab-10-2-released/).

<!-- more -->

It includes the following fixes:

- **CE:** Impersonation no longer gets stuck on password change ([gitlab-ce!15497](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15497))
- **CE:** Backport ability to enable/disable file attachments in issuable form ([gitlab-ce!15433](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15433))

---

- **CE/EES/EEP:** Lock codeclimate to version 0.69.0 in Auto DevOps template ([gitlab-ci-yml!117](https://gitlab.com/gitlab-org/gitlab-ci-yml/merge_requests/117))
- **CE/EES/EEP:** Fix bug in GcpClusters to Clusters::Cluster migration ([gitlab-ce!15566](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15566))
- **CE/EES/EEP:** Hide `section_start` and `section_end` in pipeline emails ([gitlab-ce!15534](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15534))
- **CE/EES/EEP:** Fix missing MR widget status icons ([gitlab-ce!15533](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15533))
- **CE/EES/EEP:** Use arrays in `Ci::Pipeline#latest_builds_with_artifacts` ([gitlab-ce!15525](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15525))
- **CE/EES/EEP:** Fix reply quote keyboard shortcut on MRs ([gitlab-ce!15523](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15523))
- **CE/EES/EEP:** Fix blank states using old css ([gitlab-ce!15521](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15521))
- **CE/EES/EEP:** Update composite pipelines index to include "id" ([gitlab-ce!15519](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15519))
- **CE/EES/EEP:** Use Redis cache for branch existence checks ([gitlab-ce!15513](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15513))
- **CE/EES/EEP:** Fix translation of `TagsPage|Tags` ([gitlab-ce!15512](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15512))
- **CE/EES/EEP:** Fix bitbucket wiki import with hashed storage enabled ([gitlab-ce!15490](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15490))
- **CE/EES/EEP:** Fix promoting milestone updating all issuables without milestone ([gitlab-ce!15487](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15487))
- **CE/EES/EEP:** Don't move project repository/attachments when using hashed storage ([gitlab-ce!15479](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15479))
- **CE/EES/EEP:** Add logs for monitoring the merge process ([gitlab-ce!15425](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15425))
- **CE/EES/EEP:** Make Issue Boards sidebar subscriptions async ([gitlab-ce!15364](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15364) / [gitlab-ee!3442](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3442))
- **CE/EES/EEP:** Label addition/removal are not going to be redacted wrongfully in the API ([gitlab-ce!15080](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15080) / [gitlab-ee!3478](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3478))
- **CE/EES/EEP:** Temporarily force disable prometheus metrics ([gitlab-ce!15549](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15549))
- **CE/EES/EEP:** Fix incorrect merge in GitLab QA entry page ([gitlab-ce!15540](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15540))
- **CE/EES/EEP:** Ignore hashed repos (for now) when using `rake gitlab:cleanup:repos` ([gitlab-ce!15520](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15520))
- **CE/EES/EEP:** FileUploader should use Hashed Storage only when project is migrated ([gitlab-ce!15526](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15526))
- **CE/EES/EEP:** Optimize read-only middleware so that it does not consume as much CPU ([gitlab-ce!15504](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15504))
- **CE/EES/EEP:** Mark all gitaly features as opt-in ([gitlab-ce!15522](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15522))

---

- **EES/EEP:** Account shared runner minutes to top-level namespace ([gitlab-ee!3262](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3262))
- **EES/EEP:** Geo: Ensure that LFS object deletions are communicated to the secondary ([gitlab-ee!3481](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3481))
- **EES/EEP:** Geo: Document a failure mode for large repositories ([gitlab-ee!3500](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3500))
- **EES/EEP:** Geo: Move the primary node checkbox below the URL ([gitlab-ee!3483](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3483))
- **EES/EEP:** Geo: Add hashed storage warning ([gitlab-ee!3480](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3480))
- **EES/EEP:** Geo: Cap the `retry_at` value to prevent out of range timestamps ([gitlab-ee!3461](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3461))
- **EES/EEP:** Geo: Fix in-progress repository syncs counting as failed ([gitlab-ee!3424](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3424))
- **EES/EEP:** Geo: Enable RequestStore in IssuesController spec to prevent N+1 warnings ([gitlab-ee!3356](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3356))

---

- **EEU:** Don't use `issuable_sort` cookie for Epics collection ([gitlab-ee!3502](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3502))
- **EEU:** Improve documentation for Epics ([gitlab-ee!3482](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3482))
- **EEU:** Disable file attachments for Epics ([gitlab-ee!3434](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3434))

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](https://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Editions

Interested in GitLab Enterprise Editions? Check out the [features exclusive to
EE](/pricing/).

Access to GitLab Enterprise Editions is granted by a [subscription](/stages-devops-lifecycle/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
