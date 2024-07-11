---
title: "GitLab Security Release: 11.10.3, 11.9.11, and 11.8.10"
description: "Learn more about GitLab Security Release: 11.10.3, 11.9.11, and 11.8.10 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/04/30/security-release-gitlab-11-dot-10-dot-3-released/"
categories: releases
author: Ethan Strike
author_gitlab: estrike
tags: security, security releases
image_title: '/images/blogimages/security-cover-new.png'
---

Today we are releasing versions 11.10.3, 11.9.11, and 11.8.10 for GitLab Community Edition (CE) and Enterprise Edition (EE).

The GitLab EE versions contain an important security fix, and we strongly recommend that all GitLab EE installations be upgraded immediately. GitLab CE is not affected, but the
version numbers were increased to be consistent with EE versioning.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

## Information Disclosure with Limited Scope Token

A small number of GitLab API endpoints would disclose project information when using a *read_user* scoped token. The issue is now mitigated in the latest release and is assigned [CVE-2019-11605](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-11605).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.8 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).
