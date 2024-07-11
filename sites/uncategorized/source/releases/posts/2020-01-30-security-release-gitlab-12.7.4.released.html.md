---
title: "GitLab Security Release: 12.7.4, 12.6.6, and 12.5.9"
description: "Learn more about GitLab Security Release: 12.7.4, 12.6.6, and 12.5.9 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2020/01/30/security-release-gitlab-12-7-4-released/"
categories: releases
author: Andrew Kelly
author_gitlab: ankelly
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.7.4, 12.6.6, and 12.5.9 for GitLab Community Edition (CE) and Enterprise Edition (EE).

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) in approximately 30 days.

Please read on for more information regarding this release.

## Path Traversal to Arbitrary File Read

The dependency proxy was found to have a path traversal vulnerability that if combined with an arbitrary file read vulnerability could potentially result in access to files and user data. The issue is now mitigated in the latest release and is assigned [CVE-2020-7966](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-7966).

Thanks to @nyangawa of Chaitin Tech for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.11 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## User Permissions Not Validated in ProjectExportWorker

An internal investigation revealed that permissions were not being validated in the ProjectExportWorker for the user scheduling exports. The issue is now mitigated in the latest release and is assigned [CVE-2020-8114](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-8114).

### Versions Affected

Affects GitLab EE 8.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## XSS Vulnerability in File API

Under certain conditions, requests involving the file API could result in an XSS vulnerability. The issue is now mitigated in the latest release and is assigned [CVE-2020-7973](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-7973).

Thanks to [@rpadovani](https://hackerone.com/rpadovani) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all previous GitLab versions.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Package and File Disclosure through GitLab Workhorse

An internal investigation revealed that a particular header could be used to override restrictions and result in the GitLab Workhorse disclosing packages and files in the `/tmp` directory. The issue is now mitigated in the latest release and is assigned [CVE-2020-6833](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-6833).

### Versions Affected

Affects GitLab EE 11.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## XSS Vulnerability in Create Groups

A stored XSS vulnerability was discovered using the create group functionality. The issue is now mitigated in the latest release and is assigned [CVE-2020-7971](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-7971).

Thanks to [@rioncool22](https://hackerone.com/rioncool22) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Issue and Merge Request Activity Counts Exposed

Despite project settings otherwise, non-members were able to view activity counts of issues and merge requests. The issue is now mitigated in the latest release and is assigned [CVE-2020-7967](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-7967).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 12.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Email Confirmation Bypass Using API

It was discovered that a certain API endpoint could be used to bypass email verification requirements. The issue is now mitigated in the latest release and is assigned [CVE-2020-7972](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-7972).

Thanks to [@whitehattushu](https://hackerone.com/whitehattushu) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 12.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of Forked Private Project Source Code

Authorization checks were not being applied in some cases for public repositories with merge request visibility set to members only, resulting in source code potentially being disclosed. The issue is now mitigated in the latest release and is assigned [CVE-2020-7968](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-7968).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all previous GitLab versions.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Private Project Names Exposed in GraphQL queries

Under certain conditions, particularly crafted GraphQL queries could expose private project names. The issue is now mitigated in the latest release and is assigned [CVE-2020-7979](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-7979).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 12.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of Issues and Merge Requests via Todos

Unexpired Todos could be leveraged to disclose (potentially confidential) issues and merge requests. The issue is now mitigated in the latest release and is assigned [CVE-2020-7969](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-7969).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Denial of Service via AsciiDoc

Certain payloads could result in a denial of service due to abuse of AsciiDoc includes. The issue is now mitigated in the latest release and is assigned [CVE-2020-7978](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-7978).

Thanks to [@kgadyrka](https://hackerone.com/kgadyrka) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 12.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Last Pipeline Status Exposed

Despite restrictions in place, the last pipeline status was visible via the commits API. The issue is now mitigated in the latest release and is assigned [CVE-2020-7974](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-7974).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 10.1 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Arbitrary Change of Pipeline Status

Under certain conditions, a developer of a project can change the pipeline status of a protected branch to any value. The issue is now mitigated in the latest release and is assigned [CVE-2020-7977](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-7977).

Thanks to [@rpadovani](https://hackerone.com/rpadovani) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.8 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Grafana Token Displayed in Plaintext

The Grafana token was displayed in plaintext on the settings page, but is now being masked. The issue is now mitigated in the latest release and is assigned [CVE-2020-7976](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-7976).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 12.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update excon gem

The excon gem was updated to address a flaw within that library, identified as [CVE-2019-16779](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-16779).

### Versions Affected

Affects GitLab 5.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update rdoc gem

The rdoc gem was updated, which removed an older version of the jQuery library that had several known security vulnerabilities.

### Versions Affected

Affects GitLab EE 12.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update rack-cors gem

The rack-cors gem was updated to address a vulnerability in that library, [CVE-2019-18978](https://nvd.nist.gov/vuln/detail/CVE-2019-18978).

### Versions Affected

Affects GitLab 6.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update rubyzip gem

The rubyzip gem was updated to address a vulnerability in that library, [CVE-2019-16892](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-16892).

### Versions Affected

Affects GitLab EE 8.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Apply January Mattermost Security Updates (GitLab Omnibus)

The [January Mattermost Security Updates](https://mattermost.com/blog/mattermost-security-update-5-18-1-5-17-3-5-16-5-5-9-8-esr-released/) were applied.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating
To update GitLab, see the [Update page](/update/).

## Receive Security Release Notifications
To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
