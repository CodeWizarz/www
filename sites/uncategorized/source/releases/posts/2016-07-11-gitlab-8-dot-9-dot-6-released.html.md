---
title: "GitLab 8.9.6 released"
description: "Learn more about GitLab Release 8.9.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2016/07/11/gitlab-8-dot-9-dot-6-released/"
author: Robert Speicher
author_twitter: rspeicher
categories: releases
---

Today we are releasing version 8.9.6 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

Please read on for more details.

<!-- more -->

- **EE:** Avoid adding index for key fingerprint if it already exists. ([!539])
- **CE/EE:** Fix importing of events under notes for GitLab projects. ([!5154])
- **CE/EE:** Fix log statements in import/export. ([!5129])
- **CE/EE:** Fix commit avatar alignment in compare view. ([!5128])
- **CE/EE:** Fix broken migration in MySQL. ([!5005])

[!539]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/539
[!5154]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/5154
[!5129]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/5129
[!5128]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/5128
[!5005]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/5005

## Upgrade barometer

This version has no migrations and should not require any downtime.

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
