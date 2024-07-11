---
title: "GitLab Security Release: 10.8.2, 10.7.5, and 10.6.6"
description: "Learn more about GitLab Security Release: 10.8.2, 10.7.5, and 10.6.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/05/29/security-release-gitlab-10-dot-8-dot-2-released/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
tags: security, security releases
---

Today we are releasing versions 10.8.2, 10.7.5, and 10.6.6 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

## Git updates

We've included updated Git security versions 2.16.4 and 2.14.4 in this latest release for 10.8.2, 10.7.5, and 10.6.6.

For more information, see [Git release notes](https://public-inbox.org/git/xmqqy3g2flb6.fsf@gitster-ct.c.googlers.com/)

##  Removing public deploy keys regression

The [delete deploy key](https://docs.gitlab.com/ee/api/deploy_keys.html#delete-deploy-key) operation contained a security issue which could allow an attacker to delete shared deploy keys. The issue is now resolved in the latest release.

Thanks to Christian Seelheim for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.1.6 and up.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Users can update their password without entering current password

The settings page contained an unverified password change weakness which could've been used to reset a user's password without knowing the user's current password. This only worked if either the attacker had hijacked a victim's session or had access to a victim's email address to intercept a password reset token.

Thanks to [Jobert](https://twitter.com/jobertabma) via [HackerOne](https://hackerone.com/jobert) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 1.0 and up.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Persistent XSS - Selecting users as allowed merge request approvers

The merge request approvers dropdown in GitLab EE contained a persistent xss issue which is now resolved in the latest release.

Thanks to [phillycheeze](https://hackerone.com/phillycheeze) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 9.1 and up.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Persistent XSS - Multiple locations of user selection drop downs

The user select drop down contained a persistent xss issue in GitLab EE which is now resolved in the latest release.

Thanks to [phillycheeze](https://hackerone.com/phillycheeze) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 9.1 and up.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  `include` directive in .gitlab-ci.yml allows SSRF requests

Arbitrary GET request could be performed against internal resources due to `include` directive in .gitlab-ci.yml. Data exfiltration potential is limited to resources that respond with a YAML file following certain constraints. This issue is now resolved in the latest release.

### Versions Affected

Affects GitLab EE 10.5 and up.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Permissions issue in Merge Requests Create Service

Users which were not project members could create merge requests via a fork for internal projects. This issue is now resolved in the latest release.

### Versions Affected

Affects GitLab CE/EE 10.6.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Arbitrary assignment of project fields using "Import project"

Any project model database column can be controlled on import by fields in the `project.json` of an exported project. This issue is now resolved in the latest release.

Thanks to [Jobert](https://twitter.com/jobertabma) via [HackerOne](https://hackerone.com/jobert) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.4 and up.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).
