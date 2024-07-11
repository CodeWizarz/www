---
title: "GitLab Security Release: 10.7.2, 10.6.5, and 10.5.8"
description: "Learn more about GitLab Security Release: 10.7.2, 10.6.5, and 10.5.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/04/30/security-release-gitlab-10-dot-7-dot-2-released/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
tags: security, releases, security releases
---

Today we are releasing versions 10.7.2, 10.6.5, and 10.5.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

## Persistent XSS in 'Move Issue' using project namespace

The `Move Issue` feature contained a persistent XSS vulnerability that is now resolved in the latest release. This issue has been assigned [CVE-2018-10379](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-10379).

Thanks to [fransrosen](https://hackerone.com/fransrosen) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.5 and up.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Download Archive allowing unauthorized private repo access

The `Download Archive` feature contained an improper authorization issue which is fixed in this release. Affected users will receive an email notification, and a separate blog post will be published with further details regarding this issue and its impact.

## Mattermost Updates

We've included respective Mattermost security versions in 10.5 and 10.6. The omnibus-gitlab package for 10.7.0, already contains the Mattermost security update.

For more information, see [Mattermost security updates page](https://about.mattermost.com/security-updates/)

## Updating

To update, check out our [update page](/update/)
