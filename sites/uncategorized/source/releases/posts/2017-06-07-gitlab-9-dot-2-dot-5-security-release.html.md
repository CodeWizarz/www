---
layout: post
title: "GitLab 9.2.5, 9.1.7, and 9.0.10 released"
description: "Learn more about GitLab Release 9.2.5, 9.1.7, and 9.0.10 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/06/07/gitlab-9-dot-2-dot-5-security-release/"
date: 2017-06-07
author: Brian Neel
author_twitter: b0bby_tables
author_gitlab: briann
categories: releases
tags: patch releases, releases
---

Today we are releasing versions 9.2.5, 9.1.7, and 9.0.10 for GitLab
Community Edition (CE) and Enterprise Edition (EE).

**Note: Please see the warnings in the Upgrade barometer section before upgrading.**

**Note: Versions 9.2.3-9.2.4, 9.1.5-9.1.6, and 9.0.8-9.0.9 contain incomplete fixes for the reserved namespaces / group renaming issue**

These versions contain several security fixes, including a fix for a difficult
to exploit persistent Cross-Site Scripting (XSS) vulnerability, improvements to
API protections when using session authentication, fixes for several
information disclosure vulnerabilities, and a fix for a flaw that could allow
the deletion of project avatars. We recommend that all GitLab installations be
upgraded to one of these versions.

Please read on for more details.

<!-- more -->

## Cross-Site Scripting (XSS) vulnerability when editing comments

A GitLab.com user reported that recent changes to Markdown rendering designed to
improve performance by allowing comments to be rendered client-side opened a
persistent Cross-Site Scripting (XSS) vulnerability when comments are edited
and then re-saved. This vulnerability is difficult to exploit because a victim
must be tricked into editing and then saving another user's comment. [#32908]

[#32908]: https://gitlab.com/gitlab-org/gitlab-ce/issues/32908

## API vulnerable to embedding in iFrames using Session Auth

A tip from a Twitter user led to an internal code audit that discovered a malicious
website could embed a GitLab API URL inside an iFrame, possibly tricking a user
into thinking that the website had access to the user's GitLab user information. This
attack would not disclose the user's data to the malicious website, but it could
cause confusion and the API has added an `X-Frame-Options` header to prevent
content from the API being included in iFrames. [#32557]

[#32557]: https://gitlab.com/gitlab-org/gitlab-ce/issues/32557

## Accidental or malicious use of reserved names in group names could cause deletion of all project avatars

A GitLab.com user reported that creating a group named `project` and then renaming
the group would cause all project avatars to be deleted. This was due to an improperly
constructed path variable when renaming files. To help prevent this from happening
again all avatar uploads have been moved from `/public/uploads/(user|group|project)` to
`/public/uploads/system/(user|group|project)` and `system` has been made a
reserved namespace. A migration included with this release will rename
any existing top-level `system` namespace to be `system0` (or `system1`, `system2`, etc.) [#28917]

[#28917]: https://gitlab.com/gitlab-org/gitlab-ce/issues/28917

## Unauthenticated disclosure of usernames in autocomplete controller

[HackerOne] reporter [Evelyn Lee] reported that usernames could be enumerated
using the `autocomplete/users.json` endpoint without authenticating. This
could allow an unauthenticated attacker to gather a list of all valid usernames from a GitLab
instance. [#31842]

[#31842]: https://gitlab.com/gitlab-org/gitlab-ce/issues/31842
[HackerOne]: https://hackerone.com
[Evelyn Lee]: https://hackerone.com/evelynleems

## Information leakage with references to private project snippets

GitLab.com user Patrick Fiedler reported that titles of private project
snippets could leak when they were referenced in other issues, merge requests,
or comments. [#25934]

[#25934]: https://gitlab.com/gitlab-org/gitlab-ce/issues/25934

## Elasticsearch does not implement external user checks correctly

An internal code review discovered that on instances with Elasticsearch enabled
GitLab allowed external users to view internal project data. This could unintentionally
expose sensitive information to external users. This vulnerability only affects
EE installations with Elasticsearch enabled. [#2337]

[#2337]: https://gitlab.com/gitlab-org/gitlab-ee/issues/2337

### Versions affected

Cross-Site Scripting (XSS) vulnerability when editing comments:
- GitLab CE+EE 9.2.0-9.2.2

API vulnerable to embedding in iFrames using Session Auth:
- GitLab CE+EE 8.13.0-9.0.7, 9.1.0-9.1.4, 9.2.0-9.2.2

Accidental or malicious use of reserved names in group names could cause deletion of all project avatars:
- GitLab CE+EE 4.0.0-9.0.9, 9.1.0-9.1.6, 9.2.0-9.2.4

Unauthenticated disclosure of usernames in autocomplete controller:
- GitLab CE+EE 8.7.0-9.0.7, 9.1.0-9.1.4, 9.2.0-9.2.2

Information leakage with references to private project snippets
- GitLab CE+EE 8.9.0-9.0.8, 9.1.0-9.1.5, 9.2.0-9.2.3

Elasticsearch does not implement external user checks correctly:
- GitLab EE 8.7.0-9.0.7, 9.1.0-9.1.4, 9.2.0-9.2.2

We recommend that all installations running a version mentioned above be
upgraded as soon as possible. No workarounds are available for these
vulnerabilities.

## Upgrade barometer

These versions include two migrations that do not require downtime but **must be run on a node with access to the directories containing repositories and uploads**.

The first migration renames any user or top-level group with the name `system`
to `system0` (or `system1`, `system2`, etc.). **Before running this update please
be sure to backup all repositories and file uploads in `/var/opt/gitlab/git-data`
and `/var/opt/gitlab/gitlab-rails/uploads`.**

The second migration moves all user, group, and project avatars and older note
and appearance uploads from `/public/uploads/(user|note|group|project|appearance)`
to `/public/uploads/system/(user|note|group|project|appearance)`.

To refresh avatar links the database cache must be cleared. This is normally done
automatically with every upgrade. If you have disabled the rake task that clears
the cache you will need to re-enable it or manually clear the Rails cache
after upgrading due to the change in project avatar locations:

`gitlab-rake cache:clear`

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [/etc/gitlab/skip-auto-migrations file](http://doc.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a
[subscription](/pricing/). No time to upgrade GitLab
yourself? Subscribers receive upgrade and installation services.
