---
title: "GitLab Patch Release: 10.4.4"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: rspeicher
description: "GitLab 10.4.4 patch release resolves a number of regressions and bugs in 10.4 release"
tags: patch releases
---

Today we are releasing GitLab version 10.4.4.

This version resolves a number of regressions and bugs in [this month's 10.4
release](/releases/2018/01/22/gitlab-10-4-released/).

<!-- more -->

## Bug fixes for Community and Enterprise Editions

- [Fix 500 error when loading a merge request with an invalid comment.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16795)
- [Cleanup new branch/merge request form in issues.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16854)
- [Fix GitLab import leaving group_id on ProjectLabel.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16877)
- [Fix forking projects when no restricted visibility levels are defined application-wide.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16881)
- [Resolve PrepareUntrackedUploads PostgreSQL syntax error.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17019)
- [Fixed error 500 when removing an identity with synced attributes and visiting the profile page.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17054)
- Validate user namespace before saving so that errors persist on model.
- LDAP Person no longer throws exception on invalid entry.
- Fix JIRA not working when a trailing slash is included.
- [Update Nokogiri to 1.8.2.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16807)

## Bug fixes for Enterprise Editions

- **EES/EEP/EEU:** [Handle empty event timestamp and larger memory units.](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4206)
- **EES/EEP/EEU:** Allow project to be set up to push to and pull from same mirror.
- **EEP/EEU:** Geo: [Fix log cursor failing to process a CI job artifact event](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4144)
- **EEP/EEU:** Geo: Reset force_redownload flag after successful sync.
- **EEP/EEU:** Geo: Fix redownload repository recovery when there is no local repository.

## Upgrade barometer

This version includes one new migration, and should not require any downtime.

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
