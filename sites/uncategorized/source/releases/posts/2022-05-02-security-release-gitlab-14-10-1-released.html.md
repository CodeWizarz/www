---
title: "GitLab Security Release: 14.10.1, 14.9.4, and 14.8.6"
description: "Learn more about GitLab Security Release: 14.10.1, 14.9.4, and 14.8.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2022/05/02/security-release-gitlab-14-10-1-released/"
categories: releases
author: Michael Henriksen
author_gitlab: mhenriksen
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 14.10.1, 14.9.4, and 14.8.6 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Improper access control in CI/CD cache mechanism](#improper-access-control-in-cicd-cache-mechanism)|high|
|[ReDoS on CI Editor and CI Pipeline detail pages](#redos-on-ci-editor-and-ci-pipeline-detail-pages)|medium|
|[User with developer role (group) can modify Protected branches -> Allowed to merge setting on imported project](#user-with-developer-role-group-can-modify-protected-branches---allowed-to-merge-setting-on-imported-project)|medium|
|[Maintainer can execute scheduled CI pipeline as another user](#maintainer-can-execute-scheduled-ci-pipeline-as-another-user)|medium|
|[Missing input masking on sensitive integration properties](#missing-input-masking-on-sensitive-integration-properties)|medium|
|[API discloses issue titles of limited projects](#api-discloses-issue-titles-of-limited-projects)|medium|
|[Confidential notes disclosure](#confidential-notes-disclosure)|medium|
|[Improper rack-attack discriminator for `authenticated_packages_api` with a deploy token](#improper-rack-attack-discriminator-for-authenticated_packages_api-with-a-deploy-token)|medium|
|[Improper access control in Project Members-only Wiki](#improper-access-control-in-project-members-only-wiki)|medium|
|[Guest project member can access trace log of jobs when it is enabled](#guest-project-member-can-access-trace-log-of-jobs-when-it-is-enabled)|medium|
|[HTML and CSS injection in pipeline error messages](#html-and-css-injection-in-pipeline-error-messages)|medium|
|[Forging GET Requests through and Denying Service of Simple PyPi API Endpoint](#forging-get-requests-through-and-denying-service-of-simple-pypi-api-endpoint)|medium|
|[Missing invalidation of Markdown cache causes potential XSS payloads to persist](#missing-invalidation-of-markdown-cache-causes-potential-xss-payloads-to-persist)|low|
|[Conan API incorrectly processes JWT-encoded Personal Access Tokens](#conan-api-incorrectly-processes-jwt-encoded-personal-access-tokens)|low|

## Improper access control in CI/CD cache mechanism

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/649 -->

Improper access control in the CI/CD cache mechanism in GitLab CE/EE affecting all versions from 1.0.2 before 14.8.6 allows a malicious actor with Developer privileges to perform cache poisoning leading to arbitrary code execution in protected branches. This is a high severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:C/C:H/I:L/A:N`, 7.1). It is now mitigated in the latest release and is assigned [CVE-2022-1423](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1423).

Thanks [wapiflapi](https://hackerone.com/wapiflapi) for reporting this vulnerability through our HackerOne bug bounty program.

## ReDoS on CI Editor and CI Pipeline detail pages

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/641 -->

An issue has been discovered in GitLab affecting all versions starting from 13.9 before 14.8.6, all versions starting from 14.9 before 14.9.4, all versions starting from 14.10 before 14.10.1. GitLab was not correctly handling malicious text in the CI Editor and CI Pipeline details page allowing the attacker to cause uncontrolled resource consumption. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-1510](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1510).

Thanks [stunninglemon](https://hackerone.com/stunninglemon) for reporting this vulnerability through our HackerOne bug bounty program.

## User with developer role (group) can modify Protected branches -> Allowed to merge setting on imported project

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/636 -->

Improper input validation in GitLab CE/EE affecting all versions from 8.12 prior to 14.8.6, all versions from 14.9.0 prior to 14.9.4, and 14.10.0 allows a Developer to read protected Group or Project CI/CD variables by importing a malicious project. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-1406](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1406).

Thanks [@justas_b](https://hackerone.com/justas_b) for reporting this vulnerability through our HackerOne bug bounty program.

## Maintainer can execute scheduled CI pipeline as another user

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/658 -->

An issue has been discovered in GitLab affecting all versions starting from 9.2 before 14.8.6, all versions starting from 14.9 before 14.9.4, all versions starting from 14.10 before 14.10.1. GitLab was not performing correct authorizations on scheduled pipelines allowing a malicious user to run a pipeline in the context of another user. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:R/S:U/C:H/I:H/A:N`, 6.1). It is now mitigated in the latest release and is assigned [CVE-2022-1460](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1460).

Thanks [peterl](https://hackerone.com/peterl) for reporting this vulnerability through our HackerOne bug bounty program.

## Missing input masking on sensitive integration properties

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/646 -->

Missing input masking in GitLab CE/EE affecting all versions starting from 1.0.2 before 14.8.6 causes potentially sensitive integration properties to be disclosed in the web interface. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:H/UI:R/S:C/C:H/I:N/A:N`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2022-1413](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1413).

This vulnerability has been discovered internally by the GitLab team.

## API discloses issue titles of limited projects

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/655 -->

Due to an insecure direct object reference vulnerability in Gitlab EE/CE affecting all versions from 11.0 prior to 14.8.6, 14.9 prior to 14.9.4, and 14.10 prior to 14.10.1, an endpoint may reveal the issue title to a user who crafted an API call with the ID of the issue from a public project that restricts access to issue only to project members. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2022-1352](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1352).

Thanks [shells3c](https://hackerone.com/shells3c) for reporting this vulnerability through our HackerOne bug bounty program.

## Confidential notes disclosure

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/644 -->

It was possible to disclose details of confidential notes created via the API in Gitlab CE/EE affecting all versions from 13.2 prior to 14.8.6, 14.9 prior to 14.9.4, and 14.10 prior to 14.10.1 if an unauthorised project member was tagged in the note. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). We have requested a CVE ID and will update this blog post when it is assigned.

This vulnerability has been discovered internally by the GitLab team.

## Improper rack-attack discriminator for `authenticated_packages_api` with a deploy token

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/652 -->

An issue has been discovered in GitLab affecting all versions before 14.8.6, all versions starting from 14.9 before 14.9.4, all versions starting from 14.10 before 14.10.1. GitLab was incorrectly verifying throttling limits for authenticated package requests which resulted in limits not being enforced. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-1428](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1428).

This vulnerability has been discovered internally by the GitLab team.

## Improper access control in Project Members-only Wiki

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/647 -->

Improper access control in GitLab CE/EE affecting all versions starting from 8.12 before 14.8.6, all versions starting from 8.13 before 14.9.4, and all versions starting from 8.14 before 14.10.1 allows non-project members to access contents of Project Members-only Wikis via malicious CI jobs. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-1417](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1417).

Thanks [shells3c](https://hackerone.com/shells3c) for reporting this vulnerability through our HackerOne bug bounty program.

## Guest project member can access trace log of jobs when it is enabled

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/634 -->

An improper authorization issue has been discovered in GitLab CE/EE affecting all versions prior to 14.8.6, all versions from 14.9.0 prior to 14.9.4, and 14.10.0, allowing Guest project members to access trace log of jobs when it is enabled. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-1124](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1124).

Thanks [jimeno](https://hackerone.com/jimeno) for reporting this vulnerability through our HackerOne bug bounty program.

## HTML and CSS injection in pipeline error messages

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/645 -->

Missing sanitization of data in Pipeline error messages in GitLab CE/EE affecting all versions starting from 1.0.2 before 14.8.6 allows for rendering of attacker controlled HTML tags and CSS styling. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-1416](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1416).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Forging GET Requests through and Denying Service of Simple PyPi API Endpoint

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/659 -->

An issue has been discovered in GitLab affecting all versions starting from 12.10 before 14.8.6, all versions starting from 14.9 before 14.9.4, all versions starting from 14.10 before 14.10.1. GitLab was not correctly handling malicious requests to the PyPi API endpoint allowing the attacker to cause uncontrolled resource consumption. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-1431](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1431).

Thanks [iwis](https://hackerone.com/iwis) for reporting this vulnerability through our HackerOne bug bounty program.

## Missing invalidation of Markdown cache causes potential XSS payloads to persist

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/654 -->

An issue has been discovered in GitLab affecting all versions starting from 14.4 before 14.8.6, all versions starting from 14.9 before 14.9.4, all versions starting from 14.10 before 14.10.1. Missing invalidation of Markdown caching causes potential payloads from a previously exploitable XSS vulnerability (CVE-2022-1175) to persist and execute. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:R/S:U/C:L/I:N/A:N`, 2.6). It is now mitigated in the latest release and is assigned [CVE-2022-1433](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1433).

Thanks [stacksmashing](https://hackerone.com/stacksmashing) for reporting this vulnerability through our HackerOne bug bounty program.

## Conan API incorrectly processes JWT-encoded Personal Access Tokens

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/635 -->

An issue has been discovered in GitLab affecting all versions starting from 12.6 before 14.8.6, all versions starting from 14.9 before 14.9.4, all versions starting from 14.10 before 14.10.1.  GitLab was not correctly authenticating a user that had some certain amount of information which allowed an user to authenticate without a personal access token. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:H/UI:R/S:U/C:L/I:N/A:N`, 2.0). It is now mitigated in the latest release and is assigned [CVE-2022-1426](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1426).

Thanks [firelizzard](https://hackerone.com/firelizzard) for reporting this vulnerability through our HackerOne bug bounty program.

## Update Zlib

The version of Zlib has been updated to 1.2.12 in order to mitigate security concerns.

### Versions affected

Affects GitLab Omnibus prior to 14.8

## Update Ipynbdiff

The version of Ipynbdiff has been updated to 0.4.5 in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab CE/EE prior to 14.10

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).

