---
title: "GitLab 8.7.5 Released"
description: "Learn more about GitLab Release 8.7.5 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2016/05/12/gitlab-8-dot-7-dot-5-released/"
comments: true
categories: releases
author: GitLab
author_twitter: gitlab
---

Today we are releasing version 8.7.5 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

It includes the following fixes:

- **CE/EE:** Fix relative links in wiki pages. ([!4050])
- **CE/EE:** Fix always showing build notification message when switching
  between merge requests ([!4086])
- **CE/EE:** Fix an issue when filtering merge requests with more than one
  label. ([!3886])

This release does not include any EE-specific changes.

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

[!4050]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/4050
[!4086]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/4086
[!3886]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/3886
