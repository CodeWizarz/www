---
title: "GitLab Critical Security Release: 13.10.3, 13.9.6, and 13.8.8"
description: "Learn more about GitLab Critical Security Release: 13.10.3, 13.9.6, and 13.8.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2021/04/14/security-release-gitlab-13-10-3-released/"
categories: releases
author: Dominic Couture
author_gitlab: dcouture
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 13.10.3, 13.9.6, and 13.8.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc secu
rity releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, t
he issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the
latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

## Table of Fixes

|Title|Severity|
|---|---|
|[Remote code execution when uploading specially crafted image files](#Remote-code-execution-when-uploading-specially-crafted-image-files)|critical|
| [Update Rexml](#Update-Rexml) | Dependency update - critical | 

## Remote code execution when uploading specially crafted image files

An issue has been discovered in GitLab CE/EE affecting all versions starting from 11.9. GitLab was not properly validating image files that is passed to a file parser which resulted in a remote command execution. This is a critical severity issue (`AV:N/AC:L/PR:L/UI:N/S:C/C:H/I:H/A:H`, 9.9). It is now mitigated in the latest release and is assigned [CVE-2021-22205](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22205).

Thanks [vakzz](https://hackerone.com/vakzz) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Update Rexml

The Rexml ruby gem was upgraded to version 3.2.5 in order to mitigate [CVE-2021-28965](https://www.ruby-lang.org/en/news/2021/04/05/xml-round-trip-vulnerability-in-rexml-cve-2021-28965/).

### Versions affected

Affects versions 7.12 and later.

## Updating

To update GitLab, see the [Update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
