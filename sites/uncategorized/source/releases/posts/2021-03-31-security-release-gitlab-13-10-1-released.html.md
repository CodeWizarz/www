---
title: "GitLab Security Release: 13.10.1, 13.9.5, and 13.8.7"
description: "Learn more about GitLab Security Release: 13.10.1, 13.9.5, and 13.8.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2021/03/31/security-release-gitlab-13-10-1-released/"
categories: releases
author: Vitor Meireles De Sousa
author_gitlab: vdesousa@gitlab.com
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 13.10.1, 13.9.5, and 13.8.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

## Table of Fixes

|Title|Severity|
|---|---|
|[Arbitrary File Read During Project Import](#arbitrary-file-read-during-project-import)|critical|
|[Kroki Arbitrary File Read/Write](#kroki-arbitrary-file-readwrite)|high|
|[Stored Cross-Site-Scripting in merge requests](#stored-cross-site-scripting-in-merge-requests)|medium|
|[Access data of an internal project through a public project fork as an anonymous user](#access-data-of-an-internal-project-through-a-public-project-fork-as-an-anonymous-user)|medium|
|[Incident metric images can be deleted by any user](#incident-metric-images-can-be-deleted-by-any-user)|medium|
|[Infinite Loop When a User Access a Merge Request](#infinite-loop-when-a-user-access-a-merge-request)|low|
|[Stored XSS in scoped labels](#stored-xss-in-scoped-labels)|low|
|[Admin CSRF in System Hooks Execution Through API](#admin-csrf-in-system-hooks-execution-through-api)|low|
|[Update OpenSSL dependency](#Update-OpenSSL-dependency)| Dependency update - high|
|[Update PostgreSQL dependency](#Update-PostgreSQL-dependency)| Dependency update - medium|

## Arbitrary File Read During Project Import

An issue has been discovered in GitLab CE/EE affecting all versions starting from 13.9. A specially crafted import file could read files on the server. This is a critical severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:H/I:H/A:N`, 9.6). This issue is now mitigated in the latest release and is assigned [CVE-2021-22201](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22201).

Thanks [saltyyolk](https://hackerone.com/saltyyolk) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Kroki Arbitrary File Read/Write

An issue has been discovered in GitLab CE/EE affecting all versions starting with 13.7.9. A specially crafted Wiki page allowed attackers to read arbitrary files on the server. This is a high severity issue (`CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:C/C:H/I:L/A:N`, 7.5). This issue is now mitigated in the latest release and is assigned [CVE-2021-22203](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22203).

Thanks [@ledz1996](https://hackerone.com/ledz1996) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Stored Cross-Site-Scripting in merge requests

An issue has been discovered in GitLab CE/EE affecting all versions starting from 13.4. It was possible to exploit a stored cross-site-scripting in merge request via a specifically crafted branch name. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:H/I:L/A:N`, 6.3). This issue is now mitigated in the latest release and is assigned [CVE-2021-22196](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22196).

Thanks [@yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Access data of an internal project through a public project fork as an anonymous user

An issue has been discovered in GitLab CE/EE affecting all versions starting with 12.6. Under a special condition it was possible to access data of an internal repository through a public project fork as an anonymous user. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:N/A:N`, 5.9). This issue is now mitigated in the latest release and is assigned [CVE-2021-22200](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22200).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Incident metric images can be deleted by any user

An issue has been discovered in GitLab CE/EE affecting all versions from 13.8 and above allowing an authenticated user to delete incident metric images of public projects. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). This issue is now mitigated in the latest release and is assigned [CVE-2021-22198](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22198).

Thanks [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Infinite Loop When a User Access a Merge Request

An issue has been discovered in GitLab CE/EE affecting all versions starting from 10.6 where an infinite loop exist when an authenticated user with specific rights access a MR having source and target branch pointing to each other. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:N/I:N/A:L`, 3.5). This issue is now mitigated in the latest release and is assigned [CVE-2021-22197](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22197).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Stored XSS in scoped labels

An issue has been discovered in GitLab affecting all versions starting with 12.9. GitLab was vulnerable to a stored XSS if scoped labels were used. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:L/I:N/A:N`, 3.5). This issue is now mitigated in the latest release and is assigned [CVE-2021-22199](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22199).

Thanks [mike12](https://hackerone.com/mike12) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Admin CSRF in System Hooks Execution Through API

An issue has been discovered in GitLab CE/EE affecting all previous versions. If the victim is an admin, it was possible to issue a CSRF in System hooks through the API. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:R/S:U/C:N/I:L/A:N`, 2.4). This issue is now mitigated in the latest release and is assigned [CVE-2021-22202](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22202).

Thanks [@mishre](https://hackerone.com/mishre) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Update OpenSSL dependency

The dependency on OpenSSL has been upgraded to 1.1.1j in order to mitigate security concerns.

### Versions affected

Affects versions 13.8 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Update PostgreSQL dependency

The dependency on PostgreSQL 11 and 12 has been upgraded to 11.11 and 12.6 in order to mitigate security concerns.

### Versions affected

Affects versions 9.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Updating

To update GitLab, see the [Update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
