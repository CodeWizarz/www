---
layout: post
title: "GitLab 9.5.4, 9.4.6, and 9.3.11 released"
description: "Learn more about GitLab Release: 9.5.4, 9.4.6, and 9.3.11 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/09/07/gitlab-9-dot-5-dot-4-security-release/"
date: 2017-09-07
author: Brian Neel
author_twitter: b0bby_tables
author_gitlab: briann
categories: releases
tags: patch releases, releases
---

Today we are releasing versions 9.5.4, 9.4.6, and 9.3.11 for GitLab
Community Edition (CE) and Enterprise Edition (EE).

These versions contain several security fixes, including fixes for several
persistent Cross-Site Scripting (XSS) vulnerabilities, a fix for a hard to exploit
race condition in project uploads, a fix for a CSRF token leakage vulnerability,
a fix for a bug that could allow deleted repositories to be left on disk and copied
by a user that knew their full path, some important Mattermost updates, a fix for
a critical vulnerability in the Nokogiri library, a fix for a vulnerability that
could allow the disclosure of private SSL certificates in Pages sites, and several
more. We recommend that all GitLab installations be upgraded to one of these
versions.

Please read on for more details.

<!-- more -->

## Cross-Site Scripting (XSS) vulnerability in profile names

An external security audit performed by [Madison Gurkha] disclosed a Cross-Site
Scripting (XSS) vulnerability in user names that could be exploited in several
locations. [#36979], [#37344]

[#36979]: https://gitlab.com/gitlab-org/gitlab-ce/issues/36979
[#37344]: https://gitlab.com/gitlab-org/gitlab-ce/issues/37344
[Madison Gurkha]: https://www.madison-gurkha.com/

## Open Redirect in go-get middleware

[Tim Goddard] via [HackerOne] reported that GitLab was vulnerable to an open redirect
vulnerability caused when a specific flag is passed to the `go-get` middleware.
This vulnerability could also _possibly_ be used to conduct Cross-Site Scripting
attacks. [#31508]

[#31508]: https://gitlab.com/gitlab-org/gitlab-ce/issues/31508
[HackerOne]: https://www.hackerone.com/
[Tim Goddard]: https://www.insomniasec.com/

## Race condition in project uploads

[Jobert Abma] from [HackerOne] reported that GitLab was vulnerable to a race
condition in project uploads. While very difficult to exploit this race condition
could _potentially_ allow an attacker to overwrite a victim's uploaded project
if the attacker can guess the name of the uploaded file before it is extracted. [#29652]

[#29652]: https://gitlab.com/gitlab-org/gitlab-ce/issues/29652
[Jobert Abma]: https://twitter.com/jobertabma

## Cross-Site Request Forgery (CSRF) token leakage

[naure] via [HackerOne] reported that GitLab was vulnerable to CSRF token leakage
via improper filtering of external URLs in relative URL creation. A specially
crafted link configured in a project's environments settings could be used
to steal a visiting user's CSRF token. [#31045]

[#31045]: https://gitlab.com/gitlab-org/gitlab-ce/issues/31045
[naure]: https://twitter.com/aurelcode

## Potential project disclosure via project deletion bug

An internal code review discovered that removed projects were not always being
deleted from the file system. This could allow an attacker who knew the full
path to a previously deleted project to steal a copy of the repository. These
releases prevent the leftover repository from being accessed when creating a new
project. The project deletion bug will be fixed in a later release. [#36743]

[#36743]: https://gitlab.com/gitlab-org/gitlab-ce/issues/36743

## Mattermost updates

Mattermost has recently released important security fixes for the Mattermost
versions included with GitLab CE+EE Omnibus packages. Details will be made
available on [Mattermost's website](https://about.mattermost.com/security-updates/) according to their
responsible disclosure policy.

## White-listed style attribute for table contents in MD enables UI redressing

An external security audit performed by [Recurity-Labs] discovered a UI redressing
vulnerability in the GitLab markdown sanitization library. [#36098]

[#36098]: https://gitlab.com/gitlab-org/gitlab-ce/issues/36098
[Recurity-Labs]: http://www.recurity-labs.com/

## DOM clobbering in sanitized MD causes errors

An external security audit performed by [Recurity-Labs] discovered a DOM clobbering
vulnerability in the GitLab markdown sanitization library that could be used
to render project pages unreadable. [#36104]

[#36104]: https://gitlab.com/gitlab-org/gitlab-ce/issues/36104

## Nokogiri vendored libxslt library vulnerable to potential integer overflow (CVE-2017-5029 and CVE-2016-4738)

The bundled Nokogiri library has been updated to patch an integer overflow
vulnerability. Details are available in the [Nokogiri issue]. [#29992]

[#29992]: https://gitlab.com/gitlab-org/gitlab-ce/issues/29992
[Nokogiri issue]: https://github.com/sparklemotion/nokogiri/issues/1634

## Security risk in recommended Geo configuration could give all users access to all repositories

An internal code review discovered that GitLab Geo instances could be vulnerable
to an attack that would allow any user on the primary Geo instance to clone any
repository on a secondary Geo instance. [#3271]

[#3271]: https://gitlab.com/gitlab-org/gitlab-ee/issues/3271

## GitLab Pages private certificate disclosure via symlinks

An external security review conducted by [Recurity-Labs] discovered a vulnerability
in GitLab Pages that could be used to disclose the contents of private SSL keys. [#75]

[#75]: https://gitlab.com/gitlab-org/gitlab-pages/issues/75

### Versions affected

Cross-Site Scripting (XSS) vulnerability in profile names:
- GitLab CE+EE 9.3.0-9.3.10, 9.4.0-9.4.5, 9.5.0-9.5.3

Open Redirect in go-get middleware
- GitLab CE+EE 9.0.0-9.3.10, 9.4.0-9.4.5, 9.5.0-9.5.3

Race condition in project uploads
- GitLab CE+EE 8.10.0-9.3.10, 9.4.0-9.4.5, 9.5.0-9.5.3

CSRF token leakage
- GitLab CE+EE 9.0.0-9.3.10, 9.4.0-9.4.5, 9.5.0-9.5.3

Copying of undeleted repositories
- GitLab CE+EE 9.1.0-9.3.10, 9.4.0-9.4.5, 9.5.0-9.5.3

White-listed style attribute for table contents in MD enables UI redressing
- GitLab CE+EE 8.3.0-9.3.10, 9.4.0-9.4.5, 9.5.0-9.5.3

DOM clobbering in sanitized MD causes errors
- GitLab CE+EE 8.3.0-9.3.10, 9.4.0-9.4.5, 9.5.0-9.5.3

Nokogiri vendored libxslt library vulnerable to potential integer overflow
- GitLab CE+EE 1.0.0-9.3.10, 9.4.0-9.4.5, 9.5.0-9.5.3

Security risk in recommended Geo secondary configuration could give all users access to all repositories
- GitLab EE 8.6.0-9.3.10, 9.4.0-9.4.5, 9.5.0-9.5.3

GitLab Pages private certificate disclosure via Symlinks
- GitLab CE+EE 8.6.0-9.3.10, 9.4.0-9.4.5, 9.5.0-9.5.3

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
