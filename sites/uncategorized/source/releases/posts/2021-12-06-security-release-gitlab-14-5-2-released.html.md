---
title: "GitLab Security Release: 14.5.2, 14.4.4, and 14.3.6"
description: "Learn more about GitLab Security Release: 14.5.2, 14.4.4, and 14.3.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2021/12/06/security-release-gitlab-14-5-2-released/"
categories: releases
author: Rohit Shambhuni
author_gitlab: rshambhuni
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 14.5.2, 14.4.4, and 14.3.6 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

## Table of Fixes

|Title|Severity|
|---|---|
|[Group members with developer role can escalate their privilege to maintainer on projects that they import](#group-members-with-developer-role-can-escalate-their-privilege-to-maintainer-on-projects-that-they-import)|high|
|[When user registration is limited, external users that aren't developers shouldn't have access to the CI Lint API](#when-user-registration-is-limited-external-users-that-arent-developers-shouldnt-have-access-to-the-ci-lint-api)|medium|
|[Collision in access memoization leads to potential elevated privileges on groups and projects](#collision-in-access-memoization-leads-to-potential-elevated-privileges-on-groups-and-projects)|medium|
|[Project access token names are returned for unauthenticated requesters](#project-access-token-names-are-returned-for-unauthenticated-requesters)|medium|
|[Sensitive info disclosure in logs](#sensitive-info-disclosure-in-logs)|medium|
|[Disclosure of a user's custom project and group templates](#disclosure-of-a-users-custom-project-and-group-templates)|medium|
|[ReDoS in Maven package version](#redos-in-maven-package-version)|medium|
|[Potential denial of service via the Diff feature](#potential-denial-of-service-via-the-diff-feature)|medium|
|[Regular Expression Denial of Service via user comments](#regular-expression-denial-of-service-via-user-comments)|medium|
|[Service Desk email accessible by any project member](#service-desk-email-accessible-by-any-project-member)|medium|
|[Regular Expression Denial of Service via quick actions](#regular-expression-denial-of-service-via-quick-actions)|medium|
|[IDOR in "external status check" API leaks data about any status check on the instance](#idor-in-external-status-check-api-leaks-data-about-any-status-check-on-the-instance)|medium|
|[Default branch name visible in public projects restricting access to the source code repository](#default-branch-name-visible-in-public-projects-restricting-access-to-the-source-code-repository)|low|
|[Deploy token allows access to disabled project Wiki](#deploy-token-allows-access-to-disabled-project-wiki)|low|
|[Regular Expression Denial of Service via deploy Slash commands](#regular-expression-denial-of-service-via-deploy-slash-commands)|low|
|[Users can reply to Vulnerability Report discussions despite Only Project Members settings](#users-can-reply-to-vulnerability-report-discussions-despite-only-project-members-settings)|low|
|[Unauthorised deletion of protected branches](#unauthorised-deletion-of-protected-branches)|low|
|[Author can approve Merge Request after having access revoked](#author-can-approve-merge-request-after-having-access-revoked)|low|
|[HTML Injection via Swagger UI](#html-injection-via-swagger-ui)|low|

## Group members with developer role can escalate their privilege to maintainer on projects that they import

An issue has been discovered in GitLab CE/EE affecting all versions starting from 11.0 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2. A permissions validation flaw allowed group members with a developer role to elevate their privilege to a maintainer on projects they import. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:L/A:N`, 7.1). It is now mitigated in the latest release and is assigned [CVE-2021-39944](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39944).

Thanks @justas_b for reporting this vulnerability through our HackerOne bug bounty program.

## When user registration is limited, external users that aren't developers shouldn't have access to the CI Lint API

An issue has been discovered in GitLab CE/EE affecting all versions starting from 10.5 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2. Unauthorized external users could perform Server Side Requests via the CI Lint API. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:N/UI:N/S:C/C:H/I:N/A:N`, 6.8). It is now mitigated in the latest release and is assigned [CVE-2021-39935](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39935).

Thanks [@minhli](https://hackerone.com/minhli?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

## Collision in access memoization leads to potential elevated privileges on groups and projects

A collision in access memoization logic in all versions of GitLab CE/EE before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2, leads to potential elevated privileges in groups and projects under rare circumstances. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:L/I:H/A:N`, 5.9). It is now mitigated in the latest release and is assigned [CVE-2021-39937](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39937).

This vulnerability has been discovered internally by the GitLab team.

## Project access token names are returned for unauthenticated requesters

Improper access control in the GraphQL API in GitLab CE/EE affecting all versions starting from 13.0 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2, allows an attacker to see the names of project access tokens on arbitrary projects. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2021-39915](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39915).

Thanks [@joaxcar](https://hackerone.com/joaxcar?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

## Sensitive info disclosure in logs

In all versions of GitLab CE/EE starting version 14.0 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2, the reset password token and new user email token are accidentally logged which may lead to information disclosure. This is a medium severity issue (`CVSS:3.0/AV:L/AC:L/PR:H/UI:N/S:U/C:H/I:N/A:N`, 4.4). It is now mitigated in the latest release and is assigned [CVE-2021-39919](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39919).

This vulnerability was discovered internally by a member of the GitLab team.

## Disclosure of a user's custom project and group templates

Missing authorization in GitLab EE versions starting from 12.4 before 14.3.6, starting from 14.4.0 before 14.4.4, and starting from 14.5.0 before 14.5.2 allowed an attacker to access a user's custom project and group templates. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39930](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39930).

Thanks [@ngalog](https://hackerone.com/ngalog?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

## ReDoS in Maven package version

An issue has been discovered in GitLab CE/EE affecting all versions starting from 13.2 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2. GitLab Maven Package registry is vulnerable to a regular expression denial of service when a specifically crafted string is sent. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39940](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39940).

Thanks [@anyday](https://hackerone.com/anyday?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

## Potential denial of service via the Diff feature

An issue has been discovered in GitLab CE/EE affecting all versions starting from 11.0 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2. Using large payloads, the diff feature could be used to trigger high load time for users reviewing code changes. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39932](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39932).

This vulnerability has been discovered internally by the GitLab team.

## Regular Expression Denial of Service via user comments

An issue has been discovered in GitLab CE/EE affecting all versions starting from 12.10 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2. A regular expression used for handling user input (notes, comments, etc) was susceptible to catastrophic backtracking that could cause a DOS attack. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39933](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39933).

Thanks [@hashkitten](https://hackerone.com/hashkitten?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

## Service Desk email accessible by any project member

Improper access control allows any project member to retrieve the Service Desk email address in GitLab CE/EE versions starting from 12.10 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39934](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39934).

Thanks [@gratitude101](https://hackerone.com/gratitude101?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

## Regular Expression Denial of Service via quick actions

An issue has been discovered in GitLab CE/EE affecting all versions starting from 12.9 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2. A regular expression related to quick actions features was susceptible to catastrophic backtracking that could cause a DOS attack. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39917](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39917).

Thanks [@hashkitten](https://hackerone.com/hashkitten?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

## IDOR in "external status check" API leaks data about any status check on the instance

Lack of an access control check in the External Status Check feature allowed any authenticated user to retrieve the configuration of any External Status Check in GitLab EE starting from 14.1 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39916](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39916).

Thanks [@joaxcar](https://hackerone.com/joaxcar?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

## Default branch name visible in public projects restricting access to the source code repository

An information disclosure vulnerability in GitLab CE/EE versions 12.0 to 14.3.6, 14.4 to 14.4.4, and 14.5 to 14.5.2 allowed non-project members to see the default branch name for projects that restrict access to the repository to project members. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:N/A:N`, 3.7). It is now mitigated in the latest release and is assigned [CVE-2021-39941](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39941).

Thanks [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

## Deploy token allows access to disabled project Wiki

Improper access control in GitLab CE/EE affecting all versions starting from 10.7 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2, allows an attacker in possession of a deploy token to access a project's disabled wiki. This is a low severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:U/C:L/I:N/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2021-39936](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39936).

Thanks [@vaib25vicky](https://hackerone.com/vaib25vicky?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

## Regular Expression Denial of Service via deploy Slash commands

A vulnerable regular expression pattern in GitLab CE/EE since version 8.15 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2, allows an attacker to cause uncontrolled resource consumption leading to Denial of Service via specially crafted deploy Slash commands. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:N/I:N/A:L`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2021-39938](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39938).

This vulnerability has been discovered internally by the GitLab team.

## Users can reply to Vulnerability Report discussions despite Only Project Members settings

Incorrect Authorization in GitLab EE affecting all versions starting from 11.1 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2, allows a user to add comments to a vulnerability which cannot be accessed. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:N/I:L/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2021-39918](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39918).

Thanks [@wi11](https://hackerone.com/wi11?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

## Unauthorised deletion of protected branches

An issue has been discovered in GitLab CE/EE affecting all versions starting from 8.11 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2. Under specific condition an unauthorised project member was allowed to delete a protected branches due to a business logic error. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:N/I:L/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2021-39931](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39931).

Thanks [@joaxcar](https://hackerone.com/joaxcar?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

## Author can approve Merge Request after having access revoked

Improper access control in the GitLab CE/EE API affecting all versions starting from 9.4 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2, allows an author of a Merge Request to approve the Merge Request even after having their project access revoked. This is a low severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:L/A:N`, 2.7). It is now mitigated in the latest release and is assigned [CVE-2021-39945](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39945).

Thanks [@muthu_prakash](https://hackerone.com/muthu_prakash?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

## HTML Injection via Swagger UI

An issue has been discovered in GitLab CE/EE affecting all versions starting from 12.6 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2. GitLab was vulnerable to HTML Injection through the Swagger UI feature. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:R/S:U/C:N/I:L/A:N`, 2.6). It is now mitigated in the latest release and is assigned [CVE-2021-39910](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39910).

Thanks [@kannthu](https://hackerone.com/muthu_prakash?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

## Update Ruby

The version of Ruby included in GitLab Omnibus has been updated to 2.7.5 in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab Omnibus.

## Update Rails

The version of Rails included in GitLab Omnibus has been updated to 6.1.4.1 in order to mitigate security concerns.

### Versions affected

Affects versions 12.8 and later.

## Update ncurses

The version of ncurses included in GitLab Omnibus has been updated to 6.3 in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab Omnibus.

## Update libgcrypt

The version of libgcrypt included in GitLab Omnibus has been updated to 1.9.4 in order to mitigate security concerns.

### Versions affected

Affects versions 10.3 and later.

## Update mattermost

The version of mattermost included in GitLab Omnibus versions 14.4.4 and 14.5.2 has been updated to 5.39.2 in order to mitigate security concerns. The version of mattermost included in GitLab Omnibus versions 14.3.6 has been updated to 5.38.4 in order to mitigate security concerns.

### Versions affected

Affects versions 14.1 and later.

## Update graphql

The version of graphql included in GitLab Omnibus has been updated to 1.11.10 in order to mitigate security concerns.

### Versions affected

Affects versions 8.11 and later.

## Update mermaid

The version of mermaid included in GitLab Omnibus has been updated to 8.13.4 in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab Omnibus.

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).

