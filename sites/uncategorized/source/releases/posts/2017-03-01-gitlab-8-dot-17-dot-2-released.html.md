---
title: "GitLab 8.17.2 released"
description: "Learn more about GitLab Release 8.17.2 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/03/01/gitlab-8-dot-17-dot-2-released/"
author: DJ Mountney
author_gitlab: twk3
author_twitter: twk3
categories: releases
---

Today we're releasing version 8.17.2 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a bug in our previous patch where an invalid asset may
have been cached in the web browser, causing errors in the user interface.

Please read on for more details.

<!-- more -->

The `8.17.1+ce.0` and `8.17.1+ee.0` packages contained an invalid asset, causing
JavaScript errors when the site was accessed. This asset has been corrected in
the `8.17.1+ce.2` and `8.17.1+ee.2` packages, but if you installed the previous
packages, you would continue to encounter errors due to outdated assets being
cached by the browser.

This patch includes a fix that will cause users' browsers to use the new asset
instead of the invalid one. It also includes one additional bug fix for GitLab
CI.

- **CE/EE:** Expire all webpack assets ([!9602])
- **CE/EE:** Fix concurrent access on builds/register ([!9600])

[!9602]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9602
[!9600]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9600

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
