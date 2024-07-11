---
title: "GitLab Security Release: 14.2.2, 14.1.4, and 14.0.9"
description: "Learn more about GitLab Security Release: 14.2.2, 14.1.4, and 14.0.9 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2021/08/31/security-release-gitlab-14-2-2-released/"
categories: releases
author: Andrew Kelly
author_gitlab: ankelly
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 14.2.2, 14.1.4, and 14.0.9 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

## Table of Fixes

|Title|Severity|
|---|---|
|[Stored XSS in DataDog Integration](#stored-xss-in-datadog-integration)|high|
|[Invited group members continue to have project access even after invited group is deleted](#invited-group-members-continue-to-have-project-access-even-after-invited-group-is-deleted)|medium|
|[Specially crafted requests to apollo_upload_server middleware leads to denial of service](#specially-crafted-requests-to-apollo_upload_server-middleware-leads-to-denial-of-service)|medium|
|[Privilege escalation of an external user through project token](#privilege-escalation-of-an-external-user-through-project-token)|medium|
|[Missing access control allows non-admin users to add/remove Jira Connect Namespaces](#missing-access-control-allows-non-admin-users-to-addremove-jira-connect-namespaces)|medium|
|[User enumeration on private instances](#user-enumeration-on-private-instances)|medium|
|[Member e-mails can be revealed via project import/export feature](#member-e-mails-can-be-revealed-via-project-importexport-feature)|medium|
|[Stored XSS in Jira integration](#stored-xss-in-jira-integration)|medium|
|[Stored XSS in markdown via the Design reference](#stored-xss-in-markdown-via-the-design-reference)|medium|

## Stored XSS in DataDog Integration

A stored Cross-Site Scripting vulnerability in the DataDog integration in GitLab CE/EE version 13.7 and above allows an attacker to execute arbitrary JavaScript code on the victim's behalf. This is a high severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:R/S:C/C:H/I:H/A:N`, 7.7). We have requested a CVE ID and will update this blog post when it is assigned.

Thanks shells3c for reporting this vulnerability through our HackerOne bug bounty program.

## Invited group members continue to have project access even after invited group is deleted

Under specialized conditions, an invited group member may continue to have access to a project even after the invited group, which the member was part of, is deleted. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:H/I:H/A:N`, 6.8). We have requested a CVE ID and will update this blog post when it is assigned.

This vulnerability was discovered internally by the member of the GitLab team.

## Specially crafted requests to apollo_upload_server middleware leads to denial of service

A Denial Of Service vulnerability in the apollo_upload_server Ruby gem in GitLab CE/EE version 11.11 and above allows an attacker to deny access to all users via specially crafted requests to the apollo_upload_server middleware. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H`, 6.5). We have requested a CVE ID and will update this blog post when it is assigned.

Thanks 0xn3va for reporting this vulnerability through our HackerOne bug bounty program.

## Privilege escalation of an external user through project token

A user account with 'external' status which is granted 'Maintainer' role on any project on the GitLab instance where 'project tokens' are allowed may elevate its privilege to 'Internal' and access Internal projects. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:N/S:U/C:H/I:L/A:N`, 5.5). We have requested a CVE ID and will update this blog post when it is assigned.

Thanks @joaxcar for reporting this vulnerability through our HackerOne bug bounty program.

## Missing access control allows non-admin users to add/remove Jira Connect Namespaces

Missing access control in GitLab version 13.10 and above with Jira Cloud integration enabled allows Jira users without administrative privileges to add and remove Jira Connect Namespaces via the GitLab.com for Jira Cloud application configuration page. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:L`, 5.4). We have requested a CVE ID and will update this blog post when it is assigned.

Thanks updatelap for reporting this vulnerability through our HackerOne bug bounty program.

## User enumeration on private instances

An issue has been discovered in GitLab affecting all versions starting from 14.0 before 14.0.9, all versions starting from 14.1 before 14.1.4, all versions starting from 14.2 before 14.2.2. The route for /user.keys is not restricted on instances with public visibility disabled. This allows user enumeration on such instances. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2021-22257](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22257).

GitLab would like to thank a customer who reported this issue.

Upgrade note: Please be aware that the fix for this finding makes the `/:username.keys` and `/api/v4/users/:id/keys` endpoints behave the same. The result is that these endpoints will not be publicly accessible when the restricted public visibility setting is enabled by the instance admin. This could result in some workflows breaking. In this situation, the solution would be to create a Personal Access Token with the `read_user` scope.

## Member e-mails can be revealed via project import/export feature

The project import/export feature in GitLab 8.9 and greater could be used to obtain otherwise private email addresses. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-22258](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22258).

Thanks ngalog for reporting this vulnerability through our HackerOne bug bounty program.

## Stored XSS in Jira integration

A stored Cross-Site Scripting vulnerability in the Jira integration in GitLab version 13.7 and above allows an attacker to execute arbitrary JavaScript code on the victim's behalf via malicious Jira API responses. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:H/UI:R/S:C/C:L/I:L/A:N`, 4.0). We have requested a CVE ID and will update this blog post when it is assigned.

Thanks thornguyen for reporting this vulnerability through our HackerOne bug bounty program.

## Stored XSS in markdown via the Design reference

An issue has been discovered in GitLab affecting all versions starting with 13.3. GitLab was vulnerable to a stored XSS by using the design feature in issues. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:C/C:H/I:N/A:N`, 6.8). It is now mitigated in the latest release and is assigned [CVE-2021-22238](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22238).

Thanks vakzz for reporting this vulnerability through our HackerOne bug bounty program.

## Update cURL

The version of cURL included in GitLab Omnibus has been updated to 7.77.0 in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab Omnibus

## Update PostgreSQL

The version of PostgreSQL that is bundled with GitLab Omnibus was updated to 12.7 in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab Omnibus

## Patch nginx

A patch was applied in GitLab Omnibus version 14.0.9 to mitigate a security concern related to nginx. Versions 14.1 and later already contain fixes for this security concern.

### Versions affected

Affects GitLab Omnibus 14.0 until 14.0.9

## Updating

To update GitLab, see the [Update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
