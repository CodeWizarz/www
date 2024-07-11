---
title: "GitLab Patch Release: 10.4.2"
categories: releases
author: Mark Fletcher
author_gitlab: markglenfletcher
description: "GitLab 10.4.2 patch release resolves a number of regressions and bugs in 10.4 release"
tags: patch releases
---

Today we are releasing GitLab version 10.4.2.

This version resolves a number of regressions and bugs in [this month's 10.4
release](/releases/2018/01/22/gitlab-10-4-released/) and prior versions.

<!-- more -->

## Bug fixes for Community and Enterprise Editions

- **CE/EES/EEP:** [Fix bugs preventing copy/paste on iOS](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15804)
- **CE/EES/EEP:** [Fix Gitlab::Database::Grant.create_and_execute_trigger? so it uses has_table_privilege() on PostgreSQL](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16618)
- **CE/EES/EEP:** [Fix bug for Gitaly::CommitService: Encoding::UndefinedConversionError](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16637)
- **CE/EES/EEP:** [Fix bug in security release with deploy keys migration](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16531)
- **CE/EES/EEP:** [Fix bug regarding cleaning runner cache on Windows](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16740)
- **CE/EES/EEP:** [Fix bug for project import failures](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16714)
- **CE/EES/EEP:** [Fix bug in webpack_helper](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16724)
- **CE/EES/EEP:** [Fix visibility of "Allow users to request access" option in public projects](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16485)

## Bug fixes for Enterprise Editions

- **EES/EEP:** [Fix cancelling of board settings modal](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4082)
- **EES/EEP:** [Fix bugs when moving an issue](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4229)
- **EES/EEP:** [Fix bugs with Admin Dashboard view](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4196)
- **EEP:** [Fix incorrect OPENSSH_EXPECTED_COMMAND on gitlab:geo:check task](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4236)
- **EEP:** [Fix high rate of config.lock file errors on Geo testbed](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4249)
- **EEU:** [Fix bugs with issue ordering in Epics](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4278)
- **EEU:** [Fix Epic issue item reordering to handle different scenarios](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4142)

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Editions

Interested in GitLab Enterprise Editions? Check out the [features exclusive to
EE](/pricing/).

Access to GitLab Enterprise Editions is granted by a [subscription](/stages-devops-lifecycle/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
