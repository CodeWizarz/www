---
title: "GitLab Security Release: 11.3.1, 11.2.4, and 11.1.7"
description: "Learn more about GitLab Security Release: 11.3.1, 11.2.4, and 11.1.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/10/01/security-release-gitlab-11-dot-3-dot-1-released/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
tags: security, security releases
---

> Note: 11.1.7 is still vulnerable to these issues because of a mistake tagging the release. Please upgrade to [11.1.8](/releases/2018/10/05/critical-security-release-11-3-4/).

Today we are releasing versions 11.3.1, 11.2.4, and 11.1.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

##  SSRF GCP access token disclosure

The GitLab Kubernetes integration was vulnerable to a SSRF issue which allowed for access to any URL accessible from the GitLab server. For example, for users which run GitLab on GCP, an attacker with access to use the GitLab instance would have been able to determine the GCP service token for the GitLab host. The issue is now mitigated in the latest release and is assigned [CVE-2018-17450](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17450).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Persistent XSS on issue details

The issue details page contained a lack of input validation and output encoding issue which resulted in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2018-17454](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17454).

Thanks to [@8ayac](https://hackerone.com/8ayac) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Diff formatter DoS in Sidekiq jobs

The diff formatter using `rouge` lacks timeout in Sidekiq jobs which can result in a denial of service. The issue is now mitigated in the latest release and is assigned [CVE-2018-15472](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-15472).

Thanks to [Bastian Blank](https://gitlab.com/waldi) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 7.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Confidential information disclosure in events API endpoint

The events API contained insecure direct object reference issue which resulted in disclosure of confidential issues, comments, and titles of public projects. The issue is now mitigated in the latest release and is assigned [CVE-2018-17449](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17449).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## `validate_localhost` function in `url_blocker.rb` could be bypassed

The `validate_localhost` function was missing a check for loopback addresses which could result in SSRF issues. The issue is now mitigated in the latest release and is assigned [CVE-2018-17452](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17452).

Thanks to [@math1as](https://hackerone.com/math1as) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.3 and up.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Slack integration CSRF Oauth2

The Slack integration contained a CSRF issue which could allow an attacker to issue slash commands on behalf of the victim. The issue is now mitigated in the latest release and is assigned [CVE-2018-17451](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17451).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## `GRPC::Unknown` logging token disclosure

The `GRPC::Unknown` exception was disclosing access tokens in Sentry logs. The issue is now mitigated in the latest release and is assigned [CVE-2018-17453](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17453).

### Versions Affected

Affects GitLab CE/EE 10.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## IDOR merge request approvals

The merge request approvals component contained an insecure direct object reference vulnerability which resulted in disclosure of private group names, avatars, LDAP settings, and descriptions. The issue is now mitigated in the latest release and is assigned [CVE-2018-17455](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17455).

Thanks to [@jobert](https://hackerone.com/jobert) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.13 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Persistent XSS `package.json`

When a `package.json` file is present, the blog-viewer will display a notice when browsing the repository which lacks input validation and output encoding which can result in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2018-17537](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17537).

Thanks to [@fransrosen](https://hackerone.com/fransrosen) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Persistent XSS merge request project import

The merge request page contained a lack of input validation and output encoding issue which resulted in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2018-17536](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17536).

Thanks to [@isra17](https://hackerone.com/isra17) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).
