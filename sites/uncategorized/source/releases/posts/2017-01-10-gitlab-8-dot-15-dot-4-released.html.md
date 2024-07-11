---
title: "GitLab 8.15.4, 8.14.6, and 8.13.11 Released"
description: "Learn more about GitLab Release 8.15.4, 8.14.6, and 8.13.11 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/01/10/gitlab-8-dot-15-dot-4-released/"
author: Douglas Barbosa Alexandre
author_twitter: dbalexandre
author_gitlab: dbalexandre
categories: releases
---

Today we are releasing versions 8.15.4, 8.14.6, and 8.13.11 for GitLab Community
Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we recommend that all
affected GitLab installations be upgraded to one of these versions.
Additionally, the 8.15.4 version resolves a number of regressions and bugs in
last month's [8.15 release](/releases/2016/12/22/gitlab-8-15-released/).

<!-- more -->

## Security fixes in 8.15.4, 8.14.6 and 8.13.11

### Cross-Site Scripting Vulnerability in Turbolinks

These releases include a [patch](https://gitlab.com/gitlab-org/gitlab-ce/issues/25842) for a cross-site scripting vulnerability in the
Ruby gem Turbolinks. Versions 2.5.4 and earlier of Turbolinks are vulnerable to
cross-site scripting attacks when loading attachments with HTML content types.
We've released a temporary GitLab fork of Turbolinks while we make a decision
on migrating to Turbolinks version 5 or abandoning Turbolinks.

### Cross-Site Scripting Vulnerability in GitLab-Markup

Also included with these releases is a [patch](https://gitlab.com/gitlab-org/gitlab-ce/issues/26411) for a cross-site scripting
vulnerability in the GitLab Markup gem, forked from the GitHub Markup gem.
This vulnerability can be exploited by tricking users into clicking on
ReStructuredText files that specify a raw HTML format. Thanks to Jason Ritzke
(@Rtzq0) for reporting this vulnerability.

## Additional changes in 8.15.4

- **CE/EE:** Use #parts instead of #part to read all the parts of the Message. ([!8507])
- **CE/EE:** Re-add Google Cloud Storage as a backup strategy ([!8481])
- **CE/EE:** Don't instrument 405 Grape calls ([!8445])
- **CE/EE:** Speed up group milestone index by passing group_id to IssuesFinder ([!8363])
- **CE/EE:** With Gitea v1.0.0, notes are imported ([!8298])
- **CE/EE:** Make successful pipeline emails off for watchers ([!8176])
- **Omnibus GitLab:** Switch to using gitlab-psql for query against db ([!1197])
- **Omnibus GitLab:** Adding /bin/sh to command for analyze_new_cluster.sh call ([!1194])

[!8509]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8509
[!8507]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8507
[!8481]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8481
[!8445]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8445
[!8363]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8363
[!8298]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8298
[!8176]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8176
[!1194]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1194
[!1197]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1197

## Upgrade barometer

These versions have no migrations and should not require any downtime.

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
