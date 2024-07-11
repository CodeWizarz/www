---
title: "GitLab Critical Security Release: 11.0.4, 10.8.6, and 10.7.7"
description: "Learn more about GitLab Critical Security Release: 11.0.4, 10.8.6, and 10.7.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/07/17/critical-security-release-gitlab-11-dot-0-dot-4-released/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
tags: security, security releases
---

Today we are releasing versions 11.0.4, 10.8.6, and 10.7.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

##  Remote Code Execution Vulnerability in GitLab Projects Import

The GitLab projects import component contained a vulnerability which allowed an attacker to write files to arbitrary directories on the server and that could result in remote code execution. The vulnerability has now been mitigated and is assigned to [CVE-2018-14364](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-14364).

Thanks to @nyangawa of Chaitin Tech for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.9.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

### Additional Workarounds
1. Go to `/admin/application_settings` of your GitLab instance.
1. Under "Import sources", uncheck the "GitLab export" checkbox.
1. Click `Save`.

## Updating

To update, check out our [update page](/update/).
