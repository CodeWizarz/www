---
layout: post
title: "GitLab 9.3.8, 9.2.8, 9.1.8, 9.0.11, and 8.17.7 released"
description: "Learn more about GitLab Release 9.3.8, 9.2.8, 9.1.8, 9.0.11, and 8.17.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/07/19/gitlab-9-dot-3-dot-8-released/"
date: 2017-07-19 23:59
author: GitLab
author_twitter: gitlab
categories: releases
tags: patch releases, releases
---

Today we are releasing versions 9.3.8, 9.2.8, 9.1.8, 9.0.11, and 8.17.7 for GitLab Community
Edition (CE) and Enterprise Edition (EE).

These versions contain several security fixes, including an important security
fixes for two authorization bypass vulnerabilities (post-authentication), protection against
denial-of-service attacks in regular expressions, important security patches for Mattermost,
and protections for exporting issues to Microsoft Excel via CSV files. We **strongly recommend**
that all affected GitLab installations be upgraded to one of these versions
**immediately**.

Please read on for more details.

<!-- more -->

## Projects in subgroups authorization bypass with SQL wildcards (CVE-2017-11438)

An internal code review disclosed that by choosing a namespace with underscores
an authenticated user could take advantage of a badly written SQL query to add themselves
to any project inside a subgroup with permissions of their choice.

This vulnerability was caused by a SQL query that automatically adjusts project
permissions but does not escape wildcards. This vulnerability was coincidentally patched
when the affected code was rewritten for 9.3. Therefore, versions 9.3 and above
are not vulnerable. [33323]

This issue has been assigned [CVE-2017-11438].

Note: GitLab-CE+EE 8.17 is not vulnerable to this issue, however patches
have been included to improve the security of the SQL queries in 8.17.7.

[33323]: https://gitlab.com/gitlab-org/gitlab-ce/issues/33323
[CVE-2017-11438]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-11438

### Versions affected

- GitLab CE+EE: 9.0.0 through 9.0.10
- GitLab CE+EE: 9.1.0 through 9.1.7
- GitLab CE+EE: 9.2.0 through 9.2.7

## Unauthorized repository access by using project mirrors and CI (GitLab EE only) (CVE-2017-11437)

Peter Lloyd with [Cambridge Consultants] reported that the GitLab mirroring feature
could be abused to steal copies of repositories from other users and possibly push
docker images to other user's docker registries.

To exploit this vulnerability an authenticated user would need to create a project mirror,
invite another user, assign them as the mirror user, enable CI for the mirror,
and modify the original repository. Because the CI scripts will then be executed
as the mirror user the attacker can use the CI Token to fetch repositories belonging
to the victim. GitLab now only allows users to assign themselves as the mirror user. [2905]

This issue has been assigned [CVE-2017-11437].

[2905]: https://gitlab.com/gitlab-org/gitlab-ee/issues/2905
[CVE-2017-11437]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-11437
[Cambridge Consultants]: http://www.cambridgeconsultants.com

### Versions affected

- GitLab EE: 8.5.0-8.17.6
- GitLab EE: 9.0.0-9.0.10
- GitLab EE: 9.1.0-9.1.7
- GitLab EE: 9.2.0-9.2.7
- GitLab EE: 9.3.0-9.3.7

We **strongly recommend** that all installations running a version mentioned
above be upgraded as soon as possible.

### Workarounds

There are no workaround for these vulnerabilities.

## Other fixes in 9.3.8, 9.2.8, 9.1.8, 9.0.11, and 8.17.7

### Symlink cleanup from a previous security release

The [9.2.5 security release] contained a fix for a data corruption vulnerability
involving file uploads. This fix utilized symlinks to migrate file uploads to a
new directory. Due to a typo in the included migration a symlink was accidentally
left behind after the migration finished. This symlink can cause problems with
instance backups. A fix is included with these releases to remove the problematic
symlink. [34056]

Affected versions: GitLab CE+EE 9.0.10, 9.1.7, 9.2.5-9.2.7, 9.3.0-9.3.7

