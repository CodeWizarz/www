---
title: "GitLab Security Release: 12.9.1, 12.8.8, and 12.7.8"
description: "Learn more about GitLab Security Release: 12.9.1, 12.8.8, and 12.7.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2020/03/26/security-release-12-dot-9-dot-1-released/"
categories: releases
author: Vitor Meireles De Sousa
author_gitlab: vdesousa
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.9.1, 12.8.8, and 12.7.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) in approximately 30 days.

Please read on for more information regarding this release.

## Arbitrary File Read when Moving an Issue
An arbitrary local file read was possible when an moving issues between projects. This issue is now mitigated in the latest release and is assigned [CVE-2020-10977](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10977).

Thanks [@vakzz](https://hackerone.com/vakzz) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 8.5 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Path Traversal in NPM Package Registry
The NPM package registry was vulnerable to a path traversal issue. This issue is now mitigated in the latest release and is assigned [CVE-2020-10953](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10953).

Thanks to [@saltyyolk](https://hackerone.com/saltyyolk) of Chaitin Tech for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 11.7 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## SSRF on Project Import
An SSRF issue was discovered in the project import note feature. This issue is now mitigated in the latest release and is assigned [CVE-2020-10956](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10956).

Thanks [@vakzz](https://hackerone.com/vakzz) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 8.10 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## External Users Can Create Personal Snippet
Insufficient access verification lead to unauthorized creation of personal snippets through the API by an external user. This issue is now mitigated in the latest release and is assigned [CVE-2020-12275](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12275).

Thanks the GitLab team for finding and reporting this issue.

### Versions Affected
Affects GitLab EE/CE 12.6 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Triggers Decription Can be Updated by Other Maintainers in Project
A maintainer can modify other maintainers' pipeline trigger descriptions within the same project. This issue is now mitigated in the latest release and is assigned [CVE-2020-10981](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10981).

Thanks [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 9.0 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Information Disclosure on Confidential Issues Moved to Private Programs
Issues opened in a public project and then moved to a private project reveal the private project namespace through Web-UI and GraphQL API. This issue is now mitigated in the latest release and is assigned [CVE-2020-10978](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10978).

Thanks [@0xwintermute](https://hackerone.com/0xwintermute) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 8.11 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Potential DoS in Repository Archive Download
Repository archives download could be abused to cause large resource consumption on an instance. This issue is now mitigated in the latest release and is assigned [CVE-2020-10954](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10954).

Thanks the GitLab team for finding and reporting this issue.

### Versions Affected
Affects all previous versions of GitLab CE/EE.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Blocked Users Can Still Pull/Push Docker Images
Under certain circumstances a blocked user still had the ability to pull images from the internal container registry of any projects to which the user had access. This issue is now mitigated in the latest release and is assigned [CVE-2020-10952](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10952).

Thanks [@logan5](https://hackerone.com/logan5) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 8.11 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Repository Mirroring not Disabled when Feature not Activated
A project repository could still be mirrored when the feature was not enabled. This issue is now mitigated in the latest release and is assigned [CVE-2020-12277](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12277).

Thanks [@adam__b](https://hackerone.com/adam__b) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 10.8 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Vulnerability Feedback Page Was Leaking Information on Vulnerabilities
The vulnerability feedback page was leaking metadata and comments on vulnerabilities to unauthorized users. This issue is now mitigated in the latest release and is assigned [CVE-2020-10975](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10975) .

Thanks [@rpadovani](https://hackerone.com/rpadovani) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 10.8 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Stored XSS Vulnerability in Admin Feature
A stored XSS vulnerability was discovered in an admin notification feature. This issue is now mitigated in the latest release and is assigned [CVE-2020-12276](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12276).

Thanks the GitLab team for finding and reporting this issue.

### Versions Affected
Affects GitLab EE/CE 9.5.9 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Upload Feature Allowed a User to Read Unauthorized Exported Files
The upload feature was vulnerable to parameter tampering allowing and unauthorized user to read content available under specific folders. This issue is now mitigated in the latest release and is assigned [CVE-2020-10955](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10955).

Thanks [@manassehzhou](https://hackerone.com/manassehzhou) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 11.1 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Unauthorized Users Are Able to See CI Metrics 
Restricted CI pipelines metrics could be seen by members even if the pipeline was restricted. This issue is now mitigated in the latest release and is assigned [CVE-2020-10979](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10979).

Thanks [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 11.10 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Last Pipeline Status of a Merge Request Leaked
The last status of a restricted pipeline was returned through a query in the merge request widget. This issue is now mitigated in the latest release and is assigned [CVE-2020-10976](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10976).

Thanks [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 8.17 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Blind SSRF on FogBugz
A blind SSRF was discovered in the FogBugz integration. This issue is now mitigated in the latest release and is assigned [CVE-2020-10980](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10980).

Thanks [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 8.0 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update Nokogiri dependency
The Nokogiri dependency has been upgraded to 1.10.8. This upgrade include a security fix for [CVE-2020-7595](https://github.com/advisories/GHSA-7553-jr98-vx47).

### Versions Affected
Affects all previous versions of GitLab CE/EE.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update Pcre2 dependency 
The pcre2 dependency has been upgraded to 10.34. This upgrade include a security fix for [CVE-2019-20454](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-20454).

### Versions Affected
Affects all previous versions of GitLab CE/EE.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## New SSH keys not being added to the `authorized_keys` file
A bug in GitLab 12.9.0 prevented new SSH keys from being added to the Git user's
`authorized_keys` file, effectively breaking Git-over-SSH operations for new
users. See issue [#212178](https://gitlab.com/gitlab-org/gitlab/-/issues/212178)
for full details.

### Versions Affected
Affects GitLab 12.9.0 only.

### Remediation
Upgrade to GitLab 12.9.1 or later.

## Updating
To update GitLab, see the [update page](/update/).

## Receive Security Release Notifications
To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
