---
title: "GitLab Critical Security Release: 11.8.3 and 11.7.7"
description: "Learn more about GitLab Critical Security Release: 11.8.3 and 11.7.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/03/20/critical-security-release-gitlab-11-dot-8-dot-3-released/"
categories: releases
author: Ethan Strike
author_gitlab: estrike
tags: security, security releases
---

Today we are releasing versions 11.8.3 and 11.7.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

##  Project Runner Registration Token Exposed Through Issues Quick Actions

GitLab issues quick actions were vulnerable to an information disclosure issue that disclosed project runner registration tokens to unauthorized users. The issue is now mitigated in the latest release 
and is assigned [CVE-2019-9866](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9866).

Thanks to [@jobert](https://hackerone.com/jobert) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Upgrade Mattermost to Version 5.6.5 in GitLab 11.7

The Mattermost integration was updated to version 5.6.5 for the GitLab 11.7 package. Included in this Mattermost release are several security fixes.

## Updating

To update, check out our [update page](/update/).
