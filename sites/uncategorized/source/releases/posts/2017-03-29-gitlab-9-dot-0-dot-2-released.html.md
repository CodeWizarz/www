---
title: "GitLab 9.0.2 released"
author: Brian Neel
author_twitter: b0bby_tables
author_gitlab: briann
categories: releases
description: "GitLab 9.0.2 security release"
---

Today we are releasing version 9.0.2 for GitLab
Community Edition (CE) and Enterprise Edition (EE).

This version contains two important security fixes for the recently introduced
nested groups feature of GitLab 9.0. We recommend that all GitLab installations
running version 9.0 be upgraded as soon as possible.

These security vulnerabilities do not affect GitLab versions prior to 9.0.

Please read on for more details.

<!-- more -->

## Changing a subgroup's path breaks links to repositories and files uploaded in top-level namespaces of the same name

An internal code review discovered that when subgroups containing projects were
renamed GitLab would improperly attempt to move the repositories and uploads
directories of any top-level project of the same name. GitLab was not properly
including the full path in subgroups when moving the directories. This
vulnerability could allow a user to rename top-level namespaces and upload
directories for projects that they did not own, effectively removing repository
access for the original owner, breaking all links to those uploads, and
potentially even deleting repositories belonging to other users.

[#29843]: https://gitlab.com/gitlab-org/gitlab-ce/issues/29843

## Private group name disclosure via nested groups parent_id in new/update

[Yasin Soliman] via [HackerOne] reported that it was possible to disclose the
names of private groups by attempting to create subgroups within them. This attack
requires identifying the numeric ID of the private group, however these numeric
IDs are predictable and easy to guess.

[#29875]: https://gitlab.com/gitlab-org/gitlab-ce/issues/29875

[Yasin Soliman]: https://twitter.com/SecurityYasin
[HackerOne]: https://hackerone.com/

### Versions affected

GitLab CE+EE 9.0.0 - 9.0.1

We recommend that all installations listed above be upgraded as soon as possible.
No workarounds are available for these vulnerabilities.

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
