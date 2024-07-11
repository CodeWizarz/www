---
title: "GitLab Security Release: 16.0.2, 15.11.7, and 15.10.8"
description: "Learn more about GitLab Security Release: 16.0.2, 15.11.7, and 15.10.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2023/06/05/security-release-gitlab-16-0-2-released/"
categories: releases
author: Rohit Shambhuni
author_gitlab: rshambhuni
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 16.0.2, 15.11.7, and 15.10.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=created_date&state=closed&label_name%5B%5D=bug%3A%3Avulnerability&confidential=no&first_page_size=100) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Stored-XSS with CSP-bypass in Merge requests](#stored-xss-with-csp-bypass-in-merge-requests)|high|
|[ReDoS via FrontMatterFilter in any Markdown fields](#redos-via-frontmatterfilter-in-any-markdown-fields)|high|
|[ReDoS via InlineDiffFilter in any Markdown fields](#redos-via-inlinedifffilter-in-any-markdown-fields)|high|
|[ReDoS via DollarMathPostFilter in Markdown fields](#redos-via-dollarmathpostfilter-in-markdown-fields)|high|
|[DoS via malicious test report artifacts](#dos-via-malicious-test-report-artifacts)|medium|
|[Restricted IP addresses can clone repositories of public projects](#restricted-ip-addresses-can-clone-repositories-of-public-projects)|medium|
|[Reflected XSS in Report Abuse Functionality](#reflected-xss-in-report-abuse-functionality)|medium|
|[Privilege escalation from maintainer to owner by importing members from a project](#privilege-escalation-from-maintainer-to-owner-by-importing-members-from-a-project)|medium|
|[Bypassing tags protection in GitLab](#bypassing-tags-protection-in-gitlab)|medium|
|[Denial of Service using multiple labels with arbitrarily large descriptions](#denial-of-service-using-multiple-labels-with-arbitrarily-large-descriptions)|medium|
|[Ability to use an unverified email for public and commit emails](#ability-to-use-an-unverified-email-for-public-and-commit-emails)|medium|
|[Open Redirection Through HTTP Response Splitting](#open-redirection-through-http-response-splitting)|low|
|[Disclosure of issue notes to an unauthorized user when exporting a project](#disclosure-of-issue-notes-to-an-unauthorized-user-when-exporting-a-project)|low|
|[Ambiguous branch name exploitation](#ambiguous-branch-name-exploitation)|low|

## Stored-XSS with CSP-bypass in Merge requests

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/893 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 15.11 before 15.11.7, all versions starting from 16.0 before 16.0.2. A specially crafted merge request could lead to a stored XSS on the client side which allows attackers to perform arbitrary actions on behalf of victims. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:C/C:H/I:H/A:N`, 8.7). It is now mitigated in the latest release and is assigned [CVE-2023-2442](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2442).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

## ReDoS via FrontMatterFilter in any Markdown fields

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/888 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 12.0 before 15.10.8, all versions starting from 15.11 before 15.11.7, all versions starting from 16.0 before 16.0.2. A Regular Expression Denial of Service was possible via sending crafted payloads to the preview_markdown endpoint. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H`, 7.5). It is now mitigated in the latest release and is assigned [CVE-2023-2199](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2199).

Thanks [ryhmnlfj](https://hackerone.com/ryhmnlfj) for reporting this vulnerability through our HackerOne bug bounty program.

## ReDoS via InlineDiffFilter in any Markdown fields

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/887 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 8.7 before 15.10.8, all versions starting from 15.11 before 15.11.7, all versions starting from 16.0 before 16.0.2. A Regular Expression Denial of Service was possible via sending crafted payloads to the preview_markdown endpoint. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H`, 7.5). It is now mitigated in the latest release and is assigned [CVE-2023-2198](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2198).

Thanks [ryhmnlfj](https://hackerone.com/ryhmnlfj) for reporting this vulnerability through our HackerOne bug bounty program.

## ReDoS via DollarMathPostFilter in Markdown fields

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/881 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 15.4 before 15.10.8, all versions starting from 15.11 before 15.11.7, all versions starting from 16.0 before 16.0.2. A DollarMathPostFilter Regular Expression Denial of Service in was possible by sending crafted payloads to the preview_markdown endpoint. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H`, 7.5). It is now mitigated in the latest release and is assigned [CVE-2023-2132](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2132).

Thanks [ryhmnlfj](https://hackerone.com/ryhmnlfj) for reporting this vulnerability through our HackerOne bug bounty program.

## DoS via malicious test report artifacts

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/850 -->

A denial of service issue was discovered in GitLab CE/EE affecting all versions starting from 13.2.4 before 15.10.8, all versions starting from 15.11 before 15.11.7, all versions starting from 16.0 before 16.0.2 which allows an attacker to cause high resource consumption using malicious test report artifacts. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2023-0121](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0121).

Thanks [luryus](https://hackerone.com/luryus) for reporting this vulnerability through our HackerOne bug bounty program.

## Restricted IP addresses can clone repositories of public projects

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/889 -->

An issue has been discovered in GitLab EE affecting all versions starting from 12.0 before 15.10.8, all versions starting from 15.11 before 15.11.7, all versions starting from 16.0 before 16.0.2. An attacker can clone a repository from a public project, from a disallowed IP, even after the top-level group has enabled IP restrictions on the group. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:N/A:N`, 5.9). It is now mitigated in the latest release and is assigned [CVE-2023-2589](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2589).

Thanks [ali_shehab](https://hackerone.com/ali_shehab) for reporting this vulnerability through our HackerOne bug bounty program.

## Reflected XSS in Report Abuse Functionality

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/875 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 15.8 before 15.10.8, all versions starting from 15.11 before 15.11.7, all versions starting from 16.0 before 16.0.2. A reflected XSS was possible when creating new abuse reports which allows attackers to perform arbitrary actions on behalf of victims. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:C/C:L/I:L/A:N`, 4.4). It is now mitigated in the latest release and is assigned [CVE-2023-2015](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2015).

Thanks [akadrian](https://hackerone.com/akadrian) for reporting this vulnerability through our HackerOne bug bounty program.

## Privilege escalation from maintainer to owner by importing members from a project

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/892 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 14.1 before 15.10.8, all versions starting from 15.11 before 15.11.7, all versions starting from 16.0 before 16.0.2. A malicious maintainer in a project can escalate other users to Owners in that project if they import members from another project that those other users are Owners of. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:H/UI:N/S:U/C:N/I:H/A:N`, 4.4). It is now mitigated in the latest release and is assigned [CVE-2023-2485](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2485).

Thanks [theluci](https://hackerone.com/theluci) for reporting this vulnerability through our HackerOne bug bounty program.

## Bypassing tags protection in GitLab

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/890 -->

An issue has been discovered in GitLab CE/EE affecting all versions before 15.10.8, all versions starting from 15.11 before 15.11.7, all versions starting from 16.0 before 16.0.2. An attacker was able to spoof protected tags, which could potentially lead a victim to download malicious code. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-2001](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2001).

Thanks [inspector-ambitious](https://hackerone.com/inspector-ambitious) for reporting this vulnerability through our HackerOne bug bounty program.

## Denial of Service using multiple labels with arbitrarily large descriptions

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/880 -->

A lack of length validation in GitLab CE/EE affecting all versions from 8.3 before 15.10.8, 15.11 before 15.11.7, and 16.0 before 16.0.2 allows an authenticated attacker to create a large Issue description via GraphQL which, when repeatedly requested, saturates CPU usage. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-0921](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0921).

Thanks [cryptopone](https://hackerone.com/cryptopone) for reporting this vulnerability through our HackerOne bug bounty program.

## Ability to use an unverified email for public and commit emails

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/867 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 10.1 before 15.10.8, all versions starting from 15.11 before 15.11.7, all versions starting from 16.0 before 16.0.2. A user could use an unverified email as a public email and commit email by sending a specifically crafted request on user update settings. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-1204](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1204).

Thanks [theluci](https://hackerone.com/theluci) for reporting this vulnerability through our HackerOne bug bounty program

## Open Redirection Through HTTP Response Splitting

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/885 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 15.4 before 15.10.8, all versions starting from 15.11 before 15.11.7, all versions starting from 16.0 before 16.0.2. Open redirection was possible via HTTP response splitting in the NPM package API. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:N/UI:R/S:U/C:N/I:L/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2023-0508](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0508).

Thanks [akadrian](https://hackerone.com/akadrian) for reporting this vulnerability through our HackerOne bug bounty program.

## Disclosure of issue notes to an unauthorized user when exporting a project

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/854 -->

An issue has been discovered in GitLab EE affecting all versions starting from 15.7 before 15.10.8, all versions starting from 15.11 before 15.11.7, all versions starting from 16.0 before 16.0.2. It was possible to disclose issue notes to an unauthorized user at project export. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:L/I:N/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2023-1825](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1825).

This vulnerability has been discovered internally by GitLab team member.

## Ambiguous branch name exploitation

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/886 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 1.2 before 15.10.8, all versions starting from 15.11 before 15.11.7, all versions starting from 16.0 before 16.0.2. An issue was found that allows someone to abuse a discrepancy between the Web application display and the git command line interface to social engineer victims into cloning non-trusted code. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:U/C:N/I:L/A:N`, 2.6). It is now mitigated in the latest release and is assigned [CVE-2023-2013](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2013).

Thanks [inspector-ambitious](https://hackerone.com/inspector-ambitious) for reporting this vulnerability through our HackerOne bug bounty program.

## Update Mattermost

Mattermost has been updated to version 7.9.3 in order to mitigate security issues.

## Update Ncurses

Ncurses has been updated to version 6.4-20230225 in order to mitigate security issues.

## Update PostgreSQL

PostgreSQL has been updated to versions 12.14 and 13.11 in order to mitigate security issues.

## Non Security Patches

This security release also includes the following non-security patches.

### 16.0.2

* [Update the upgrade path for 15.11 and 16.x](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/121518)
* [Introduce parallelised BitBucket Server Importer](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/121470)
* [Fix Sidekiq crash when gitlab.yml contains UTF-8 characters](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/121872)
* [Revert "Remove legacy project routes"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/121745)
* [Merge branch '344594-fix-migration' into '16-0-stable-ee'](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/121843)
* [Do not run notify-package-and-test-failure on sec](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/121606)
* [Add task to fix migrations for 15.11 upgrades (16.0 Stable)](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/121894)
* [Do not requeue the indexing worker if failures occur](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/122345)
* [Stop supporting and using deprecated Gitaly configuration](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6918)

### 15.11.7

* [Backport 'Remove uncessary fields from pack-objects cache key computation' to 15.11](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/5868)
* [Do not run notify-package-and-test-failure on sec](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/121608)
* [Add task to fix migrations for 15.11 upgrades (15.11 Stable)](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/121895)

### 15.10.8

* [Update redis-namespace dependency in MailRoom](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1397)
* [Skip weak dependencies during install on UBI](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1406)
* [Fix restore with azcopy](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1404)
* [Backport 'fix-container-replication' into 15.10](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/120163)
* [Convert some regex to use Gitlab::UntrustedRegexp](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/121305)
* [Do not run notify-package-and-test-failure on sec](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/121609)
* [Add SMTP timeout configuration options](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6887)
* [Validate that SMTP settings do not enable both TLS and STARTTLS](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6877)

## Updating

To update GitLab, see the [Update page](/update).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).

