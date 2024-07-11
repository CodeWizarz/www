---
title: "GitLab Critical Security Release: 11.9.7, 11.8.7, and 11.7.11"
description: "Learn more about GitLab Critical Security Release: 11.9.7, 11.8.7, and 11.7.11 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/04/10/critical-security-release-gitlab-11-dot-9-dot-7-released/"
categories: releases
author: Ethan Strike
author_gitlab: estrike
tags: security, security releases
---

Today we are releasing versions 11.9.7, 11.8.7, and 11.7.11 for GitLab Community Edition (CE) and Enterprise Edition (EE).

The GitLab EE versions contain an important security fix, and we strongly recommend that all GitLab EE installations be upgraded immediately. GitLab CE is not affected, but the
version numbers were increased to be consistent with EE versioning.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

## Group Runner Registration Token Exposure

The GitLab groups API was vulnerable to an information disclosure issue that disclosed group runner registration tokens to unauthorized users. The issue is now mitigated in the latest release and is assigned [CVE-2019-11000](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11000).

Thanks to [@storm_spirit](https://hackerone.com/storm_spirit) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 10.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).
