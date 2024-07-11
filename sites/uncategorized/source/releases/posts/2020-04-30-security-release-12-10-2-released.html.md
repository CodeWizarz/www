---
title: "GitLab Security Release: 12.10.2, 12.9.5, 12.8.10"
description: "Learn more about GitLab Security Release: 12.10.2, 12.9.5, 12.8.10 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2020/04/30/security-release-12-10-2-released/"
categories: releases
author: Dominic Couture
author_gitlab: dcouture
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.10.2, 12.9.5, 12.8.10 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) in approximately 30 days.

Please read on for more information regarding this release.

## Path Traversal in NuGet Package Registry
It was possible to use a malicious NuGet package to read any `*.nupkg` file on the system. This issue is now mitigated in the latest release and is assigned [CVE-2020-12448](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12448).

Thanks [@saltyyolk of Chaitin Tech](https://hackerone.com/saltyyolk) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 12.8 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Workhorse Bypass Leads to File Disclosure
A specially crafted request could bypass the GitLab Workhorse and read files in certain specific paths on the server. This issue is now mitigated in the latest release and is assigned [CVE-2020-12448](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12448).

Thanks [@vakzz](https://hackerone.com/vakzz) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 11.5 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## OAuth Application Client Secrets Revealed
A vulnerability allowed any user to retrieve OAuth application client secrets after authorizing. This issue is now mitigated in the latest release and is assigned [CVE-2020-10187](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10187).

Thanks [@stefansundin](https://hackerone.com/stefansundin) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE/CE 12.8 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible. Additionally, the OAuth client secrets should be rotated if your HTTP logs show that the `/oauth/authorized_applications.json` path has been accessed.

## Code Owners Approval Rules Are Not Updated for Existing Merge Requests When Source Branch Changes
It was possible to bypass code owners approval by committing changes in a specific order. This issue is now mitigated in the latest release and is assigned [CVE-2020-12449](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12449).

Thanks [@nathanielwyliet](https://gitlab.com/nathanielwyliet) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 12.6 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Code Owners Protection Not Enforced from Web UI
It was possible to bypass code owners approval by committing changes through the web interface. This issue is now mitigated in the latest release and is assigned [CVE-2020-12451](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12451).

Thanks [@zane.wright](https://gitlab.com/zane.wright) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 12.9 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Repository Mirror Passwords Exposed To Maintainers
When a maintainer deleted a repository mirror, the HTTP response contained the passwords set for the other mirrors on the same repository. This issue is now mitigated in the latest release and is assigned [CVE-2020-12450](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12450).

### Versions Affected
Affects GitLab EE/CE 11.6 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Admin Audit Log Page Denial of Service
A specific API call could make the admin audit log page inaccessible. This issue is now mitigated in the latest release and is assigned [CVE-2020-12452](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12452).

Thanks [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 12.7 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Private Project ID Revealed Through Group API
If a public group contained a private project that was used as a template, its ID was revealed in the group API. This issue is now mitigated in the latest release and is assigned [CVE-2020-12453](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12453).

Thanks [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 11.5 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Elasticsearch Credentials Logged to ELK
The data logged in ELK after modifying the Elasticsearch integration through the admin setting page contained credentials. This issue is now mitigated in the latest release and is assigned [CVE-2020-12454](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12454).

### Versions Affected
Affects GitLab EE 8.4 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## GitHub Personal Access Token Exposed on Integrations Page
The GitHub Personal Access Token field was not masked on the integration settings page. This issue is now mitigated in the latest release and is assigned [CVE-2020-12455](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12455).

Thanks [@kylifornication](https://gitlab.com/kylifornication) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 10.6 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update Nokogiri dependency in Gitaly
The Nokogiri dependency has been upgraded to 1.10.9 in Gitaly. This upgrade includes a security fix for [CVE-2020-7595](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-7595).

### Versions Affected
Affects all previous versions of GitLab CE/EE.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update OpenSSL Dependency
The OpenSSL dependency has been upgraded from 1.1.1f to 1.1.1g. This upgrade includes a security fix for [CVE-2020-1967](https://www.openssl.org/news/secadv/20200421.txt).

### Versions Affected
Affects GitLab Omnibus 12.4 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update git
git has been updated to version 2.24.3. This upgrade includes a security fix for [CVE-2020-11008](https://lore.kernel.org/git/xmqq4kterq5s.fsf@gitster.c.googlers.com/).

### Versions Affected
Affects all previous versions of GitLab Omnibus.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating
To update GitLab, see the [update page](/update/).

## Receive Security Release Notifications
To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
