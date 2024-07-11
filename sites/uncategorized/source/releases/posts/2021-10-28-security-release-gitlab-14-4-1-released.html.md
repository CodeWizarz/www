---
title: "GitLab Security Release: 14.4.1, 14.3.4, and 14.2.6"
description: "Learn more about GitLab Security Release: 14.4.1, 14.3.4, and 14.2.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
+canonical_path: "/releases/2021/10/28/security-release-gitlab-14-4-1-released/"
categories: releases
author: Nikhil George
author_gitlab: ngeorge1
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 14.4.1, 14.3.4, and 14.2.6 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

## Table of Fixes

|Title|Severity|
|---|---|
|[Stored XSS via ipynb files](#stored-xss-via-ipynb-files)|high|
|[Unicode characters can be abused to commit malicious code into projects without notice](#unicode-characters-can-be-abused-to-commit-malicious-code-into-projects-without-notice)|medium|
|[Pipeline schedules on imported projects can be set to automatically active after import](#pipeline-schedules-on-imported-projects-can-be-set-to-automatically-active-after-import)|medium|
|[Potential Denial of service via Workhorse](#potential-denial-of-service-via-workhorse)|medium|
|[Improper Access Control allows Merge Request creator to bypass locked status](#improper-access-control-allows-merge-request-creator-to-bypass-locked-status)|medium|
|[Projects API discloses ID and name of private groups](#projects-api-discloses-id-and-name-of-private-groups)|medium|
|[Severity of an incident can be changed by a guest user](#severity-of-an-incident-can-be-changed-by-a-guest-user)|medium|
|[System root password accidentally written to log file](#system-root-password-accidentally-written-to-log-file)|medium|
|[Potential DoS via a malformed TIFF image](#potential-dos-via-a-malformed-tiff-image)|medium|
|[Bypass of CODEOWNERS Merge Request approval requirement](#bypass-of-codeowners-merge-request-approval-requirement)|medium|
|[Change project visibility to a restricted option](#change-project-visibility-to-a-restricted-option)|medium|
|[Project exports leak external webhook token value](#project-exports-leak-external-webhook-token-value)|low|
|[Invited group members, with access inherited from parent group, continue to have project access even after invited subgroup is transfered](#invited-group-members-with-access-inherited-from-parent-group-continue-to-have-project-access-even-after-invited-subgroup-is-transfered)|low|
|[SCIM token is visible after creation](#scim-token-is-visible-after-creation)|low|
|[Regular expression denial of service issue when cleaning namespace path](#regular-expression-denial-of-service-issue-when-cleaning-namespace-path)|low|
|[Prevent creation of scopeless apps using applications API](#prevent-creation-of-scopeless-apps-using-applications-api)|low|
|[Webhook data exposes assignee's private email address](#webhook-data-exposes-assignee's-private-email-address)|low|

## Stored XSS via ipynb files

Improper validation of ipynb files in GitLab CE/EE version 13.5 and above allows an attacker to execute arbitrary JavaScript code on the victim's behalf. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:C/C:H/I:H/A:N`, 8.7). It is now mitigated in the latest release and is assigned [CVE-2021-39906](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39906).

Thanks @saleemrashid for reporting this vulnerability through our HackerOne bug bounty program.

## Unicode characters can be abused to commit malicious code into projects without notice

In all versions of GitLab CE/EE, certain Unicode characters can be abused to commit malicious code into projects without being noticed in merge request or source code viewer UI. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:H/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2021-39908](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39908). The general attack vector was also assigned [CVE-2021-42574](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-42574) by the original researchers and is known as a "Trojan Source Attack".

Thanks @nickboucher for reporting this vulnerability through our HackerOne bug bounty program.

## Pipeline schedules on imported projects can be set to automatically active after import

In all versions of GitLab CE/EE since version 8.0, an attacker can set the pipeline schedules to be active in a project export so when an unsuspecting owner imports that project, pipelines are active by default on that project. Under specialized conditions, this may lead to information disclosure if the project is imported from an untrusted source. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:H/UI:R/S:U/C:H/I:H/A:L`, 6.0). It is now mitigated in the latest release and is assigned [CVE-2021-39895](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39895).

Thanks @justas_b for reporting this vulnerability through our HackerOne bug bounty program.

## Potential Denial of service via Workhorse

A potential DOS vulnerability was discovered in GitLab CE/EE starting with version 13.7. The stripping of EXIF data from certain images resulted in high CPU usage. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:L`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2021-39907](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39907).

Thanks @ajxchapman for reporting this vulnerability through our HackerOne bug bounty program.

## Improper Access Control allows Merge Request creator to bypass locked status

An Improper Access Control vulnerability in the GraphQL API in GitLab CE/EE since version 13.1 allows a Merge Request creator to resolve discussions and apply suggestions after a project owner has locked the Merge Request. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39904](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39904).

Thanks @jimeno for reporting this vulnerability through our HackerOne bug bounty program.

## Projects API discloses ID and name of private groups

An information disclosure vulnerability in the GitLab CE/EE API since version 8.9.6 allows a user to see basic information on private groups that a public project has been shared with. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39905](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39905).

Thanks @rafiem for reporting this vulnerability through our HackerOne bug bounty program.

## Severity of an incident can be changed by a guest user

Incorrect Authorization in GitLab CE/EE 13.4 or above allows a user with guest membership in a project to modify the severity of an incident. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39902](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39902).

Thanks @cradlr for reporting this vulnerability through our HackerOne bug bounty program.

## System root password accidentally written to log file

Accidental logging of system root password in the migration log in all versions of GitLab CE/EE allows an attacker with local file system access to obtain system root-level privileges. This is a medium severity issue (`CVSS:3.0/AV:L/AC:L/PR:H/UI:N/S:U/C:H/I:N/A:N`, 4.4). It is now mitigated in the latest release and is assigned [CVE-2021-39913](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39913).

This vulnerability has been discovered internally by the GitLab team.

## Potential DoS via a malformed TIFF image

A potential DoS vulnerability was discovered in GitLab CE/EE starting with version 13.7. Using a malformed TIFF images was possible to trigger memory exhaustion. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:L`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2021-39912](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39912).

Thanks @haquaman for reporting this vulnerability through our HackerOne bug bounty program.

## Bypass of CODEOWNERS Merge Request approval requirement

Lack of email address ownership verification in the CODEOWNERS feature in all versions of GitLab EE since version 11.3 allows an attacker to bypass CODEOWNERS Merge Request approval requirement under rare circumstances. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:N/I:H/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2021-39909](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39909).

Thanks @vaib25vicky for reporting this vulnerability through our HackerOne bug bounty program.

## Change project visibility to a restricted option

In all versions of GitLab CE/EE since version 13.0, a low privileged user, through an API call, can change the visibility level of a group or a project to a restricted option even after the instance administrator sets that visibility option as restricted in settings. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:N/S:U/C:H/I:H/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2021-39903](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39903).

Thanks @s4nderdevelopment for reporting this vulnerability through our HackerOne bug bounty program.

## Project exports leak external webhook token value

In all versions of GitLab CE/EE since version 10.6, a project export leaks the external webhook token value which may allow access to the project which it was exported from. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:N/A:N`, 3.7). It is now mitigated in the latest release and is assigned [CVE-2021-39898](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39898).

Thanks @xanbanx for reporting this vulnerability through our HackerOne bug bounty program.

## Invited group members, with access inherited from parent group, continue to have project access even after invited subgroup is transfered

Improper access control in GitLab CE/EE version 10.5 and above allowed subgroup members with inherited access to a project from a parent group to still have access even after the subgroup is transferred. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:R/S:U/C:L/I:L/A:N`, 3.7). It is now mitigated in the latest release and is assigned [CVE-2021-39897](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39897).

Thanks @joaxcar for reporting this vulnerability through our HackerOne bug bounty program.

## SCIM token is visible after creation

In all versions of GitLab CE/EE since version 11.10, an admin of a group can see the SCIM token of that group by visiting a specific endpoint. This is a low severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:N/S:U/C:L/I:N/A:N`, 2.7). It is now mitigated in the latest release and is assigned [CVE-2021-39901](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39901).

Thanks @ngalog for reporting this vulnerability through our HackerOne bug bounty program.

## Regular expression denial of service issue when cleaning namespace path

A regular expression denial of service issue in GitLab versions 8.13 to 14.2.5, 14.3.0 to 14.3.3 and 14.4.0
could cause excessive usage of resources when a specially crafted username was used when provisioning a new user. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:N/I:N/A:L`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2021-39914](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39914).

This vulnerability has been discovered internally by the GitLab team

## Prevent creation of scopeless apps using applications API

The application api in GitLab CE/EE version 10.5 and above allowed creation of scopeless apps. This is a low severity issue and is now mitigated in latest release.

This vulnerability has been discovered internally by the GitLab team

## Webhook data exposes assignee's private email address

An improper access control flaw in GitLab CE/EE since version 13.9 exposes private email address of Issue and Merge Requests assignee to Webhook data consumers. This is a low severity issue (`CVSS:3.0/AV:P/AC:H/PR:L/UI:R/S:U/C:L/I:N/A:N`, 1.7). It is now mitigated in the latest release and is assigned [CVE-2021-39911](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39914).

This vulnerability has been discovered internally by the GitLab team.

## Update Redis

The version of Redis included in GitLab Omnibus has been updated to 6.0.16 in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab Omnibus

## Update OpenSSL

The version of OpenSSL included in GitLab Omnibus has been updated to 1.1.1l in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab Omnibus

## Update Curl

The version of Curl included in GitLab Omnibus has been updated to 7.79.1 in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab Omnibus

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
