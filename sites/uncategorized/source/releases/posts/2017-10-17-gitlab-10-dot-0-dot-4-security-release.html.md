---
layout: post
title: "GitLab 10.0.4, 9.5.9, and 9.4.7 released"
description: "Learn more about GitLab Release: 10.0.4, 9.5.9, and 9.4.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/10/17/gitlab-10-dot-0-dot-4-security-release/"
date: 2017-10-17
author: Brian Neel
author_twitter: b0bby_tables
author_gitlab: briann
categories: releases
tags: patch releases, releases
---

Today we are releasing versions 10.0.4, 9.5.9, and 9.4.7 for GitLab
Community Edition (CE) and Enterprise Edition (EE).

These versions contain several security fixes, including fixes for two
persistent Cross-Site Scripting (XSS) vulnerabilities, an open redirect vulnerability,
a bug when changing usernames that could leave behind and leak
repositories, an information leakage vulnerability in private issue names, and
security updates for Ruby and libxml2. We recommend that all GitLab installations
be upgraded to one of these versions.

Please read on for more details.

<!-- more -->

## Cross-Site Scripting (XSS) vulnerability in the Markdown sanitization filter

[Yasin Soliman] via [HackerOne] reported a Cross-Site Scripting (XSS) vulnerability in the
GitLab markdown sanitization filter. The sanitization filter was not properly
stripping invalid characters from URL schemes and was therefore vulnerable to
persistent XSS attacks anywhere Markdown was supported. [#38272]

[#38272]: https://gitlab.com/gitlab-org/gitlab-ce/issues/38272
[Yasin Soliman]: https://twitter.com/SecurityYasin

## Cross-Site Scripting (XSS) vulnerability in search bar

[Josh Unger] reported a Cross-Site Scripting (XSS) vulnerability in the
issue search bar. Usernames were not being properly HTML escaped inside the author
filter would could allow arbitrary script execution. [#38267]

[Josh Unger]: https://gitlab.com/joshunger

[#38267]: https://gitlab.com/gitlab-org/gitlab-ce/issues/38267

## Open redirect in repository `git` redirects

[Eric Rafaloff] via [HackerOne] reported that GitLab was vulnerable to an open redirect
vulnerability when redirecting requests for repository names that include the `git`
extension. GitLab was not properly removing dangerous parameters from the params
field before redirecting which could allow an attacker to redirect users to
arbitrary hosts. [#37715]

[#37715]: https://gitlab.com/gitlab-org/gitlab-ce/issues/37715
[HackerOne]: https://www.hackerone.com/
[Eric Rafaloff]: https://ericrafaloff.com

## Username changes could leave repositories behind

An internal code review discovered that a bug in the code that moves repositories
during a username change could potentially leave behind projects, allowing an
attacker who knows the previous username to potentially steal the contents of
repositories on instances that are not configured with hashed namespaces. [#38126]

[#38126]: https://gitlab.com/gitlab-org/gitlab-ce/issues/38126

## Confidential issue names could leak in "related issues" feature

An internal code review discovered that confidential issue titles could leak
when referenced as "related issues". GitLab EE was not properly filtering confidential
issues in the related issues feature for users that did not have access to these
issues. [#3435]

[#3435]: https://gitlab.com/gitlab-org/gitlab-ee/issues/3435

## Ruby update

The version of Ruby included with GitLab Omnibus CE+EE packages has been updated
to 2.3.5 to patch a potential SMTP injection vulnerability that could allow attackers
to use a GitLab instance to send arbitrary emails. A patch is also included to
support the use of carriage returns as email separators in pipeline alert email
recipient lists so that installations improperly using carriage returns as email
separators do not break. [HackerOne Report]

[HackerOne Report]: https://hackerone.com/reports/137631

## Libxml2 update

The version of libxml2 included with GitLab Omnibus CE+EE packages has been updated
to 2.9.6 to patch several security vulnerabilities. [XMLSoft]

[XMLSoft]: http://xmlsoft.org/news.html

### Versions affected

Cross-Site Scripting (XSS) vulnerability in markdown:
- GitLab CE+EE 2.8.0-9.4.6, 9.5.0-9.5.8, 10.0.0-10.0.3

Cross-Site Scripting (XSS) vulnerability in search bar
- GitLab CE+EE 9.3.0-9.4.6, 9.5.0-9.5.8, 10.0.0-10.0.3

Open redirect in repository git redirects
- GitLab CE+EE 9.2.0-9.4.6, 9.5.0-9.5.8, 10.0.0-10.0.3

Username changes could leave repositories behind
- GitLab CE+EE 9.5.0-9.5.8, 10.0.0-10.0.3

Confidential issue names could leak in "related issues" feature
- GitLab EE 9.4.0-9.4.6, 9.5.0-9.5.8, 10.0.0-10.0.3

Ruby update
- GitLab CE+EE 8.14.0-9.4.6, 9.5.0-9.5.8, 10.0.0-10.0.3

Libxml2 update
- GitLab CE+EE 1.1.1-9.4.6, 9.5.0-9.5.8, 10.0.0-10.0.3

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
