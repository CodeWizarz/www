---
title: "GitLab Critical Security Release: 11.7.4 and 11.6.9"
description: "Learn more about GitLab Critical Security Release: 11.7.4 and 11.6.9 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/02/05/critical-security-release-gitlab-11-dot-7-dot-4-released/"
categories: releases
author: Ethan Strike
author_gitlab: estrike
tags: security, security releases
---

Today we are releasing versions 11.7.4 and 11.6.9 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

##  Leak of Confidential Issue and Merge Request Titles

GitLab Releases were vulnerable to an authorization issue that allowed users to view confidential issue and merge request titles of other projects. The issue is now mitigated in the latest release and is assigned [CVE-2019-7353](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-7353).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.7 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Persistent XSS in User Status

A regression was identified in the patch for a persistent XSS attack in user status. The issue is now mitigated in the latest release and is assigned [CVE-2019-6796](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6796).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).
