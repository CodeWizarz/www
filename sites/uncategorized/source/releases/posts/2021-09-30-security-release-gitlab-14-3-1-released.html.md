---
title: "GitLab Security Release: 14.3.1, 14.2.5, and 14.1.7"
description: "Learn more about GitLab Security Release: 14.3.1, 14.2.5, and 14.1.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2021/09/30/security-release-gitlab-14-3-1-released/"
categories: releases
author: Michael Henriksen
author_gitlab: mhenriksen
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 14.3.1, 14.2.5, and 14.1.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

## Table of Fixes

|Title|Severity|
|---|---|
|[Stored XSS in merge request creation page](#stored-xss-in-merge-request-creation-page)|high|
|[Denial-of-service attack in Markdown parser](#denial-of-service-attack-in-markdown-parser)|high|
|[Stored Cross-Site Scripting vulnerability in the GitLab Flavored Markdown](#stored-cross-site-scripting-vulnerability-in-the-gitlab-flavored-markdown)|high|
|[DNS Rebinding vulnerability in Gitea importer](#dns-rebinding-vulnerability-in-gitea-importer)|medium|
|[Exposure of trigger tokens on project exports](#exposure-of-trigger-tokens-on-project-exports)|medium|
|[Improper access control for users with expired password](#improper-access-control-for-users-with-expired-password)|medium|
|[Access tokens are not cleared after impersonation](#access-tokens-are-not-cleared-after-impersonation)|medium|
|[Reflected Cross-Site Scripting in Jira Integration](#reflected-cross-site-scripting-in-jira-integration)|medium|
|[DNS Rebinding vulnerability in Fogbugz importer](#dns-rebinding-vulnerability-in-fogbugz-importer)|medium|
|[Access tokens persist after project deletion](#access-tokens-persist-after-project-deletion)|medium|
|[User enumeration vulnerability](#user-enumeration-vulnerability)|medium|
|[Potential DOS via API requests](#potential-dos-via-api-requests)|medium|
|[Pending invitations of public groups and public projects are visible to any user](#pending-invitations-of-public-groups-and-public-projects-are-visible-to-any-user)|medium|
|[Bypass Disabled Repo by URL Project Creation](#bypass-disabled-repo-by-url-project-creation)|medium|
|[Low privileged users can see names of the private groups shared in projects](#low-privileged-users-can-see-names-of-the-private-groups-shared-in-projects)|medium|
|[API discloses sensitive info to low privileged users](#api-discloses-sensitive-info-to-low-privileged-users)|medium|
|[Epic listing do not honour group memberships](#epic-listing-do-not-honour-group-memberships)|medium|
|[Insecure Direct Object Reference vulnerability may lead to protected branch names getting disclosed](#insecure-direct-object-reference-vulnerability-may-lead-to-protected-branch-names-getting-disclosed)|medium|
|[Low privileged users can import users from projects that they they are not a maintainer on](#low-privileged-users-can-import-users-from-projects-that-they-they-are-not-a-maintainer-on)|medium|
|[Potential DOS via dependencies API](#potential-dos-via-dependencies-api)|medium|
|[Create a project with unlimited repository size through malicious Project Import](#create-a-project-with-unlimited-repository-size-through-malicious-project-import)|medium|
|[Bypass disabled Bitbucket Server import source project creation](#bypass-disabled-bitbucket-server-import-source-project-creation)|medium|
|[Requirement to enforce 2FA is not honored when using git commands](#requirement-to-enforce-2fa-is-not-honored-when-using-git-commands)|medium|
|[Content spoofing vulnerability](#content-spoofing-vulnerability)|medium|
|[Improper session management in impersonation feature](#improper-session-management-in-impersonation-feature)|low|
|[Create OAuth application with arbitrary scopes through content spoofing](#create-oauth-application-with-arbitrary-scopes-through-content-spoofing)|low|
|[LDAP users can bypass 2FA and load certain pages with HTTP Basic Auth](#ldap-users-can-bypass-2fa-and-load-certain-pages-with-http-basic-auth)|low|
|[Lack of account lockout on change password functionality](#lack-of-account-lockout-on-change-password-functionality)|low|
|[Epic reference was not updated while moved between groups](#epic-reference-was-not-updated-while-moved-between-groups)|low|
|[Missing authentication allows disabling of two-factor authentication](#missing-authentication-allows-disabling-of-two-factor-authentication)|low|
|[Information disclosure in SendEntry](#information-disclosure-in-sendentry)|low|

## Stored XSS in merge request creation page

A Stored XSS in merge request creation page in Gitlab EE version 13.5 and above allows an attacker to execute arbitrary JavaScript code on the victim's behalf via malicious approval rule names. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:C/C:H/I:H/A:N`, 8.7). It is now mitigated in the latest release and is assigned [CVE-2021-39885](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39885).

Thanks joaxcar for reporting this vulnerability through our HackerOne bug bounty program.

## Denial-of-service attack in Markdown parser

A vulnerability was discovered in GitLab starting with version 12.2 that allows an attacker to cause uncontrolled resource consumption with a specially crafted file. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:C/C:N/I:N/A:H`, 7.7). It is now mitigated in the latest release and is assigned [CVE-2021-39877](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39877).

Thanks phill for reporting this vulnerability through our HackerOne bug bounty program.

## Stored Cross-Site Scripting vulnerability in the GitLab Flavored Markdown

A stored Cross-Site Scripting vulnerability in the GitLab Flavored Markdown in GitLab CE/EE version 8.4 and above allowed an attacker to execute arbitrary JavaScript code on the victim's behalf. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:U/C:H/I:H/A:N`, 7.3). It is now mitigated in the latest release and is assigned [CVE-2021-39887](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39887).

Thanks saleemrashid for reporting this vulnerability through our HackerOne bug bounty program.

## DNS Rebinding vulnerability in Gitea importer

In all versions of GitLab CE/EE since version 8.15, a DNS rebinding vulnerability in Gitea Importer may be exploited by an attacker to trigger Server Side Request Forgery (SSRF) attacks. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:H/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2021-39867](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39867).

This issue was found internally by a member of the GitLab team.

## Exposure of trigger tokens on project exports

In all versions of GitLab CE/EE since version 8.9, project exports may expose trigger tokens configured on that project. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:R/S:U/C:H/I:N/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2021-39869](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39869).

Thanks @mishre for reporting this vulnerability through our HackerOne bug bounty program.

## Improper access control for users with expired password

In all versions of GitLab CE/EE since version 14.1, an improper access control vulnerability allows users with expired password to still access GitLab through git and API through access tokens acquired before password expiration. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2021-39872](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39872).

Thanks @joaxcar for reporting this vulnerability through our HackerOne bug bounty program.

## Access tokens are not cleared after impersonation

In all versions of GitLab CE/EE since version 8.0, access tokens created as part of admin's impersonation of a user are not cleared at the end of impersonation which may lead to unnecessary sensitive info disclosure. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:H/UI:N/S:U/C:H/I:H/A:N`, 5.9). It is now mitigated in the latest release and is assigned [CVE-2021-39891](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39891).

This vulnerability was found internally by a member of the GitLab team.

## Reflected Cross-Site Scripting in Jira Integration

A stored Reflected Cross-Site Scripting vulnerability in the Jira integration in GitLab version 13.0 up to 14.3.1 allowed an attacker to execute arbitrary javascript code. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:R/S:C/C:H/I:N/A:N`, 5.8). It is now mitigated in the latest release and is assigned [CVE-2021-39878](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39878).

Thanks ooooooo_q for reporting this vulnerability through our HackerOne bug bounty program.

## DNS Rebinding vulnerability in Fogbugz importer

In all versions of GitLab CE/EE since version 8.0, a DNS rebinding vulnerability exists in Fogbugz importer which may be used by attackers to exploit Server Side Request Forgery attacks. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:L/A:N`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2021-39894](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39894).

This vulnerability was discovered internally by the GitLab team.

## Access tokens persist after project deletion

A business logic error in the project deletion process in GitLab 13.6 and later allows persistent access via project access tokens. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:L/A:N`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2021-39866](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39866).

Thanks joaxcar for reporting this vulnerability through our HackerOne bug bounty program.

## User enumeration vulnerability

In all versions of GitLab CE/EE, provided a user ID, anonymous users can use a few endpoints to retrieve information about any GitLab user. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2021-39882](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39882).

This issue was found internally by a member of the GitLab team.

## Potential DOS via API requests

A potential DOS vulnerability was discovered in GitLab starting with version 9.1 that allowed parsing files without authorisation. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:L`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2021-39893](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39893).

This vulnerability has been discovered internally by the GitLab team.

## Pending invitations of public groups and public projects are visible to any user

In all versions of GitLab CE/EE since version 13.6, it is possible to see pending invitations of any public group or public project by visiting an API endpoint. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2021-39875](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39875).

Thanks @ashish_r_padelkar for reporting this vulnerability through our HackerOne bug bounty program.

## Bypass Disabled Repo by URL Project Creation

In all versions of GitLab CE/EE since version 11.11, an instance that has the setting to disable Repo by URL import enabled is bypassed by an attacker making a crafted API call. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39870](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39870).

Thanks @ngalog for reporting this vulnerability through our HackerOne bug bounty program.

## Low privileged users can see names of the private groups shared in projects

In all versions of GitLab EE since version 8.13, an endpoint discloses names of private groups that have access to a project to low privileged users that are part of that project. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39884](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39884).

Thanks @ashish_r_padelkar for reporting this vulnerability through our HackerOne bug bounty program.

## API discloses sensitive info to low privileged users

In all versions of GitLab EE since version 13.10, a specific API endpoint may reveal details about a private group and other sensitive info inside issue and merge request templates. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39888](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39888).
Thanks @0xn3va for reporting this vulnerability through our HackerOne bug bounty program.

## Epic listing do not honour group memberships

Improper authorization checks in GitLab EE > 13.11 allows subgroup members to see epics from all parent subgroups. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39883](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39883).

This vulnerability has been discovered internally by the GitLab team.

## Insecure Direct Object Reference vulnerability may lead to protected branch names getting disclosed

In all versions of GitLab EE since version 14.1, due to an insecure direct object reference vulnerability, an endpoint may reveal the protected branch name to a malicious user who makes a crafted API call with the ID of the protected branch. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39889](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39889).

Thanks @ashish_r_padelkar for reporting this vulnerability through our HackerOne bug bounty program.

## Low privileged users can import users from projects that they they are not a maintainer on

In all versions of GitLab CE/EE since version 12.0, a lower privileged user can import users from projects that they don't have a maintainer role on and disclose email addresses of those users. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39892](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39892).

Thanks @ashish_r_padelkar for reporting this vulnerability through our HackerOne bug bounty program.

## Potential DOS via dependencies API

A potential DOS vulnerability was discovered in GitLab EE starting with version 12.6 due to lack of pagination in dependencies API. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-22259](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22259).

This vulnerability has been discovered internally by the GitLab team.

## Create a project with unlimited repository size through malicious Project Import

In all versions of GitLab CE/EE since version 8.12, an authenticated low-privileged malicious user may create a project with unlimited repository size by modifying values in a project export. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39868](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39868).

Thanks @ngalog for reporting this vulnerability through our HackerOne bug bounty program.

## Bypass disabled Bitbucket Server import source project creation

In all versions of GitLab CE/EE since version 13.0, an instance that has the setting to disable Bitbucket Server import enabled is bypassed by an attacker making a crafted API call. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39871](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39871).

This issue was discovered internally by a member of the GitLab team.

## Requirement to enforce 2FA is not honored when using git commands

In all versions of GitLab CE/EE since version 11.0, the requirement to enforce 2FA is not honored when using git commands. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39874](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39874).

Thanks @melar_dev for reporting this vulnerability through our HackerOne bug bounty program.

## Content spoofing vulnerability

In all versions of GitLab CE/EE, there exists a content spoofing vulnerability which may be leveraged by attackers to trick users into visiting a malicious website by spoofing the content in an error response. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:R/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39873](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39873).

Thanks @w00t1 for reporting this vulnerability through our HackerOne bug bounty program.

## Improper session management in impersonation feature

In all versions of GitLab CE/EE since version 8.0, when an admin uses the impersonate feature twice and stops impersonating, the admin may be logged in as the second user they impersonated, which may lead to repudiation issues. This is a low severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:N/S:U/C:L/I:L/A:N`, 3.8). It is now mitigated in the latest release and is assigned [CVE-2021-39896](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39896).

This vulnerability was reported to GitLab by a customer.

## Create OAuth application with arbitrary scopes through content spoofing

In all versions of GitLab CE/EE since version 7.7, the application may let a malicious user create an OAuth client application with arbitrary scope names which may allow the malicious user to trick unsuspecting users to authorize the malicious client application using the spoofed scope name and description. This is a low severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:U/C:N/I:L/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2021-39881](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39881).

Thanks @executor for reporting this vulnerability through our HackerOne bug bounty program.

## LDAP users can bypass 2FA and load certain pages with HTTP Basic Auth

It was possible to bypass 2FA for LDAP users and access some specific pages with Basic Authentication in GitLab 14.1.1 and above. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:L/I:N/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2021-39890](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39890).

This vulnerability has been discovered internally by the GitLab team.

## Lack of account lockout on change password functionality

In all versions of GitLab CE/EE, an attacker with access to a user’s session may brute force the user’s password via the change password function. There is a rate limit in place, but the attack may still be conducted by splitting the attack over several IP addresses. This is a low severity issue (`CVSS:3.0/AV:P/AC:H/PR:N/UI:R/S:U/C:L/I:L/A:N`, 2.9). It is now mitigated in the latest release and is assigned [CVE-2021-39899](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39899).

This vulnerability was discovered internally by the GitLab team.

## Epic reference was not updated while moved between groups

Permissions rules were not applied while issues were moved between projects of the same group in GitLab versions starting with 10.6 and up to 14.1.7 allowing users to read confidential Epic references. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:R/S:U/C:L/I:N/A:N`, 2.6). It is now mitigated in the latest release and is assigned [CVE-2021-39886](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39886).

This vulnerability was discovered internally by the GitLab team.

## Missing authentication allows disabling of two-factor authentication

Missing authentication in all versions of GitLab CE/EE since version 7.11.0 allows an attacker with access to a victim's session to disable two-factor authentication. This is a low severity issue (`CVSS:3.0/AV:L/AC:H/PR:L/UI:R/S:U/C:N/I:L/A:N`, 2.2). It is now mitigated in the latest release and is assigned [CVE-2021-39879](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39879).

This vulnerability has been discovered internally by the GitLab team.

## Information disclosure in SendEntry

Information disclosure from SendEntry in GitLab starting with 10.8 allowed exposure of full URL of artifacts stored in object-storage with a temporary availability via Rails logs. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:H/UI:R/S:U/C:L/I:N/A:N`, 2.0). It is now mitigated in the latest release and is assigned [CVE-2021-39900](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39900).

This vulnerability has been discovered internally by the GitLab team.

## Updating

To update GitLab, see the [Update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
