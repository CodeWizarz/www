---
title: "GitLab Security Release: 13.6.2, 13.5.5, and 13.4.7"
description: "Learn more about GitLab Security Release: 13.6.2, 13.5.5, and 13.4.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2020/12/07/security-release-gitlab-13-6-2-released/"
categories: releases
author: Andrew Kelly
author_gitlab: ankelly
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 13.6.2, 13.5.5, and 13.4.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are [two types of security releases](/security/#gitlab-security-releases): a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

## XSS in Zoom Meeting URL

A XSS vulnerability exists in Gitlab CE/EE starting with 12.4 that allows an attacker to perform cross-site scripting to other users via importing a malicious project. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:C/C:L/I:L/A:L`, 5.5). It is now mitigated in the latest release and is assigned [CVE-2020-26407](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-26407).

Thanks [@vakzz](https://hackerone.com/vakzz) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Limited Information Disclosure in Private Profile

A limited information disclosure vulnerability exists in Gitlab CE/EE  starting with 12.2 that allows an attacker to view limited information in user's private profile. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2020-26408](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-26408).

Thanks [@maruthi12](https://hackerone.com/maruthi12) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## User email exposed via GraphQL endpoint

An issue has been discovered in GitLab CE/EE affecting all versions starting from 13.4 before 13.6.2. Information disclosure via GraphQL starting in GitLab 13.4 results in user email being unexpectedly visible. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). This issue is now mitigated in the latest release and is assigned [CVE-2021-22413](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22413).

Thanks [vaib25vicky](https://hackerone.com/vaib25vicky) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Group and project membership potentially exposed via GraphQL

Information disclosure via GraphQL in GitLab CE/EE 13.1 and later exposes private group and project membership. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). This issue is now mitigated in the latest release and is assigned [CVE-2021-22417](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22417).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Search terms logged in `search` parameter in rails logs

Information disclosure in Advanced Search component of GitLab EE starting in 8.4 results in exposure of search terms via Rails logs. This is a medium severity issue (`CVSS:3.1/AV:L/AC:H/PR:H/UI:R/S:C/C:H/I:N/A:N`, 5.0). This issue is now mitigated in the latest release and is assigned [CVE-2021-22416](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22416).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Un-authorised access to feature flag user list

An issue was discovered in Gitlab CE/EE versions starting from 13.1 to 13.5 which allowed an un-authorised user to access the user list corresponding to a feature flag in a project. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2020-13357](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13357).

Thanks [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## A specific query on the explore page causes statement timeouts

A potential DOS vulnerability was discovered in all versions of GitLab. Using a specific query name for a project search can cause statement timeouts that can lead to a potential DOS if abused. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2020-26411](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-26411).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Exposure of starred projects on private user profiles

An issue has been discovered in GitLab affecting all versions starting from 12.2 before 13.6.2, all versions starting from 12.2 before 13.5.5, all versions starting from 12.2 before 13.4.7. Information about the starred projects for private user profiles was exposed via the GraphQL API starting in 13.4 and via the REST API starting in 12.2. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). This issue is now mitigated in the latest release and is assigned [CVE-2021-22415](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22415).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Uncontrolled Resource Consumption in any Markdown field using Mermaid

A DOS vulnerability exists in Gitlab CE/EE starting with 10.3 that allows an attacker to trigger uncontrolled resource by bypassing input validation in markdown fields. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2020-26409](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-26409).

Thanks [misha98857](https://hackerone.com/misha98857) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Former group members able to view updates to confidential epics

Removed group members were able to use the To-Do functionality to retrieve updated information on confidential epics starting in GitLab EE 13.2. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:L/I:N/A:N`, 3.1). This issue is now mitigated in the latest release and is assigned [CVE-2021-22412](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22412).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update GraphicsMagick dependency

The GraphicsMagick dependency has been upgraded to 1.3.35 in order to mitigate security concerns.

### Versions Affected

Affects GitLab Omnibus 11.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update GnuPG dependency

The GnuPG dependency has been upgraded to 2.2.23 in order to mitigate security concerns.

### Versions Affected

Affects GitLab Omnibus 13.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update libxml dependency

The libxml dependency has been upgraded to 2.9.10 in order to mitigate security concerns.

### Versions Affected

Affects GitLab Omnibus 10.8 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
