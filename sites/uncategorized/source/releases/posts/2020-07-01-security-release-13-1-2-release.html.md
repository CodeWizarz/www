---
title: "GitLab Security Release: 13.1.2, 13.0.8 and 12.10.13"
description: "Learn more about GitLab Security Release: 13.1.2, 13.0.8 and 12.10.13 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2020/07/01/security-release-13-1-2-release/"
categories: releases
author: Costel Maxim
author_gitlab: cmaxim
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 13.1.2, 13.0.8 and 12.10.13 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are [two types of security releases](/security/#gitlab-security-releases): a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.


## Missing Permission Check on Time Tracking
It was possible to add time spent on a issue without being a project member. This issue is now mitigated in the latest release and is assigned [CVE-2020-13319](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13319).

Thanks [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 12.8 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Cross-Site Scripting in PyPi Files API
Under certain conditions, requests involving the PyPi files API could result in an XSS vulnerability. This issue is now mitigated in the latest release and is assigned [CVE-2020-13328](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13328).

Thanks [@vakzz](https://hackerone.com/vakzz) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 13.1 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Insecure Authorization Check on Private Project Security Dashboard
Under certain conditions, a project member with Guest permissions was allowed to view the project security dashboard.This issue is now mitigated in the latest release and is assigned [CVE-2020-13320](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13320).

Thanks [@vaib25vicky](https://hackerone.com/vaib25vicky) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 12.8 to 13.1.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Cross-Site Scripting in References
A stored cross-site scripting vulnerability was discovered when editing references. This issue is now mitigated in the latest release and is assigned [CVE-2020-13338](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13338).

Thanks [@vakzz](https://hackerone.com/vakzz) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 8.10.0 to 13.1.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Cross-Site Scripting in Group Names
An internal investigation revealed that Group Names could be used to store XSS payloads. TThis issue is now mitigated in the latest release and is assigned [CVE-2020-13327](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13337).

### Versions Affected
Affects GitLab EE 12.10 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Cross-Site Scripting in Blob Viewer
A stored XSS vulnerability was discovered in the blob viewer feature. This issue is now mitigated in the latest release and is assigned [CVE-2020-13329](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13329).

Thanks [@yvvdwf](https://hackerone.com/yvvdwf) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 12.6 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Cross-Site Scripting in Error Tracking 
A stored cross-site scripting payload could be injected in the Error Tracking page. This issue is now mitigated in the latest release and is assigned [CVE-2020-13336](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13336).

Thanks [@mike12](https://hackerone.com/mike12) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 12.10 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Insecure Authorisation Check on Creation and Deletion of Deploy Tokens 
An insecure authorization check allowed project members with Maintainer role to create and delete deploy tokens. This issue is now mitigated in the latest release and is assigned [CVE-2020-13322](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13322).

Thanks [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 12.9 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## User Name Format Restiction Bypass
Username format restrictions could be bypassed allowing for html tags to be added. TThis issue is now mitigated in the latest release and is assigned [CVE-2020-13321](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13321).

Thanks [@zseano](https://hackerone.com/zseano) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all versions of GitLab.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Denial of Service in Issue Comments
A denial of service vulnerability involving the comments on an issue was discovered. This issue is now mitigated in the latest release and is assigned [CVE-2020-13325](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13325).

Thanks @tiradorngpilipinas for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 12.9 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Cross-Site Scripting in Wiki Pages
A stored cross-site scripting vulnerability was discovered in the Wiki upload feature. This issue is now mitigated in the latest release and is assigned [CVE-2020-13331](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13331).

Thanks [@semsem123](https://hackerone.com/semsem123) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 12.10 and older.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Private Merge Request Updates Leaked via Todos
An internal investigation revealed that updates to private merge requests could be disclosed to removed project members. This issue is now mitigated in the latest release and is assigned [CVE-2020-13323](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13323).

### Versions Affected
Affects all versions of GitLab.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Private User Activity Leaked via API
Under certain conditions the private activty of an user could be exposed via the API. TThis issue is now mitigated in the latest release and is assigned [CVE-2020-13324](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13324).

Thanks [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 9.4 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

##  Cross-Site Scripting in Bitbucket Import Feature
A stored XSS vulnerability could be exploited using the Bitbucket project import feature. This issue is now mitigated in the latest release and is assigned [CVE-2020-13330](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13330).

Thanks [@saltyyolk of Chaitin Tech](https://hackerone.com/saltyyolk) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab  11.2 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

##  Github Project Restriction Bypass
It was possible to bypass the restriction of importing projects from Github via the API. This issue is now mitigated in the latest release and is assigned [CVE-2020-13326](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13326).

Thanks [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab  11.8 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update PCRE Dependency
The lippcre in PCRE has been upgraded from 8.42  to 8.44. This upgrade includes a security fix for CVE-2020-14155.

### Versions Affected
Affects all previous versions of GitLab Omnibus.

## Update Kaminari Gem
Using Kaminari before 1.2.1, an attacker could inject arbitrary code into pages with pagination links. This upgrade includes a security fix for CVE-2020-11082.

### Versions Affected
Affects all previous versions of GitLab Omnibus.

## Update Xterm.js 
A remote code execution exists in xterm.js before 3.9.2. This upgrade includes a security fix for CVE-2019-0542.

### Versions Affected
Affects all previous versions of GitLab Omnibus.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating
To update GitLab, see the [update page](/update/).

## Receive Security Release Notifications
To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
