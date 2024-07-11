---
title: "GitLab Patch Release: 10.2.3"
categories: releases
author: Michael Teiva Kozono
author_gitlab: mkozono
author_twitter: mozonok
description: "GitLab 10.2.3 patch release resolves a number of regressions and bugs in 10.2.2"
tags: patch releases, releases
---

Today we are releasing version 10.2.3 for GitLab Community Edition (CE) and Enterprise Editions (EES, EEP).

This version resolves a number of regressions and bugs in
[this month's 10.2 release](/releases/2017/11/22/gitlab-10-2-released/).

<!-- more -->

## Bug fixes for Community and Enterprise Editions

- **CE/EES/EEP:** Fix hashed storage for Import/Export uploads ([!15482])
- **CE/EES/EEP:** Ensure that `rake gitlab:cleanup:repos` task does not mess with hashed repositories ([!15520])
- **CE/EES/EEP:** Ensure that `rake gitlab:cleanup:dirs` task does not mess with hashed repositories ([!15600])
- **CE/EES/EEP:** Fix WIP system note not being created ([!15528])
- **CE/EES/EEP:** Fix link text from group context ([!15565])
- **CE/EES/EEP:** Fix defaults for MR states and merge statuses ([!15594])
- **CE/EES/EEP:** Fix pulling and pushing using a personal access token with the sudo scope ([!15571])

## Bug fixes for Enterprise Editions

- **EES/EEP:** Fix viewing default push rules on a Geo secondary ([!3559])
- **EES/EEP:** Fix Geo wiki sync error not increasing retry count ([!3569])
- **EEU:** Disable Autocomplete for Epics ([!3504])
- **EEU:** Fix Epic fullscreen editing ([!3437])
- **EEU:** Fix tasklist for Epics ([!3435])

## Performance improvements for Community and Enterprise Editions

- **CE/EES/EEP:** Drastically improve Project Search performance by no longer searching namespace name ([!15590])
- **CE/EES/EEP:** Reuse authors when rendering event Atom feeds ([!15630])
- **CE/EES/EEP:** Optimise StuckCiJobsWorker using cheap SQL query outside, and expensive inside ([!15527])

[!15482]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15482
[!15520]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15520
[!15527]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15527
[!15528]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15528
[!15565]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15565
[!15571]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15571
[!15584]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15584
[!15590]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15590
[!15594]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15594
[!15600]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15600
[!15630]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15630
[!3435]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3435
[!3437]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3437
[!3504]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3504
[!3559]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3559
[!3569]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3569

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
