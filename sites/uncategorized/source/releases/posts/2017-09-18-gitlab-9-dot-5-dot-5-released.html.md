---
title: "GitLab Patch Release: 9.5.5"
categories: releases
date: 2017-09-18
author: Simon Knox
author_gitlab: psimyn
author_twitter: psimyn
description: "GitLab 9.5.5 patch release resolves a number of regressions and bugs in 9.5.4"
tags: patch releases, releases
---

Today we are releasing version 9.5.5 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[this month's 9.5.4 release](/releases/2017/09/07/gitlab-9-dot-5-dot-4-security-release/) and
prior versions.

It includes the following fixes:

- **CE/EE** Better prefilled description for issue created from failed job. ([!13790])
- **CE/EE** Fix 500 errors caused by a race condition in GPG's tmp directory handling ([!14194])
- **CE/EE** Fix project feature being deleted when updating project with invalid visibility level ([!14235])
- **CE/EE** Fix Pipeline Triggers to show triggered label and predefined variables ([!14244])
- **CE/EE** Don't show Pages settings when not available ([!13888])
- **CE/EE** Check that GPG signature and commit are created by the same user ([!13771])
- **CE/EE** Better nav layout at small screen sizes ([!13967])
- **CE/EE** Fix merge request widget button height differences ([!14000])
- **CE/EE** Fix Mark as Resolved icon ([!14042])
- **CE/EE** Fix X-Gitlab-Event header when testing webhook ([!14108])
- **CE/EE** Fix collapsed sidebar project title scroll issue ([!13777])
- **CE/EE** Disable GitLab Project Import button if source disabled ([!13789])
- **CE/EE** Fix divide-by-zero error for new projects ([!13803])
- **CE/EE** Normalize styles in New Issue/MR combo button ([!13647])
- **CE/EE** Speed up creation of new Merge Requests ([!13685])
- **CE/EE** Increase storage timeout default ([!14023])
- **EE** Fix activation of project mirror when project is created ([!2756])
- **EE** Fix bug where mirror trigger builds is nil at project create ([!2797])
- **EE** Ensure routing setting is available before calling it ([!2908])
- **EE** Allow pushing without a branch name ([!2879])
- **EE** Fix branch name regex not being saved on admin push_rule page ([!2877])
- **EE** Fix issue with projects with an empty import URL ([!2824])
- **EE** Geo - Whitelist LFS requests to download objects on a secondary node ([!2758])
- **EE** Fix unsetting credentials data for pull mirrors ([!2810])
- **EE** Fix merges not working when project is not licensed for squash ([!2817])
- **EE** Fix approver icon spacing on Merge Request widget ([!2825])
- **EE** Fix 500 error on SSH host keys action ([!2827])
- **EE** Set Deploy boards to collapse by default ([!2834])
- **EE** Don't put password in SSH remote for public key authentication ([!2837])
- **Omnibus CE/EE** Update pgb-notify template ([!1873])
- **Omnibus CE/EE** Increase storage timeout default ([!1906])
- **Omnibus CE/EE** Add more options to repmgr.conf template ([!1893])
- **Omnibus CE/EE** Update pgbouncer to use one style of logging  ([!1918])
- **Omnibus CE/EE** Upgrade ruby version to 2.3.5 ([!1930])
- **Omnibus CE/EE** Upgrade libyaml version to 0.1.7

[!13790]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13790
[!14194]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14194
[!14235]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14235
[!14244]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14244
[!13888]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13888
[!13771]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13771
[!13967]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13967
[!14000]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14000
[!14042]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14042
[!14108]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14108
[!13777]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13777
[!13789]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13789
[!13647]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13647
[!13803]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13803
[!13685]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13685
[!14023]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14023
[!2908]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2908
[!2879]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2879
[!2797]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2797
[!2756]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2756
[!2877]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2877
[!2824]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2824
[!2758]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2758
[!2810]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2810
[!2817]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2817
[!2825]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2825
[!2834]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2834
[!2837]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2837
[!2827]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2827
[!1873]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1873
[!1906]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1906
[!1893]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1893
[!1918]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1918
[!1930]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1930

## Upgrade barometer

This version includes some new migrations, but does not require any
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
