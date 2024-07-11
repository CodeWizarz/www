---
title: "GitLab Security Release: 16.2.2, 16.1.3, and 16.0.8"
description: "Learn more about GitLab Security Release: 16.2.2, 16.1.3, and 16.0.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2023/08/01/security-release-gitlab-16-2-2-released/"
categories: releases
author: Greg Myers
author_gitlab: greg
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 16.2.2, 16.1.3, and 16.0.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=created_date&state=closed&label_name%5B%5D=bug%3A%3Avulnerability&confidential=no&first_page_size=100) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[ReDoS via ProjectReferenceFilter in any Markdown fields](#redos-via-projectreferencefilter-in-any-markdown-fields)|high|
|[ReDoS via AutolinkFilter in any Markdown fields](#redos-via-autolinkfilter-in-any-markdown-fields)|high|
|[An attacker can run pipeline jobs as arbitrary user](#an-attacker-can-run-pipeline-jobs-as-arbitrary-user)|high|
|[Regex DoS in Harbor Registry search](#regex-dos-in-harbor-registry-search)|medium|
|[Arbitrary read of files owned by the "git" user via malicious tar.gz file upload using GitLab export functionality](#arbitrary-read-of-files-owned-by-the-git-user-via-malicious-targz-file-upload-using-gitlab-export-functionality)|medium|
|[Stored XSS in Web IDE Beta via crafted URL](#stored-xss-in-web-ide-beta-via-crafted-url)|medium|
|[`securityPolicyProjectAssign` mutation does not authorize security policy project ID](#securitypolicyprojectassign-mutation-does-not-authorize-security-policy-project-id)|medium|
|[Possible Pages Unique Domain Overwrite](#possible-pages-unique-domain-overwrite)|medium|
|[Access tokens may have been logged when a query was made to an endpoint](#access-tokens-may-have-been-logged-when-a-query-was-made-to-an-endpoint)|medium|
|[Reflected XSS via PlantUML diagram](#reflected-xss-via-plantuml-diagram)|medium|
|[The main branch of a repository with a specially designed name may allow an attacker to create repositories with malicious code](#the-main-branch-of-a-repository-with-a-specially-designed-name-may-allow-an-attacker-to-create-repositories-with-malicious-code)|medium|
|[Invalid 'start_sha' value on merge requests page may lead to Denial of Service](#invalid-start_sha-value-on-merge-requests-page-may-lead-to-denial-of-service)|medium|
|[Developers can create pipeline schedules on protected branches even if they don't have access to merge](#developers-can-create-pipeline-schedules-on-protected-branches-even-if-they-dont-have-access-to-merge)|medium|
|[Potential DOS due to lack of pagination while loading license data](#potential-dos-due-to-lack-of-pagination-while-loading-license-data)|medium|
|[Leaking emails of newly created users](#leaking-emails-of-newly-created-users)|low|

## ReDoS via ProjectReferenceFilter in any Markdown fields

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/910 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 9.3 before 16.0.8, all versions starting from 16.1 before 16.1.3, all versions starting from 16.2 before 16.2.2. A Regular Expression Denial of Service was possible via sending crafted payloads which use ProjectReferenceFilter to the preview_markdown endpoint. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H`, 7.5). It is now mitigated in the latest release and is assigned [CVE-2023-3994](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3994).

Thanks [ryhmnlfj](https://hackerone.com/ryhmnlfj) for reporting this vulnerability through our HackerOne bug bounty program.

## ReDoS via AutolinkFilter in any Markdown fields

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/925 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 8.14 before 16.0.8, all versions starting from 16.1 before 16.1.3, all versions starting from 16.2 before 16.2.2. A Regular Expression Denial of Service was possible via sending crafted payloads which use AutolinkFilter to the preview_markdown endpoint. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H`, 7.5). It is now mitigated in the latest release and is assigned [CVE-2023-3364](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3364).

Thanks [ryhmnlfj](https://hackerone.com/ryhmnlfj) for reporting this vulnerability through our HackerOne bug bounty program.

## An attacker can run pipeline jobs as arbitrary user

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/917 -->

An issue has been discovered in GitLab EE affecting all versions starting from 13.12 before 16.0.8, all versions starting from 16.1 before 16.1.3, all versions starting from 16.2 before 16.2.2. It was possible for an attacker to run pipeline jobs as an arbitrary user via scheduled security scan policies. This is a high severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:C/C:H/I:H/A:N`, 8.2). It is now mitigated in the latest release and is assigned [CVE-2023-3932](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3932).

Thanks [vaib25vicky](https://hackerone.com/vaib25vicky) for reporting this vulnerability through our HackerOne bug bounty program.

## Regex DoS in Harbor Registry search

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/913 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 15.2 before 16.0.8, all versions starting from 16.1 before 16.1.3, all versions starting from 16.2 before 16.2.2. A Regular Expression Denial of Service was possible by using crafted payloads to search Harbor Registry. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2023-0632](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0632).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Arbitrary read of files owned by the "git" user via malicious tar.gz file upload using GitLab export functionality

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/926 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 8.10 before 16.0.8, all versions starting from 16.1 before 16.1.3, all versions starting from 16.2 before 16.2.2. Under specific circumstances, a user importing a project 'from export' could access and read unrelated files via uploading a specially crafted file. This was due to a bug in `tar`, fixed in [`tar-1.35`](https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00005.html). This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:C/C:H/I:N/A:N`, 6.3). It is now mitigated in the latest release and is assigned [CVE-2023-3385](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3385).

Thanks [ubercomp](https://hackerone.com/ubercomp) for reporting this vulnerability through our HackerOne bug bounty program.

## Stored XSS in Web IDE Beta via crafted URL

An issue has been discovered in GitLab CE/EE affecting all versions starting from 15.9 before 16.0.8, all versions starting from 16.1 before 16.1.3, all versions starting from 16.2 before 16.2.2. It was possible for an attacker to trigger a stored XSS vulnerability via user interaction with a crafted URL in the WebIDE beta. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:C/C:L/I:L/A:N`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2023-2164](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2164).

Thanks [viridian_40826d](https://hackerone.com/viridian_40826d) for reporting this vulnerability through our HackerOne bug bounty program.

## `securityPolicyProjectAssign` mutation does not authorize security policy project ID

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/929 -->

An issue has been discovered in GitLab EE affecting all versions starting from 14.1 before 16.0.8, all versions starting from 16.1 before 16.1.3, all versions starting from 16.2 before 16.2.2. It was possible for EE-licensed users to link any security policy project by its ID to projects or groups the user has access to, potentially revealing the security projects's configured security policies. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:H/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2023-4002](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-4002).

This vulnerability has been discovered internally by GitLab team member [bauerdominic](https://gitlab.com/bauerdominic).

## Possible Pages Unique Domain Overwrite

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/920 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 15.9 before 16.0.8, all versions starting from 16.1 before 16.1.3, all versions starting from 16.2 before 16.2.2. It was possible to takeover GitLab Pages with unique domain URLs if the random string added was known. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:L/I:N/A:N`, 5.0). It is now mitigated in the latest release and is assigned [CVE-2023-4008](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-4008).

This vulnerability was discovered internally by GitLab team member [kassio](https://gitlab.com/kassio).

## Access tokens may have been logged when a query was made to an endpoint

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/906 -->

An issue has been discovered in GitLab EE affecting all versions starting from 14.3 before 16.0.8, all versions starting from 16.1 before 16.1.3, all versions starting from 16.2 before 16.2.2. Access tokens may have been logged when a query was made to a specific endpoint. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:H/I:N/A:N`, 4.9). It is now mitigated in the latest release and is assigned [CVE-2023-3993](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3993).

This vulnerability was discovered internally by GitLab team member [mjozenazemian](https://gitlab.com/mjozenazemian).

## Reflected XSS via PlantUML diagram

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/932 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 10.0 before 16.0.8, all versions starting from 16.1 before 16.1.3, all versions starting from 16.2 before 16.2.2. A reflected XSS was possible when creating specific PlantUML diagrams that allowed the attacker to perform arbitrary actions on behalf of victims. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:L/A:N`, 4.8). It is now mitigated in the latest release and is assigned [CVE-2023-3500](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3500).

Thanks [ankitsingh](https://hackerone.com/ankitsingh) for reporting this vulnerability through our HackerOne bug bounty program.

## The main branch of a repository with a specially designed name may allow an attacker to create repositories with malicious code

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/915 -->

An issue has been discovered in GitLab affecting all versions before 16.0.8, all versions starting from 16.1 before 16.1.3, all versions starting from 16.2 before 16.2.2. The main branch of a repository with a specially designed name allows an attacker to create repositories with malicious code. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:U/C:N/I:H/A:N`, 4.8). It is now mitigated in the latest release and is assigned [CVE-2023-3401](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3401).

Thanks [st4nly0n](https://hackerone.com/st4nly0n) for reporting this vulnerability through our HackerOne bug bounty program

## Invalid 'start_sha' value on merge requests page may lead to Denial of Service

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/928 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 16.1 before 16.1.3, all versions starting from 16.2 before 16.2.2. An invalid 'start_sha' value on merge requests page may lead to Denial of Service as Changes tab would not load. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-3900](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3900).

Thanks [toukakirishima](https://hackerone.com/toukakirishima) for reporting this vulnerability through our HackerOne bug bounty program.

## Developers can create pipeline schedules on protected branches even if they don't have access to merge

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/901 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting before 16.0.8, all versions starting from 16.1 before 16.1.3, all versions starting from 16.2 before 16.2.2, which leads to developers being able to create pipeline schedules on protected branches even if they don't have access to merge. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-2022](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2022).

Thanks [js_noob](https://hackerone.com/js_noob) for reporting this vulnerability through our HackerOne bug bounty program.

## Potential DOS due to lack of pagination while loading license data

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/931 -->

An issue has been discovered in GitLab EE affecting all versions from 15.11 prior to 16.2.2 which allows an attacker to spike the resource consumption by loading Dependency List page, resulting in a possible DoS. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is mitigated in the latest 16.2.2 release and is assigned [CVE-2023-4011](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-4011).

This vulnerability was discovered internally by GitLab team member [gonzoyumo](https://gitlab.com/gonzoyumo).

## Leaking emails of newly created users

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/927 -->

An issue has been discovered in GitLab affecting all versions starting from 12.9 before 16.0.8, all versions starting from 16.1 before 16.1.3, all versions starting from 16.2 before 16.2.2. It was possible to leak a user's email via an error message for groups that restrict membership by email domain. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:L/I:N/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2023-1210](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1210).

Thanks [shells3c](https://hackerone.com/shells3c) for reporting this vulnerability through our HackerOne bug bounty program.

## Update Mattermost

Mattermost has been updated to version 7.10.4  in order to mitigate security issues.

## Update Redis

Redis has been updated to version 6.2.13 in order to mitigate security issues.

## Non Security Patches

This security release also includes the following non-security patches.

### 16.2.2

- [Issue type change to incident results in 404](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/127238 "Merge branch '418983-fix-issue-type-update' into 'master'")
- [Enable `descendant_security_scans` by default](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/127045 "Enable descendant_security_scans by default")
- [Disable IAT verification by default](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/127516 "Disable IAT verification by default")
- [BitBucket Server Importer - Preserve PR (MR) reviewers](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/127777 "BitBucket Server Importer - Preserve PR (MR) reviewers")
- [Toggle `recommend_pg_upgrade` to false for now](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/7060 "Toggle recommend_pg_upgrade to false for now")

### 16.1.3

- [Geo: Backport design repos verification bug fix](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/125261 "Geo: Backport design repos verification bug fix")
- [Geo - Backport wiki repository verification fix](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/125316 "Geo - Backport wiki repository verification fix")
- [Fix FOUC when new sidebar enabled](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/126783 "Fix FOUC when new sidebar enabled")
- [Repair the trigger for Release Environments](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/127515 "[16.1] Repair the trigger for Release Environments")
- [Disable IAT verification by default](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/127517 "Disable IAT verification by default")
- [Backport fix for pending direct uploads completion to 16.1](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/127402 "Backport fix for pending direct uploads completion to 16.1")
- [BitBucket Server Importer - Preserve PR (MR) reviewers](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/127778 "BitBucket Server Importer - Preserve PR (MR) reviewers")
- [Fix pg-upgrade failure on Geo secondary nodes \[16.1\]](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/7050 "Fix pg-upgrade failure on Geo secondary nodes [16.1]")
- [Don't 500 when pages tries to serve a chunked file](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/7034 "Don't 500 when pages tries to serve a chunked file")

### 16.0.8

- [Disable IAT verification by default](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/127518 "Disable IAT verification by default")
- [Fix pg-upgrade failure on Geo secondary nodes \[16.0\]](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/7051 "Fix pg-upgrade failure on Geo secondary nodes [16.0]")

## Updating

To update GitLab, see the [Update page](/update).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
