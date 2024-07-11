---
title: "GitLab Security Release: 11.6.1, 11.5.6, 11.4.13"
description: "Learn more about GitLab Security Release: 11.6.1, 11.5.6, 11.4.13 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/12/31/security-release-gitlab-11-dot-6-dot-1-released/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
tags: security, security releases
---

Today we are releasing versions 11.6.1, 11.5.6, and 11.4.13 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain an important security fix, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

##  Source code disclosure merge request diff

The merge request diff feature was missing an authorization control which resulted in source code disclosure of public or internal projects with a repository available to team members only. The issue is now mitigated in the latest release and is assigned [CVE-2018-20493](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20493).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.17 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Todos improper access control

The todos component was vulnerable to an improper access control issue which could've resulted in access to confidential issues or merge requests. The issue is now mitigated in the latest release and is assigned [CVE-2018-20492](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20492).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  URL `rel` attribute not set

The `rel` attribute was not set for some URLs in a markdown field. The issue is now mitigated in the latest release and is assigned [CVE-2018-20489](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20489).

Thanks to [@jobert](https://hackerone.com/jobert) from HackerOne for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.1 and later.

##  Persistent XSS Autocompletion

An attribute used in autocompletion contained an input validation and output encoding issue which resulted in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2018-20490](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20490).

Thanks to [@jouko](https://hackerone.com/jouko) for responsibly reporting this vulnerability to us.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

### Versions Affected

Affects GitLab CE/EE 11.2 and later.

##  SSRF repository mirroring

The repository mirroring feature was vulnerable to an SSRF issue. It is now mitigated in the latest release and is assigned [CVE-2018-20497](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20497).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

By default, this fix forbids importing projects or mirroring repositories in the same network. In order to allow URLs pointing to the local network, the option located in `Admin > Settings > Network > Outbound requests > Allow requests to the local network from hooks and services` has to be enabled.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

### Versions Affected

Affects GitLab CE/EE 8.7.0 and later.

*Updated: 2019-01-14:* A similar SSRF issue in `CI/CD Pipelines for External Repositories` was also mitigated with this fix. It now respects the `Outbound requests` setting above. Thanks to [@math1as](https://hackerone.com/math1as) for responsibly reporting this vulnerability to us.

##  CI job token LFS error message disclosure

The CI job token was being disclosed in the job output due to an LFS error message. It is now mitigated in the latest release and is assigned [CVE-2018-20495](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20495).

Thanks to [Damian Nowak](https://gitlab.com/Nowaker) for responsibly reporting this vulnerability to us.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

### Versions Affected

Affects GitLab CE/EE 11.3 and later.

##  Secret CI variable exposure

Secret CI variables can be exposed by creating a tag with the same name as an existing protected branch. This issue is now mitigated in the latest release and is assigned [CVE-2018-20488](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20488).

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

### Versions Affected

Affects GitLab CE/EE 9.3 and later.

##  Guest user CI job disclosure

The CI jobs API endpoint contained an improper access control issue which resulted in guest users being able to access job information. This issue is now mitigated in the latest release and is assigned [CVE-2018-20494](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20494).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

### Versions Affected

Affects GitLab CE/EE 8.4 and later.

##  Persistent XSS label reference

The markdown label references feature contained a lack of input validation and output encoding issue which resulted in a persistent XSS. This issue is now mitigated in the latest release and is assigned [CVE-2018-20496](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20496).

Thanks to [@jouko](https://hackerone.com/jouko) for responsibly reporting this vulnerability to us.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

### Versions Affected

Affects GitLab CE/EE 8.10 and later.

##  Persistent XSS wiki in IE browser

A persistent XSS issue was discovered in wiki markdown pages due to an issue of how Internet Explorer treats a certain configuration of the CSP header. This issue is now mitigated in the latest release and is assigned [CVE-2018-20491](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20491).

Thanks to @ruvlol for responsibly reporting this vulnerability to us.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

### Versions Affected

Affects GitLab CE/EE 11.3. GitLab.com was not affected.

##  SSRF in project imports with LFS

The project imports feature was vulnerable to an SSRF issue which allowed an attacker to make requests to any local network resource accessible from the GitLab server. This issue is now mitigated in the latest release and is assigned [CVE-2018-20499](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20499).

Thanks to @nyangawa of Chaitin Tech for responsibly reporting this vulnerability to us.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

### Versions Affected

Affects GitLab CE/EE 11.0 and later.

##  Improper access control CI/CD settings

The CI/CD settings contained an issue where the runner registration token could not be reset. This was a security risk if one of the maintainers leaves the group and they know the token. This issue is now mitigated in the latest release and is assigned [CVE-2018-20500](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20500).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

### Versions Affected

Affects GitLab CE/EE 9.4 and later.

##  Missing authorization control merge requests

A project member that has been removed from a private project retains control over the state, assignee, milestones, and labels of a merge request and issue. It is now mitigated in the latest release and is assigned [CVE-2018-20501](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20501).

Thanks to [@jobert](https://hackerone.com/jobert) from HackerOne for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.12 and later.

##  Improper access control branches and tags

Guest users were able to view branches and tag names, which is normally forbidden. The issue is now mitigated in the latest release and is assigned [CVE-2018-20498](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20498).

Thanks to [@bull](https://hackerone.com/bull) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.10 and later.

##  Missing authentication for Prometheus alert endpoint

The GitLab Prometheus integration alert endpoint was lacking authentication which could result in falsely generated notification emails. The issue is now mitigated in the latest release and is assigned [CVE-2018-20507](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20507).

### Versions Affected

Affects GitLab CE/EE 11.2 and later.

## Updating

To update, check out our [update page](/update/).
