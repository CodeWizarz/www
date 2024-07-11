---
title: "GitLab Security Release: 13.8.2, 13.7.6 and 13.6.6"
description: "Learn more about GitLab Security Release: 13.8.2, 13.7.6 and 13.6.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2021/02/01/security-release-gitlab-13-8-2-released/"
categories: releases
author: Costel Maxim
author_gitlab: cmaxim
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 13.8.2, 13.7.6 and 13.6.6 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.


## Stored XSS in merge request

An issue has been discovered in GitLab affecting all versions starting with 13.7. GitLab was vulnerable to a stored XSS in merge requests. This issue is now mitigated in the latest release and is assigned [CVE-2021-22182](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22182).

Thanks [ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Stored XSS in epic's pages

An issue has been discovered in GitLab affecting all versions starting with 11.8. GitLab was vulnerable to a stored XSS in the epics page, which could be exploited with user interactions. This issue is now mitigated in the latest release and is assigned [CVE-2021-22183](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22183).

Thanks [mike12](https://hackerone.com/mike12) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Sensitive GraphQL variables exposed in structured log

An information disclosure issue in GitLab 12.0+ allowed a user with access to the server logs to see sensitive information that wasn't properly redacted. This is a medium severity issue (`CVSS:3.1/AV:L/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:N`, 6.2). This issue is now mitigated in the latest release and is assigned [CVE-2021-22184](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22184).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Guest user can see tag names in private projects

Improper authorization in GitLab 12.8+ allows a guest user in a private project to view tag data that should be inaccessible on the releases page. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-22172](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22172).

Thanks [@izzsec](https://hackerone.com/izzsec?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Information disclosure via error message

An issue was identified in GitLab EE 13.4 or later which could disclose internal IP address via error messages. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-22169](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22169).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## DNS rebinding protection bypass

An issue has been discovered in GitLab affecting all versions starting with 12.2. GitLab was vulnerable to a DNS rebinding protection bypass. This issue is now mitigated in the latest release and is assigned [CVE-2021-22179](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22179).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Validate existence of private project

An issue has been discovered in GitLab affecting all versions. Validate the use of a specific name for private project in a group was posible. This issue is now mitigated in the latest release and is assigned [CVE-2021-22193](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22193).

Thanks [milindpurswani](https://hackerone.com/milindpurswani) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).

