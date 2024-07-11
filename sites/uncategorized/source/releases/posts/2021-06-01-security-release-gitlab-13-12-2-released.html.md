---
title: "GitLab Security Release: 13.12.2, 13.11.5, and 13.10.5"
description: "Learn more about GitLab Security Release: 13.12.2, 13.11.5, and 13.10.5 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2021/06/01/security-release-gitlab-13-12-2-released/"
categories: releases
author: Michael Henriksen
author_gitlab: mhenriksen
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 13.12.2, 13.11.5, and 13.10.5 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

## Additional notes

In GitLab 13.10 the CI Lint API started requiring [authentication](https://docs.gitlab.com/ee/api/#authentication) for GitLab instances where registration is disabled. Starting with this release, the CI Lint API endpoint will also require authentication when registration is limited (for example where an email domain allowlist is configured).

This version also includes a data migration to fix some records with incorrect data that causes 2FA to not be enforced for some users even if they are members of groups that require it. The root cause for the issue was already fixed but some records created before the fix need to be corrected. The migration is a background migration that will be scheduled in batches of 10,000 users at two minute intervals.

## Table of Fixes

|Title|Severity|
|---|---|
|[Stealing GitLab OAuth access tokens using XSLeaks in Safari](#stealing-gitlab-oauth-access-tokens-using-xsleaks-in-safari)|high|
|[Denial of service through recursive triggered pipelines](#denial-of-service-through-recursive-triggered-pipelines)|high|
|[Unauthenticated CI lint API may lead to information disclosure and SSRF](#unauthenticated-ci-lint-api-may-lead-to-information-disclosure-and-ssrf)|medium|
|[Server-side DoS through rendering crafted Markdown documents](#server-side-dos-through-rendering-crafted-markdown-documents)|medium|
|[Issue and merge request length limit is not being enforced](#issue-and-merge-request-length-limit-is-not-being-enforced)|medium|
|[Insufficient Expired Password Validation](#insufficient-expired-password-validation)|medium|
|[XSS in blob viewer of notebooks](#xss-in-blob-viewer-of-notebooks)|medium|
|[Logging of Sensitive Information](#logging-of-sensitive-information)|medium|
|[On-call rotation information exposed when removing a member](#on-call-rotation-information-exposed-when-removing-a-member)|low|
|[Spoofing commit author for signed commits](#spoofing-commit-author-for-signed-commits)|low|

## Stealing GitLab OAuth access tokens using XSLeaks in Safari

A cross-site leak vulnerability in the OAuth flow of all versions of GitLab CE/EE since 7.10 allowed an attacker to leak an OAuth access token by getting the victim to visit a malicious page with Safari. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H`, 8.8). It is now mitigated in the latest release and is assigned [CVE-2021-22213](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22213).

Thanks hubblebubble for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Denial of service through recursive triggered pipelines

A denial of service vulnerability in GitLab CE/EE affecting all versions since 11.8 allows an attacker to create a recursive pipeline relationship and exhaust resources. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:C/C:N/I:N/A:H`, 7.7). It is now mitigated in the latest release and is assigned [CVE-2021-22181](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22181).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Unauthenticated CI lint API may lead to information disclosure and SSRF

When requests to the internal network for webhooks are enabled, a server-side request forgery vulnerability in GitLab CE/EE affecting all versions starting from 10.5 was possible to exploit for an unauthenticated attacker even on a GitLab instance where registration is limited. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:N/UI:N/S:C/C:H/I:N/A:N`, 6.8). It is now mitigated in the latest release and is assigned [CVE-2021-22214](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22214).

Thanks [@myster](https://hackerone.com/myster?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Server-side DoS through rendering crafted Markdown documents

A denial of service vulnerability in all versions of GitLab CE/EE before 13.12.2, 13.11.5 or 13.10.5 allows an attacker to cause uncontrolled resource consumption with a specially crafted issue or merge request. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2021-22217](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22217).

Thanks phli for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Issue and merge request length limit is not being enforced

A denial of service vulnerability in all versions of GitLab CE/EE before 13.12.2, 13.11.5 or 13.10.5 allows an attacker to cause uncontrolled resource consumption with a very long issue or merge request description. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2021-22216](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22216).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Insufficient Expired Password Validation

An issue has been discovered in GitLab affecting all versions starting from 12.9.0 before 13.10.5, all versions starting from 13.11.0 before 13.11.5, all versions starting from 13.12.0 before 13.12.2. Insufficient expired password validation in various operations allow user to maintain limited access after their password expired. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:L/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2021-22221](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22221).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## XSS in blob viewer of notebooks

An issue has been discovered in GitLab affecting all versions starting with 13.10. GitLab was vulnerable to a stored XSS in blob viewer of notebooks. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:R/S:C/C:L/I:L/A:N`, 6.1). It is now mitigated in the latest release and is assigned [CVE-2021-22220](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22220).

Thanks (@yvvdwf)[https://hackerone.com/yvvdwf] for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Logging of Sensitive Information

GitLab CE/EE since version 9.5 allows a high privilege user to obtain sensitive information from log files because the sensitive information was not correctly registered for log masking. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:H/UI:N/S:U/C:H/I:N/A:N`, 4.4). It is now mitigated in the latest release and is assigned [CVE-2021-22219](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22219).

This vulnerability has been discovered internally by the GitLab team https://gitlab.com/dcouture.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## On-call rotation information exposed when removing a member

An information disclosure vulnerability in GitLab EE versions 13.11 and later allowed a project owner to leak information about the members' on-call rotations in other projects. This is a low severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:N/S:U/C:L/I:N/A:N`, 2.7). It is now mitigated in the latest release and is assigned [CVE-2021-22215](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22215).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Spoofing commit author for signed commits

All versions of GitLab CE/EE starting with 12.8 were affected by an issue in the handling of x509 certificates that could be used to spoof author of signed commits. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:R/S:U/C:N/I:L/A:N`, 2.6). It is now mitigated in the latest release and is assigned [CVE-2021-22218](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22218).

Thanks subbotin for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Enable qsh verification for Atlassian Connect

qsh verification has been enabled for Atlassian Connect to address a breaking change in the Atlassian Connect API.

If you are using Jira Connect with a self-managed instance you need to update to these latest security releases before June 7th. If you are on GitLab.com, you do not need to do anything. For more details see [this GitLab issue](https://gitlab.com/gitlab-org/gitlab/-/issues/328267).

### Versions affected

Affects all versions of GitLab.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Update bindata dependency

The dependency on bindata has been upgraded to 2.4.10 in order to mitigate security concerns.

### Versions affected

Affects versions 12.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Update grafana dependency

The dependency on Grafana has been upgraded to 7.5.4 in order to mitigate security concerns.

### Versions affected

Affects versions 13.11, 13.10 and 13.9.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Updating

To update GitLab, see the [Update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
