---
layout: post
title: "GitLab 10.2.4, 10.1.5, and 10.0.7 Released"
description: "Learn more about GitLab Release: 10.2.4, 10.1.5, and 10.0.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/12/08/gitlab-10-dot-2-dot-4-security-release/"
date: 2017-12-08
author: Brian Neel
author_twitter: b0bby_tables
author_gitlab: briann
categories: releases
tags: patch releases, releases
---

Today we are releasing versions 10.2.4, 10.1.5, and 10.0.7 for GitLab
Community Edition (CE) and Enterprise Edition (EE).

These versions contain several security fixes, including a fix for a difficult to exploit
Cross-Site Scripting (XSS) vulnerability, a fix for an API bug that could leak the
names of private projects, a fix for a private email disclosure vulnerability, and a fix
for a bug that could allow users without access to a project to create issues in that
project.

We recommend that all GitLab installations be upgraded to one of these versions.

Please read on for more details.

<!-- more -->

## User without access to private Wiki can see it on the project page ([#36679])

[Matthias Burtscher] reported that it was possible for a user to see a private
Wiki on the project page without having the corresponding permission.

**Versions affected:** GitLab CE+EE 8.12.0–10.0.6, 10.1.0–10.1.4, 10.2.0–10.2.3

[#36679]: https://gitlab.com/gitlab-org/gitlab-ce/issues/36679
[Matthias Burtscher]: https://gitlab.com/mburtscher

## E-mail address disclosure through member search fields ([#34910])

[Hugo Geoffroy] reported via [HackerOne] that it was possible to find out the
full e-mail address of any user by brute-forcing the member search field.

**Versions affected:** GitLab CE+EE 8.6.0–10.0.6, 10.1.0–10.1.4, 10.2.0–10.2.3

[#34910]: https://gitlab.com/gitlab-org/gitlab-ce/issues/34910
[Hugo Geoffroy]: https://gitlab.com/pstch
[HackerOne]: https://www.hackerone.com/

## Groups API leaks private projects ([#39134])

An internal code review discovered that users were able to list private projects
they had no access to by using the Groups API.

**Versions affected:** GitLab CE+EE 4.2.0–10.0.6, 10.1.0–10.1.4, 10.2.0–10.2.3

[#39134]: https://gitlab.com/gitlab-org/gitlab-ce/issues/39134

## Cross-Site Scripting (XSS) possible by editing a comment ([#40706])

[Sylvain Heiniger] reported via [HackerOne] that it was possible for arbitrary
JavaScript code to be executed when editing a comment.

**Versions affected:** GitLab CE+EE 10.0.0–10.0.6, 10.1.0–10.1.4, 10.2.0–10.2.3

[#40706]: https://gitlab.com/gitlab-org/gitlab-ce/issues/40706
[Sylvain Heiniger]: https://compass-security.com
[HackerOne]: https://www.hackerone.com/

## Issue API allows any user to create a new issue even when issues are restricted or disabled ([#30663])

[Mohammad Hasbini] reported that any user could create a new issues in a project
even when issues were disabled or restricted to team members in the project settings.

**Versions affected:** GitLab CE+EE 8.12.0–10.0.6, 10.1.0–10.1.4, 10.2.0–10.2.3

[#30663]: https://gitlab.com/gitlab-org/gitlab-ce/issues/30663
[Mohammad Hasbini]: https://gitlab.com/0xbsec

<br>

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
