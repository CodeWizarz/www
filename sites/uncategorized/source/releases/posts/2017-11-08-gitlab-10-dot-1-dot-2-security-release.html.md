---
layout: post
title: "GitLab 10.1.2, 10.0.6, and 9.5.10 released"
description: "Learn more about GitLab Release: 10.1.2, 10.0.6, and 9.5.10 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/11/08/gitlab-10-dot-1-dot-2-security-release/"
date: 2017-11-08
author: Brian Neel
author_twitter: b0bby_tables
author_gitlab: briann
categories: releases
tags: patch releases, releases
---

Today we are releasing versions 10.1.2, 10.0.6, and 9.5.10 for GitLab
Community Edition (CE) and Enterprise Edition (EE).

These versions contain several security fixes, including updates for several third
party applications shipped with GitLab Omnibus packages, a fix for a Server-side Request
Forgery (SSRF) bypass, the re-introduction of a GitLab Geo security fix that was omitted
from GitLab 10.1 releases, and some security header additions to the GitLab API.

We recommend that all GitLab installations be upgraded to one of these versions.

Please read on for more details.

<!-- more -->

## Security vulnerabilities in curl

The version of `curl` included with GitLab Omnibus packages has been updated to
patch [several security vulnerabilities]. [#2905]

[several security vulnerabilities]: https://curl.haxx.se/docs/vuln-7.53.0.html
[#2905]: https://gitlab.com/gitlab-org/omnibus-gitlab/issues/2905

### Versions affected

GitLab Omnibus CE+EE 9.5.9 and earlier, 10.0.0–10.0.5, 10.1.0–10.1.1

## SSRF vulnerability via project import

[edio] via [HackerOne] discovered that GitLab [SSRF protections] in project imports
did not properly translate IP addresses written in decimal, octal, or other formats.
This could allow a malicious user to send project import requests to services running
on the local interface of a GitLab instance, possibly resulting in unexpected behavior. [#33310]

[HackerOne]: https://www.hackerone.com/
[edio]: https://edoverflow.com/
[#33310]: https://gitlab.com/gitlab-org/gitlab-ce/issues/33310

[SSRF protections]:/releases/2017/03/20/gitlab-8-dot-17-dot-4-security-release/#ssrf-when-importing-a-project-from-a-repo-by-url

### Versions affected

GitLab CE+EE 9.5.9 and earlier, 10.0.0–10.0.5, 10.1.0–10.1.1

## Missing X-Content-Type-Options header in API Responses

During an external security audit performed by [Recurity-Labs] it was discovered
that the GitLab API did not include an HTTP `X-Content-Type-Options` header. The
lack of this header could make it easier for attackers to exploit other, undiscovered,
vulnerabilities using the GitLab API. [#36099]

[#36099]: https://gitlab.com/gitlab-org/gitlab-ce/issues/36099
[Recurity-Labs]: http://www.recurity-labs.com/

### Versions affected

GitLab CE+EE 9.5.9 and earlier, 10.0.0–10.0.5, 10.1.0–10.1.1

## Mattermost updates

Mattermost has recently released important security fixes for the Mattermost versions included with GitLab CE+EE Omnibus packages.
Details will be made available on [Mattermost's website] according to their responsible disclosure policy.

[Mattermost's website]: https://about.mattermost.com/security-updates/

### Versions affected

GitLab Omnibus CE+EE 9.5.9 and earlier, 10.0.0–10.0.5, 10.1.0–10.1.1 running Mattermost

## GitLab Geo JSON web tokens do not expire

An internal code review discovered that the GitLab Geo JSON web tokens (JWT) used
to replicate data between Geo instances were not configured to expire. Without
expiration these tokens could be used forever and presented an increased risk
of compromise should a token be accidentally disclosed. Geo web tokens are now
configured to expire after two minutes. [#3787]

[#3787]: https://gitlab.com/gitlab-org/gitlab-ee/issues/3787

### Versions affected

GitLab EE 8.9–9.5.9, 10.0.0–10.0.5, 10.1.0–10.1.1

## Security risk in recommended GitLab Geo configuration could give all users access to all repositories

The GitLab 9.5.4 security release contained a fix for a GitLab Geo vulnerability
that could allow any user of a GitLab Geo instance to clone any repository on
the secondary Geo instance. This patch was included in the later 9.5 and 10.0 releases
but was mistakenly excluded from the 10.1.0 and 10.1.1 releases. [#3899]

[#3899]: https://gitlab.com/gitlab-org/gitlab-ee/issues/3899

[previous security fix]: /2017/09/07/gitlab-9-dot-5-dot-4-security-release/#security-risk-in-recommended-geo-configuration-could-give-all-users-access-to-all-repositories

### Versions affected

GitLab EE 10.1.0–10.1.1

## MySQL fix for Pivotal users

This security release also contains a non-security fix for a bug involving MySQL
that could prevent GitLab users who use GitLab PCF tile from upgrading. The fix itself is not
a security fix but has been included to allow GitLab Pivotal users to apply these security updates. [#38372]

[#38372]: https://gitlab.com/gitlab-org/gitlab-ce/issues/38372

---

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
