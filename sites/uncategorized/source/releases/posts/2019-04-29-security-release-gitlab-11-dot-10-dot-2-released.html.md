---
title: "GitLab Security Release: 11.10.2, 11.9.10, and 11.8.9"
description: "Learn more about GitLab Security Release: 11.10.2, 11.9.10, and 11.8.9 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/04/29/security-release-gitlab-11-dot-10-dot-2-released/"
categories: releases
author: Juan Broullon
author_gitlab: jbroullon
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 11.10.2, 11.9.10, and 11.8.9 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab-ce/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=security) in approximately 30 days.

Please read on for more information regarding this release.

## Moving an Issue to Private Repo Leaks Project Namespace

When an issue was moved to a private project, the private project namespace was leaked to unauthorized users with access to the original issue. The issue is now mitigated in the latest release and is assigned [CVE-2019-11545](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11545).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Notification Emails Sent to Restricted Users

Non-member users who subscribed to notifications of an internal project with issue and repository restrictions would receive emails about restricted events. The issue is now mitigated in the latest release and is assigned [CVE-2019-11544](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11544).

Thanks to [@yashrs](https://hackerone.com/yashrs) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.10 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Unauthorized Comments on Confidential Issues

Unprivileged members of a project were able to post comments on confidential issues through an authorization issue in the note endpoint. The issue is now mitigated in the latest release and is assigned [CVE-2019-11548](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11548).

Thanks to @mishre for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 5.4.0 through 11.8.8.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Merge Request Approval Count Inflation

A Race Condition vulnerability was discovered which could allow users to approve a merge request multiple times and potentially reach the approval count required to merge. The issue is now mitigated in the latest release and is assigned [CVE-2019-11546](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11546).

Thanks to [@flashdisk](https://hackerone.com/flashdisk) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Unsanitized Branch Names on New Merge Request Notification Emails

The branch name on new merge request notification emails wasn't being escaped, which could potentially lead to XSS issues. The issue is now mitigated in the latest release and is assigned [CVE-2019-11547](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11547).

Thanks to [@mario-areias](https://hackerone.com/mario-areias) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 6.0.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Improper Sanitation of Credentials in Gitaly

Gitaly has been upgraded to fix an information disclosure issue where HTTP/GIT credentials were included in logs on connection errors. The issue is now mitigated in the latest release and is assigned [CVE-2019-11549](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11549).

Thanks to @j-jam for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Upgrade to Rails 5.0.7.2

Ruby on Rails was upgraded to version 5.0.7.2 for the Gitlab 11.10.2 package. This Ruby on Rails release contains several security fixes.

## Updating

To update GitLab, see the [update page](/update/).
