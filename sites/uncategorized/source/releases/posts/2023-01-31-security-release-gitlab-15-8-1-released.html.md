---
title: "GitLab Security Release: 15.8.1, 15.7.6, and 15.6.7"
description: "Learn more about GitLab Security Release: 15.8.1, 15.7.6, and 15.6.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2023/01/31/security-release-gitlab-15-8-1-released/"
categories: releases
author: Nick Malcolm
author_gitlab: nmalcolm
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.8.1, 15.7.6, and 15.6.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Denial of Service via arbitrarily large Issue descriptions](#denial-of-service-via-arbitrarily-large-issue-descriptions)|medium|
|[CSRF via file upload allows an attacker to take over a repository.](#csrf-via-file-upload-allows-an-attacker-to-take-over-a-repository)|medium|
|[Sidekiq background job DoS by uploading malicious CI job artifact zips](#sidekiq-background-job-dos-by-uploading-malicious-ci-job-artifact-zips)|medium|
|[Sidekiq background job DoS by uploading a malicious Helm package](#sidekiq-background-job-dos-by-uploading-a-malicious-helm-package)|medium|

## Denial of Service via arbitrarily large Issue descriptions

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/817 -->

A lack of length validation in GitLab CE/EE affecting all versions from 12.4 before 15.6.7, 15.7 before 15.7.6, and 15.8 before 15.8.1 allows an authenticated attacker to create a large Issue description via GraphQL which, when repeatedly requested, saturates CPU usage. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-3411](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3411).

Thanks [cryptopone](https://hackerone.com/cryptopone) for reporting this vulnerability through our HackerOne bug bounty program.

## CSRF via file upload allows an attacker to take over a repository.

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/820 -->

A Cross Site Request Forgery issue has been discovered in GitLab CE/EE affecting all versions before 15.6.7, all versions starting from 15.7 before 15.7.6, and all versions starting from 15.8 before 15.8.1. An attacker could take over a project if an Owner or Maintainer uploads a file to a malicious project. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:U/C:H/I:H/A:N`, 6.4). It is now mitigated in the latest release and is assigned [CVE-2022-4138](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4138).

Thanks [st4nly0n](https://hackerone.com/st4nly0n) and [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Sidekiq background job DoS by uploading malicious CI job artifact zips

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/810 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 14.3 before 15.6.7, all versions starting from 15.7 before 15.7.6, all versions starting from 15.8 before 15.8.1. An attacker may upload a crafted CI job artifact zip file in a project that uses dynamic child pipelines and make a sidekiq job allocate a lot of memory. In GitLab instances where Sidekiq is memory-limited, this may cause Denial of Service. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-3759](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3759).

Thanks [luryus](https://hackerone.com/luryus) for reporting this vulnerability through our HackerOne bug bounty program.

## Sidekiq background job DoS by uploading a malicious Helm package

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/818 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 14.0 before 15.6.7, all versions starting from 15.7 before 15.7.6, all versions starting from 15.8 before 15.8.1. It was possible to trigger a DoS attack by uploading a malicious Helm chart. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-0518](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0518).

Thanks [luryus](https://hackerone.com/luryus) for reporting this vulnerability through our HackerOne bug bounty program.

## Update Mattermost

<!-- https://gitlab.com/gitlab-org/security/omnibus-gitlab/-/issues/79 -->

Mattermost has been updated to versions 7.5.2, 7.4.1, and 7.1.5 in order to mitigate security issues. 

### Versions affected

Affects versions 15.6 and 15.7 of GitLab Omnibus. GitLab 15.8 already included Mattermost 7.5.2.

## Non-security patches 

This security release also includes the following non-security patches.

Into 15.6.7:

* [Ensure Workhorse is built with FIPS for CNG](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1233)
* [Grab gitlab-logger archives from the new project location](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1252)
* [Ensure Workhorse is built in FIPS mode for Omnibus](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6575)
* [Doc: FIPS, update omnibus language](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/106592)
* [Only refresh indexes that exist](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/106986)
* [Clear DuplicateJobs cookies from post-deployment migration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/109098)
* [Upgrade GitLab logger to v2.3.0](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1273)

Into 15.7.6:

* [Geo - Remove parameter validation for registry notification request](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/109690)

Into 15.8.1:

* [Fix command in print-release-contents job](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/6644)
* [Fix resource_parent in FOSS instances](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/109991)
* [Geo - Remove parameter validation for registry notification request](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/109690)

## Updating

To update GitLab, see the [Update page](/update).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).

