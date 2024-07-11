---
layout: post
title: "GitLab 9.0.4, 8.17.5, and 8.16.9 released"
description: "Learn more about GitLab Release 9.0.4, 8.17.5, and 8.16.9 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/04/05/gitlab-9-dot-0-dot-4-security-release/"
date: 2017-04-05
author: Brian Neel
author_twitter: b0bby_tables
author_gitlab: briann
categories: releases
---

Today we are releasing versions 9.0.4, 8.17.5, and 8.16.9 for GitLab
Community Edition (CE) and Enterprise Edition (EE).

These versions contain several security fixes, including security upgrades for
Mattermost, a fix for script injection using class attributes, a fix for a private
project name disclosure vulnerability, a fix for a file path disclosure vulnerability,
and fixes for two open redirect vulnerabilities. We recommend that all GitLab
installations be upgraded to one of these versions.

Please read on for more details.

<!-- more -->

## Security Upgrade for Mattermost versions 3.7 and 3.6

Mattermost has not yet released full details, however an important security
release was published and Mattermost has advised all users to upgrade immediately.
GitLab versions 8.16 and 8.17 have been upgraded to Mattermost 3.6.5 and GitLab
version 9.0 has been upgraded to Mattermost 3.7.3. [#2179]

[#2179]: https://gitlab.com/gitlab-org/omnibus-gitlab/issues/2179

## Unfiltered `class` attribute in Markdown code

[Chalker] via [HackerOne] reported a script injection vulnerability that allowed
an attacker to execute Gitlab Javascript code via unfiltered class definitions.
This attack is limited to pre-existing Javascript that can be referenced via
class names. [#30125]

[#30125]: https://gitlab.com/gitlab-org/gitlab-ce/issues/30125

[Chalker]: https://github.com/ChALkeR/

## Private project name disclosure in merge requests

Timo Schmid from [ERNW] reported an information disclosure vulnerability in GitLab
merge requests that allowed an attacker to disclose the names of private
repositories. [#29364]

[#29364]: https://gitlab.com/gitlab-org/gitlab-ce/issues/29364

## Path disclosure in project import/export

Timo Schmid from [ERNW] also reported an information disclosure vulnerability in
the GitLab project import feature that allowed an attacker to disclose the full
path names for GitLab export directories when imports are allowed from GitLab
export files. Paths could also be disclosed by repeatedly attempting to create a
project export file. [#29363]

[#29363]: https://gitlab.com/gitlab-org/gitlab-ce/issues/29363
[ERNW]: https://www.ernw.de/

## Open redirect vulnerabilities in the GitLab dashboard

[Eaden McKee] via [HackerOne] reported three open redirect vulnerabilities in GitLab
dashboard pages. The todos, issues, and merge request dashboards were vulnerable.
By including a `host` field in the URL an attacker could redirect a GitLab user
to the website of their choosing. [#29651]

[#29651]: https://gitlab.com/gitlab-org/gitlab-ce/issues/29651

[Eaden McKee]: https://twitter.com/eadz

## Open redirect vulnerability in project import status

[Yasin Soliman] via [HackerOne] reported an open redirect vulnerability in the GitLab
project import status page. By including a specially crafted `continue[to]` field
in the URL an attacker could redirect a GitLab user to the website of their choosing. [#29651]

[#29651]: https://gitlab.com/gitlab-org/gitlab-ce/issues/29651

[Yasin Soliman]: https://twitter.com/SecurityYasin
[HackerOne]: https://hackerone.com/

### Versions affected

Mattermost vulnerability:
- GitLab CE+EE Omnibus (with Mattermost enabled) 7.14-8.16.8, 8.17.0-8.17.4, 9.0.0-9.0.3

Unfiltered `class` attribute in Markdown code:
- GitLab CE+EE 8.0.0-8.16.8, 8.17.0-8.17.4, 9.0.0-9.0.3

Private project name disclosure in merge requests:
- GitLab CE+EE 7.1.0-8.16.8, 8.17.0-8.17.4, 9.0.0-9.0.3

Path disclosure in project import/export:
- GitLab CE+EE 8.8.0-8.16.8, 8.17.0-8.17.4, 9.0.0-9.0.3

Open redirects in dashboards:
- GitLab CE+EE 8.16.0-8.16.8, 8.17.0-8.17.4, 9.0.0-9.0.3

Open redirect in project import status:
- GitLab CE+EE 8.6.0-8.16.8, 8.17.0-8.17.4, 9.0.0-9.0.3

We recommend that all installations running a version mentioned above be
upgraded as soon as possible. No workarounds are available for these
vulnerabilities.

## Upgrade barometer

These versions do not include any migrations and will not require downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`
file](http://doc.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a
[subscription](/pricing/). No time to upgrade GitLab
yourself? Subscribers receive upgrade and installation services.
