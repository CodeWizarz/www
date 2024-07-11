---
title: "GitLab Critical Security Release: 12.1.6, 12.0.6, and 11.11.8"
description: "Learn more about GitLab Critical Security Release: 12.1.6, 12.0.6, and 11.11.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/08/12/critical-security-release-gitlab-12-dot-1-dot-6-released/"
categories: releases
author: Juan Broullon
author_gitlab: jbroullon
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.1.6, 12.0.6, and 11.11.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

## Insecure Authentication Methods Disabled for Grafana By Default  

Basic authentication and hard-coded admin credentials are now disabled by default in the bundled Grafana instance as part of the Omnibus-based GitLab packages. 
This change forces GitLab SSO to be the only authentication method, creates a backup of existing data, and resets the Grafana configuration to the GitLab default. 
Custom dashboards and user accounts that have been created will be preserved in the backup. Grafana authentication settings can then be modified following the 
[Omnibus Configuration Settings](https://docs.gitlab.com/omnibus/settings/grafana.html) guide.

The Grafana dashboard, when accessed using the hard-coded credentials, allowed for a malicious user to view internal resources that are accessible 
by the host where the GitLab instance resides. 

The issue is now mitigated in the latest release and is assigned [CVE-2019-14943](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-14943).

Thanks to [@stargo](https://gitlab.com/stargo) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 12.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).

## Multiple Command-Line Flag Injection Vulnerabilities

Improper parameter sanitization on Gitaly could lead to privilege escalation and remote code execution vulnerabilities under certain conditions. The issue is now mitigated in the latest release and is assigned [CVE-2019-14944](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-14944).

Thanks to [@vakzz](https://hackerone.com/vakzz) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).

## Insecure Cookie Handling on GitLab Pages 

Authentication cookies on GitLab Pages with Access Control could be sent over HTTP and weren't properly encrypted, which made them vulnerable to Man-In-The-Middle attacks. The issue is now mitigated in the latest release and is assigned [CVE-2019-14942](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-14942).

This issue was internally discovered by the GitLab Security Team.

### Versions Affected

Affects GitLab CE/EE 11.5 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).
