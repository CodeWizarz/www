---
title: "GitLab Security Release: 11.8.1, 11.7.6, and 11.6.10"
description: "Learn more about GitLab Security Release: 11.8.1, 11.7.6, and 11.6.10 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/03/04/security-release-gitlab-11-dot-8-dot-1-released/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
tags: security, security releases
---

Today we are releasing versions 11.8.1, 11.7.6, and 11.6.10 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

## Arbitrary file read via MergeRequestDiff

A problem with lack of input validation was discovered for MergeRequestDiff objects which resulted in an arbitrary local file read. The issue is now mitigated in the latest release and is assigned [CVE-2019-9221](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9221).

Thanks to @nyangawa of Chaitin Tech for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## IDOR add `public`/`internal` groups as members to project

An IDOR was discovered which could allow project owners to add `public`/`internal` groups, of which they are not a member, to their project. The issue is now mitigated in the latest release and is assigned [CVE-2019-9756](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9756).

Thanks to [@vijay_kumar1110](https://hackerone.com/indoappsec?type=user) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.8.0 and earlier.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## CSRF add Kubernetes cluster integration

The Kubernetes integration feature was vulnerable to CSRF which could result in overwriting an existing Kubernetes integration with the attacker's cluster. The issue is now mitigated in the latest release and is assigned [CVE-2019-9176](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9176).

Thanks to [@cache-money](https://hackerone.com/cache-money) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.1 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Blind SSRF in prometheus integration

The prometheus integration feature was vulnerable to SSRF which could result access to internal services. The issue is now mitigated in the latest release and is assigned [CVE-2019-9174](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9174).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Merge request information disclosure

Projects configured with MRs accessible only by project members were subject to information disclosure to non-members via a specific API endpoint. The issue is now mitigated in the latest release and is assigned [CVE-2019-9172](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9172).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.7 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## IDOR milestone name information disclosure

The milestone picker was vulnerable to an IDOR which resulted in disclosure of milestone names. The issue is now mitigated in the latest release and is assigned [CVE-2019-9170](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9170).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 2.9.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Burndown chart information disclosure

The burndown chart feature was inadvertently leaking confidential issue attribute information. The issue is now mitigated in the latest release and is assigned [CVE-2019-9175](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9175).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 7.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Private merge request titles in public project information disclosure

The milestones tab was inadvertently leaking private merge request titles to the public. The issue is now mitigated in the latest release and is assigned [CVE-2019-9178](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9178).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.12 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Private namespace disclosure in email notification when issue is moved

When an issue is moved to a private namespace, the email notification was inadvertently disclosing the project path which it was moved to. The issue is now mitigated in the latest release and is assigned [CVE-2019-9179](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9179).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.7 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Users with restricted repo access can access and create discussions on commits

A permissions issue was discovered for access to discussions/notes on commits. The issue is now mitigated in the latest release and is assigned [CVE-2019-9890](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9890).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.8.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Milestone name disclosure  

When a project is public and issues are set to `Only Project Members`, milestone names are able to be disclosed via the milestone autocomplete and board endpoints. These issues are now mitigated in the latest release and are assigned [CVE-2019-9171](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9171) and [CVE-2019-9224](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9224).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.16 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Issue board name disclosure  

When a project is public and issues are set to `Only Project Members`, issue board names are able to be disclosed via the boards and boards list API endpoints. These issues are now mitigated in the latest release and are assigned [CVE-2019-9225](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9225) and [CVE-2019-9219](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9219).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) and [@vijay_kumar1110](https://hackerone.com/indoappsec?type=user) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.16 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## NPM automatic package referencer

The automatic package referencer contained an issue where victims could be tricked into installing and executing a malicious package from the npm registry. The issue is now mitigated in the latest release and is assigned [CVE-2019-9217](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9217).

Thanks to [@edoverflow](https://hackerone.com/edoverflow) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.16 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Path traversal snippet mover

The logic to move snippets contained a path traversal vulnerability which is currently resulting in a denial of service but could result in data exposure. The issue is now mitigated in the latest release and is assigned [CVE-2019-9222](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9222).

Thanks to [@pindakaas](https://hackerone.com/pindakaas) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Information disclosure repo existence

An information disclosure was discovered which could allow an attacker to determine the existence of a private repo by attempting to clone it. The issue is now mitigated in the latest release and is assigned [CVE-2019-9223](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9223).

Thanks to [Tim Wanders](https://gitlab.com/tim241) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.15 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Issue DoS via Mermaid

An input validation issue was discovered in the issue page markdown field which could result in a DoS on the affected issue. The issue is now mitigated in the latest release and is assigned [CVE-2019-9220](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9220).

Thanks to [@8ayac](https://hackerone.com/8ayac) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Privilege escalation impersonate user

The impersonate user feature contained a vulnerability which could allow for the user being impersonated to escalate privileges. The issue is now mitigated in the latest release and is assigned [CVE-2019-9485](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9485).

Thanks to [@skavans](https://hackerone.com/skavans) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.8 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Validate InResponseTo when linking GitLab.com Group SAML

GitLab.com is now validating the `InResponseTo` field in the SAML response matches the unique ID we generated for the initial request in order to prevent account hijacking. Note that GitLab.com issues cannot be assigned CVE IDs.

### Versions Affected

Affects GitLab.com Only.

### Remediation

The patch has already been applied to GitLab.com

## Permissions issue GitLab.com Group SAML

Disabling the Group SAML option, after previously enabling it, could still allow users to join via SAML SSO. Note that GitLab.com issues cannot be assigned CVE IDs.

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab.com Only.

### Remediation

The patch has already been applied to GitLab.com

## Omnibus updates

Non-security updates for the `gitlab-ctl restart unicorn` `restart_command` have been applied. Please see https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/3062 for more details regarding this update.

## Updating

To update, check out our [update page](/update/).
