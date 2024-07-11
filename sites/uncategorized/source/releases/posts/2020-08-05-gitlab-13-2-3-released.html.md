---
title: "GitLab Security Release: 13.2.3, 13.1.6 and 13.0.12"
description: "Learn more about GitLab Security Release  13.2.3, 13.1.6 and 13.0.12 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2020/08/05/gitlab-13-2-3-released/"
categories: releases
author: Andrew Kelly
author_gitlab: ankelly
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 13.2.3, 13.1.6 and 13.0.12 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are [two types of security releases](/security/#gitlab-security-releases): a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

## Previously fixed (in 12.9.1): Arbitrary File Read when Moving an Issue
Recently, a GitLab user posted a blog about the exploitation of a known vulnerability which has been previously disclosed and assigned [CVE-2020-10977](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10977). GitLab EE/CE 8.5 to 12.9 is vulnerable to a path traversal when moving an issue between projects.

This issue was remediated and patched in the [12.9.1 release](https://about.gitlab.com/releases/2020/03/26/security-release-12-dot-9-dot-1-released/) in March 2020.

We strongly recommend that all users confirm they are running the latest version of GitLab to ensure they are up-to-date with current security releases. Users should update immediately if possible. If upgrading immediately is not possible for some reason, public registration should be disabled.

## Memory Exhaustion via Excessive Logging of Invite Email Error
Excessive error logging related to an invitation email being sent to members of a deleted group could potentially cause memory exhaustion on lower resource machines. This issue is now mitigated in the latest release and is assigned [CVE-2020-13280](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13280).

### Versions Affected
Affects all previous GitLab versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Denial of Service Through Project Import Feature
The project import feature did not perform size checks before decompressing data, potentially resulting in a denial of service. This issue is now mitigated in the latest release and is assigned [CVE-2020-13281](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13281).

Thanks [@u3mur4](https://hackerone.com/u3mur4) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 8.9 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## User Controlled Git Configuration Settings Resulting in SSRF
When importing a repository via URL, the git `http.<url>.proxy` setting could be changed and lead to server-side request forgery. This issue is now mitigated in the latest release and is assigned [CVE-2020-13286](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13286).

Thanks [@vakzz](https://hackerone.com/vakzz) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 12.7 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Stored XSS in Issue Reference Number Tooltip
For some browsers, the tooltip for issue reference numbers could result in stored XSS on mouseover. This issue is now mitigated in the latest release and is assigned [CVE-2020-13285](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13285).

Thanks [@yvvdwf](https://hackerone.com/yvvdwf) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 12.9 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Stored XSS in Issues List via Milestone Title
The milestone title field can lead to stored XSS when viewed under certain conditions on the issue list. This issue is now mitigated in the latest release and is assigned [CVE-2020-13283](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13283).

Thanks [@mike12](https://hackerone.com/mike12) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 10.8 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Improper Access Control After Group Transfer
Members of a parent group silently and unexpectedly maintained their access levels when a subgroup is transferred. This issue is now mitigated in the latest release and is assigned [CVE-2020-13282](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13282).

Thanks [@kryword](https://hackerone.com/kryword) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all previous GitLab versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Bypass Email Verification Required for OAuth Flow
The required email verification for the OAuth authorization code flow could be bypassed, which potentially could affect third party applications that use GitLab as an identity provider. This issue is now mitigated in the latest release and is assigned [CVE-2020-13292](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13292).

Thanks [@cache-money](https://hackerone.com/cache-money) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all previous GitLab versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Confusion When Using Hexadecimal Branch Names
Using a branch with a hexadecimal name could override an existing hash. This issue is now mitigated in the latest release and is assigned [CVE-2020-13293](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13293).

Thanks [@retroplasma](https://hackerone.com/retroplasma) for responsibly reporting this vulnerability to us.
 
### Versions Affected
Affects all previous GitLab versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Insufficient OAuth Revocation
Access grants were not revoked when a user revoked access to an application. This issue is now mitigated in the latest release and is assigned [CVE-2020-13294](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13294).

Thanks [@benaubin](https://hackerone.com/benaubin), [@whitehattushu](https://hackerone.com/whitehattushu), and [@lauritz](https://hackerone.com/lauritz) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 7.7 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Improper Access Control for Project Sharing
Project sharing could temporarily allow too permissive access. This issue is now mitigated in the latest release and is assigned [CVE-2020-13291](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13291).

### Versions Affected
Affects GitLab 13.2 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Stored XSS in Jobs Page
A stored XSS was identified in the CI/CD Jobs page. This issue is now mitigated in the latest release and is assigned [CVE-2020-13288](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13288).

Thanks [@mike12](https://hackerone.com/mike12) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 13.0 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Improper Access Control of Applications Page
Users without two-factor authentication set up can still access the `/profile/applications` page even when two-factor authentication is required. This issue is now mitigated in the latest release and is assigned [CVE-2020-13290](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13290).

Thanks [@brdoors3](https://hackerone.com/brdoors3) for responsibly reporting this vulnerability to us and [@melar_dev](https://hackerone.com/melar_dev) for providing additional important details.

### Versions Affected
Affects GitLab 8.4 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## SSRF into Shared Runner
By replacing dockerd with a malicious server, a SSRF was possible into the Shared Runner. This issue is now mitigated in the latest release and is assigned [CVE-2020-13295](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13295).

Thanks [@lucash-dev](https://hackerone.com/lucash-dev) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all versions of GitLab Runner.

### Remediation
We **strongly recommend** that all installations of **GitLab Runner** are [upgraded](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner) to the latest version as soon as possible.

## Update Kramdown Gem
The kramdown gem has been upgraded to 2.3.0. This upgrade include a security fix for [CVE-2020-14001](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-14001).

### Versions Affected
Affects GitLab 13.2 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating
To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications
To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
