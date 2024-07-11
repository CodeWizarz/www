---
title: "GitLab Security Release: 11.4.3, 11.3.8, and 11.2.7"
description: "Learn more about GitLab Security Release: 11.4.3, 11.3.8, and 11.2.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/10/29/security-release-gitlab-11-dot-4-dot-3-released/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
tags: security, security releases
---

Today we are releasing versions 11.4.3, 11.3.8, and 11.2.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

## RCE in Gitlab Wiki API

The wiki API contained an input validation issue which resulted in remote code execution. The issue is now mitigated in the latest release and is assigned [CVE-2018-18649](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18649).

Thanks to @nyangawa of Chaitin Tech for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  SSRF in Hipchat integration

The GitLab Hipchat integration was vulnerable to a SSRF issue which allowed an attacker to make requests to any local network resource accessible from the GitLab server. The issue is now mitigated in the latest release and is assigned [CVE-2018-18646](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18646).

Thanks to [@bull](https://hackerone.com/bull) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 5.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Cleartext storage of personal access tokens

Personal access tokens were being stored unencrypted as plain text in the database which could result in attackers potentially reading them via SQL injection or other database leaks. The issue is now mitigated in the latest release and is assigned [CVE-2018-18641](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18641).

### Versions Affected

Affects GitLab CE/EE 8.10.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Information exposure through stack trace error message

A JSON endpoint was disclosing Gem version information which could result in an attacker discovering vulnerable Gems available on a specific GitLab instance. The issue is now mitigated in the latest release and is assigned [CVE-2018-18648](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18648).

### Versions Affected

Affects GitLab CE/EE 11.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Persistent XSS autocomplete

The fragment identifier (hash) of several pages in GitLab contained a lack of input validation and output encoding issue which resulted in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2018-18643](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18643).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Information exposure in stored browser history

Private project pages had inadequate cache control, which resulted in unauthorized users being able to view them in the browser. The issue is now mitigated in the latest release and is assigned [CVE-2018-18640](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18640).

Thanks to [@8ayac](https://hackerone.com/8ayac) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all versions of GitLab CE/EE

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Information exposure when replying to issues through email

It was found that when replying to an issue through email, with the GitLab email footer included, a user's unsubscribe link would be included in the issue. This information is considered sensitive. The issue is now mitigated in the latest release and is assigned [CVE-2018-18645](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18645).

Thanks to [Bence Nagy](https://gitlab.com/underyx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all versions of GitLab CE/EE

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Persistent XSS in License Management and Security Reports

The license management and security reports pages contained a lack of input validation and output encoding which resulted in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2018-18642](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18642).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Security Reports - Affects GitLab EE 10.4.0 and later
License Management - Affects GitLab EE 11.0.0 and later

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Metrics information disclosure in Prometheus integration

The GitLab Prometheus integration was vulnerable to an indirect object reference issue which allowed an unauthorized user to see private information. This information includes the project name, environment name, metric name, and metric query. Additionally, an unauthorized user could create false alarms. The issue is now mitigated in the latest release and is assigned [CVE-2018-18644](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18644).

Thanks to [@jobert](https://hackerone.com/jobert) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Unauthorized changes to a protected branch's access levels

The protected_branches api was vulnerable to an issue which allowed an unauthorized user to remove the `merge_access_levels` and `push_access_levels` objects. This could result in the inability of project participants to push or merge into the branch. The issue is now mitigated in the latest release and is assigned [CVE-2018-18647](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18647).

Thanks to [@jobert](https://hackerone.com/jobert) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.11 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Upgrade Ruby to 2.4.5

The version of Ruby used in the Omnibus package was upgraded to version 2.4.5. Included in this Ruby release are several security fixes.

## Upgrade Redis to 3.2.12

The version of Redis used in the Omnibus package was upgraded in the GitLab 11.2 and 11.3 releases. This upgrade was previously included in GitLab 11.4 Omnibus package. Included in this Redis release are several security fixes.

## Updating

To update, check out our [update page](/update/).
