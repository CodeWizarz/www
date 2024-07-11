---
title: "GitLab Critical Security Release: 16.3.4 and 16.2.7"
description: "Learn more about GitLab Critical Security Release: 16.3.4 and 16.2.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
categories: releases
author: Nick Malcolm
author_gitlab: nmalcolm
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 16.3.4 and 16.2.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=created_date&state=closed&label_name%5B%5D=bug%3A%3Avulnerability&confidential=no&first_page_size=100) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**. For versions starting from 13.12 before 16.2.7, all versions starting from 16.3 before 16.3.4, see the [mitigations](#mitigations-for-impacted-versions) offered below.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.


## Table of Fixes

|Title|Severity|
|---|---|
|[Attacker can abuse scan execution policies to run pipeline as another user](#attacker-can-abuse-scan-execution-policies-to-run-pipelines-as-another-user)| critical |

## Attacker can abuse scan execution policies to run pipelines as another user

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/975 -->
An issue has been discovered in GitLab EE affecting all versions starting
from 13.12 before 16.2.7 and all
versions starting from 16.3 before 16.3.4. It was possible for an attacker to run 
pipelines as an arbitrary user via scheduled security scan policies. 
This was a bypass of [CVE-2023-3932](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3932) showing additional impact.
This is a critical severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:H/I:H/A:N`, 9.6). 
It is now mitigated in the latest release and is assigned [CVE-2023-5009](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-5009).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

### Mitigations for impacted versions

Instances running versions starting from 13.12 before 16.2.7, all versions starting from 16.3 before 16.3.4 are vulnerable if both of the features below are enabled at the same time. In order to mitigate this vulnerability in situations where it's not possible to upgrade, it is required to disable one or both features.

- [Direct transfers](https://docs.gitlab.com/ee/administration/settings/import_and_export_settings.html#enable-migration-of-groups-and-projects-by-direct-transfer)
- [Security policies](https://docs.gitlab.com/ee/user/application_security/policies/scan-execution-policies.html)

**If both features are turned on, the instance is in a vulnerable state.**

## Non Security Patches

This security release also includes the following non-security patches.

### 16.3.4

* [Use new indexer, fix removing blobs from index](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/131073)
* [Backport "Fix Geo secondary proxying Git pulls unnecessarily" to 16.3](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/131920)

### 16.2.7

* [Revert "Merge branch 'md-play-all-skipped-button' into 'master'"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/131193)

## Updating

To update GitLab, see the [Update page](/update).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).

