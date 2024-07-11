---
title: "GitLab Security Release: 14.1.2, 14.0.7, and 13.12.9"
description: "Learn more about GitLab Security Release: 14.1.2, 14.0.7, and 13.12.9 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2021/08/03/security-release-gitlab-14-1-2-released/"
categories: releases
author: Dominic Couture
author_gitlab: dcouture
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 14.1.2, 14.0.7, and 13.12.9 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

## Table of Fixes

|Title|Severity|
|---|---|
|[Stored XSS in Mermaid when viewing Markdown files](#stored-xss-in-mermaid-when-viewing-markdown-files)|high|
|[Stored XSS in default branch name](#stored-xss-in-default-branch-name)|high|
|[Perform Git actions with an impersonation token even if impersonation is disabled](#perform-git-actions-with-an-impersonation-token-even-if-impersonation-is-disabled)|medium|
|[Tag and branch name confusion allows Developer to access protected CI variables](#tag-and-branch-name-confusion-allows-developer-to-access-protected-ci-variables)|medium|
|[New subscriptions generate OAuth tokens on an incorrect OAuth client application](#new-subscriptions-generate-oauth-tokens-on-an-incorrect-oauth-client-application)|medium|
|[Ability to list and delete impersonation tokens for your own user](#ability-to-list-and-delete-impersonation-tokens-for-your-own-user)|medium|
|[Pipelines page is partially visible for users that have no right to see CI/CD](#pipelines-page-is-partially-visible-for-users-that-have-no-right-to-see-cicd)|medium|
|[Improper email validation on an invite URL](#improper-email-validation-on-an-invite-url)|medium|
|[Unauthorised user was able to add meta data upon issue creation](#unauthorised-user-was-able-to-add-meta-data-upon-issue-creation)|medium|
|[Unauthorized user can trigger deployment to a protected environment](#unauthorized-user-can-trigger-deployment-to-a-protected-environment)|medium|
|[Guest in private project can see CI/CD Analytics](#guest-in-private-project-can-see-cicd-analytics)|medium|
|[Guest users can create issues for Sentry errors and track their status](#guest-users-can-create-issues-for-sentry-errors-and-track-their-status)|medium|
|[Private user email disclosure via group invitation](#private-user-email-disclosure-via-group-invitation)|medium|
|[Projects are allowed to add members with email address domain that should be blocked by group settings](#projects-are-allowed-to-add-members-with-email-address-domain-that-should-be-blocked-by-group-settings)|medium|
|[Misleading username could lead to impersonation in using SSH Certificates](#misleading-username-could-lead-to-impersonation-in-using-ssh-certificates)|low|
|[Unauthorized user is able to access and view project vulnerability reports](#unauthorized-user-is-able-to-access-and-view-project-vulnerability-reports)|low|
|[Denial of service in repository caused by malformed commit author](#denial-of-service-in-repository-caused-by-malformed-commit-author)|low|

## Stored XSS in Mermaid when viewing Markdown files

Insufficient input sanitization in Mermaid markdown in GitLab CE/EE version 11.4 and up allows an attacker to exploit a stored cross-site scripting vulnerability via a specially-crafted markdown. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:C/C:H/I:H/A:N`, 8.7). It is now mitigated in the latest release and is assigned [CVE-2021-22242](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22242).

Thanks @saleemrashid for reporting this vulnerability through our HackerOne bug bounty program.

### Note

Users will no longer be able to configure `htmlLabels` setting in Mermaid charts.

## Stored XSS in default branch name

An issue has been discovered in GitLab CE/EE affecting all versions starting from 13.4. It was possible to exploit a stored cross-site-scripting via a specifically crafted default branch name. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:C/C:H/I:H/A:N`, 8.7). It is now mitigated in the latest release and is assigned [CVE-2021-22241](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22241).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Perform Git actions with an impersonation token even if impersonation is disabled

Under specialized conditions, GitLab may allow a user with an impersonation token to perform Git actions even if impersonation is disabled. This vulnerability is present in GitLab CE/EE versions before 13.12.9, 14.0.7, 14.1.2. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:H/UI:N/S:U/C:H/I:H/A:H`, 6.6). It is now mitigated in the latest release and is assigned [CVE-2021-22237](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22237).

GitLab would like to thank a customer who reported this issue.

## Tag and branch name confusion allows Developer to access protected CI variables

A confusion between tag and branch names in GitLab CE/EE affecting all versions since 13.7 allowed a Developer to access protected CI variables which should only be accessible to Maintainers. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2021-22252](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22252).

Thanks @rodrigopetter for reporting this vulnerability through our HackerOne bug bounty program.

## New subscriptions generate OAuth tokens on an incorrect OAuth client application

Due to improper handling of OAuth client IDs, new subscriptions generated OAuth tokens on an incorrect OAuth client application. This vulnerability is present in GitLab CE/EE since version 14.1. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:U/C:L/I:L/A:L`, 5.5). It is now mitigated in the latest release and is assigned [CVE-2021-22236](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22236).

This vulnerability was found internally by the GitLab team.

## Ability to list and delete impersonation tokens for your own user

Improper authorization in GitLab CE/EE affecting all versions since 13.3 allowed users to view and delete impersonation tokens that administrations created for their account. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:L/A:N`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2021-22250](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22250).

Thanks @jimeno for reporting this vulnerability through our HackerOne bug bounty program.

## Pipelines page is partially visible for users that have no right to see CI/CD

Improper authorization on the pipelines page in GitLab CE/EE affecting all versions since 13.12 allowed unauthorized users to view some pipeline information for public projects that have access to pipelines restricted to members only. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2021-22248](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22248).

This vulnerability has been discovered internally by the GitLab team.

## Improper email validation on an invite URL

Under specialized conditions, GitLab CE/EE versions starting 7.10 may allow existing GitLab users to use an invite URL meant for another email address to gain access into a group. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:L/I:L/A:L`, 5.0). It is now mitigated in the latest release and is assigned [CVE-2021-22243](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22243).

This vulnerability was found internally by the GitLab team.

## Unauthorised user was able to add meta data upon issue creation

An unauthorized user was able to insert metadata when creating new issue on GitLab CE/EE 14.0 and later. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:C/C:N/I:L/A:N`, 5.0). It is now mitigated in the latest release and is assigned [CVE-2021-22239](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22239).

This vulnerability has been discovered internally by the GitLab team.

## Unauthorized user can trigger deployment to a protected environment

Improper authorization in GitLab EE affecting all versions since 13.4 allowed a user who previously had the necessary access to trigger deployments to protected environments under specific conditions after the access has been removed. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:C/C:N/I:L/A:L`, 4.9). It is now mitigated in the latest release and is assigned [CVE-2021-22253](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-CVE-2021-22253).

Thanks @vaib25vicky for reporting this vulnerability through our HackerOne bug bounty program.

## Guest in private project can see CI/CD Analytics

Improper authorization in GitLab CE/EE affecting all versions since 13.0 allows guests in private projects to view CI/CD analytics. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-22247](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22247).

Thanks @ashish_r_padelkar for reporting this vulnerability through our HackerOne bug bounty program.

## Guest users can create issues for Sentry errors and track their status

Improper authorization in GitLab CE/EE affecting all versions since 12.6 allowed guest users to create issues for Sentry errors and track their status. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-22256](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22256).

Thanks @maruthi12 for reporting this vulnerability through our HackerOne bug bounty program.

## Private user email disclosure via group invitation

A verbose error message in GitLab EE affecting all versions since 12.2 could disclose the private email address of a user invited to a group. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-22249](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22249).

Thanks @jimeno for reporting this vulnerability through our HackerOne bug bounty program.

## Projects are allowed to add members with email address domain that should be blocked by group settings

Improper validation of invited users' email address in GitLab EE affecting all versions since 12.2 allowed projects to add members with email address domain that should be blocked by group settings. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-22251](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22251).

Thanks @ashish_r_padelkar for reporting this vulnerability through our HackerOne bug bounty program.

## Misleading username could lead to impersonation in using SSH Certificates

Under very specific conditions a user could be impersonated using Gitlab shell. This vulnerability affects GitLab CE/EE 13.1 and later through 14.1.2, 14.0.7 and 13.12.9. This is a low severity issue (`CVSS:3.0/CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:L/I:N/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2021-22254](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22254).

Thanks ledz1996 for reporting this vulnerability through our HackerOne bug bounty program.

## Unauthorized user is able to access and view project vulnerability reports

Improper authorization in the vulnerability report feature in GitLab EE affecting all versions since 13.1 allowed a reporter to access vulnerability data. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:L/I:N/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2021-22244](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22244).

Thanks @vaib25vicky for reporting this vulnerability through our HackerOne bug bounty program.

## Denial of service in repository caused by malformed commit author

Improper validation of commit author in GitLab CE/EE affecting all versions allowed an attacker to make several pages in a project impossible to view. This is a low severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:N/A:L`, 2.7). It is now mitigated in the latest release and is assigned [CVE-2021-22245](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22245).

Thanks @stanlyoncm for reporting this vulnerability through our HackerOne bug bounty program.

## Update Mattermost

Mattermost has been upgraded to 5.35.4 in order to mitigate security concerns.

### Versions affected

Affects GitLab Omnibus versions 13.10 and later

## Update oauth ruby gem

The oauth ruby gem has been upgraded to 0.5.6 in order to mitigate security concerns.

### Versions affected

Affects versions 10.6 and later

## Update libgcrypt

libgcrypt has been upgraded to 1.9.3 in order to mitigate security concerns.

### Versions affected

Affects all previous versions of GitLab Omnibus

## Updating

To update GitLab, see the [Update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