[34056]: https://gitlab.com/gitlab-org/gitlab-ce/issues/34056
[9.2.5 security release]: /releases/2017/06/07/gitlab-9-dot-2-dot-5-security-release/

### Accidental or malicious use of reserved names in group names could cause deletion of all snippet uploads

The [9.2.5 security release] contained a fix for a data corruption vulnerability
involving file uploads. After the release of 9.2.5 an internal code review
determined that the recently introduced snippet file uploads feature was also vulnerable
to file deletion. Snippet uploads have now been moved into the protected `system` namespace. [33359]

Affected versions: GitLab CE+EE 9.3.0-9.3.7

[33359]: https://gitlab.com/gitlab-org/gitlab-ce/issues/33359
[9.2.5 security release]: /releases/2017/06/07/gitlab-9-dot-2-dot-5-security-release/

### Project name leak on todos page

An internal code review discovered that forceful browsing could be utilized to disclose
the names of private projects. [33303]

Affected versions: GitLab CE+EE 8.10.0-8.17.6, 9.0.0-9.0.10, 9.1.0-9.1.7, 9.2.0-9.2.7, 9.3.0-9.3.7

[33303]: https://gitlab.com/gitlab-org/gitlab-ce/issues/33303

### Denial of Service via regular expressions in CI process

[Lukas Svoboda] reported that regular expressions (regex) included with CI scripts could be
utilized to perform a denial-of-service attack on GitLab instances. GitLab now uses
the [re2 Regex library] to limit regex execution time. [24570]

Affected versions: GitLab CE+EE 8.0.0-8.17.6, 9.0.0-9.0.10, 9.1.0-9.1.7, 9.2.0-9.2.7, 9.3.0-9.3.7

[24570]: https://gitlab.com/gitlab-org/gitlab-ce/issues/24570
[re2 Regex library]: https://github.com/google/re2
[Lukas Svoboda]: https://github.com/lksv

### Issue title leakage when external issue tracker is enabled

An internal code review determined that when an external issue tracker is configured
it was possible to discover the titles of all issues in a given GitLab instance,
including issues in private projects and confidential issues. [33679]

Affected versions: GitLab CE+EE 8.14.0-8.17.6, 9.0.0-9.0.10, 9.1.0-9.1.7, 9.2.0-9.2.7, 9.3.0-9.3.7

[33679]: https://gitlab.com/gitlab-org/gitlab-ce/issues/33679

### Mattermost security update

GitLab Omnibus packages now include the latest versions of Mattermost, including
the most recent security patches. Mattermost has not yet released details on the
patched vulnerabilities but is encouraging all users to upgrade.

These updates are only available for GitLab CE+EE 9.1, 9.2, and 9.3. [2576]

Affected versions: All GitLab versions prior to 9.3.8, 9.2.8, and 9.1.8.

[2576]: https://gitlab.com/gitlab-org/omnibus-gitlab/issues/2576

### Client-side command execution in Microsoft Excel using issue exports (EE only)

[Edio] via [HackerOne] reported that the export to CSV feature for project issues
in GitLab EE could be abused to execute arbitrary commands on a victim's computer
if the resulting CSV file were opened in Microsoft Excel. For this attack to work
an attacker must have the ability to create or edit issues in a project and must trick
a victim into exporting and opening the CSV file containing the malicious issue
text in Microsoft Excel.

All issue contents containing dangerous characters are now escaped upon export
by prepending a single quote to each column. [30250]

Affected versions: GitLab EE 9.0.0-9.0.10, 9.1.0-9.1.7, 9.2.0-9.2.7, 9.3.0-9.3.7

[30250]: https://gitlab.com/gitlab-org/gitlab-ce/issues/30250
[Edio]: https://twitter.com/EdOverflow
[HackerOne]: https://hackerone.com/

## Upgrade barometer

These versions includes two small migrations to remove a leftover symlink and
and move private snippet uploads to the `system` directory. These migrations
should not require any downtime.

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
