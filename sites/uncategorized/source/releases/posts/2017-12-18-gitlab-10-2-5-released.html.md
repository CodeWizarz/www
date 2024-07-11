---
title: "GitLab Patch Release: 10.2.5"
categories: releases
author: Michael Teiva Kozono
author_gitlab: mkozono
author_twitter: mozonok
description: "GitLab 10.2.5 patch release resolves a number of regressions and bugs in 10.2.4"
tags: patch releases, releases
---

Today we are releasing version 10.2.5 for GitLab Community Edition (CE) and Enterprise Editions (EES, EEP).

This version resolves a number of regressions and bugs in
[this month's 10.2 release](/releases/2017/11/22/gitlab-10-2-released/).

<!-- more -->

## Bug fixes for Community and Enterprise Editions

- **CE/EES/EEP:** [Create a fork network for forks with a deleted source.][!15595]
- **CE/EES/EEP:** [Correctly link to a forked project from the new fork page.][!15653]
- **CE/EES/EEP:** [Fix the fork project functionality for projects with hashed storage.][!15671]
- **CE/EES/EEP:** [Fix `updateEndpoint` undefined error for `issue_show` app root.][!15698]
- **CE/EES/EEP:** [Fix broken illustration images for monitoring page empty states.][!15889]
- **CE/EES/EEP:** [Fix related branches/Merge requests failing to load when the hostname setting is changed.][!15735]
- **CE/EES/EEP:** [Fix `gitlab:import:repos` Rake task moving repositories into the wrong location.][!15823]
- **CE/EES/EEP:** [Gracefully handle case when repository's root ref does not exist.][!15678]

## Bug fixes for Enterprise Editions

- **EES/EEP:** [Visualize whether board filters are applied.][gitlab-ee!3499]

## Bug fixes for Omnibus GitLab

- [Reduce memory usage if running a Geo secondary node][omnibus-gitlab!2084]

## Performance improvements for Community and Enterprise Editions

- **CE/EES/EEP:** [Keep track of all circuitbreaker keys in a set.][!15613]
- **CE/EES/EEP:** [Only load branch names for protected branch checks.][!15629]
- **CE/EES/EEP:** [Optimize API `/groups/:id/projects` by preloading associations.][!15475]

[!15595]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15595
[!15653]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15653
[!15671]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15671
[!15698]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15698
[!15889]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15889
[!15613]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15613
[!15735]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15735
[!15823]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15823
[!15678]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15678
[!15629]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15629
[!15475]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15475
[gitlab-ee!3499]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3499
[omnibus-gitlab!2084]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2084

## Upgrade barometer

This version does not include any new migrations, and should not require any
[downtime to update](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

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
