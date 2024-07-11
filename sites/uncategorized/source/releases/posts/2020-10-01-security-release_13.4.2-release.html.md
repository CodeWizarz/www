---
title: "GitLab Security Release: 13.4.2, 13.3.7 and 13.2.10"
description: "Learn more about GitLab Security Release: 13.4.2, 13.3.7 and 13.2.10 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2020/10/01/security-release-13-4-2-release/"
categories: releases
author: Ron Chan
author_gitlab: rchan
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 13.4.2, 13.3.7 and 13.2.10 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are [two types of security releases](/security/#gitlab-security-releases): a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

## Potential Denial Of Service Via Update Release Links API

A potential DoS vulnerability was discovered in release api, certain user supplied values could rise the CPU usage. This issue is now mitigated in the latest release and is assigned [CVE-2020-13333](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13333).

Thanks [@anyday](https://hackerone.com/anyday) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 13.1 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Insecure Storage of Session Key In Redis

Under certain condition an unauthorised user could read the Redis keys and use to obtain a valid session. This issue is now mitigated in the latest release and is assigned [CVE-2020-13344](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13344).

Thanks [@rabbitfang](https://gitlab.com/rabbitfang) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 10.8 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Improper Access Expiration Date Validation 

It was possible for users to access projects with an expired access date. This issue is now mitigated in the latest release and is assigned [CVE-2020-13332](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13332).

Thanks [@henonoah](https://hackerone.com/henonoah) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 8.11.0-rc6+ and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Cross-Site Scripting in Multiple Pages

A reflected cross-site scripting was discovred in different pages. This issue is now mitigated in the latest release and  is assigned [CVE-2020-13345](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13345).

Thanks [@vakzz](https://hackerone.com/vakzz) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 10.8 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Unauthorized Users Can View Custom Project Template

An unauthorised user was able to view private custom project template. This issue is now mitigated in the latest release and is assigned [CVE-2020-13343](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13343).

Thanks [@jobert](https://hackerone.com/jobert) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 11.2 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Cross-Site Scripting in SVG Image Preview

A stored cross-site scripting was found in SVG image preview. This issue is now mitigated in the latest release and is assigned [CVE-2020-13339](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13339).

Thanks [@aryan2808](https://hackerone.com/aryan2808) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 12.10 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Incomplete Handling in Account Deletion

It was discovered that there was insufficient check before account deletion which allowed an account to be deleted while being the owner of a group. This issue is now mitigated in the latest release and is assigned [CVE-2020-13335](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13335).

Thanks [@brdoors3](https://hackerone.com/brdoors3) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 7.12 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Insufficient Rate Limiting at Re-Sending Confirmation Email

It was discovered that there was insufficient rate-limiting at re-sending confirmatil email. This issue is now mitigated in the latest release and is assigned [CVE-2020-13341](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13342).

Thanks [@yuanchenlu](https://gitlab.com/yuanchenlu) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 10.1.0 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Improper Type Check in GraphQL

It was discovered that due to an improper type check in GraphQL users with developer role were able to perform unauthorised actions. This issue is now mitigated in the latest release and is assigned [CVE-2020-13341](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13341).

Thanks [@ledz1996](https://gitlab.com/ledz1996) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 13.1 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## To-dos Are Not Redacted When Membership Changes

It was discovered that after membership changes were applied, the to-do list was not redacted properly. This issue is now mitigated in the latest release and is assigned [CVE-2020-13346](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13346).

Thanks [@vaib25vicky](https://gitlab.com/vaib25vicky) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 11.2 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Guest users can modify confidentiality attribute

It was discovered that improper authorization checks allows a non-member of a project/group to change the confidentiality attribute of issue via mutation GraphQL query. This issue is now mitigated in the latest release and is assigned [CVE-2020-13334](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13334).

Thanks [@0xwintermute](https://hackerone.com/0xwintermute) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 8.6 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Command injection on runner host

It was discovered that improper validation of authorization configuration allowed arbitary command execution on windows runner host. This issue is now mitigated in the latest release and is assigned [CVE-2020-13347](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13347).

Thanks [@ajxchapman](https://hackerone.com/ajxchapman) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab Runner 12.0.0 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Insecure Runner Configuration in Kubernetes Environments 

An internal investigation revealed a security issue in GitLab Runner configuration used with Kubernetes environments that could be used to perform a MitM(Man in the Middle) attack. This issue is now mitigated in the latest release and is assigned [CVE-2020-13327](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13327).

### Versions Affected
Affects GitLab Runner 13.2, 13.3, 13.4 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

------------

## Updating
To update GitLab, see the [update page](/update/).

## Receive Security Release Notifications
To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
