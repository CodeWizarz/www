---
title: "GitLab Security Release: 12.4.1, 12.3.6, and 12.2.9"
description: "Learn more about GitLab Security Release: 12.4.1, 12.3.6, and 12.2.9 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/10/30/security-release-gitlab-12-dot-4-dot-1-released/"
categories: releases
author: Costel Maxim
author_gitlab: cmaxim
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.4.1, 12.3.6, and 12.2.9 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) in approximately 30 days.

Please read on for more information regarding this release.

## Source branch of a MR could be removed by an unauthorised user

An unauthorised member of the target project could delete the source branch of MR. The issue is now mitigated in the latest release and is assigned [CVE-2019-18446](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18446).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.15 and up.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Private group members could be listed

An unauthorised user could view the members of a private group. The issue is now mitigated in the latest release and is assigned [CVE-2019-18447](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18447).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all previous GitLab CE/EE versions.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of System Notes via Elasticsearch integration

System Notes would be disclosed with the Comments Search feature provided by Elasticsearch integration. The issue is now mitigated in the latest release and is assigned [CVE-2019-18460](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18460).

Thanks to [@rpadovani](https://hackerone.com/rpadovani) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab 8.8.3 and later

### Remediation

We **strongly recommend** that all installations running an affected version above **with enabled** Elasticsearch integration are upgraded to the latest version as soon as possible.

## Disclosure of Private Comments via Elasticsearch integration

Private comments in restricted groups would be disclosed with the Search feature provided by Elasticsearch integration. The issue is now mitigated in the latest release and is assigned [CVE-2019-18456](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18456).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.17 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above **with enabled** Elasticsearch integration are upgraded to the latest version as soon as possible.

## Confirm existence of private repositories

By using brute-force an unauthorised user could check if a private repository exists. The issue is now mitigated in the latest release and is assigned [CVE-2019-18448](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18448).

Thanks to [@brxxn](https://hackerone.com/brxxn) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all previous GitLab CE/EE versions.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Private group membership could be disclosed

Unauthorised users were able to read private groups membership using the autocomplete endpoint. The issue is now mitigated in the latest release and is assigned [CVE-2019-18449](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18449).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all previous GitLab CE/EE versions.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of Project Labels

Project labels could be disclosed through the GitLab API to unauthorised users. The issue is now mitigated in the latest release and is assigned [CVE-2019-18450](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18450).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all previous GitLab CE/EE versions.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of Private Project Path and Labels

When an issue was moved to a public project from a private one, the associated private labels and the private project namespace would be disclosed through the GitLab API. The issue is now mitigated in the latest release and is assigned [CVE-2019-18452](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18452).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Uncontrolled Resource Consumption due to Nested GraphQL Queries

Nested GraphQL queries could be built so that it resulted a denial of service of the affected page. The issue is now mitigated in the latest release and is assigned [CVE-2019-18455](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18455).

Thanks to [@freddd](https://hackerone.com/freddd) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Improper access control on comments

An authorization issue discovered allowed a demoted user to add comments via email. The issue is now mitigated in the latest release and is assigned [CVE-2019-18453](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18453).

Thanks to [@hx01](https://hackerone.com/hx01) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Sentry Token Access Control

An authorization issue discovered in the Sentry tokens handling that allowed access to a demoted user . The issue is now mitigated in the latest release and is assigned [CVE-2019-18457](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18457).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.8 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Authorisation check for Project Transfer option

An authorization check needed for transfer projects to another group feature allowed users with developer rights to move projects. The issue is now mitigated in the latest release and is assigned [CVE-2019-18458](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18458).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.5 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## XSS in Wiki Pages Using RDoc

The link validation for RDoc wiki pages contained an issue that could get exploited to a persistent XSS vulnerability. The issue is now mitigated in the latest release and is assigned [CVE-2019-18454](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18454).

Thanks to [@vakzz](https://hackerone.com/vakzz) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.5 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Untrusted Input could be used for Internal Redirect

An internal review determined an issue in the InternalRedirect filtering allowing for open redirect attacks. The issue is now mitigated in the latest release and is assigned [CVE-2019-18451](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18451).

### Versions Affected

Affects GitLab CE/EE 10.7.4 and later

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Access control for protected environments

An internal review determined that groups could maintain access to protected environments even after removal. The issue is now mitigated in the latest release and is assigned [CVE-2019-18459](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18459).

### Versions Affected

Affects GitLab CE/EE 11.3 to 12.3.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Private Sub Group path Disclosure

The private sub group path was disclosed when a sub group epic was added to a public group. The issue is now mitigated in the latest release and is assigned [CVE-2019-18461](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18461).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 12.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of Group Packages List

An issue was found that allowed an unauthorised user to list the packages of a group. The issue is now mitigated in the latest release and is assigned [CVE-2019-18463](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18463).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 12.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Private Repository Name Disclosure

An issue was found that allowed an unauthorised user to confirm the name of a private repository. The issue is now mitigated in the latest release and is assigned [CVE-2019-18462](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18462).

Thanks to [@mclaren650sspider](https://hackerone.com/mclaren650sspider) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 12.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating

To update GitLab, see the [update page](/update/).
