---
title: "GitLab Security Release: 13.8.4, 13.7.7 and 13.6.7"
description: "Learn more about GitLab Security Release: 13.8.4, 13.7.7 and 13.6.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2021/02/11/security-release-gitlab-13-8-4-released/"
categories: releases
author: Costel Maxim
author_gitlab: cmaxim
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 13.8.4, 13.7.7 and 13.6.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.


## Improper Certificate Validation for Fortinet OTP

Starting with version 13.7 the Gitlab CE/EE editions were affected by a security issue related to the validation of the certificates for the Fortinet OTP that could result in authentication issues. This issue is now mitigated in the latest release and is assigned [CVE-2021-22189](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22189).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Denial of Service Attack on gitlab-shell

Potential DoS was identified in gitlab-shell in GitLab CE/EE version 12.6.0 or above, which allows an attacker to spike the server resource utilization via gitlab-shell command. This issue is now mitigated in the latest release and is assigned [CVE-2021-22177](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22177).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.


## Resource exhaustion due to pending jobs 

An issue has been discovered in GitLab affecting all versions of Gitlab EE/CE before 12.6.7. A potential resource exhaustion issue that allowed running or pending jobs to continue even after project was deleted. This issue is now mitigated in the latest release and is assigned [CVE-2021-22187](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22187).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Confidential issue titles were exposed

An issue has been discovered in GitLab affecting all versions starting with 13.0. Confidential issue titles in Gitlab were readable by an unauthorised user via branch logs. This issue is now mitigated in the latest release and is assigned [CVE-2021-22188](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22188).

Thanks [@aemirercin](https://hackerone.com/aemirercin?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.


## Improper access control allowed demoted project members to access authored merge requests

An issue has been discovered in GitLab affecting all versions starting with 3.0.1. Improper access control allows demoted project members to access details on authored merge requests. This issue is now mitigated in the latest release and is assigned [CVE-2021-22176](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22176).

Thanks [@muthu_prakash](https://hackerone.com/muthu_prakash?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Improper access control allowed unauthorized users to access analytic pages

An issue has been discovered in GitLab affecting all versions starting with 13.4. Improper access control allows unauthorized users to access details on analytic pages. This issue is now mitigated in the latest release and is assigned [CVE-2021-22180](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22180).

Thanks [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Unauthenticated CI lint API may lead to information disclosure and SSRF

When requests to the internal network for webhooks are enabled, a server-side request forgery vulnerability in GitLab affecting all versions starting from 10.5 was possible to exploit for an unauthenticated attacker even on a GitLab instance where registration is disabled. This issue is now mitigated in the latest release and is assigned [CVE-2021-22175](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22175). 

Thanks [@myster](https://hackerone.com/myster?type=user) for reporting this vulnerability through our HackerOne bug bounty program

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Prometheus integration in Gitlab may lead to SSRF

An issue has been discovered in GitLab affecting all versions starting from 13.2. Gitlab was vulnerable to server-side request forgery vulnerability attack due when Prometheus was used. This issue is now mitigated in the latest release and is assigned [CVE-2021-22178](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22178).


Thanks [@yvvdwf](https://hackerone.com/yvvdwf?type=user) for reporting this vulnerability through our HackerOne bug bounty program

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
