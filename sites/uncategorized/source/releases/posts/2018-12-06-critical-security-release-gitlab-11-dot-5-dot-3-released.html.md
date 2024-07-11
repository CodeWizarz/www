---
title: "GitLab Critical Security Release: 11.5.3, 11.4.10, 11.3.12"
description: "Learn more about GitLab Critical Security Release: 11.5.3, 11.4.10 and 11.3.12 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/12/06/critical-security-release-gitlab-11-dot-5-dot-3-released/"
categories: releases
author: Ethan Strike
author_gitlab: estrike
tags: security, security releases
---

Today we are releasing versions 11.5.3, 11.4.10, and 11.3.12 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain an important security fix, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

##  Directory Traversal in Templates API

The templates api was vulnerable to a directory traversal issue which could allow an attacker to read arbitrary files on a GitLab server. The issue is now mitigated in the latest release and is assigned [CVE-2018-19856](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19856).

Thanks to @nyangawa of Chaitin Tech for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.11 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).
