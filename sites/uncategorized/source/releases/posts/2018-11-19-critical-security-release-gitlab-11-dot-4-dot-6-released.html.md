---
title: "GitLab Critical Security Release: 11.5.0-rc12, 11.4.6, 11.3.10"
description: "Learn more about GitLab Critical Security Release: 11.5.0-rc12, 11.4.6 and 11.3.10 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/11/19/critical-security-release-gitlab-11-dot-4-dot-6-released/"
categories: releases
author: Ethan Strike
author_gitlab: estrike
tags: security, security releases
---

Today we are releasing versions 11.5.0-rc12, 11.4.6, and 11.3.10 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

##  Persistent XSS Autocompletion

An attribute used in autocompletion contained an input validation and output encoding issue which resulted in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2018-18643](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18643).

### Versions Affected

Affects GitLab CE 11.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Unauthorized service template creation

The project import feature contained an input validation issue that resulted in the ability for an unauthorized user to create service templates. The issue is now mitigated in the latest release and is assigned [CVE-2018-19359](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19359).

Thanks to [@jobert](https://hackerone.com/jobert) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE 8.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).

*Updated: 2018-11-20:* We have received some questions regarding the XSS vulnerability in this release and a similar vulnerability reported in October. The fix in this release does correct an incomplete patch in the [October security release](/releases/2018/10/29/security-release-gitlab-11-dot-4-dot-3-released/).
