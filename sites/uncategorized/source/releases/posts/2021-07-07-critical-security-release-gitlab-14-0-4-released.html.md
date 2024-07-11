---
title: "GitLab Critical Security Release: 14.0.4, 13.12.8, and 13.11.7"
description: "Learn more about GitLab Critical Security Release: 14.0.4, 13.12.8, and 13.11.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2021/07/07/critical-security-release-gitlab-14-0-4-released/"
categories: releases
author: Costel Maxim
author_gitlab: cmaxim
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 14.0.4, 13.12.8, and 13.11.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

## Table of Fixes

|Title|Severity|
|---|---|
|[Arbitrary file read via design feature](#arbitrary-file-read-via-design-feature)|critical|

## Arbitrary file read via design feature

An issue has been discovered in GitLab CE/EE affecting all versions starting with 13.11, 13.12 and 14.0. A specially crafted [design](https://docs.gitlab.com/ee/user/project/issues/design_management.html) allowed attackers to read arbitrary files on the server. This is a critical severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:C/C:H/I:H/A:N`, 9.6). It is now mitigated in the latest release and is assigned [CVE-2021-22234](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22234). 

Thanks [vakzz](https://hackerone.com/vakzz) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Updating

To update GitLab, see the [Update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
