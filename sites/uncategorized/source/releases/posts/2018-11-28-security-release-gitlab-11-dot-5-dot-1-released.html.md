---
title: "GitLab Security Release: 11.5.1, 11.4.8, and 11.3.11"
description: "Learn more about GitLab Security Release: 11.5.1, 11.4.8, and 11.3.11 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/11/28/security-release-gitlab-11-dot-5-dot-1-released/"
categories: releases
author: Ethan Strike
author_gitlab: estrike
tags: security, security releases
---

Today we are releasing versions 11.5.1, 11.4.8, and 11.3.11 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

## IDOR at issue notes

The issue comments feature contained an authorization bug which could allow an attacker to comment on a confidential issue which they shouldn't be allowed to. The issue is now mitigated in the latest release and is assigned [CVE-2019-5883](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5883).

Thanks to [@lucky_sen](https://hackerone.com/lucky_sen) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 6.0 to 11.5.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## View Names of Private Groups

The Todos dashboard permitted an unauthorized user to view the names of private groups. The issue is now mitigated in the latest release and is assigned [CVE-2018-19494](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19494).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Persistent XSS in Environments

The Environments page contained a lack of input validation and output encoding issue which resulted in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2018-19493](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19493).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## SSRF in Prometheus integration

The Prometheus integration was vulnerable to an SSRF issue which allowed an attacker to make requests to any local network resource accessible from the GitLab server. The issue is now mitigated in the latest release and is assigned [CVE-2018-19495](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19495).

Thanks to [@bull](https://hackerone.com/bull) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Unauthorized Promotion of Milestones

Milestones were vulnerable to an insecure object reference issue where a user with insufficient privileges could promote a project milestone to a group milestone. The issue is now mitigated in the latest release and is assigned [CVE-2018-19496](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19496).

Thanks to [@sandeep_hodkasia](https://hackerone.com/sandeep_hodkasia) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Exposure of Confidential Issue Title

The commits listing page in a project permitted an unauthorized user to view the title of a confidential issue. The issue is now mitigated in the latest release and is assigned [CVE-2018-19577](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19577).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Persisent XSS in Markdown Fields via Mermaid Script

Fields that accept Markdown contained incomplete input validation and output encoding when accepting Mermaid script, which resulted in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2018-19573](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19573).

Thanks to [@fransrosen](https://hackerone.com/fransrosen) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Persistent XSS in Markdown Fields via Unrecognized HTML Tags

Fields that accept Markdown contained incomplete input validation and output encoding when accepting unrecognized HTML tags, which resulted in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2018-19570](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19570).

Thanks to [@otr](https://hackerone.com/otr) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Symlink Race Condition in Pages

GitLab Pages had a symlink race condition that would allow unauthorized access to files in the Pages chroot. The issue is now mitigated in the latest release and is assigned [CVE-2018-19572](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19572).

Thanks to [Bastian Blank](https://gitlab.com/waldi) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE 8.17 & EE 8.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Unauthorized Changes by Guest User in Issues

GitLab issues were vulnerable to an insecure object reference issue that allowed a Guest user to make changes to, or delete their own comments after an issue had been made confidential. The issue is now mitigated in the latest release and is assigned [CVE-2018-19576](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19576).

Thanks to [@sandeep_hodkasia](https://hackerone.com/sandeep_hodkasia) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Unauthorized Comments on Locked Issues

GitLab issues were vulnerable to an insecure object reference issue that allowed an unauthorized user to make comments after an issue had been locked. The issue is now mitigated in the latest release and is assigned [CVE-2018-19575](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19575).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.1 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Improper Enforcement of Token Scope

The GitLab web interface was vulnerable to an authorization issue that allowed access to the web-UI as a user using their Personal Access Token (PAT) of any scope. The issue is now mitigated in the latest release and is assigned [CVE-2018-19569](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19569).

With this fix, the use of PATs is limited to the API, the RSS feed, and the registry, which could break any existing automation scripts that don't use the API. The impact is expected to be limited.

Thanks to Jan Alsenz of Oneconsult AG for responsibly reporting this vulnerability to us.

*Updated: 2018-11-28:* We have received reports that this change has impacted how repo files and job artifacts are downloaded for some users. For instructions on how to do so through the API, please see [our support issue](https://gitlab.com/gitlab-org/gitlab-ce/issues/54572#note_120859334). Thank you to the users participating in this issue. Your feedback is important to us.

### Versions Affected

Affects GitLab CE/EE 8.8 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## CRLF Injection in Project Mirroring

When using the Git protocol, project mirroring was vulnerable to a CRLF injection vulnerability. The issue is now mitigated in the latest release and is assigned [CVE-2018-19585](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19585).

Thanks to [@chromium1337](https://hackerone.com/chromium1337) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.18 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## XSS in OAuth Authorization

The OAuth authorization process contained a lack of input validation and output encoding which resulted in an XSS. The issue is now mitigated in the latest release and is assigned [CVE-2018-19574](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19574).

Thanks to [@fransrosen](https://hackerone.com/fransrosen) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 7.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## SSRF in Webhooks

Webhooks were vulnerable to an SSRF vulnerability that allowed an attacker to make requests to any local network resource accessible from the GitLab server. The issue is now mitigated in the latest release and is assigned [CVE-2018-19571](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19571).

Thanks to @nyangawa of Chaitin Tech for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.18 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Send Email on Email Address Change

Previously, GitLab did not send an email to the old email address when an email address change was made. The issue is now mitigated in the latest release and is assigned [CVE-2018-19580](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19580).

Thanks to [@muon4](https://hackerone.com/muon4) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all versions of GitLab CE/EE.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Workhorse Logs Contained Tokens

Workhorse was logging access tokens, which allowed administrators with access to the logs to see the tokens of other users. The issue is now mitigated in the latest release and is assigned [CVE-2018-19583](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19583).

### Versions Affected

Affects GitLab CE/EE 8.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Unauthorized Publishing of Draft Comments

The discussion drafts endpoint, used in merge requests, contained an insecure object reference vulnerability that permitted an unauthorized user to publish the drafts of another user. The issue is now mitigated in the latest release and is assigned [CVE-2018-19582](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19582).

Thanks to [@lucky_sen](https://hackerone.com/lucky_sen) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Guest Can Set Weight of a New Issue

GitLab issues were vulnerable to an insecure object reference issue that allowed a Guest user to set the weight of an issue they created. The issue is now mitigated in the latest release and is assigned [CVE-2018-19581](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19581).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Disclosure of Private Group's Members and Milestones

An insecure direct object reference vulnerability in issue boards allowed authenticated, but unauthorized users to view members and milestone details of private groups. The issue is now mitigated in the latest release and is assigned [CVE-2018-19584](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19584).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Persisent XSS in Operations

The Operations page contained a lack of input validation and output encoding which resulted in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2018-19579](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19579).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.5.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Reporter Can View Operations Page

Due to incomplete permissions validation, a user with Reporter privileges was permitted to view the Jaeger Tracing Operations page. The issue is now mitigated in the latest release and is assigned [CVE-2018-19578](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19578).

Thanks to [@vijay_kumar1110](https://hackerone.com/indoappsec?type=user) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.5.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Upgrade to Redis 3.2.12

The version of Redis used in the Omnibus package was upgraded in the GitLab 11.3 release. This upgrade was previously included in GitLab 11.4 and 11.5 Omnibus packages, and includes several security fixes.
The upgrade to Redis was incorrectly reported in the [October security release](/releases/2018/10/29/security-release-gitlab-11-dot-4-dot-3-released/).

## Updating

To update, check out our [update page](/update/).
