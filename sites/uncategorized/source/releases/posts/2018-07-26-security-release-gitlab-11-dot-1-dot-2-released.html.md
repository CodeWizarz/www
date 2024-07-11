---
title: "GitLab Security Release: 11.1.2, 11.0.5, and 10.8.7"
description: "Learn more about GitLab Security Release: 11.1.2, 11.0.5, and 10.8.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/07/26/security-release-gitlab-11-dot-1-dot-2-released/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
tags: security, security releases
---

Today we are releasing versions 11.1.2, 11.0.5, and 10.8.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

##  Markdown DoS

An `11.1.0` regression caused Markdown rendering times to slow exponentially, possibly leading to a denial of service. This issue is now resolved in the latest release and is assigned to [CVE-2018-14601](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-14601).

### Versions Affected

Affects GitLab CE/EE 11.1.0.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Information Disclosure Prometheus Metrics

GitLab Prometheus metrics was disclosing private project pathnames. This also affected the Prometheus instances on `dashboards.gitlab.com`. The issue is now resolved in the latest release and is assigned to [CVE-2018-14602](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-14602).

### Versions Affected

Affects GitLab CE/EE 9.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  CSRF in System Hooks

The "Test" feature of the System Hooks component contained low severity CSRF vulnerability. The issue is now resolved in the latest release and is assigned to [CVE-2018-14603](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-14603).

Thanks to [Lyubomir Tsirkov](https://hackerone.com/sql00) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 2.7.0pre and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Persistent XSS Pipeline Tooltip

The tooltip of the job inside the CI/CD pipeline was not properly sanitized and resulted in a persistent XSS. The issue is now resolved in the latest release and is assigned to [CVE-2018-14604](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-14604).

Thanks to [@fransrosen](https://hackerone.com/fransrosen) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.7 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Persistent XSS in Branch Name via Web IDE

The branch name was not properly sanitized when committing a file via the Web IDE which resulted in a persistent XSS. The issue is now resolved in the latest release and is assigned to [CVE-2018-14605](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-14605).

Thanks to [@fransrosen](https://hackerone.com/fransrosen) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.7 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Persistent XSS Milestone Promotion

When promoting a Milestone, the name of the Milestone is not sanitized properly which results in the notification to trigger a persistent XSS. The issue is now resolved in the latest release and is assigned to [CVE-2018-14606](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-14606).

Thanks to [@fransrosen](https://hackerone.com/fransrosen) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Mattermost Updates

Mattermost has been updated to version 5.0.2, and it contains a security fix that's also been backported to 4.10.2.

For more information, see [Mattermost security updates page](https://about.mattermost.com/security-updates/).

## Updating

To update, check out our [update page](/update/).
