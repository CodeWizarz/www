---
title: "GitLab Security Release: 10.5.3, 10.4.5, 10.3.8"
author: James Ritchey
author_gitlab: jritchey
categories: releases
description: "GitLab versions 10.5.3, 10.4.5, and 10.3.8 contain a number of important security fixes."
ee_cta: false
tags: security, security releases
---

Today we are releasing versions 10.5.3, 10.4.5, and 10.3.8 for GitLab Community Edition (CE) and Enterprise Edition (EE). These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

This security release blog post is the first part of two. The second blog will be posted in approximately 30 days, and it will detail the vulnerability findings.

Please read on for more details regarding this release.

##  2FA weakness

The two factor authentication feature contained a security weakness
potentially resulting in abuse of recovery codes.

### Versions affected

* GitLab CE and EE 7.4.0 and up

### Remediation

We **strongly recommend** that all installations running an affected version above be upgraded to the latest version as soon as possible.

## Geo: failover weak file permissions

A weak file permissions issue affecting the GitLab Geo feature was discovered which could potentially result in low-privileged users triggering a failover.

### Versions affected

* GitLab EE 8.7.0 and up

### Remediation

For existing installations, you will need to edit the PostgreSQL `recovery.conf` file (in Omnibus GitLab it's located at `/var/opt/gitlab/postgresql/data/recovery.conf`) for all Geo secondary nodes:

```ruby
trigger_file = '/tmp/postgresql.trigger' # <- remove this line
```

We strongly recommend that all installations running an affected version above be upgraded to the latest version as soon as possible.

## Open redirect GitLab Pages

An open redirect issue was discovered on GitLab Pages which could result in assisting phishing campaigns to have a more trustworthy appearance.

Thanks to [pankajj736] on HackerOne for reporting this issue.

[pankajj736]: https://hackerone.com/pankajj736

### Versions affected

* GitLab CE and EE 10.3 and up

### Remediation

We **strongly recommend** that all installations running an affected version above be upgraded to the latest version as soon as possible.

## Improper authorization group lock

The group lock feature contained an improper authorization issue which could result in accidental sharing of a project.

### Versions Affected

* GitLab CE and EE 9.5 and up

### Remediation

We **strongly recommend** that all installations running an affected version above be upgraded to the latest version as soon as possible.

## Push rules denial of service

A lack of input validation issue was discovered in the push rules feature which could result in a denial of service of the platform.

### Versions affected

* GitLab EE 9.1 and up

### Remediation

We **strongly recommend** that all installations running an affected version above be upgraded to the latest version as soon as possible.

## Upgrade barometer

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations` file](http://doc.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

### CVE IDs

We are working on obtaining CVE numbers for these vulnerabilities and will update the blog post accordingly when we've obtained that information.
