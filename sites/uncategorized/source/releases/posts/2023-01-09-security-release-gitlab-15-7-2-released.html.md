---
title: "GitLab Security Release: 15.7.2, 15.6.4, and 15.5.7"
description: "Learn more about GitLab Security Release: 15.7.2, 15.6.4, and 15.5.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2023/01/09/security-release-gitlab-15-7-2-released/"
categories: releases
author: Kevin Morrison
author_gitlab: kmorrison1
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.7.2, 15.6.4, and 15.5.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Race condition on gitlab.com enables verified email forgery & third-party account hijacking](#race-condition-on-gitlabcom-enables-verified-email-forgery--third-party-account-hijacking)|medium|
|[DOS and high resource consumption of Prometheus server through abuse of Grafana integration proxy endpoint](#dos-and-high-resource-consumption-of-prometheus-server-through-abuse-of-grafana-integration-proxy-endpoint)|medium|
|[Maintainer can leak sentry token by changing the configured URL](#maintainer-can-leak-sentry-token-by-changing-the-configured-url)|medium|
|[Maintainer can leak masked webhook secrets by changing target URL of the webhook](#maintainer-can-leak-masked-webhook-secrets-by-changing-target-url-of-the-webhook)|medium|
|[Cross-site scripting in wiki changes page affecting self-hosted instances running without strict CSP](#cross-site-scripting-in-wiki-changes-page-affecting-self-hosted-instances-running-without-strict-csp)|medium|
|[Group access tokens continue to work after owner loses ability to revoke them](#group-access-tokens-continue-to-work-after-owner-loses-ability-to-revoke-them)|medium|
|[Users' avatar disclosure by user ID in private GitLab instances](#users-avatar-disclosure-by-user-id-in-private-gitlab-instances)|medium|
|[Arbitrary Protocol Redirection in GitLab Pages](#arbitrary-protocol-redirection-in-gitlab-pages)|medium|
|[ReDoS due to device-detector parsing user agents](#redos-due-to-device-detector-parsing-user-agents)|medium|
|[Regex DOS in the Submodule Url Parser](#regex-dos-in-the-submodule-url-parser)|medium|

## Race condition on gitlab.com enables verified email forgery & third-party account hijacking

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/804 -->

An issue has been discovered in GitLab CE/EE affecting all versions before 15.5.7, all versions starting from 15.6 before 15.6.4, all versions starting from 15.7 before 15.7.2. A race condition can lead to verified email forgery and takeover of third-party accounts when using GitLab as an OAuth provider. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:L/I:L/A:N`, 6.4). It is now mitigated in the latest release and is assigned [CVE-2022-4037](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4037).

Thanks to an anonymous researcher for reporting this vulnerability through our HackerOne bug bounty program.

## DOS and high resource consumption of Prometheus server through abuse of Grafana integration proxy endpoint

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/805 -->

An issue has been discovered in GitLab CE/EE affecting all versions before 15.5.7, all versions starting from 15.6 before 15.6.4, all versions starting from 15.7 before 15.7.2. A crafted Prometheus Server query can cause high resource consumption and may lead to Denial of Service. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:N/I:N/A:L`, 5.8). It is now mitigated in the latest release and is assigned [CVE-2022-3613](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3613).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Maintainer can leak sentry token by changing the configured URL

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/813 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 11.8 before 15.5.7, all versions starting from 15.6 before 15.6.4, all versions starting from 15.7 before 15.7.2. A malicious Maintainer can leak the sentry token by changing the configured URL in the Sentry error tracking settings page. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:C/C:L/I:L/A:N`, 5.5). It is now mitigated in the latest release and is assigned [CVE-2022-4365](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4365).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Maintainer can leak masked webhook secrets by changing target URL of the webhook

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/814 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 15.1 before 15.5.7, all versions starting from 15.6 before 15.6.4, all versions starting from 15.7 before 15.7.2. A malicious Maintainer can leak masked webhook secrets by changing target URL of the webhook. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:C/C:L/I:L/A:N`, 5.5). It is now mitigated in the latest release and is assigned [CVE-2022-4342](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4342).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Cross-site scripting in wiki changes page affecting self-hosted instances running without strict CSP

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/803 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 15.4 before 15.5.7, all versions starting from 15.6 before 15.6.4, all versions starting from 15.7 before 15.7.2. Due to the improper filtering of query parameters in the wiki changes page, an attacker can execute arbitrary JavaScript on the self-hosted instances running without strict CSP. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:C/C:L/I:L/A:N`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2022-3573](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3573).

Thanks [ryotak](https://hackerone.com/ryotak) for reporting this vulnerability through our HackerOne bug bounty program.

## Group access tokens continue to work after owner loses ability to revoke them

Incorrect Authorization check affecting all versions of GitLab EE from 13.11 prior to 15.5.7, 15.6 prior to 15.6.4, and 15.7 prior to 15.7.2 allows group access tokens to continue working even after the group owner loses the ability to revoke them. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:N/UI:R/S:U/C:H/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2022-4167](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4167).

This vulnerability was reported to us by a customer.

## Users' avatar disclosure by user ID in private GitLab instances

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/801 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 10.0 before 15.5.7, all versions starting from 15.6 before 15.6.4, all versions starting from 15.7 before 15.7.2. GitLab allows unauthenticated users to download user avatars using the victim's user ID, on private instances that restrict public level visibility. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2022-3870](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3870).

Thanks [nocasis](https://hackerone.com/nocasis) for reporting this vulnerability through our HackerOne bug bounty program.

## Arbitrary Protocol Redirection in GitLab Pages

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/811 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 11.4 prior to 15.5.7, 15.6 prior to 15.6.4, and 15.7 prior to 15.7.2. GitLab Pages allows redirection to arbitrary protocols. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-0042](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0042).

This vulnerability has been discovered internally by a GitLab team member, Joern Schneeweisz.

## Regex DoS due to device-detector parsing user agents

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/815 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 10.8 before 15.5.7, all versions starting from 15.6 before 15.6.4, all versions starting from 15.7 before 15.7.2. An attacker may cause Denial of Service on a GitLab instance by exploiting a regex issue in how the application parses user agents. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-4131](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4131).

Thanks [afewgoats](https://hackerone.com/afewgoats) for reporting this vulnerability through our HackerOne bug bounty program.

## Regex DoS in the Submodule Url Parser

An issue has been discovered in GitLab CE/EE affecting all versions starting from 6.6 before 15.5.7, all versions starting from 15.6 before 15.6.4, all versions starting from 15.7 before 15.7.2. An attacker may cause Denial of Service on a GitLab instance by exploiting a regex issue in the submodule URL parser. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-3514](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3514).

Thanks [mokusou](https://hackerone.com/mokusou) for reporting this vulnerability through our HackerOne bug bounty program.

## Update Mattermost

Mattermost has been updated to version 7.3.1 in order to mitigate security issues.

### Versions affected

Affects all versions of GitLab Omnibus 15.4 and 15.5.

## Update Python

Python has been updated to version 3.8.16 in order to mitigate security issues.

### Versions affected

Affects all versions of GitLab Omnibus 15.5, 15.6 and 15.7.

## Update Logrotate

Logrotate has been updated to version 3.20.1 in order to mitigate security issues.

### Versions affected

Affects all versions of GitLab Omnibus 15.5, 15.6 and 15.7.

## Update Redis

Redis has been updated to version 6.2.8 in order to mitigate security issues.

### Versions affected

Affects all versions of GitLab Omnibus.

## Updating

To update GitLab, see the [Update page](/update).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).

