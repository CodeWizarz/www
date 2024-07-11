---
title: "GitLab 8.8.4 released"
description: "Learn more about GitLab Release 8.8.4 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2016/06/09/gitlab-8-dot-8-dot-4-released/"
author: GitLab
categories: releases
author_twitter: gitlab
---

Today we are releasing version 8.8.4 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

It includes the following fixes:

- **CE/EE:** Fix LDAP-based login for users with 2FA enabled ([!4493])
- **EE:** Remove license over-usage message ([!447])

[!447]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/447
[!4493]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/4493

<!-- more -->

## Upgrade barometer

This version does not include any migrations, and should not require any
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
