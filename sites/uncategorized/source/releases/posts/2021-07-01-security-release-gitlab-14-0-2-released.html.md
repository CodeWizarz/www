---
title: "GitLab Security Release: 14.0.2, 13.12.6, and 13.11.6"
description: "Learn more about GitLab Security Release: 14.0.2, 13.12.6, and 13.11.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2021/07/01/security-release-gitlab-14-0-2-released/"
categories: releases
author: Costel Maxim
author_gitlab: cmaxim
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 14.0.2, 13.12.6, and 13.11.6 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

## Table of Fixes

|Title|Severity|
|---|---|
|[DoS using Webhook connections ](#DoS-using-Webhook-connections)|high|
|[CSRF on GraphQL API allows executing mutations through GET requests](#csrf-on-graphql-api-allows-executing-mutations-through-get-requests)|high|
|[Private projects information disclosure](#private-projects-information-disclosure)|medium|
|[Single sign-on users not getting blocked](#single-sign-on-users-not-getting-blocked)|medium|
|[Some users can push to Protected Branch with Deploy keys](#some-users-can-push-to-protected-branch-with-deploy-keys)|medium|
|[A deactivated user can access data through GraphQL](#a-deactivated-user-can-access-data-through-graphql)|medium|
|[Reflected XSS in release edit page](#reflected-xss-in-release-edit-page)|medium|
|[Clipboard DOM-based XSS](#clipboard-dom-based-xss)|medium|
|[Stored XSS on Audit Log](#stored-xss-on-audit-log)|medium|
|[Forks of public projects by project members could leak codebase](#forks-of-public-projects-by-project-members-could-leak-codebase)|medium|
|[Improper text rendering](#improper-text-rendering)|medium|
|[HTML Injection in full name field](#html-injection-in-full-name-field)|low|
|[Denial of service of user profile page](#denial-of-service-of-user-profile-page)|medium|
|[Update Nokogiri](#update-nokogiri) | low |
|[Update Mattermost](#update-mattermost) | medium |
|[Update Redis](#update-redis) | medium |
|[Update Rdoc](#update-rdoc) | medium |
|[Update libxml2](#update-libxml2) | medium |
|[Update Rails gem](#update-Rails-gem) | medium |

## DoS using Webhook connections

A vulnerability was discovered in GitLab versions before 14.0.2, 13.12.6, 13.11.6. GitLab Webhook feature could be abused to perform denial of service attacks. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:C/C:N/I:N/A:H`, 7.7). We have requested a CVE ID and will update this blog post when it is assigned.

Thanks [afewgoats](https://hackerone.com/afewgoats) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## CSRF on GraphQL API allows executing mutations through GET requests

A cross-site request forgery vulnerability in the GraphQL API in GitLab since version 13.12 and before versions 13.12.6 and 14.0.2 allowed an attacker to call mutations as the victim. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:R/S:U/C:L/I:H/A:N`, 7.1). We have requested a CVE ID and will update this blog post when it is assigned.

Thanks [az3z3l](https://hackerone.com/az3z3l) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Private projects information disclosure

An information disclosure vulnerability was found in GitLab EE versions 13.10 and later allowed a user to read project details. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). We have requested a CVE ID and will update this blog post when it is assigned.

Thanks [0xn3va](https://hackerone.com/0xn3va) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Single sign-on users not getting blocked

Improper access control in GitLab EE before versions 13.11.6, 13.12.6, and 14.0.2 allowed users to be created via single sign on despite user cap being enabled. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:L/I:L/A:N`, 4.2). We have requested a CVE ID and will update this blog post when it is assigned.

Thanks [bingomzan](https://hackerone.com/bingomzan) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Some users can push to Protected Branch with Deploy keys

Under certain conditions, some users were able to push to protected branches that were restricted to deploy keys in GitLab CE/EE since version 13.9. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:N/S:U/C:H/I:H/A:N`, 6.5). We have requested a CVE ID and will update this blog post when it is assigned.

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## A deactivated user can access data through GraphQL

An issue has been discovered in GitLab affecting all versions. Improper access control allows unauthorised users to access project details using Graphql. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N`, 6.5). We have requested a CVE ID and will update this blog post when it is assigned.

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Reflected XSS in release edit page

A reflected cross-site scripting vulnerability in GitLab before versions 13.11.6, 13.12.6 and 14.0.2 allowed an attacker to send a malicious link to a victim and trigger actions on their behalf if they clicked it. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:R/S:C/C:L/I:L/A:N`, 6.1). We have requested a CVE ID and will update this blog post when it is assigned.

Thanks [ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Clipboard DOM-based XSS

Improper input sanitization in markdown in GitLab CE/EE version 13.11 and up allowed an attacker to exploit a stored cross-site scripting vulnerability via a specially-crafted input. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:N/UI:R/S:C/C:L/I:L/A:N`, 4.7). We have requested a CVE ID and will update this blog post when it is assigned.

Thanks [vovohelofor](https://hackerone.com/vovohelo) reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Stored XSS on Audit Log

Client-Side code injection through Feature Flag name starting with GitLab CE/EE 11.9 allows a specially crafted feature flag name to PUT requests on behalf of other users via clicking on a link. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:R/S:C/C:L/I:L/A:N`, 6.1). It is now mitigated in the latest release and is assigned [CVE-2021-22223](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22223).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Forks of public projects by project members could leak codebase

An issue has been discovered in GitLab CE/EE affecting all versions starting with 12.8. Under a special condition it was possible to access data of an internal repository through project fork done by a project member. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:N/A:N`, 5.9). We have requested a CVE ID and will update this blog post when it is assigned.

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Improper text rendering

Improper text rendering while rendering merge requests could be exploited to submit malicious code. This vulnerability affects GitLab CE/EE 9.3 and later through 13.11.6, 13.12.6, and 14.0.2. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:H/A:N`, 4.9). We have requested a CVE ID and will update this blog post when it is assigned.

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## HTML Injection in full name field

HTML injection was possible via the full name field before versions 13.11.6, 13.12.6, and 14.0.2 in GitLab CE. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:U/C:N/I:L/A:N`, 3.5). We have requested a CVE ID and will update this blog post when it is assigned.

Thanks [andor404](https://hackerone.com/andor404) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Denial of service of user profile page

A denial of service in user's profile page is found starting with GitLab CE/EE 8.0 that allows attacker to reject access to their profile page via using a specially crafted username. This is a low severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:L/S:U/C:N/I:N/A:L`, 3.5). We have requested a CVE ID and will update this blog post when it is assigned.

Thanks [maruthi12](https://hackerone.com/maruthi12) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Update Nokogiri

Nokogiri has been upgraded to 1.11.4 in order to mitigate security concerns.

### Versions affected

Affects all versions.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Update Mattermost

Mattermost has been upgraded to 5.33.5 in order to mitigate security concerns.

### Versions affected

Affects versions 13.10 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Update Redis

Redis has been upgraded to 6.0.14 in order to mitigate security concerns.

### Versions affected

Affects versions 13.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Update Rdoc

Rdoc has been upgraded to 6.3.1 in order to mitigate security concerns.

### Versions affected

Affects all versions.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Update libxml2

libxml2 has been upgraded to 2.9.11 in order to mitigate security concerns.

### Versions affected

Affects all versions.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Update Rails gem

The Rails gem has been upgraded to 6.0.3.7 in order to mitigate security concerns.

### Versions affected

Affects all versions.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Updating

To update GitLab, see the [Update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).

