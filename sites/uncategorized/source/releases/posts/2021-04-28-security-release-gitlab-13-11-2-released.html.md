---
title: "GitLab Security Release: 13.11.2, 13.10.4, and 13.9.7"
description: "Learn more about GitLab Security Release: 13.11.2, 13.10.4, and 13.9.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2021/04/28/security-release-gitlab-13-11-2-released/"
categories: releases
author: Vitor Meireles De Sousa
author_gitlab: vdesousa@gitlab.com
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 13.11.2, 13.10.4, and 13.9.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

## Table of Fixes

|Title|Severity|
|---|---|
|[Read API scoped tokens can execute mutations](#read_api-scoped-tokens-can-execute-mutations)|high|
|[Pull mirror credentials are exposed](#pull-mirror-credentials-are-exposed)|medium|
|[Denial of Service when querying repository branches API](#denial-of-service-when-querying-repository-branches-api)|medium|
|[Non-owners can set system_note_timestamp when creating / updating issues](#non-owners-can-set-system_note_timestamp-when-creating--updating-issues)|medium|
|[DeployToken will impersonate a User with the same ID when using Dependency Proxy](#deploytoken-will-impersonate-a-user-with-the-same-id-when-using-dependency-proxy)|low|
|[Update Python dependency](#update-Python-dependency)|Dependency Update - critical|
|[Update Redis dependency](#update-Redis-dependency)|Dependency Update - high|
|[Update carrierwave gem](#update-carrierwave-gem)|Dependency Update - high|
|[Update Mermaid npm package](#update-Mermaid-npm-package)|Dependency Update - high|

## Read API scoped tokens can execute mutations

An issue has been discovered in GitLab CE/EE affecting all versions starting from 13.8. GitLab was not properly validating authorisation tokens which resulted in GraphQL mutation being executed. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:N`, 7.5). It is now mitigated in the latest release and is assigned [CVE-2021-22209](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22209).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Pull mirror credentials were exposed

An issue has been discovered in GitLab affecting all versions starting from 11.6. Pull mirror credentials were exposed and could allow other maintainers to view the credentials in plain-text. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:C/C:H/I:N/A:N`, 6.8). It is now mitigated in the latest release and is assigned [CVE-2021-22206](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22206).

Thanks [jlneel](https://hackerone.com/jlneel) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Denial of Service when querying repository branches API

An issue has been discovered in GitLab CE/EE affecting all versions starting from 13.2. When querying the repository branches through API, GitLab was ignoring a query parameter and returning a considerable amount of results. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:L`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2021-22210](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22210).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Non-owners can set system_note_timestamp when creating / updating issues

An issue has been discovered in GitLab affecting versions prior to 13.5. Improper permission check could allow the change of timestamp for issue creation or update. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-22208](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22208).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## DeployToken will impersonate a User with the same ID when using Dependency Proxy

An issue has been discovered in GitLab CE/EE affecting all versions starting from 13.7. GitLab Dependency Proxy, under certain circumstances, can impersonate a user resulting in possibly incorrect access handling. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:N/I:N/A:L`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2021-22211](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22211).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Update Python dependency

The dependency on Python has been upgraded to 3.7.10 in order to mitigate security concerns.

### Versions affected

Affects Omnibus versions 12.0 and later.

## Update Redis dependency

The dependency on Redis has been upgraded to 6.0.12 in order to mitigate security concerns.

### Versions affected

Affects versions 12.7 and later.

## Update carrierwave gem

The carrierwave gem has been upgraded to 1.3.2 in order to mitigate security concerns.

### Versions affected

Affects all versions.

## Update Mermaid npm package

The Mermaid npm package has been upgraded to 8.9.2 in order to mitigate security concerns.

### Versions affected

Affects versions 13.9 and later.

## Updating

To update GitLab, see the [Update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
