---
title: "GitLab Security Release: 16.3.1, 16.2.5, and 16.1.5"
description: "Learn more about GitLab Security Release: 16.3.1, 16.2.5, and 16.1.5 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2023/08/31/security-release-gitlab-16-3-1-released/"
categories: releases
author: Félix Veillette-Potvin
author_gitlab: fvpotvin
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 16.3.1, 16.2.5 and 16.1.5 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=created_date&state=closed&label_name%5B%5D=bug%3A%3Avulnerability&confidential=no&first_page_size=100) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Privilege escalation of "external user" to internal access through group service account](#privilege-escalation-of-external-user-to-internal-access-through-group-service-account)|medium|
|[Maintainer can leak sentry token by changing the configured URL (fix bypass)](#maintainer-can-leak-sentry-token-by-changing-the-configured-url-fix-bypass)|medium|
|[Google Cloud Logging private key showed in plain text in GitLab UI leaking to other group owners](#google-cloud-logging-private-key-showed-in-plain-text-in-gitlab-ui-leaking-to-other-group-owners)|medium|
|[Information disclosure via project import endpoint](#information-disclosure-via-project-import-endpoint)|medium|
|[Developer can leak DAST scanners "Site Profile" request headers and auth password](#developer-can-leak-dast-scanners-site-profile-request-headers-and-auth-password)|medium|
|[Project forking outside current group](#project-forking-outside-current-group)|medium|
|[User is capable of creating Model experiment and updating existing run's status in public project](#user-is-capable-of-creating-model-experiment-and-updating-existing-run's-status-in-public-project)|medium|
|[ReDoS in bulk import API](#redos-in-bulk-import-api)|medium|
|[Pagination for Branches and Tags can be skipped leading to DoS](#pagination-for-branches-and-tags-can-be-skipped-leading-to-dos)|medium|
|[Internal Open Redirection Due to Improper handling of  "../" characters](#internal-open-redirection-due-to-improper-handling-of-characters)|low|
|[Subgroup Member With Reporter Role Can Edit Group Labels](#subgroup-member-with-reporter-role-can-edit-group-labels)|low|
|[Banned user can delete package registries](#banned-user-can-delete-package-registries)|low|

## Privilege escalation of "external user" to internal access through group service account

An issue has been discovered in GitLab EE affecting all versions starting from 16.1 before 16.1.5, all versions starting from 16.2 before 16.2.5, all versions starting from 16.3 before 16.3.1. If an external user is given an owner role on any group, that external user may escalate their privileges on the instance by creating a service account in that group. This service account is not classified as external and may be used to access internal projects. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:H/I:H/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2023-3915](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3915).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Maintainer can leak sentry token by changing the configured URL (fix bypass)

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/950 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 11.8 before 16.1.5, all versions starting from 16.2 before 16.2.5, all versions starting from 16.3 before 16.3.1. A malicious Maintainer can, under specific circumstances, leak the sentry token by changing the configured URL in the Sentry error tracking settings page. This was as a result of an incomplete fix for CVE-2022-4365. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:C/C:L/I:L/A:N`, 5.5). It is now mitigated in the latest release and is assigned [CVE-2023-4378](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-4378.

Thanks [70rpedo](https://hackerone.com/70rpedo) for reporting this vulnerability through our HackerOne bug bounty program.

## Google Cloud Logging private key showed in plain text in GitLab UI leaking to other group owners

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/940 -->

An information disclosure issue in GitLab EE affecting all versions from 16.2 prior to 16.2.5, and 16.3 prior to 16.3.1 allowed other Group Owners to see the Public Key for a Google Cloud Logging audit event streaming destination, if configured. Owners can now only write the key, not read it. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:C/C:L/I:L/A:N`, 5.5), and affects only GitLab EE. It is now mitigated in the latest release and is assigned [CVE-2023-3950](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3950.

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Information disclosure via project import endpoint

An issue has been discovered in GitLab CE/EE affecting all versions starting from 10.6 before 16.1.5, all versions starting from 16.2 before 16.2.5, all versions starting from 16.3 before 16.3.1 in which any user can read limited information about any project's imports. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:L/I:N/A:N`, 5.0). It is now mitigated in the latest release and is assigned [CVE-2023-4630](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-4630).

This vulnerability was found internally by a GitLab team member [Rodrigo Tomonari](https://gitlab.com/rodrigo.tomonari).

## Developer can leak DAST scanners "Site Profile" request headers and auth password

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/954 -->

An issue has been discovered in GitLab EE affecting all versions starting from 13.12 before 16.1.5, all versions starting from 16.2 before 16.2.5, all versions starting from 16.3 before 16.3.1 in which a project member can leak credentials stored in site profile. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:L/I:N/A:N`, 5.0), and only affects GitLab EE. It is now mitigated in the latest release and is assigned [CVE-2022-4343](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4343).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Project forking outside current group

An issue has been discovered in GitLab CE/EE affecting all versions starting from 13.3 before 16.1.5, all versions starting from 16.2 before 16.2.5, all versions starting from 16.3 before 16.3.1. Due to improper permission validation it was possible to fork a project outside of current group by an unauthorised user. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-4638](https://cve.mitre.org/cgi-binCVE-2023-1279/cvename.cgi?name=CVE-2023-4638).

Thanks [theluci](https://hackerone.com/theluci) for reporting this vulnerability through our HackerOne bug bounty program.

## User is capable of creating Model experiment and updating existing run's status in public project

An issue has been discovered in GitLab CE/EE affecting all versions starting from 16.2 before 16.2.5, all versions starting from 16.3 before 16.3.1. Due to improper permission validation it was possible to create model experiments in public projects. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-4018](https://cve.mitre.org/cgi-binCVE-2023-1279/cvename.cgi?name=CVE-2023-4018).

Thanks [ricardobrito](https://hackerone.com/ricardobrito) for reporting this vulnerability through our HackerOne bug bounty program

## ReDoS in bulk import API

<!-- https://gitlab.com/gitlab-org/security/gitlahttps://about.gitlab.com/releases/2023/08/01/b/-/issues/935 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 15.11 before 16.1.5, all versions starting from 16.2 before 16.2.5, all versions starting from 16.3 before 16.3.1. An authenticated user could trigger a denial of service when importing or cloning malicious content. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H`,6.5). It is now mitigated in the latest release and is assigned [CVE-2023-3205](https://cve.mitre.org/cgi-binCVE-2023-1279/cvename.cgi?name=CVE-2023-3205).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program

## Pagination for Branches and Tags can be skipped leading to DoS

An issue has been discovered in GitLab CE/EE affecting all versions starting from 15.3 before 16.1.5, all versions starting from 16.2 before 16.2.5, all versions starting from 16.3 before 16.3.1 in which the projects API pagination can be skipped, potentially leading to DoS on certain instances. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:N/I:N/A:H`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2023-4647](https://cve.mitre.org/cgi-binCVE-2023-1279/cvename.cgi?name=CVE-2023-4647).

This vulnerability has been discovered internally by GitLab team member [Vasilii Iakliushin](https://gitlab.com/vyaklushin)

## Internal Open Redirection Due to Improper handling of  "../" characters

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/934 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 4.1 before 16.1.5, all versions starting from 16.2 before 16.2.5, all versions starting from 16.3 before 16.3.1 where it was possible to create a URL that would redirect to a different project. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:N/I:L/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2023-1279](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1279).

Thanks [akadrian](https://hackerone.com/akadrian) for reporting this vulnerability through our HackerOne bug bounty program.

## Subgroup Member With Reporter Role Can Edit Group Labels

An issue has been discovered in GitLab CE/EE affecting all versions starting from 10.0 before 16.1.5, all versions starting from 16.2 before 16.2.5, all versions starting from 16.3 before 16.3.1. Due to improper permission validation it was possible to edit labels description by an unauthorised user. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:N/I:L/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2023-0120](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0120).

Thanks [drjgouveia](https://hackerone.com/drjgouveia) for reporting this vulnerability through our HackerOne bug bounty program.

## Banned user can delete package registries

An issue has been discovered in GitLab CE/EE affecting all versions starting from 15.2 before 16.1.5, all versions starting from 16.2 before 16.2.5, all versions starting from 16.3 before 16.3.1. A namespace-level banned user can access the API. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:L/A:N`, 2.7). It is now mitigated in the latest release and is assigned [CVE-2023-1555](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1555).

Thanks [ali_shehab](https://hackerone.com/ali_shehab) for reporting this vulnerability through our HackerOne bug bounty program.

## Update commonmarker

Commonmarker has been updated to version 0.23.10 in order to mitigate security issues.

## Update openssl 
Openssl has been updated to version to 1.1.1u in order to mitigate security issues.
## Non Security Patches

This security release also includes the following non-security patches.

### 16.3.1

* [Remove unified URL limitation for GitLab chart (16.3 backport)](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/129854)
* [Revert migration to backfill archived in wikis](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/129910)
* [Add .net to context selector to skip live envs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/129922)
* [Backport "Geo: Resync direct upload object stored artifacts" to 16.3](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/129882)
* [CSP: disable LFS url when not using object storage](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/130200)
* [Backport LicenseScanning fix for AutoDevOps](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/129971)

### 16.2.5

* [Backport "cgroup: using a noop manager on linux without cgroup" fix to 16.2](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/6172)
* [Adjust Danger logic for stable branches](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/128763)
* [Backport "Geo: Resync direct upload object stored artifacts" to 16.2](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/129883)

### 16.1.5

* [Revert "Log rails response length" - 16.1 Backport](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/128779)
* [Adjust Danger logic for stable branches](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/128764)
* [Backport "Geo: Resync direct upload object stored artifacts" to 16.1](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/129884)

## Updating

To update GitLab, see the [Update page](/update).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).

