---
title: "GitLab Patch Release: 9.5.8"
categories: releases
date: 2017-10-04
author: Jose Ivan Vargas
author_gitlab: jivanvl
author_twitter: jivanvl
description: "GitLab 9.5.8 patch release resolves a number of regressions and bugs"
tags: patch releases, releases
---

Today we are releasing version 9.5.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version includes backports of fixes for bugs that are present in the 9.5.x releases.

<!-- more -->

It includes the following fixes:

- **CE/EE** Fix fork button being disabled for users who can fork to group ([!14551])
- **EE** Fix delta size check to handle commit or nil objects ([!2976])
- **EE** Fix EE delta size check handling with annotated tags ([!3041])


[!14551]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14551
[!2976]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2976
[!3041]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3041

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
