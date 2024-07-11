---
title: "GitLab Patch Release: 10.3.6"
categories: releases
author: Tiago Botelho
author_gitlab: tiagonbotelho
author_twitter: tiagonbotelho
description: "GitLab 10.3.6 patch release resolves a number of regressions and bugs in 10.3.5 and prior versions"
tags: patch releases, releases
---

Today we are releasing GitLab version 10.3.6.

This version resolves a number of regressions and bugs in
[this month's 10.3.5 release](/releases/2018/01/18/gitlab-10-3-5-released/) and
prior versions.

<!-- more -->

## Bug fixes for Community and Enterprise Editions

- **CE/EES/EEP:** [Fix Mermaid drawings not loading on some browsers](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16537)
- **CE/EES/EEP:** [Resolve "Incorrect default merge request title when Jira activated"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16356)
- **CE/EES/EEP:** [Prevent RevList failing on non UTF8 paths](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16440)
- **CE/EES/EEP:** [Set target_branch to the ref branch when creating MR from issue](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16422)
- **CE/EES/EEP:** [Fix Route validation when conflicting permanent redirects exist](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16397)
- **CE/EES/EEP:** [Fixing request json mime type](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16427)
- **CE/EES/EEP:** [Fix 500 error when visiting a commit where the blobs do not exist (nil blobs)](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16237)
- **CE/EES/EEP:** [Fix hooks not being set up properly for bare import Rake task](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16280)
- **CE/EES/EEP:** [Fix custom name in branch creation for issue in Firefox](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16244)
- **CE/EES/EEP:** [Prevent excessive DB load due to faulty DeleteConflictingRedirectRoutesRange background migration](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16205)
- **CE/EES/EEP:** [Fixing bug related to wiki last version](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16197)
- **CE/EES/EEP:** [Resolve "gitlab-rake gitlab:import:repos schedules an import"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16115)
- **CE/EES/EEP:** [Fix changes dropdown ellipsis working across browsers](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16281)
- **CE/EES/EEP:** [Resolve "Error 500 trying to view a merge request JSON: undefined method binary? for nil:NilClass"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16193)
- **CE/EES/EEP:** [Resolve "Branch name omitted due to bad UTF-8 conversion by Gitaly ref handler"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16243)
- **CE/EES/EEP:** [Do not run ee_compat_check on security branches](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16188)
- **CE/EES/EEP:** [Avoid leaving a push event empty if payload cannot be created](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16214)
- **CE/EES/EEP:** [Update prometheus gem to version that publishes +Inf bucket in accordance with Prometheus docs.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16175)
- **CE/EES/EEP:** [Fixed abuse reports link url](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16068)
- **CE/EES/EEP:** [Gracefully handle garbled URIs in Markdown](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16123)
- **CE/EES/EEP:** [Clarify Auto DevOps pipelines](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16106)
- **CE/EES/EEP:** [Refactor user, project and group docs when changing namespace](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16019)
- **CE/EES/EEP:** [Add CI YML example for Browser Performance Testing in CE](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16058)
- **CE/EES/EEP:** [Fix shortcut links on help page](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16001)

## Bug fixes for Enterprise Editions

- **EEU:** [Mention Auto SAST in merge request SAST docs](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3836)
- **EEP:** [Multiple kubernetes clusters documentation](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3800)
- **EEP:** [Add Browser Performance Testing docs](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3852)
- **EEP:** [Resolve "Fix Geo::RepositoriesCleanUpWorker to work with hashed storage"](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4059)
- **EEP:** [Update dashboard image](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3870)
- **EES/EEP:** [Fix JS bundle not running on the Cluster update/destroy pages](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4112)
- **EES/EEP:** [Fix 500 error when visiting a commit where the blobs do not exist (nil blobs)](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3987)
- **EES/EEP:** [Clarify Auto DevOps pipelines](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3872)
- **EES/EEP:** [Replace explicit service configuration with roles](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3742)
- **EES/EEP:** [Use 'preload' in export to CSV](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3841)
- **EES/EEP:** [Improve bidirectional mirroring docs](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3802)

## Bug fixes for Omnibus GitLab

- **Omnibus:** [Specify initial tag of QA image for pushing to dockerhub](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2183)
- **Omnibus:** [Use dash instead of spaces in cache keys and build jobs](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2185)

## Upgrade barometer

This version does not include any new migrations, and should [not require any
downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

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
