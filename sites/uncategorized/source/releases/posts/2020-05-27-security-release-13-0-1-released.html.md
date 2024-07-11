---
title: "GitLab Security Release: 13.0.1, 12.10.7, 12.9.8"
description: "Learn more about GitLab Security Release: 13.0.1, 12.10.7, 12.9.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2020/05/27/security-release-13-0-1-released/"
categories: releases
author: Juan Broullon
author_gitlab: jbroullon
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 13.0.1, 12.10.7, 12.9.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

GitLab releases patches for vulnerabilities in dedicated security releases. There are [two types of security releases](/security/#gitlab-security-releases): a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.  

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards.  As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to at least the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](https://about.gitlab.com/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.


## User Email Verification Bypass
A security issue allowed users to bypass the email verification process. This issue is now mitigated in the latest release and is assigned [CVE-2020-13265](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13265).

Thanks to [@zapprising](https://hackerone.com/zapprising) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab CE/EE 12.5 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## OAuth Flow Missing Email Verification Checks
A vulnerability allowed unverified users to use OAuth authorization code flow, which could potentially affect third party applications that use GitLab as an identity provider. This issue is now mitigated in the latest release and is assigned [CVE-2020-13272](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13272).

Thanks to [@peet86](https://hackerone.com/peet86) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab CE/EE 12.3+ and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Notification Email Verification Bypass
A vulnerability was identified that allowed users to set an unverified email address as notification email. This issue is now mitigated in the latest release and is assigned [CVE-2020-13276](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13276).

Thanks to [@rgupt](https://hackerone.com/rgupt) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all previous GitLab CE/EE versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Server-Side Request Forgery in Grafana
A vulnerability in Grafana allowed unauthenticated users to send HTTP requests to internal network resources and read their responses. Further details are available  [on the Grafana blog](https://grafana.com/blog/2020/06/03/grafana-6.7.4-and-7.0.2-released-with-important-security-fix/). This issue is now mitigated in the latest release and is assigned [CVE-2020-13379](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13379).

Thanks to [@rhynorater](https://hackerone.com/rhynorater) and [@nnwakelam](https://hackerone.com/nnwakelam) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 11.9 and later

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Group Sign-Up Restriction Bypass
A user with an unverified address within the restricted domain could request access to domain restricted groups. This issue is now mitigated in the latest release and is assigned [CVE-2020-13275](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13275).

Thanks to [@izzsec](https://hackerone.com/izzsec) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 12.2 and later

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Mirror Project Owner Impersonation
A security issue related to mirror project deletions could lead to the impersonation of its owner. This issue is now mitigated in the latest release and is assigned [CVE-2020-13263](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13263).

Please note that the edit project API endpoint has been restricted and only admin users have the ability to set the `mirror_user_id`

Thanks to [@sky003](https://hackerone.com/sky003) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 9.5 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Missing Permission Check on Fork Relation Creation
A missing security check allowed guest users to create a fork relation on restricted public projects. This issue is now mitigated in the latest release and is assigned [CVE-2020-13270](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13270).

Thanks [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab CE/EE 11.3 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Cross-Site Scripting in Repository Files API
Under certain conditions, requests involving the repository files API could result in an XSS vulnerability. This issue is now mitigated in the latest release and is assigned [CVE-2020-13271](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13271).

Thanks [@rpadovani](https://hackerone.com/rpadovani) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all previous GitLab EE versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Kubernetes Cluster Token Disclosure
A security issue made the Kubernetes cluster token visible to other group maintainers. This issue is now mitigated in the latest release and is assigned [CVE-2020-13264](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13264).

Thanks [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab CE/EE between 10.3 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Object Storage File Enumeration
A specially crafted request could be used to confirm the existence of files hosted on object storage services, without disclosing their contents. This issue is now mitigated in the latest release and is assigned [CVE-2020-13268](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13268).

Thanks [@ledz1996](https://hackerone.com/ledz1996) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab CE/EE 12.10 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Insecure Authorization Check on Project Deploy Keys
An insecure authorization check allowed updating permissions of other users' deploy keys under certain conditions. This issue is now mitigated in the latest release and is assigned [CVE-2020-13266](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13266).

This vulnerability has been discovered internally by the GitLab Security Team.

### Versions Affected
Affects GitLab CE/EE 12.8 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Cross-Site Scripting on Metrics Dashboard
A Stored Cross-Site Scripting vulnerability allowed the execution on Javascript payloads on the Metrics Dashboard. This issue is now mitigated in the latest release and is assigned [CVE-2020-13267](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13267).

Thanks [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab CE/EE 12.8 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Denial of Service on Custom Dashboards
A security issue enabled denial of service attacks via memory exhaustion. This issue is now mitigated in the latest release and is assigned [CVE-2020-13273](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13273).

This vulnerability was discovered internally by the GitLab team. 

### Versions Affected
Affects GitLab CE/EE 12.0 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Client-Side Code Injection through Mermaid Markup
A specially crafted Mermaid payload allowed performing PUT requests on behalf of other users when clicking on a link. This issue is now mitigated in the latest release and is assigned [CVE-2020-13262](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13262).

Thanks [@yvvdwf](https://hackerone.com/yvvdwf) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab CE/EE 12.9 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Cross-Site Scripting on Static Site Editor
A Reflected Cross-Site Scripting has been discovered on the Static Site Editor. This issue is now mitigated in the latest release and is assigned [CVE-2020-13269](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13269).

Thanks [@bull](https://hackerone.com/bull) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab CE/EE 12.10 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of Amazon EKS Credentials
Amazon EKS Credentials were disclosed to other administrators of an instance through HTML source code. This issue is now mitigated in the latest release and is assigned [CVE-2020-13261](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13261).

Thanks [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab CE/EE 12.6 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Denial of Service on Workhorse
A security issue allowed achieving Denial of Service attacks through memory exhaustion by uploading malicious artifacts. This issue is now mitigated in the latest release and is assigned [CVE-2020-13274](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13274).

This vulnerability has been discovered internally by the GitLab Team.

### Versions Affected
Affects all previous GitLab CE/EE versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update Ruby
Ruby upgrades to version 2.6.6 have been backported to previous versions of GitLab. This upgrade includes security fixes for [CVE-2020-8130](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-8130).

### Versions Affected
Affects GitLab CE/EE 12.0 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.


## Updating
To update GitLab, see the [update page](/update/).

## Receive Security Release Notifications
To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
