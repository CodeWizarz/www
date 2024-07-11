---
title: "GitLab 8.7.2 Released"
description: "Learn more about GitLab Release 8.7.2 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2016/05/03/gitlab-8-dot-7-dot-2-released/"
date: 2016-05-03
categories: releases
comments: true
author: GitLab
author_twitter: gitlab
---

Today we are releasing version 8.7.2 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

It includes the following fixes:

- **EE:** Fix MR notifications for Slack and Hipchat when approvals are fulfilled
  ([!325])
- **EE:** Merge requests on a secondary node no longer check if a merge request
  can be merged ([!366])
- **CE/EE:** The "New Branch" button displayed on issue pages is now loaded
  asynchronously ([!3855])
- **CE/EE:** Creating wiki pages no longer results in an HTTP 500 error
  ([!3924])
- **CE/EE:** The spacing between notification labels and buttons has been
  updated ([!3965])

<!-- more -->

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
EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a [subscription](/pricing/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.

[!3855]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/3855
[!3924]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/3924
[!3965]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/3965
[!325]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/325
[!366]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/366
