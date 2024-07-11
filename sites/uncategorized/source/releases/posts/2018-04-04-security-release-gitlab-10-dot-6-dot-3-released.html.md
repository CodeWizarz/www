---
title: "GitLab Security Release: 10.6.3, 10.5.7, and 10.4.7"
description: "Learn more about GitLab Security Release: 10.6.3, 10.5.7, and 10.4.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/04/04/security-release-gitlab-10-dot-6-dot-3-released/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
tags: security, security releases
---

Today we are releasing versions 10.6.3, 10.5.7, and 10.4.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

## Confidential issue comments in Slack, Mattermost, and webhook integrations

Comments on confidential issues were previously sent to webhooks and integrations when notifications were configured to send notes or comments. This applied to custom webhooks, Slack, and Mattermost notifications.

We've introduced a new option to control the sending of confidential notes as well as an option for specifying a different channel for Slack and Mattermost.

### Versions Affected

Affects GitLab CE/EE 8.6 and up.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Persistent XSS in milestones data-milestone-id

The milestone dropdown feature contained a persistent XSS issue that is now resolved in the latest release. This issue has been assigned [CVE-2018-9244](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-9244).


Thanks to [fransrosen](https://hackerone.com/fransrosen) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.2 and up.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Persistent XSS in filename of merge request

Filenames in the changes tab contained a persistent XSS issue that is now resolved in the latest release. This issue has been assigned [CVE-2018-9243](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-9243).

Thanks to [fransrosen](https://hackerone.com/fransrosen) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.4 and up.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Upgrade barometer

This release includes one database migration, which can be run without downtime. This migration adds a column to the
`services` table. Another background migration is launched to populate this value.

## Updating

To update, check out our [update page](/update/).
