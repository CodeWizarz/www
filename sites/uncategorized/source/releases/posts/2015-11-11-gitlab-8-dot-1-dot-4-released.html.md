---
title: "GitLab 8.1.4 Released"
description: "Learn more about GitLab Release 8.1.4 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2015/11/11/gitlab-8-dot-1-dot-4-released/"
date: 2015-11-11
categories: releases
author: GitLab
author_twitter: gitlab
---

Today we are releasing version 8.1.4 for Community Edition (CE) and Enterprise
Edition (EE).

It includes the following fixes:

- **CE/EE:** Fix bug where manually merged branches in a MR would end up with an
  empty diff
- **CE/EE:** Prevent redirect loop when `home_page_url` is set to the root URL
- **CE/EE:** Fix incoming email configuration defaults
- **CE/EE:** Remove CSS properties preventing hard tabs from rendering in Chromium
  45
- **EE:** Fix bug in JIRA integration which prevented merge requests from being
  accepted when using issue closing pattern

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

Interested in GitLab Enterprise Edition?
Check out the [features exclusive to GitLab EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a [subscription](http://www.gitlab.com/pricing).
No time to upgrade GitLab yourself?
Subscribers receive upgrade and installation services.
