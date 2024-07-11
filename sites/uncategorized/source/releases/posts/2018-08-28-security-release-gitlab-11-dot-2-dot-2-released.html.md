---
title: "GitLab Security Release: 11.2.3, 11.1.6, and 11.0.6"
description: "Learn more about GitLab Security Release: 11.2.3, 11.1.6, and 11.0.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/08/28/security-release-gitlab-11-dot-2-dot-2-released/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
tags: security, security releases
---

Today we are releasing versions 11.2.3, 11.1.6, and 11.0.6 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

##  Persistent XSS in Pipeline Tooltip

The tooltip of the job inside the CI/CD pipeline was not properly sanitized which resulted in a persistent XSS. The issue is now resolved in the latest release and will be assigned a CVE shortly.

Thanks to [@fransrosen](https://hackerone.com/fransrosen) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.7 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  GitLab.com GCP Endpoints Exposure

Zeroconf endpoints in Google Cloud Platform (GCP) would have been accessible
via webhooks post-migration. The issue is now resolved in the latest release
for gitlab.com.

Thanks to [@fransrosen](https://hackerone.com/fransrosen) and [@avlidienbrunn](https://hackerone.com/avlidienbrunn) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab.com and instances deployed to GCP.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Persistent XSS in Merge Request Changes View

The Merge Request `Changes` view was not properly sanitizing certain hunk locations which resulted in a persistent XSS. The issue is now resolved in the latest release and will be assigned a CVE shortly.

Thanks to [@fransrosen](https://hackerone.com/fransrosen) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.1 and 11.2.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Sensitive Data Disclosure in Sidekiq Logs

The project import url credentials were being output to the Sidekiq logs. The issue is now resolved in the latest release and will be assigned a CVE shortly.

Thanks to [@kevinksd](https://gitlab.com/kevinksd) and [@Johlandabee](https://gitlab.com/Johlandabee) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.10.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Missing CSRF in System Hooks

There is a CSRF Vulnerability which allows an attacker to resend requests to multiple hooks. The "resend request" CSRF token is missing. For this reason attacker can trick user of gitlab to perform an unwanted action on a System Hook for which the user is currently authenticated.

Thanks to [Lyubomir Tsirkov](https://hackerone.com/sql00) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab 2.7.0pre and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Orphaned Upload Files Exposure

Through various bugs, it is possible to orphan a project upload file so that it is not tracked by the uploads table. If the project is moved, then it is possible for another user to create a new project with the same path. Exporting that project will contain the orphaned file, and thus exposing data. The issue is now resolved in the latest release and will be assigned a CVE shortly.

### Versions Affected

Affects GitLab CE/EE 8.10.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Missing Authorization Control API Repository Storage

Regular users are currently able to change the repository storage value using the API. The issue is now resolved in the latest release and will be assigned a CVE shortly.

### Versions Affected

Affects GitLab EE 8.10 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).
