---
title: "GitLab Security Release: 12.1.2, 12.0.4, and 11.11.7"
description: "Learn more about GitLab Security Release: 12.1.2, 12.0.4, and 11.11.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/07/29/security-release-gitlab-12-dot-1-dot-2-released/"
categories: releases
author: Jeremy Matos
author_gitlab: jeremymatos
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.1.2, 12.0.4, and 11.11.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab-ce/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=security) in approximately 30 days.

Please read on for more information regarding this release.

## GitHub Integration SSRF

An input validation problem was discovered in the GitHub service integration which could result in an attacker being able to make arbitrary POST requests in a GitLab instance's internal network. The issue is now mitigated in the latest release and is assigned [CVE-2019-5461](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5461).

Thanks to [@jobert](https://hackerone.com/jobert) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Trigger Token Impersonation

An authorization issue was discovered when trigger tokens are not rotated once ownership of them has changed. The issue is now mitigated in the latest release and is assigned [CVE-2019-5462](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5462).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Build Status Disclosure

An authorization issue was discovered in the CI badge images endpoint which could result in disclosure of the build status. The issue is now mitigated in the latest release and is assigned [CVE-2019-5463](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5463).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all previous GitLab CE/EE versions.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## SSRF Mitigation Bypass

A flawed DNS rebinding protection issue was discovered in `url_blocker.rb` which could result in SSRF where the library is utilized. The issue is now mitigated in the latest release and is assigned [CVE-2019-5464](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5464).

Thanks to [@mclaren650sspider](https://hackerone.com/mclaren650sspider) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Information Disclosure New Issue ID

An authorization issue was discovered in the move issue feature which could result in disclosure of the newly created issue ID. The issue is now mitigated in the latest release and is assigned [CVE-2019-5465](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5465).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.14 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## IDOR Label Name Enumeration

An IDOR was discovered in the new merge requests endpoint which could result in disclosure of label names. The issue is now mitigated in the latest release and is assigned [CVE-2019-5466](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5466).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.5 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Persistent XSS Wiki Pages

An input validation and output encoding issue was discovered in the wiki pages feature which could result in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2019-5467](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5467).

Thanks to [@ryhmnlfj](https://hackerone.com/ryhmnlfj) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.10 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## User Revokation Bypass with Mattermost Integration

An authorization issue was discovered when Mattermost slash commands are used with a blocked account. The issue is now mitigated in the latest release and is assigned [CVE-2019-5468](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5468).

Thanks to [@logan5](https://hackerone.com/logan5) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.14 command service and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Arbitrary File Upload via Import Project Archive

A file upload issue was discovered when importing a project archive. The issue is now mitigated in the latest release and is assigned [CVE-2019-5469](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5469).

Thanks to [@ajxchapman](https://hackerone.com/ajxchapman) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.5 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Information Disclosure Vulnerability Feedback

An authorization issue was discovered in the security dashboard which could result in disclosure of vulnerability feedback information. The issue is now mitigated in the latest release and is assigned [CVE-2019-5470](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5470).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.8 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Persistent XSS via Email

An input validation and output encoding issue was discovered in the email notification feature which could result in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2019-5471](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5471).

Thanks to [@mario-areias](https://hackerone.com/mario-areias) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Denial Of Service Epic Comments

An authorization issue was discovered that forbid to delete epic comments. The issue is now mitigated in the latest release and is assigned [CVE-2019-5472](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5472).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all previous GitLab EE 10.7 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Email Verification Bypass

An authentication issue was discovered that allowed to bypass email verification. The issue is now mitigated in the latest release and is assigned [CVE-2019-5473](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5473).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 12.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Override Merge Request Approval Rules

An authorization issue was discovered in the merge request approval rules. The issue is now mitigated in the latest release and is assigned [CVE-2019-5474](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5474).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.8 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of Pipeline Details

Details of restricted pipelines were visible via the merge request endpoint. The issue is now mitigated in the latest release and is assigned [CVE-2019-15594](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15594). 

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.8 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating

To update GitLab, see the [update page](/update/).
