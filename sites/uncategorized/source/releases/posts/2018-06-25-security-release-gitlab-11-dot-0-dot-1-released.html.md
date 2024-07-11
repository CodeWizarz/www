---
title: "GitLab Security Release: 11.0.1, 10.8.5, and 10.7.6"
description: "Learn more about GitLab Security Release: 11.0.1, 10.8.5, and 10.7.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/06/25/security-release-gitlab-11-dot-0-dot-1-released/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
tags: security, security releases
---

Today we are releasing versions 11.0.1, 10.8.5, and 10.7.6 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

##  Wiki XSS

The wiki contains a persistent XSS issue due to a lack of output encoding affecting a specific markdown feature. The issue is now resolved in the latest release. It has been assigned to [CVE-2018-12606](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-12606).

Thanks to [@fransrosen](https://hackerone.com/fransrosen) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 7.11 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Sanitize gem updates

The sanitize gem is updated to version 4.6.4 due to versions < 4.6.3 being affected by [CVE-2018-3740](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-3740).

### Versions Affected

Affects GitLab CE/EE 6.8.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  XSS in url_for(params)

The usage of `url_for` contained a XSS issue due to it allowing arbitrary protocols as a parameter. The issue is now resolved in the latest release. It has been assigned to [CVE-2018-12605](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-12605).

### Versions Affected

Affects GitLab CE/EE 10.7 only. This is already fixed in 10.8 and up.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Content injection via username

The username field contained an input validation issue which resulted in HTML content injection on several pages and could lead to phishing attacks. The issue is now resolved in the latest release.

Thanks to @talaohu28 for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 4.1 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Activity feed publicly displaying internal project names

The activity feed was disclosing membership and project-level events of internal projects, even when logged out. The issue is now resolved in the latest release.

Thanks to [@ppjet6](https://gitlab.com/ppjet6) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.7 - 11.0.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Persistent XSS in charts

The charts feature contained a persistent XSS issue due to a lack of output encoding. The issue is now resolved in the latest release. It has been assigned to [CVE-2018-12607](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-12607).

Thanks to [@fransrosen](https://hackerone.com/fransrosen) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.5 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).
