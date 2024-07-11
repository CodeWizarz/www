---
title: "GitLab Security Release: 14.7.1, 14.6.4, and 14.5.4"
description: "Learn more about GitLab Security Release: 14.7.1, 14.6.4, and 14.5.4 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2022/02/03/security-release-gitlab-14-7-1-released/"
categories: releases
author: Andrew Kelly
author_gitlab: ankelly
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 14.7.1, 14.6.4, and 14.5.4 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

## Table of Fixes

|Title|Severity|
|---|---|
|[Arbitrary POST requests via special HTML attributes in Jupyter Notebooks](#arbitrary-post-requests-via-special-html-attributes-in-jupyter-notebooks)|high|
|[DNS Rebinding vulnerability in Irker IRC Gateway integration](#dns-rebinding-vulnerability-in-irker-irc-gateway-integration)|medium|
|[Missing certificate validation for external CI services](#missing-certificate-validation-for-external-ci-services)|medium|
|[Blind SSRF Through Project Import](#blind-ssrf-through-project-import)|medium|
|[Open redirect vulnerability in Jira Integration](#open-redirect-vulnerability-in-jira-integration)|medium|
|[Issue link was disclosing the linked issue](#issue-link-was-disclosing-the-linked-issue)|medium|
|[Service Desk email accessible by project non-members](#service-desk-email-accessible-by-project-non-members)|medium|
|[Authenticated users can search other users by their private email](#authenticated-users-can-search-other-users-by-their-private-email)|medium|
|["External status checks" can be accepted by users below developer access if the user is either author or assignee of the target merge request](#external-status-checks-can-be-accepted-by-users-below-developer-access-if-the-user-is-either-author-or-assignee-of-the-target-merge-request)|medium|
|[Deleting packages in bulk from package registries may cause table locks](#deleting-packages-in-bulk-from-package-registries-may-cause-table-locks)|medium|
|[Autocomplete enabled on specific pages](#autocomplete-enabled-on-specific-pages)|low|
|[Possible SSRF due to not blocking shared address space](#possible-ssrf-due-to-not-blocking-shared-address-space)|low|
|[System notes reveals private project path when Issue is moved to a public project](#system-notes-reveals-private-project-path-when-issue-is-moved-to-a-public-project)|low|
|[Timeout for pages using Markdown](#timeout-for-pages-using-markdown)|low|
|[Certain branch names could not be protected](#certain-branch-names-could-not-be-protected)|low|

## Arbitrary POST requests via special HTML attributes in Jupyter Notebooks

Missing sanitization of HTML attributes in Jupyter notebooks in all versions of GitLab CE/EE since version 14.5 allows an attacker to perform arbitrary HTTP POST requests on a user's behalf leading to potential account takeover. This is a high severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:R/S:C/C:H/I:H/A:N`, 7.7). It is now mitigated in the latest release and is assigned [CVE-2022-0427](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0427).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## DNS Rebinding vulnerability in Irker IRC Gateway integration

A DNS rebinding vulnerability in the Irker IRC Gateway integration in all versions of GitLab CE/EE since version 7.9 allows an attacker to trigger Server Side Request Forgery (SSRF) attacks. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:H/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-0425](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0425).

This vulnerability has been discovered internally by the GitLab team.

## Missing certificate validation for external CI services

An issue has been discovered affecting GitLab versions prior to 14.4.5, between 14.5.0 and 14.5.3, and between 14.6.0 and 14.6.1. GitLab does not validate SSL certificates for some of external CI services which makes it possible to perform MitM attacks on connections to these external services. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:H/UI:N/S:U/C:H/I:H/A:N`, 5.9). It is now mitigated in the latest release and is assigned [CVE-2022-0123](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0123).

This vulnerability has been discovered internally by the GitLab team.

## Blind SSRF Through Project Import

A vulnerability was discovered in GitLab starting with version 10.5. GitLab was vulnerable to a blind SSRF attack through the Project Import feature. . This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:L`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2022-0136](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0136).

Thanks [no1zy](https://hackerone.com/no1zy) for reporting this vulnerability through our HackerOne bug bounty program.

## Open redirect vulnerability in Jira Integration

An issue has been discovered affecting GitLab versions prior to 13.5. An open redirect vulnerability was fixed in GitLab integration with Jira that a could cause the web application to redirect the request to the attacker specified URL. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:R/S:C/C:N/I:L/A:N`, 4.7). It is now mitigated in the latest release and is assigned [CVE-2022-0283](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0283).

This vulnerability has been discovered internally by the GitLab team.

## Issue link was disclosing the linked issue

Improper access control allowed for project non-members to retrieve issue details when it was linked to an item form the vulnerability dashboard in GitLab CE/EE. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-0390](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0390).

Thanks [wi11](https://hackerone.com/wi11) for reporting this vulnerability through our HackerOne bug bounty program.

## Service Desk email accessible by project non-members

Improper access control allows project non-members to retrieve the Service Desk email address in GitLab CE/EE. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-0373](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0373).

Thanks [albatraoz](https://hackerone.com/albatraoz) for reporting this vulnerability through our HackerOne bug bounty program.

## Authenticated users can search other users by their private email

GitLab search may allow authenticated users to search other users by their respective private emails even if a user set their email to private. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-0371](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0371).

Customers may continue to search GitLab through the following methods:

- Search via public email
- Search via username
- Query Users API for user id
- Use our new [Provisioned Users endpoint](https://docs.gitlab.com/ee/api/groups.html#list-provisioned-users) (if you use Group SAML or SCIM)
- Use an Admin token to search for the users via the API (if you are on a GitLab self-managed instance)

This vulnerability was found internally by a member of the GitLab team.

## "External status checks" can be accepted by users below developer access if the user is either author or assignee of the target merge request

An authorization logic error in the External Status Check API in GitLab EE affecting all versions starting from 14.1 before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2, allowed a user to update the status of the check via an API call. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39943](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39943).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Deleting packages in bulk from package registries may cause table locks

An issue has been discovered in GitLab affecting all versions starting from 11.9 before 14.5.4, all versions starting from 14.6.0 before 14.6.4, all versions starting from 14.7.0 before 14.7.1. GitLab was not correctly handling bulk requests to delete existing packages from the package registries which could result in a Denial of Service under specific conditions. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:N/A:H`, 4.9). It is now mitigated in the latest release and is assigned [AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:N/A:H](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0477).

This vulnerability was found internally by a member of the GitLab team.

## Autocomplete enabled on specific pages

An issue has been discovered in GitLab affecting all versions starting from 14.0 before 14.4.5, all versions starting from 14.5.0 before 14.5.3, all versions starting from 14.6.0 before 14.6.2. GitLab was not disabling the `Autocomplete` attribute of fields related to sensitive information making it possible to be retrieved under certain conditions. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:H/UI:R/S:U/C:L/I:L/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2022-0167](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0167).

This vulnerability has been discovered internally by the GitLab team.

## Possible SSRF due to not blocking shared address space

A vulnerability was discovered in GitLab starting with version 12. GitLab was vulnerable to a blind SSRF attack since requests to shared address space were not blocked. . This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:L/I:N/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2022-0249](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0249).

Thanks [no1zy](https://hackerone.com/no1zy) for reporting this vulnerability through our HackerOne bug bounty program.

## System notes reveals private project path when Issue is moved to a public project

An issue has been discovered in GitLab affecting all versions starting from 10.0 before 14.5.4, all versions starting from 10.1 before 14.6.4, all versions starting from 10.2 before 14.7.1. Private project paths can be disclosed to unauthorized users via system notes when an Issue is closed via a Merge Request and later moved to a public project. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:N/UI:R/S:U/C:L/I:N/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2022-0344](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0344).

Thanks [ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for reporting this vulnerability through our HackerOne bug bounty program.

## Timeout for pages using Markdown

An issue has been discovered in GitLab CE/EE affecting all versions starting with version 8.10. It was possible to trigger a timeout on a page with markdown by using a specific amount of block-quotes. This is a low severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:U/C:N/I:N/A:L`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2022-0488](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0488).

This vulnerability has been discovered internally by the GitLab team.

## Certain branch names could not be protected

In some cases, branch names containing HTML tags were not properly being protected. This is a follow-up to [CVE-2021-39931](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39931).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Update Mattermost

The version of Mattermost has been updated to 6.1.1 in order to mitigate security concerns.

### Versions affected

Affects GitLab Omnibus prior to 14.7

## Update Go

The version of Go used in the GitLab Omnibus `.gitlab-ci.yml` file has been updated to 2.9.1 in order to mitigate security concerns.

### Versions affected

Affects GitLab Omnibus prior to 14.7

## Update Rouge

The version of Rouge has been updated to 3.27.0 in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab CE/EE

## Update Mermaid

The version of Mermaid has been updated to 8.13.10 in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab CE/EE

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).

