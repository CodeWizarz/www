---
title: "GitLab Security Release: 12.3.2, 12.2.6, and 12.1.12"
description: "Learn more about GitLab Security Release: 12.3.2, 12.2.6, and 12.1.12 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/09/30/security-release-gitlab-12-dot-3-dot-2-released/"
categories: releases
author: Jeremy Matos
author_gitlab: jeremymatos
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.3.2, 12.2.6, and 12.1.12 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) in approximately 30 days.

Please read on for more information regarding this release.

## XSS in Markdown Preview Using Mermaid

The Mermaid plugin was updated in GitLab 12.1 to address an XSS issue in markdown preview. The Mermaid plugin was previously updated in 12.2 and 12.3. The issue is now mitigated in the latest release and is assigned [CVE-2019-15586](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15586).

Thanks to [@brainpanic](https://hackerone.com/brainpanic) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 12.1.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Bypass Email Verification using Salesforce Authentication

The Salesforce login integration could be used by an attacker to create an account that bypassed domain restrictions and email verification requirements. The issue is now mitigated in the latest release and is assigned [CVE-2019-5486](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5486).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.11 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Account Takeover using SAML

The GitLab SAML integration had a validation issue that permitted an attacker to takeover another user's account. The issue is now mitigated in the latest release and is assigned [CVE-2019-15585](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15585).

Thanks to @mishre for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 7.12 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Uncontrolled Resource Consumption in Markdown using Mermaid

Markdown fields contained an input validation issue that resulted in a denial of service of the affected page. The issue is now mitigated in the latest release and is assigned [CVE-2019-15584](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15584).

Thanks to [@ryhmnlfj](https://hackerone.com/ryhmnlfj) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of Private Project Path and Labels

When an issue was moved to a public project from a private one, the associated private labels and the private project namespace would be disclosed through the GitLab API. The issue is now mitigated in the latest release and is assigned [CVE-2019-15583](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15583).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of Assignees via Milestones

The assignee(s) of a confidential issue in a private project would be disclosed to a guest via milestones. The issue is now mitigated in the latest release and is assigned [CVE-2019-15579](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15579).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.2.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of Project Path via Unsubscribe Link

The path of a private project, that used to be public, would be disclosed in the unsubscribe email link of issues and merge requests. The issue is now mitigated in the latest release and is assigned [CVE-2019-15578](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15578)

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.4.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of Project Milestones via Groups

Project milestones would be disclosed via groups browsing. The issue is now mitigated in the latest release and is assigned [CVE-2019-15577](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15577)

Thanks to @uzsunny](https://hackerone.com/uzsunnyz?type=user) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.0.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of Private System Notes via GraphQL

Private system notes would be disclosed via GraphQL endpoint. The issue is now mitigated in the latest release and is assigned [CVE-2019-15576](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15576).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 12.0.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## GIT Command Injection via API

GIT command injection was possible via the API through the `blobs` scope. The issue is now mitigated in the latest release and is assigned [CVE-2019-15575](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15575).

Thanks to [@vakzz](https://hackerone.com/vakzz) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

**Note:** We recommend to [rotate the Gitaly authentication token](https://docs.gitlab.com/ee//administration/gitaly/#rotating-a-gitaly-authentication-token) as an extra security measure.

## Bypass User Blocking via CI/CD token

A blocked user would be able to use GIT clone and pull if he had obtained a CI/CD token before. The issue is now mitigated in the latest release and is assigned [CVE-2019-15589](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15589).

Thanks to [@logan5](https://hackerone.com/logan5) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all versions of GitLab CE/EE.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## IDOR Adding Groups to Protected Environments

An IDOR was discovered that allowed a maintainer to add any private group to a protected environment. The issue is now mitigated in the latest release and is assigned [CVE-2019-15582](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15582).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of Group Membership via Merge Request Approval Rules

An IDOR was discovered that allowed a project owner or maintainer to see the members of any private group via merge request approval rules. The issue is now mitigated in the latest release and is assigned [CVE-2019-15581](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15581).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.13 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of Head Pipeline via Blocking Merge Request Feature

When using the blocking merge request feature, it was possible for an unauthenticated user to see the head pipeline data of a public project even though pipeline visibility was restricted. The issue is now mitigated in the latest release and is assigned [CVE-2019-15580](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15580).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 12.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Grafana update

We have patched Grafana, which is included in the GitLab Omnibus package for CVE-2018-19039.

## Updating

To update GitLab, see the [update page](/update/).
