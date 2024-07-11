---
title: "GitLab Security Release: 11.11.1, 11.10.5, and 11.9.12"
description: "Learn more about GitLab Security Release: 11.11.1, 11.10.5, and 11.9.12 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/06/03/security-release-gitlab-11-dot-11-dot-1-released/"
categories: releases
author: Juan Broullon
author_gitlab: jbroullon
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 11.11.1, 11.10.5, and 11.9.12 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab-ce/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=security) in approximately 30 days.

Please read on for more information regarding this release.

## Remote Command Execution Vulnerability on Repository Download Feature

A specially crafted payload would allow an authenticated malicious user to execute commands remotely through the repository download feature. The issue is now mitigated in the latest release and is assigned [CVE-2019-12430](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12430).

Thanks to @nyangawa of Chaitin Tech for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.11.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Confidential Issue Titles Revealed to Restricted Users on Unsubscribe

Non-member users who subscribed to issue notifications could access the title of confidential issues through the unsubscription page. The issue is now mitigated in the latest release and is assigned [CVE-2019-12432](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12432).

Thanks to [@skavans](https://hackerone.com/skavans) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.13 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of Milestone Metadata through the Search API

Restricted users could access the metadata of private milestones through the Search API. The issue is now mitigated in the latest release and is assigned [CVE-2019-12431](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12431).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.13 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Private Project Discovery via Comment Links

Users could guess the URL slug of private projects through the contrast of the destination URLs of issues linked in comments. The issue is now mitigated in the latest release and is assigned [CVE-2019-12434](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12434).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Metadata of Confidential Issues Disclosed to Restricted Users 

Unprivileged users were able to access labels, status and merge request counts of confidential issues via the milestone details page. The issue is now mitigated in the latest release and is assigned [CVE-2019-12429](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12429).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Mandatory External Authentication Provider Sign-In Restrictions Bypass 

Users could bypass the mandatory external authentication provider sign-in restrictions by sending a specially crafted request. The issue is now mitigated in the latest release and is assigned [CVE-2019-12428](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12428).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 6.8 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Internal Projects Allowed to Be Created on in Private Groups

Restricted visibility settings allow creating internal projects in private groups, leading to multiple permission issues. The issue is now mitigated in the latest release and is assigned [CVE-2019-12433](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12433).

Thanks to [Peter Marko](https://gitlab.com/petermarko) for contributing with a fix for this issue.

### Versions Affected

Affects GitLab CE/EE 11.7 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Server-Side Request Forgery Through DNS Rebinding

Multiple features contained Server-Side Request Forgery (SSRF) vulnerabilities caused by an insufficient validation to prevent DNS rebinding attacks. The issue is now mitigated in the latest release and is assigned [CVE-2019-12443](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12443).

Thanks to @nyangawa of Chaitin Tech for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

**Note:** The protection against DNS rebinding attacks can be disabled by unmarking the "Enforce DNS rebinding attack protection" checkbox under *Admin Area > Settings > Network > Outbound requests*

## Stored Cross-Site Scripting on Wiki Pages 

Wiki Pages contained a lack of input validation which resulted in a persistent XSS vulnerability. The issue is now mitigated in the latest release and is assigned [CVE-2019-12444](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12444).

Thanks to [@ryhmnlfj](https://hackerone.com/ryhmnlfj) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Stored Cross-Site Scripting on Notes

A malicious user could execute JavaScript code on notes by importing a specially crafted project file. The issue is now mitigated in the latest release and is assigned [CVE-2019-12445](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12445).

Thanks to @nyangawa of Chaitin Tech for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Repository Password Disclosed on Import Error Page

A failure while importing a repository by URL would render an error page containing the plaintext password of the repository to import. The issue is now mitigated in the latest release and is assigned [CVE-2019-12446](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12446).

Thanks to [@vandebrj](https://gitlab.com/vandebrj) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Protected Branches Restriction Rules Bypass

The protected branches feature contained a access control issue which resulted in a bypass of the protected branches restriction rules. The issue is now mitigated in the latest release and is assigned [CVE-2019-12441](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12441).

Thanks to @nyangawa of Chaitin Tech for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Stored Cross-Site Scripting Vulnerability on Child Epics

The epic details page contained a lack of input validation and output encoding issue which resulted in a persistent XSS vulnerability on child epics. The issue is now mitigated in the latest release and is assigned [CVE-2019-12442](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12442).

Thanks to @near_ for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.7 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Upgrade to Knative 0.5

Knative was upgraded to version 0.5 for the GitLab 11.11, 11.10 and 11.9 packages. This Knative release contains several security fixes.

## Updating

To update GitLab, see the [update page](/update/).
