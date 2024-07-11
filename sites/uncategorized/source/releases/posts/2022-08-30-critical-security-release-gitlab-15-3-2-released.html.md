---
title: "GitLab Critical Security Release: 15.3.2, 15.2.4 and 15.1.6"
description: "Learn more about GitLab Critical Security Release: 15.3.2, 15.2.4 and 15.1.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2022/08/30/critical-security-release-gitlab-15-3-2-released/"
categories: releases
author: Costel Maxim
author_gitlab: cmaxim
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.3.2, 15.2.4 and 15.1.6 for GitLab Community Edition (CE) and Enterprise Edition (EE). Please note, this critical release will also serve as our monthly security release for August.

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Remote Command Execution via GitHub import](#remote-command-execution-via-github-import)|critical|
|[Stored XSS via labels color](#stored-xss-via-labels-color)|high|
|[Content injection via Incidents Timeline description](#content-injection-via-incidents-timeline-description)|high|
|[Denial of Service via Issue preview](#denial-of-service-via-issue-preview)|high|
|[Lack of length validation in Snippets leads to Denial of Service](#lack-of-length-validation-in-snippets-leads-to-denial-of-service)|medium|
|[Group IP allow-list not fully respected by the Package Registry](#group-ip-allow-list-not-fully-respected-by-the-package-registry)|medium|
|[Abusing Gitaly.GetTreeEntries calls leads to denial of service](#abusing-gitalygettreeentries-calls-leads-to-denial-of-service)|medium|
|[Arbitrary HTTP Requests Possible in .ipynb Notebook with Malicious Form Tags](#arbitrary-http-requests-possible-in-ipynb-notebook-with-malicious-form-tags)|medium|
|[Read repository content via LivePreview feature](#read-repository-content-via-livepreview-feature)|medium|
|[Regular Expression Denial of Service via special crafted input](#regular-expression-denial-of-service-via-special-crafted-input)|medium|
|[Information Disclosure via Arbitrary GFM references rendered in Incident Timeline Events](#information-disclosure-via-arbitrary-gfm-references-rendered-in-incident-timeline-events)|medium|
|[Denial of Service via the Create branch API](#denial-of-service-via-the-create-branch-api)|medium|
|[Brute force attack may guess a password even when 2FA is enabled](#brute-force-attack-may-guess-a-password-even-when-2fa-is-enabled)|low|
|[IDOR in Zentao integration leaked issue details](#idor-in-zentao-integration-leaked-issue-details)|low|

## Remote Command Execution via GitHub import

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/755 -->

A vulnerability in GitLab CE/EE affecting all versions from 11.10 before 15.1.6, all versions starting from 15.2 before 15.2.4, all versions starting from 15.3 before 15.3.2. allows an authenticated user to achieve remote code execution via the Import from GitHub API endpoint. This is a critical severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:H/I:H/A:H`, 9.9). It is now mitigated in the latest release and is assigned [CVE-2022-2992](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2992).

Thanks [vakzz](https://hackerone.com/vakzz) for reporting this vulnerability through our HackerOne bug bounty program.

## Stored XSS via labels color

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/749 -->

A cross-site scripting issue has been discovered in GitLab CE/EE affecting all versions before 15.1.6, all versions starting from 15.2 before 15.2.4, all versions starting from 15.3 before 15.3.2. It was possible to exploit a vulnerability in setting the labels color feature which could lead to a stored XSS that allowed attackers to perform arbitrary actions on behalf of victims at client side. This is a high severity issue (`CVSS:3.1/AV:N/AC:H/PR:H/UI:R/S:C/C:H/I:H/A:N`, 7.3). It is now mitigated in the latest release and is assigned [CVE-2022-2865](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2865).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

## Content injection via Incidents Timeline description

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/729 -->

An issue has been discovered in GitLab affecting all versions starting from 10.0 before 15.1.6, all versions starting from 15.2 before 15.2.4, all versions starting from 15.3 before 15.3.2. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:H/I:H/A:N`, 7.3). It is now mitigated in the latest release and is assigned [CVE-2022-2527](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2527).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

## Lack of length validation in Snippets leads to Denial of Service

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/731 -->

A lack of length validation in Snippet descriptions in GitLab CE/EE affecting all versions before 15.1.6, all versions starting from 15.2 before 15.2.4, all versions starting from 15.3 before 15.3.2 allows an authenticated attacker to create a maliciously large Snippet which when requested with or without authentication places excessive load on the server, potentially leading to Denial of Service. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-2592](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2592).

Thanks [cryptopone](https://hackerone.com/cryptopone) for reporting this vulnerability through our HackerOne bug bounty program.

## Group IP allow-list not fully respected by the Package Registry

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/706 -->

An issue has been discovered in GitLab affecting all versions starting from 12.10 before 15.1.6, all versions starting from 15.2 before 15.2.4, all versions starting from 15.3 before 15.3.2. GitLab was not performing correct authentication with some Package Registries when IP address restrictions were configured, allowing an attacker already in possession of a valid Deploy Token to misuse it from any location. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:H/I:H/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-2533](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2533).

This vulnerability has been discovered internally by the GitLab team.

## Abusing Gitaly.GetTreeEntries calls leads to denial of service

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/709 -->

A business logic issue in the handling of large repositories in all versions of GitLab CE/EE from 10.0 before 15.1.6, all versions starting from 15.2 before 15.2.4, all versions starting from 15.3 before 15.3.2 allowed an authenticated and authorized user to exhaust server resources by importing a malicious project. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-2455](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2455).

Thanks [0xn3va](https://hackerone.com/0xn3va) for reporting this vulnerability through our HackerOne bug bounty program.

## Arbitrary HTTP Requests Possible in .ipynb Notebook with Malicious Form Tags

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/748 -->

A crafted tag in the Jupyter Notebook viewer in GitLab EE/CE affecting all versions before 15.1.6, all versions starting from 15.2 before 15.2.4, all versions starting from 15.3 before 15.3.2 allows an attacker to issue arbitrary HTTP requests. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:U/C:H/I:H/A:N`, 6.4). It is now mitigated in the latest release and is assigned [CVE-2022-2428](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2428).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.


## Read repository content via LivePreview feature

<!-- https://gitlab.com/gitlab-org/gitlab/-/issues/349388 -->

An issue has been discovered in GitLab CE/EE affecting all versions from 10.8 before 15.1.6, all versions starting from 15.2 before 15.2.4, all versions starting from 15.3 before 15.3.2. It was possible to read repository content by an unauthorised user if a project member used a crafted link. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:H/I:N/A:N`, 5.7). It is now mitigated in the latest release and is assigned [CVE-2022-2907](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2907).

Thanks [niraeth](https://hackerone.com/niraeth) for reporting this vulnerability through our HackerOne bug bounty program.

## Regular Expression Denial of Service via special crafted input

A potential DoS vulnerability was discovered in Gitlab CE/EE versions starting from 10.7 before 15.1.6, all versions starting from 15.2 before 15.2.4, all versions starting from 15.3 before 15.3.2 allowed an attacker to trigger high CPU usage via a special crafted input added in the Commit message field. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-2908](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2908).

Thanks [ryhmnlfj](https://hackerone.com/ryhmnlfj) for reporting this vulnerability through our HackerOne bug bounty program.

## Information Disclosure via Arbitrary GFM references rendered in Incident Timeline Events

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/745 -->

An improper access control issue in GitLab CE/EE affecting all versions starting from 15.2 before 15.2.4, all versions from 15.3 before 15.3.2 allows disclosure of confidential information via the Incident timeline events. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-2630](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2630).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

## Denial of Service via the Create branch API

<!-- https://gitlab.com/gitlab-org/gitlab/-/issues/366876 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 12.9 before 15.1.6, all versions starting from 15.2 before 15.2.4, all versions starting from 15.3 before 15.3.2. Improper data handling on branch creation could have been used to trigger high CPU usage. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:U/C:H/I:N/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-3639](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3639).

Thanks [elise](https://gitlab.com/elise) for reporting this vulnerability.

## Denial of Service via Issue preview

<!-- https://gitlab.com/gitlab-org/gitlab/-/issues/361982 -->

A potential DOS vulnerability was discovered in GitLab CE/EE affecting all versions before 15.1.6, all versions starting from 15.2 before 15.2.4, all versions starting from 15.3 before 15.3.2. Malformed content added to the issue description could have been used to trigger high CPU usage. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H`, 7.5). It is now mitigated in the latest release and is assigned [CVE-2022-2931](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2931).

Thanks [legit-security](https://hackerone.com/legit-security) for reporting this vulnerability through our HackerOne bug bounty program.

## IDOR in Zentao integration leaked issue details

<!-- https://gitlab.com/gitlab-org/gitlab/-/issues/360372 -->

An issue has been discovered in GitLab EE affecting all versions starting from 14.5 before 15.1.6, all versions starting from 15.2 before 15.2.4, all versions starting from 15.3 before 15.3.2. GitLab's Zentao integration has an insecure direct object reference vulnerability that may be exploited by an attacker to leak project issues. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:C/C:L/I:N/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2022-3331](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3331).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Brute force attack may guess a password even when 2FA is enabled

<!-- https://gitlab.com/gitlab-org/gitlab/-/issues/340395 -->

An issue has been discovered in GitLab CE/EE affecting all versions before 15.1.6, all versions starting from 15.2 before 15.2.4, all versions starting from 15.3 before 15.3.2. It may be possible for an attacker to guess a user's password by brute force by sending crafted requests to a specific endpoint, even if the victim user has 2FA enabled on their account.
 This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:N/A:N`, 3.7). It is now mitigated in the latest release and is assigned [CVE-2022-3031](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3031).

This vulnerability was reported to us by a customer.

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
