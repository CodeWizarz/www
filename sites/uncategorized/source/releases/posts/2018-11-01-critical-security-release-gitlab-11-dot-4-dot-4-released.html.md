---
title: "GitLab Critical Security Release: 11.4.4, 11.3.9, 11.2.8"
description: "Learn more about GitLab Critical Security Release: 11.4.4, 11.3.9 and 11.2.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/11/01/critical-security-release-gitlab-11-dot-4-dot-4-released/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
tags: security, security releases
---

Today we are releasing versions 11.4.4, 11.3.9, and 11.2.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

##  SSRF in Kubernetes integration

The GitLab Kubernetes integration was vulnerable to a SSRF issue which could allow an attacker to make requests to access any internal URLs. The issue is now mitigated in the latest release and is assigned [CVE-2018-18843](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18843).

### Versions Affected

Affects GitLab EE 11.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).
