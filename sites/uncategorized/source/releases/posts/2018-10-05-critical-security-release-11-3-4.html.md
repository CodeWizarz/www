---
title: "GitLab Critical Security Release: 11.3.4, 11.2.5, and 11.1.8"
categories: releases
author: James Ritchey
author_gitlab: jritchey
description: "We strongly recommend that all GitLab installations be upgraded to one of these versions immediately, as they contain a number of important security fixes."
tags: security, releases, security releases
---

Today we are releasing versions 11.3.4, 11.2.5, and 11.1.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

## Git updates

We've included updated Git security versions 2.18.1 and 2.17.2 in this latest release for 11.3.4, 11.2.5, and 11.1.8.

For more information, see the Git [release notes](https://public-inbox.org/git/xmqqy3bcuy3l.fsf@gitster-ct.c.googlers.com/T/#u).

##  Merge request information disclosure

The merge request JSON endpoint was inadvertently disclosing all `User` record data of a person associated with the discussion. The issue is now mitigated in the latest release and is assigned [CVE-2018-17939](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17939).

### Versions affected

Affects GitLab CE/EE 11.3, 11.2, and 11.1.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Private project namespace information disclosure

The epic feature is leaking private project namespaces if someone adds a related issue to the epic. The issue is now mitigated in the latest release and is assigned [CVE-2018-17976](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17976).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions affected

Affects GitLab CE/EE 10.2 - 11.3.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Gitlab Flavored Markdown API information disclosure

The GFM API is missing an authorization control which results in leaking confidential issue titles and private snippet titles. The issue is now mitigated in the latest release and is assigned [CVE-2018-17975](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17975).

Thanks to [@jobert](https://hackerone.com/jobert) for responsibly reporting this vulnerability to us.

### Versions affected

Affects GitLab CE 11.0 - 11.3.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).
