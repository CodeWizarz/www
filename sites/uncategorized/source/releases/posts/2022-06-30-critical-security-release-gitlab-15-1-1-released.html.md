---
title: "GitLab Critical Security Release: 15.1.1, 15.0.4, and 14.10.5"
description: "Learn more about GitLab Critical Security Release: 15.1.1, 15.0.4, and 14.10.5 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2022/06/30/critical-security-release-gitlab-15-1-1-released/"
categories: releases
author: Nikhil George
author_gitlab: ngeorge1
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.1.1, 15.0.4, and 14.10.5 for GitLab Community Edition (CE) and Enterprise Edition (EE). _Please note, this critical release will also serve as our monthly security release for June_.

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Remote Command Execution via Project Imports](#remote-command-execution-via-project-imports)|critical|
|[XSS in ZenTao integration affecting self hosted instances without strict CSP](#xss-in-zentao-integration-affecting-self-hosted-instances-without-strict-csp)|high|
|[XSS in project settings page](#xss-in-project-settings-page)|high|
|[Unallowed users can read unprotected CI variables](#unallowed-users-can-read-unprotected-ci-variables)|high|
|[IP allow-list bypass to access Container Registries](#ip-allow-list-bypass-to-access-container-registries)|medium|
|[2FA status is disclosed to unauthenticated users](#2fa-status-is-disclosed-to-unauthenticated-users)|medium|
|[IDOR in sentry issues](#idor-in-sentry-issues)|medium|
|[Reporters can manage issues in error tracking](#reporters-can-manage-issues-in-error-tracking)|medium|
|[CI variables provided to runners outside of a group's restricted IP range](#ci-variables-provided-to-runners-outside-of-a-group's-restricted-ip-range)|medium|
|[Regular Expression Denial of Service via malicious web server responses](#regular-expression-denial-of-service-via-malicious-web-server-responses)|medium|
|[Unauthorized read for conan repository](#unauthorized-read-for-conan-repository)|low|
|[Open redirect vulnerability](#open-redirect-vulnerability)|low|
|[Group labels are editable through subproject](#group-labels-are-editable-through-subproject)|low|
|[Release titles visible for any users if group milestones are associated with any project releases](#release-titles-visible-for-any-users-if-group-milestones-are-associated-with-any-project-releases)|low|
|[Restrict membership by email domain bypass](#restrict-membership-by-email-domain-bypass)|low|
|[Job information is leaked to users who previously were maintainers via the Runner Jobs API endpoint](#job-information-is-leaked-to-users-who-previously-were-maintainers-via-the-runner-jobs-api-endpoint)|low|


## Remote Command Execution via Project Imports

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/695 -->

A critical issue has been discovered in GitLab affecting all versions starting from 14.0 prior to 14.10.5, 15.0 prior to 15.0.4, and 15.1 prior to 15.1.1 where an authenticated user authorized to import projects could import a maliciously crafted project leading to remote code execution. This is a critical severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:H/I:H/A:H`, 9.9). It is now mitigated in the latest release and is assigned [CVE-2022-2185](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2185).

Thanks [vakzz](https://hackerone.com/vakzz) for reporting this vulnerability through our HackerOne bug bounty program.

## XSS in ZenTao integration affecting self hosted instances without strict CSP

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/676 -->

Insufficient sanitization in GitLab EE's external issue tracker affecting all versions from 14.5 prior to 14.10.5, 15.0 prior to 15.0.4, and 15.1 prior to 15.1.1 allows an attacker to perform cross-site scripting when a victim clicks on a maliciously crafted ZenTao link. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:C/C:H/I:H/A:N`, 8.7). It is now mitigated in the latest release and is assigned [CVE-2022-2235](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2235).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.


## XSS in project settings page

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/684 -->

A Stored Cross-Site Scripting vulnerability in the project settings page in GitLab CE/EE affecting all versions from 14.4 prior to 14.10.5, 15.0 prior to 15.0.4, and 15.1 prior to 15.1.1, allows an attacker to execute arbitrary JavaScript code in GitLab on a victim's behalf. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:R/S:C/C:H/I:H/A:N`, 8.1). It is now mitigated in the latest release and is assigned [CVE-2022-2230](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2230).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

## Unallowed users can read unprotected CI variables

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/686 -->

An improper authorization issue in GitLab CE/EE affecting all versions from 13.7 prior to 14.10.5, 15.0 prior to 15.0.4, and 15.1 prior to 15.1.1 allows an attacker to extract the value of an unprotected variable they know the name of in public projects or private projects they're a member of. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:N`, 7.5). It is now mitigated in the latest release and is assigned [CVE-2022-2229](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2229).

Thanks [shell3c](https://hackerone.com/shell3c) for reporting this vulnerability through our HackerOne bug bounty program.

## IP allow-list bypass to access Container Registries

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/679 -->

Incorrect authorization in GitLab EE affecting all versions from 10.7 prior to 14.10.5, 15.0 prior to 15.0.4, and 15.1 prior to 15.1.1, allowed an attacker already in possession of a valid Deploy Key or a Deploy Token to misuse it from any location to access Container Registries even when IP address restrictions were configured. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:H/I:H/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-1983](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1983).

This issue was found internally by a member of the GitLab team.

## 2FA status is disclosed to unauthenticated users

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/675 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 13.4 before 14.10.5, all versions starting from 15.0 before 15.0.4, all versions starting from 15.1 before 15.1.1. GitLab reveals if a user has enabled two-factor authentication on their account in the HTML source, to unauthenticated users. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2022-1963](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1963).

Thanks [albatraoz](https://hackerone.com/albatraoz) for reporting this vulnerability through our HackerOne bug bounty program.

## CI variables provided to runners outside of a group's restricted IP range

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/682 -->

Information exposure in GitLab EE affecting all versions from 12.0 prior to 14.10.5, 15.0 prior to 15.0.4, and 15.1 prior to 15.1.1 allows an attacker with the appropriate access tokens to obtain CI variables in a group with using IP-based access restrictions even if the GitLab Runner is calling from outside the allowed IP range. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:N/UI:R/S:U/C:H/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2022-2228](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2228).

This vulnerability has been discovered internally by the GitLab team

## IDOR in sentry issues

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/680 -->

An access control vulnerability in GitLab EE/CE affecting all versions from 14.8 prior to 14.10.5, 15.0 prior to 15.0.4, and 15.1 prior to 15.1.1, allows authenticated users to enumerate issues in non-linked sentry projects. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:L/I:N/A:N`, 5.0). It is now mitigated in the latest release and is assigned [CVE-2022-2243](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2243).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Reporters can manage issues in error tracking

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/680 -->

An improper authorization vulnerability in GitLab EE/CE affecting all versions from 14.8 prior to 14.10.5, 15.0 prior to 15.0.4, and 15.1 prior to 15.1.1, allows project memebers with reporter role to manage issues in project's error tracking feature. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-2244](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2244).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Regular Expression Denial of Service via malicious web server responses

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/671 -->

A Regular Expression Denial of Service vulnerability in GitLab CE/EE affecting all versions from 1.0.2 prior to 14.10.5, 15.0 prior to 15.0.4, and 15.1 prior to 15.1.1 allows an attacker to make a GitLab instance inaccessible via specially crafted web server response headers. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-1954](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1954).

Thanks [afewgoats](https://hackerone.com/afewgoats) for reporting this vulnerability through our HackerOne bug bounty program.

## Unauthorized read for conan repository

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/670 -->

An issue has been discovered in GitLab affecting all versions starting from 12.4 before 14.10.5, all versions starting from 15.0 before 15.0.4, all versions starting from 15.1 before 15.1.1. GitLab was leaking Conan packages names due to incorrect permissions verification. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:L/I:N/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2022-2270](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2270).

Thanks [fushbey](https://hackerone.com/fushbey) for reporting this vulnerability through our HackerOne bug bounty program.

## Open redirect vulnerability

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/687 -->

An open redirect vulnerability in GitLab EE/CE affecting all versions from 11.1 prior to 14.10.5, 15.0 prior to 15.0.4, and 15.1 prior to 15.1.1, allows redirect users to a malicious location. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:C/C:N/I:L/A:N`, 4.7). It is now mitigated in the latest release and is assigned [CVE-2022-2250](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2250).

Thanks [stealthy](https://hackerone.com/stealthy) for reporting this vulnerability through our HackerOne bug bounty program.

## Group labels are editable through subproject

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/683 -->

An issue has been discovered in GitLab CE/EE affecting all versions from 8.13 prior to 14.10.5, 15.0 prior to 15.0.4, and 15.1 prior to 15.1.1. Under certain conditions, using the REST API an unprivileged user was able to change labels description. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:N/UI:R/S:U/C:N/I:L/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2022-1999](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1999).

This vulnerability has been discovered internally by the GitLab team.

## Release titles visible for any users if group milestones are associated with any project releases

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/690 -->

An information disclosure vulnerability in GitLab EE affecting all versions from 12.5 prior to 14.10.5, 15.0 prior to 15.0.4, and 15.1 prior to 15.1.1, allows disclosure of release titles if group milestones are associated with any project releases. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:U/C:L/I:N/A:N`, 2.6). It is now mitigated in the latest release and is assigned [CVE-2022-2281](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2281).

Thanks [ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for reporting this vulnerability through our HackerOne bug bounty program.


## Restrict membership by email domain bypass

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/668 -->

An issue has been discovered in GitLab EE affecting all versions starting from 12.2 prior to 14.10.5, 15.0 prior to 15.0.4, and 15.1 prior to 15.1.1. In GitLab, if a group enables the setting to restrict access to users belonging to specific domains, that allow-list may be bypassed if a Maintainer uses the 'Invite a group' feature to invite a group that has members that don't comply with domain allow-list. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:L/A:N`, 2.7). It is now mitigated in the latest release and is assigned [CVE-2022-1981](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1981).

Thanks [muthu_prakash](https://hackerone.com/muthu_prakash) for reporting this vulnerability through our HackerOne bug bounty program.

## Job information is leaked to users who previously were maintainers via the Runner Jobs API endpoint

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/667 -->

Improper access control in the runner jobs API in GitLab CE/EE affecting all versions prior to 14.10.5, 15.0 prior to 15.0.4, and 15.1 prior to 15.1.1 allows a previous maintainer of a project with a specific runner to access job and project meta data under certain conditions. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:L/I:N/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2022-2227](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2227).

Thanks [vaib25vicky](https://hackerone.com/vaib25vicky) for reporting this vulnerability through our HackerOne bug bounty program.

## Update rack

The version of rack has been updated to 2.2.3.1 in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab CE/EE

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).

