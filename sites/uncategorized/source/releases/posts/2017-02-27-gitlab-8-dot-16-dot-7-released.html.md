---
title: "GitLab 8.16.7 released"
description: "Learn more about GitLab Release 8.16.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/02/27/gitlab-8-dot-16-dot-7-released/"
author: James Lopez
author_gitlab: jameslopez
author_twitter: jlopezofficial
categories: releases
---

Today we're releasing version 8.16.7 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in the [last month's 8.16
release](/releases/2017/01/22/gitlab-8-16-released/).

Please read on for more details.

<!-- more -->

- **CE/EE:** Fix hash of ruby in update documentation. ([!8735])
- **CE/EE:** Fix MR changes tab size count when there are over 100 files in the diff. ([!9091])
- **EE:** Read true-up info from license and validate it. ([!1206])
- **EE:** Fixed merge request state not updating when approvals feature is active. ([!1264])

[!8735]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8735
[!9091]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9091
[!1206]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1206
[!1264]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1264


## Upgrade barometer

This version does not include any migrations and does not require downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`
file](http://doc.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/pricing/).

Access to GitLab Enterprise Edition is included with a [subscription](/pricing/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
