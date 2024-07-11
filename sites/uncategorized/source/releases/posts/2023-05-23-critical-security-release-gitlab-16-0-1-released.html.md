---
title: "GitLab Critical Security Release: 16.0.1"
description: "Learn more about GitLab Critical Security Release: 16.0.1 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2023/05/23/critical-security-release-gitlab-16-0-1-released/"
categories: releases
author: Rohit Shambhuni
author_gitlab: rshambhuni
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing version 16.0.1 for GitLab Community Edition (CE) and Enterprise Edition (EE). It is only required for installations running 16.0.0. Earlier versions are not affected.

This version contains important security fixes, and we strongly recommend that GitLab installations running 16.0.0 be upgraded immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=created_date&state=closed&label_name%5B%5D=bug%3A%3Avulnerability&confidential=no&first_page_size=100) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Arbitrary file read via uploads path traversal](#arbitrary-file-read-via-uploads-path-traversal)|critical|

## Arbitrary file read via uploads path traversal

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/891 -->

An issue has been discovered in GitLab CE/EE affecting only version 16.0.0. An unauthenticated malicious user can use a path traversal vulnerability to read 
arbitrary files on the server when an attachment exists in a public project nested within at least five groups. This is a critical severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:H/I:H/A:N`, 10.0). It is now mitigated in the latest release and is assigned [CVE-2023-2825](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2825).

Thanks [pwnie](https://hackerone.com/pwnie) for reporting this vulnerability through our HackerOne bug bounty program.

## Updating

To update GitLab, see the [Update page](/update).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
