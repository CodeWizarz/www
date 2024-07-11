---
title: "GitLab  Security Release: 12.6.2, 12.5.6, and 12.4.7"
description: "Learn more about GitLab Security Release: 12.6.2, 12.5.6, and 12.4.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2020/01/02/security-release-gitlab-12-6-2-released/"
categories: releases
author: Vitor Meireles De Sousa
author_gitlab: vdesousa
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.6.2, 12.5.6, and 12.4.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes that were inadvertently not included in our most recent security release. We strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) in approximately 30 days.

Please read on for more information regarding this release.

## Group Maintainers Can Update/Delete Group Runners Using API
Insufficient access verification lead to unauthorized modification of group runners through the API. This issue is now mitigated in the latest release and is assigned CVE-2019-20144.

Thanks [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 10.8 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## GraphQL Queries Can Hang the Application
Certain GraphQL queries can hang the application due to some server's missing parameters in handling time consuming queries. This issue is now mitigated in the latest release and is assigned CVE-2019-20146.

Thanks the GitLab team for finding and reporting this issue.

### Versions Affected
Affects GitLab EE/CE 11.0 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Unauthorized Users Have Access to Milestones of Releases
Under certain circumstances, an unauthenticated user can access a release's milestone and issues. This issue is now mitigated in the latest release and is assigned CVE-2019-20143.

Thanks [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 12.6.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Private Group Name Revealed Through Protected Tags API
When a group is removed from a project membership, it was possible for group members to see project namespace changes through the Protected Tags API. This issue is now mitigated in the latest release and is assigned CVE-2019-20147.

Thanks [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 9.1 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Users Can Publish Reviews on Locked Merge Requests
When a merge request was locked, a user was still able to submit a drafted review and publish. This issue is now mitigated in the latest release and is assigned CVE-2019-20145.

Thanks [@rafiem](https://hackerone.com/rafiem) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab CE/EE 11.4 and later.

### Remediation
We __strongly recommend__ that all installations running an affected version above are upgraded to the latest version as soon as possible.

## DoS in the Issue and Commit Comments Pages
While adding a comment in the Issue and Commit pages, a malicious user can cause  HTTP 500 code when sending a special message. This issue is now mitigated in the latest release and is assigned CVE-2019-20142.

Thanks [@dfens](https://hackerone.com/dfens) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab CE/EE 12.3 and later.

### Remediation
We __strongly recommend__ that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Project Name Disclosed Through Unsubscribe Link
When an unauthenticated user visits an unsubscribe link, a private project name can be disclosed under certain conditions. This issue is now mitigated in the latest release and is assigned CVE-2019-20148.

Thanks [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 8.13 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Private Project Name Disclosed Through Notification Settings
Under specific conditions an user can view the name of a private project through the notifications settings. This issue is now mitigated in the latest release and is assigned CVE-2020-5197.

Thanks [@iframe](https://hackerone.com/iframe) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 5.1 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating
To update GitLab, see the [Update page](/update/).

## Receive Security Release Notifications
To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
