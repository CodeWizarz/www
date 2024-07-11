---
title: "GitLab Critical Security Release: 11.6.4, 11.5.7, 11.4.14"
description: "Learn more about GitLab Critical Security Release: 11.6.4, 11.5.7, 11.4.14 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/01/16/critical-security-release-gitlab-11-dot-6-dot-4-released/"
categories: releases
author: Ethan Strike
author_gitlab: estrike
tags: security, security releases
---

Today we are releasing versions 11.6.4, 11.5.7, and 11.4.14 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain an important security fix, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

##  Arbitrary repo read in Gitlab project import

The project import feature contained a lack of archive validation which could result in an arbitrary repo read. The issue is now mitigated in the latest release and is assigned [CVE-2019-6240](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6240).

Thanks to @nyangawa of Chaitin Tech for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).
