---
title: "GitLab Critical Security Release: 15.3.1, 15.2.3, 15.1.5"
description: "Learn more about GitLab Critical Security Release: 15.3.1, 15.2.3, 15.1.5 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2022/08/22/critical-security-release-gitlab-15-3-1-released/"
categories: releases
author: Nick Malcolm 
author_gitlab: nmalcolm
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.3.1, 15.2.3, 15.1.5 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Remote Command Execution via Github import](#Remote Command Execution via Github import)|Critical|


## Remote Command Execution via Github import

<!-- https://gitlab.com/gitlab-org/gitlab/-/issues/371098 -->

A vulnerability in GitLab CE/EE affecting all versions starting from 11.3.4 before 15.1.5, all versions starting from 15.2 before 15.2.3, all versions starting from 15.3 before 15.3.1 allows an an authenticated user to achieve remote code execution via the Import from GitHub API endpoint. This is a Critical severity issue (`AV:N/AC:L/PR:L/UI:N/S:C/C:H/I:H/A:H`,  9.9). It is now mitigated in the latest release and is assigned [CVE-2022-2884](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2884).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

### Workarounds

If you're unable to upgrade right away, you can secure your GitLab
installation against this vulnerability using the workaround outlined
below until you have time to upgrade.

#### Disable GitHub import

Login using an administrator account to your GitLab installation and perform the
following:

1. Click "Menu" -> "Admin".
1. Click "Settings" -> "General".
1. Expand the "Visibility and access controls" tab.
1. Under "Import sources" disable the "GitHub" option.
1. Click "Save changes".

### Verifying the workaround

1. In a browser window, login as any user.
1. Click "+" on the top bar.
1. Click "New project/repository".
1. Click "Import project".
1. Verify that "GitHub" does not appear as an import option.

## Updating

To update GitLab, see the [Update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
