---
layout: post
title: "GitLab 9.1.3, 9.0.7, and 8.17.6 released"
description: "Learn more about GitLab Release 9.1.3, 9.0.7, and 8.17.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/05/08/gitlab-9-dot-1-dot-3-security-release/"
date: 2017-05-08
author: Brian Neel
author_twitter: b0bby_tables
author_gitlab: briann
categories: releases
---

Today we are releasing versions 9.1.3, 9.0.7, and 8.17.6 for GitLab
Community Edition (CE) and Enterprise Edition (EE).

These versions contain several security fixes, including security upgrades for
Mattermost, fixes for several persistent Cross-site Scripting (XSS) vulnerabilities,
and fixes for several information disclosure vulnerabilities. We recommend that
all GitLab installations be upgraded to one of these versions.

Please read on for more details.

<!-- more -->

## Security upgrade for Mattermost versions 3.7 and 3.6

Mattermost has not yet released full details, however an important security
release was published and Mattermost has advised all users to upgrade immediately.
GitLab Omnibus CE+EE versions 9.1 and 9.0 have been upgraded to Mattermost 3.7.5
and GitLab Omnibus CE+EE version 8.17 has been upgraded to Mattermost 3.6.7. [#2282]

This upgrade also required the addition of a new Mattermost setting in `gitlab.rb`. [#2286]

[#2282]: https://gitlab.com/gitlab-org/omnibus-gitlab/issues/2282
[#2286]: https://gitlab.com/gitlab-org/omnibus-gitlab/issues/2286

## Security upgrade for MySQL client libraries

The MySQL client library included with GitLab Omnibus packages has been upgraded
to 5.5.56 to patch [CVE-2017-3305], a potential man-in-the-middle vulnerability for
installations using MySQL over the network. [#2311]

[#2311]: https://gitlab.com/gitlab-org/omnibus-gitlab/issues/2311
[CVE-2017-3305]: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-3305

## Cross-Site Scripting (XSS) vulnerability in project import file names for gitlab_project import types

Timo Schmid from [ERNW] reported a persistent Cross-Site Scripting vulnerability in the new
project import view for gitlab_project import types. This XSS vulnerability was
caused by the use of Hamlit filters inside HAML views without manually escaping
HTML. Unlike content outside of a filter, content inside Hamlit filters (`:css`,
`:javascript`, `:preserve`, `:plain`) is not automatically escaped. [#28325]

[ERNW]: https://www.ernw.de/
[#28325]: https://gitlab.com/gitlab-org/gitlab-ce/issues/28325

## Cross-Site Scripting (XSS) vulnerability in git submodule support

[Jobert Abma][jobert-twitter] from [HackerOne] reported a persistent XSS vulnerability in the GitLab
repository files view that could be exploited by injecting malicious script into
a git submodule. [#30527]

[#30527]: https://gitlab.com/gitlab-org/gitlab-ce/issues/30527
[jobert-twitter]: https://twitter.com/jobertabma
[HackerOne]: https://hackerone.com/

## Cross-Site Scripting (XSS) vulnerability in repository "new branch" view

A GitLab user reported a persistent XSS vulnerability in the repository new
branch view that allowed malicious branch names or `git` references to execute
arbitrary Javascript. [#31332]

[#31332]: https://gitlab.com/gitlab-org/gitlab-ce/issues/31332

## Cross-Site Scripting (XSS) vulnerability in mirror errors display

While investigating Timo Schmid's previously reported XSS vulnerability in import
filenames another persistent XSS vulnerability was discovered in the GitLab
Enterprise Edition's (EE) mirror view. This vulnerability was also caused by the
misuse of Hamlit filters. [#28325]

[#28325]: https://gitlab.com/gitlab-org/gitlab-ce/issues/28325

## Potential XSS vulnerability in DropLab

An internal code audit disclosed a vulnerability in DropLab's templating that,
while not currently exploitable, could become exploitable depending on how the
templates were used in the future. This is a preventative patch. [#30761]

[#30761]: https://gitlab.com/gitlab-org/gitlab-ce/issues/30761

## Tab Nabbing vulnerabilities in mardown link filter, Asciidoc files, and other markup files

[edio] via [HackerOne] reported two tab nabbing vulnerabilities. The first tab
nabbing vulnerability was caused by improper hostname filtering when identifying
user-supplied external links. GitLab did not properly filter usernames from the
URL. An attacker could construct a specially crafted link including a username to
bypass GitLab's external link filter. This allowed an attacker to post links in
Markdown that did not include the appropriate "noreferrer noopener" options,
allowing tab nabbing attacks.

The second vulnerability was in the AsciiDoctor markup library. AsciiDoctor was
not properly including the "noreferrer noopener" options with external links. An
internal investigation discovered other markup libraries that were also vulnerable. [#29413] / [#29374]

[#29413]: https://gitlab.com/gitlab-org/gitlab-ce/issues/29413
[#29374]: https://gitlab.com/gitlab-org/gitlab-ce/issues/29374

[edio]: https://twitter.com/EdOverflow
[HackerOne]: https://www.hackerone.com/

## Unauthorized disclosure of wiki pages in search

M. Hasbini reported a flaw in the project search feature that allowed authenticated
users to disclose the contents of private wiki pages inside public projects. [#31157]

[#31157]: https://gitlab.com/gitlab-org/gitlab-ce/issues/31157

## External users can view internal snippets

Christian Kühn discovered a vulnerability in GitLab snippets that allowed an
external user to view the contents of internal snippets. [#30487]

[#30487]: https://gitlab.com/gitlab-org/gitlab-ce/issues/30487

## Subgroup visibility for private subgroups under a public parent group

Matt Harrison discovered a vulnerability with subgroups that allowed private
subgroup names to be disclosed when they belong to a parent group that is public. [#31068]

[#31068]: https://gitlab.com/gitlab-org/gitlab-ce/issues/31068

### Versions affected

Mattermost vulnerability:
- GitLab CE+EE Omnibus (with Mattermost enabled) 7.14-8.17.5, 9.0.0-9.0.6, 9.1.0-9.1.2

Update mysql to 5.5.56 for CVE-2017-3305:
- GitLab CE+EE Omnibus (with MySQL enabled) All versions up to and including 8.17.5, 9.0.0-9.0.6, 9.1.0-9.1.2

Cross-Site Scripting (XSS) vulnerability in mirror errors display:
- GitLab EE 9.0.0-9.0.6, 9.1.0-9.1.2

Cross-Site Scripting (XSS) vulnerability in project import via GitLab export (file names):
- GitLab CE+EE 8.3.0-8.17.5, 9.0.0-9.0.6, 9.1.0-9.1.2

Cross-Site Scripting (XSS) vulnerability in repository "new branch" view:
- GitLab CE+EE 8.13.0-8.17.5, 9.0.0-9.0.6, 9.1.0-9.1.2

Persistent XSS in git submodule support:
- GitLab CE+EE 6.6.0-8.17.5, 9.0.0-9.0.6, 9.1.0-9.1.2

Potential XSS vulnerability in DropLab:
- GitLab CE+EE 9.1.0-9.1.2

Subgroup visibility for private subgroups under a public parent group:
- GitLab CE+EE 9.0.0-9.0.6,9.1.0-9.1.2

Tab Nabbing vulnerabilities in mardown link filter, Asciidoc files, and other markup files:
- AsciiDoctor: GitLab CE+EE 7.12.0-8.17.5, 9.0.0-9.0.6, 9.1.0-9.1.2
- Markdown links: GitLab CE+EE 8.14.0-8.17.5, 9.0.0-9.0.6, 9.1.0-9.1.2

Unauthorized disclosure of wiki pages in search:
- GitLab CE+EE 8.14.0-8.17.5, 9.0.0-9.0.6, 9.1.0-9.1.2

External Users can view internal snippets:
- GitLab CE+EE 7.4.0-8.17.5, 9.0.0-9.0.6, 9.1.0-9.1.2

We recommend that all installations running a version mentioned above be
upgraded as soon as possible. No workarounds are available for these
vulnerabilities.

## Upgrade barometer

These versions do not include any migrations and will not require downtime.

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
