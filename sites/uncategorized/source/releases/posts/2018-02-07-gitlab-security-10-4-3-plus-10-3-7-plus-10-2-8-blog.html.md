---
title: "GitLab Security Release: 10.4.3, 10.3.7, and 10.2.8"
description: "Learn more about GitLab Security Release: 10.4.3, 10.3.7, and 10.2.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/02/07/gitlab-security-10-4-3-plus-10-3-7-plus-10-2-8-blog/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
tags: security
---

Today we are releasing versions 10.4.3, 10.3.7, and 10.2.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

This security release blog post is the first part of two. The second blog will be posted in approximately 30 days, and it will detail the vulnerability findings.

Please read on for more details regarding this release.

<!-- more -->

##  SnippetFinder information disclosure

The GitLab SnippetFinder component contained an information disclosure which allowed access to snippets restricted to `Only team members` or configured as `disabled`. The issue is now resolved in the latest version.

### Versions affected

* GitLab CE and EE 7.4.0 and up

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## LDAP API authorization issue

An LDAP API endpoint contained an authorization vulnerability which unintentionally disclosed bulk LDAP groups data. This issue is now fixed in the latest release.

Thanks to [Jobert Abma] of [HackerOne] for responsibly disclosing this issue to us.

[Jobert Abma]: https://twitter.com/jobertabma
[HackerOne]: https://hackerone.com/jobert

### Versions affected

* GitLab CE and EE 6.1.0 and up

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Persistent XSS mermaid markdown

The mermaid markdown feature contained a persistent XSS issue that is now resolved in the latest release.

Thanks to [Nils Juenemann] for responsibly disclosing this issue to us.

[Nils Juenemann]: https://twitter.com/totally_unknown

### Versions affected

* GitLab CE and EE 10.3 and up

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Insecure direct object reference Todo API

The Todo API was vulnerable to an insecure direct object reference issue which resulted in an information disclosure of confidential data.

Thanks to [Jobert Abma] of [HackerOne] for responsibly disclosing this issue to us.

### Versions Affected

* GitLab CE and EE 9.5 and up

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## GitHub import access control issue

An improper access control weakness issue was discovered in the GitHub import feature. The issue allowed an attacker to create projects under other accounts which they shouldn't have access to. The issue is now resolved in the latest version.

Thanks to [Jobert Abma] of [HackerOne] for responsibly disclosing this issue to us.

### Versions affected

* GitLab CE and EE 9.1 and up

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Protected variables information disclosure

The CI jobs protected tag feature contained a vulnerability which resulted in an information disclosure of protected variables. The issue is now resolved in the latest release.

Thanks to Wes Cossick of [Sparksuite] for responsibly disclosing this issue to us.

[Sparksuite]: https://www.sparksuite.com/

### Versions affected

* GitLab CE and EE 9.1 and up

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Upgrade barometer

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations` file](http://doc.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

### CVE IDs

We are working on obtaining CVE numbers for these vulnerabilities and will update the blog post accordingly when we've obtained that information.

## Enterprise Edition

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a
[subscription](/pricing/). No time to upgrade GitLab
yourself? Subscribers receive upgrade and installation services.
