---
title: "GitLab Patch Release: 11.0.3"
categories: releases
author: Filipa Lacerda
author_gitlab: filipa
author_twitter: FilipaLacerda
description: "GitLab 11.0.3 patch release resolves a number of regresssions and bugs in 11.0 release."
---

Today we are releasing version 11.0.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 11.0 release](/releases/2018/06/22/gitlab-11-0-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Revert merge request widget button max height](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20175)
- [Implement upload copy when moving an issue with upload on object storage](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20191)
- [Fix broken '!' support to autocomplete MRs in `GFM` fields](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20204)
- [Restore showing Elasticsearch and Geo status on dashboard.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20276)
- [Fix merge request page rendering error when its target/source branch is missing](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20280)
- [Fix sidebar collapse breapoints for job and wiki pages](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20188)
- [Fix size of code blocks in headings](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20229)
- [Fix loading screen for search autocomplete dropdown](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20187)
- [Fix ambiguous `due_date` column for Issue scopes.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20251)
- [Always serve favicon from main GitLab domain so that CI badge can be drawn over it.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20263)
- [Fix tooltip flickering bug.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20270)
- [Fix refreshing cache keys for open issues count.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/)
- [Replace deprecated bs.affix in merge request tabs with sticky polyfill.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20269)
- [Prevent pipeline job tooltip from scrolling off dropdown container.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/)
- [Fix 500 Error when attempting to view MR after its target branch was deleted](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20280)
- [Fix issue count not updating for project members](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19904)
- [Fix No UI element to edit group label](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20192)
- [Fix Tooltips scroll along the list within Pipeline jobs dropdown on MR widget](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20171)
- [Fix Tooltips flicker when highlighting award emoji](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20235)


## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.

