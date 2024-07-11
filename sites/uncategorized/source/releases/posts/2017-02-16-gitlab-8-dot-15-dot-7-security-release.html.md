---
layout: post
title: "GitLab 8.15.7 and 8.14.10 released"
description: "Learn more about GitLab Release 8.15.7 and 8.14.10 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/02/16/gitlab-8-dot-15-dot-7-security-release/"
author: Brian Neel
author_twitter: b0bby_tables
author_gitlab: briann
categories: releases
---

Today we are releasing versions 8.15.7 and 8.14.10 for GitLab
Community Edition (CE) and Enterprise Edition (EE).

These versions contain an important security fix for Omnibus GitLab installations
with Mattermost. We recommend that all GitLab installations running Omnibus
versions 8.15 or 8.14 with Mattermost enabled be upgraded as soon as possible.

This release does not affect GitLab versions 8.16.0 and above.

Please read on for more details.

<!-- more -->

## Mattermost Security Update
Mattermost has not yet released full details, however a high severity security
release was published and Mattermost has advised all users to upgrade immediately.
A patch for Mattermost 3.6, shipped with Omnibus versions of GitLab 8.16, was
released with GitLab 8.16.5 on February 14, 2017. A matching patch for Mattermost
3.5, shipped with GitLab Omnibus versions 8.15 and 8.14, has now been made available.
See the Mattermost [release notes] for more information.

[release notes]: https://docs.mattermost.com/administration/changelog.html?highlight=changelog#notes-on-patch-release

### Versions affected

GitLab CE+EE Omnibus w/Mattermost 8.14.0 - 8.14.9, 8.15.0 - 8.15.6

We recommend that all installations listed above with Mattermost enabled be
upgraded as soon as possible. No workarounds are available for these
vulnerabilities.

GitLab users who do not have Mattermost enabled are not affected.

## Upgrade barometer

This version has no new migrations and should not require any downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a `/etc/gitlab/skip-auto-migrations` file.

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/features/#enterprise).
Access to GitLab Enterprise Edition is included with a
[subscription](/pricing/). No time to upgrade GitLab
yourself? Subscribers receive upgrade and installation services.
