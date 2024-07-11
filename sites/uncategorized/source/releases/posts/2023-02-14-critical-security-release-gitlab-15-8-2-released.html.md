---
title: "GitLab Critical Security Release: 15.8.2, 15.7.7 and 15.6.8"
description: "Learn more about GitLab Critical Security Release: 15.8.2, 15.7.7 and 15.6.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2023/02/14/critical-security-release-gitlab-15-8-2-released/"
categories: releases
author: Costel Maxim
author_gitlab: cmaxim
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.8.2, 15.7.7, and 15.6.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com and GitLab Dedicated are already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Security issues in Git](#security-issues-in-git)|Critical|

## Security issues in Git

This release addresses the security issues [CVE-2023-23946](https://nvd.nist.gov/vuln/detail/CVE-2023-23946) and [CVE-2023-22490](https://nvd.nist.gov/vuln/detail/CVE-2023-22490) in [Git](https://git-scm.com/).

These vulnerabilities affect all previous versions of GitLab.

The details of these vulnerabilities are as follows:

### CVE-2023-23946

A user can feed a specially crafted input to `git apply` to overwrite a path outside the working tree.

This can be used to execute arbitrary commands in GitLab installations within GitLab's Gitaly environment.

Credit for finding CVE-2023-23946 goes to Joern Schneeweisz of GitLab.

### CVE-2023-22490

Using a specially-crafted repository, Git can be tricked into using its local clone optimization even when using a non-local transport. Though Git will abort local clones whose source $GIT_DIR/objects directory contains symbolic links (c.f., CVE-2022-39253), the objects  directory itself may still be a symbolic link.

These two may be combined to include arbitrary files based on known paths on the victim's filesystem within the malicious repository's working copy, allowing for data exfiltration in a similar manner as CVE-2022-39253.

Credit for finding CVE-2023-22490 goes to yvvdwf.

## Update Python

Python has been updated to version 3.9.16 in order to mitigate security issues.

### Versions affected

Affects all GitLab Omnibus versions from 14.1 to 15.6.7, all 15.7 versions before 15.7.7, and all 15.8 versions before 15.8.2.

## Non-security patches

This security release also includes the following non-security patches.

Into 15.8.2:

* [Fix false positives for approved by insufficient users violation](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/110651)
* [gitaly: Remove readiness check](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/111527)

Into 15.7.7:

* [GitLab Version Check - Add feature flag](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/111585)
* [gitaly: Remove readiness check](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/111527)

## Updating

To update GitLab, see the [Update page](/update).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
