---
title: "GitLab Critical Security Release: 15.7.5, 15.6.6, and 15.5.9"
description: "Learn more about GitLab Critical Security Release: 15.7.5, 15.6.6, and 15.5.9 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2023/01/17/critical-security-release-gitlab-15-7-5-released/"
categories: releases
author: Nick Malcolm
author_gitlab: nmalcolm
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.7.5, 15.6.6, and 15.5.9 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com and GitLab Dedicated are already running the patched version.

UPDATE (2023-01-20): In addition, we have released GitLab Runner versions 15.8.0, 15.7.3, 15.6.3, and 15.5.2. These images contain updates to the [Docker helper images](https://docs.gitlab.com/runner/configuration/advanced-configuration.html#helper-image) to address the Git vulnerabilities.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Critical security issues in Git](#critical-security-issues-in-git)|Critical|

## Critical security issues in Git

This release addresses the security issues [CVE-2022-41903](https://nvd.nist.gov/vuln/detail/CVE-2022-41903) and [CVE-2022-23521](https://nvd.nist.gov/vuln/detail/CVE-2022-23521) in [Git](https://git-scm.com/).

These vulnerabilities affect all previous versions of GitLab.

The details of these vulnerabilities are as follows:

### CVE-2022-41903

The `git-log` command has the ability to display commits using an arbitrary format with its `--format` specifiers. This functionality is also exposed to `git-archive` via the `export-subst` gitattribute.

When processing the padding operators (e.g., `%<(`, `%<|(`, `%>(`, `%>>(`, or `%><( )`, an integer overflow can occur in `pretty.c::format_and_pad_commit()` where a `size_t` is improperly stored as an `int`, and then added as an offset to a subsequent `memcpy()` call.

This overflow can be triggered directly by a user running a command which invokes the commit formatting machinery (e.g., `git log --format=...`). It may also be triggered indirectly through `git-archive` via the `export-subst` mechanism, which expands format specifiers inside of files within the repository during a git archive.

This integer overflow can result in arbitrary heap writes, which may result in remote code execution.

Credit for finding CVE-2022-41903 goes to Joern Schneeweisz of GitLab.

### CVE-2022-23521

gitattributes are a mechanism to allow defining attributes for paths. These attributes can be defined by adding a `.gitattributes` file to the repository, which contains a set of file patterns and the attributes that should be set for paths matching this pattern.

When parsing gitattributes, multiple integer overflows can occur when there is a huge number of path patterns, a huge number of attributes for a single pattern, or when the declared attribute names are huge.

These overflows can be triggered via a crafted `.gitattributes` file that may be part of the commit history. Git silently splits lines longer than 2KB when parsing gitattributes from a file, but not when parsing them from the index. Consequentially, the failure mode depends on whether the file exists in the working tree, the index or both.

This integer overflow can result in arbitrary heap reads and writes, which may result in remote code execution.

Credit for finding CVE-2022-23521 goes to Markus Vervier and Eric Sesterhenn of X41 D-Sec.

## Updating

To update GitLab, see the [Update page](/update).

Note: GitLab releases have skipped 15.7.4, 15.6.5, and 15.5.8. There are no patches with these version numbers.

To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).
These security releases update Git on the helper images, which are used
by the Docker and Kubernetes executors. If you are using a shell
executor, you will need to update Git on your operating system.

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
