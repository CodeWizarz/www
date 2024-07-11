---
title: "GitLab Security Release: 15.5.2, 15.4.4, and 15.3.5"
description: "Learn more about GitLab Security Release: 15.5.2, 15.4.4, and 15.3.5 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2022/11/02/security-release-gitlab-15-5-2-released/"
categories: releases
author: Dominic Couture
author_gitlab: dcouture
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.5.2, 15.4.4, and 15.3.5 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[DAST analyzer sends custom request headers with every request](#dast-analyzer-sends-custom-request-headers-with-every-request)|high|
|[Stored-XSS with CSP-bypass via scoped labels' color](#stored-xss-with-csp-bypass-via-scoped-labels-color)|high|
|[Maintainer can leak Datadog API key by changing integration URL](#maintainer-can-leak-datadog-api-key-by-changing-integration-url)|medium|
|[Uncontrolled resource consumption when parsing URLs](#uncontrolled-resource-consumption-when-parsing-urls)|medium|
|[Issue HTTP requests when users view an OpenAPI document and click buttons](#issue-http-requests-when-users-view-an-openapi-document-and-click-buttons)|medium|
|[Command injection in CI jobs via branch name in CI pipelines](#command-injection-in-ci-jobs-via-branch-name-in-ci-pipelines)|medium|
|[Open redirection](#open-redirection)|medium|
|[Prefill variables do not check permission of the project in external CI config](#prefill-variables-do-not-check-permission-of-the-project-in-external-ci-config)|medium|
|[Disclosure of audit events to insufficiently permissioned group and project members](#disclosure-of-audit-events-to-insufficiently-permissioned-group-and-project-members)|medium|
|[Arbitrary GFM references rendered in Jira issue description leak private/confidential resources](#arbitrary-gfm-references-rendered-in-jira-issue-description-leak-privateconfidential-resources)|medium|
|[Award emojis API for an internal note is accessible to users without access to the note](#award-emojis-api-for-an-internal-note-is-accessible-to-users-without-access-to-the-note)|low|
|[Open redirect in pipeline artifacts when generating HTML documents](#open-redirect-in-pipeline-artifacts-when-generating-html-documents)|low|
|[Retrying a job in a downstream pipeline allows the retrying user to take ownership of the retried jobs in upstream pipelines](#retrying-a-job-in-a-downstream-pipeline-allows-the-retrying-user-to-take-ownership-of-the-retried-jobs-in-upstream-pipelines)|low|
|[Project-level Secure Files can be written out of the target directory](#project-level-secure-files-can-be-written-out-of-the-target-directory)|low|

## DAST analyzer sends custom request headers with every request

<!-- https://gitlab.com/gitlab-org/gitlab/-/issues/377473 -->

Missing validation in DAST analyzer affecting all versions from 1.11.0 prior to 3.0.32, allows custom request headers to be sent with every request, regardless of the host. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:H/I:N/A:N`, 7.7). It is now mitigated in the latest release and is assigned [CVE-2022-3767](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3767).

This vulnerability has been discovered internally by the GitLab team.

## Stored-XSS with CSP-bypass via scoped labels' color

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/770 -->

A cross-site scripting issue has been discovered in GitLab CE/EE affecting all versions prior to 15.3.5, 15.4 prior to 15.4.4, and 15.5 prior to 15.5.2. It was possible to exploit a vulnerability in setting the labels  colour feature  which could lead to a stored XSS that allowed attackers to perform arbitrary actions on behalf of victims at client side. This is a high severity issue (`CVSS:3.1/AV:N/AC:H/PR:H/UI:R/S:C/C:H/I:H/A:N`, 7.3). It is now mitigated in the latest release and is assigned [CVE-2022-3265](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3265).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

## Maintainer can leak Datadog API key by changing integration URL

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/780 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 12.1 before 15.3.5, all versions starting from 15.4 before 15.4.4, all versions starting from 15.5 before 15.5.2. A malicious maintainer could exfiltrate a Datadog integration's access token by modifying the integration URL such that authenticated requests are sent to an attacker controlled server. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:C/C:L/I:L/A:N`, 5.5). It is now mitigated in the latest release and is assigned [CVE-2022-3483](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3483).

Thanks [ryotak](https://hackerone.com/ryotak) for reporting this vulnerability through our HackerOne bug bounty program.

## Uncontrolled resource consumption when parsing URLs

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/768 -->

An uncontrolled resource consumption issue when parsing URLs in GitLab CE/EE affecting all versions prior to 15.3.5, 15.4 prior to 15.4.4, and 15.5 prior to 15.5.2 allows an attacker to cause performance issues and potentially a denial of service on the GitLab instance. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:L`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2022-3818](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3818).

This vulnerability has been discovered internally by the GitLab team.

## Issue HTTP requests when users view an OpenAPI document and click buttons

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/778 -->

Lack of sand-boxing of OpenAPI documents in GitLab CE/EE affecting all versions from 12.6 prior to 15.3.5, 15.4 prior to 15.4.4, and 15.5 prior to 15.5.2 allows an attacker to trick a user to click on the Swagger OpenAPI viewer and issue HTTP requests that affect the victim's account. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:U/C:N/I:H/A:N`, 4.8). It is now mitigated in the latest release and is assigned [CVE-2022-3726](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3726).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

## Command injection in CI jobs via branch name in CI pipelines

Improper sanitization of branch names in GitLab Runner affecting all versions prior to 15.3.5, 15.4 prior to 15.4.4, and 15.5 prior to 15.5.2 allows a user who creates a branch with a specially crafted name and gets another user to trigger a pipeline to execute commands in the runner as that other user. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:U/C:H/I:N/A:N`, 4.8). It is now mitigated in the latest release and is assigned [CVE-2022-2251](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2251).

Thanks [stanlyoncm](https://hackerone.com/stanlyoncm) for reporting this vulnerability through our HackerOne bug bounty program.

## Open redirection

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/781 -->

An open redirect vulnerability in GitLab EE/CE affecting all versions from 9.3 prior to 15.3.5, 15.4 prior to 15.4.4, and 15.5 prior to 15.5.2, allows an attacker to redirect users to an arbitrary location if they trust the URL. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:C/C:N/I:L/A:N`, 4.7). It is now mitigated in the latest release and is assigned [CVE-2022-3486](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3486).

Thanks [ryotak](https://hackerone.com/ryotak) for reporting this vulnerability through our HackerOne bug bounty program.

## Prefill variables do not check permission of the project in external CI config

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/761 -->

An improper authorization issue in GitLab CE/EE affecting all versions from 14.4 prior to 15.3.5, 15.4 prior to 15.4.4, and 15.5 prior to 15.5.2 allows an attacker to read variables set directly in a GitLab CI/CD configuration file they don't have access to. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-3793](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3793).

This vulnerability has been discovered internally by the GitLab team.

## Disclosure of audit events to insufficiently permissioned group and project members

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/771 -->

Incorrect authorization during display of Audit Events in GitLab EE affecting all versions from 14.5 prior to 15.3.5, 15.4 prior to 15.4.4, and 15.5 prior to 15.5.2, allowed Developers to view the project's Audit Events and Developers or Maintainers to view the group's Audit Events. These should have been restricted to Project Maintainers, Group Owners, and above. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-3413](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3413).

This vulnerability has been discovered internally by the GitLab team.

## Arbitrary GFM references rendered in Jira issue description leak private/confidential resources

An information disclosure issue in GitLab CE/EE affecting all versions from 14.4 prior to 15.3.5, 15.4 prior to 15.4.4, and 15.5 prior to 15.5.2 allows an attacker to use GitLab Flavored Markdown (GFM) references in a Jira issue to disclose the names of resources they don't have access to. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-2761](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2761).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

## Award emojis API for an internal note is accessible to users without access to the note

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/783 -->

An improper authorization issue in GitLab CE/EE affecting all versions from 15.0 prior to 15.3.5, 15.4 prior to 15.4.4, and 15.5 prior to 15.5.2 allows a malicious users to set emojis on internal notes they don't have access to. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:N/I:L/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2022-3819](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3819).

This vulnerability has been discovered internally by the GitLab team.

## Open redirect in pipeline artifacts when generating HTML documents

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/764 -->

An open redirect in GitLab CE/EE affecting all versions from 10.1 prior to 15.3.5, 15.4 prior to 15.4.4, and 15.5 prior to 15.5.2 allows an attacker to trick users into visiting a trustworthy URL and being redirected to arbitrary content. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:N/I:L/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2022-3280](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3280).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Retrying a job in a downstream pipeline allows the retrying user to take ownership of the retried jobs in upstream pipelines

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/779 -->

Improper authorization in GitLab CE/EE affecting all versions from 7.14 prior to 15.3.5, 15.4 prior to 15.4.4, and 15.5 prior to 15.5.2 allows a user retrying a job in a downstream pipeline to take ownership of the retried jobs in the upstream pipeline even if the user doesn't have access to that project. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:N/I:L/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2022-3706](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3706).

This vulnerability has been discovered internally by the GitLab team.

## Project-level Secure Files can be written out of the target directory

<!-- https://gitlab.com/gitlab-org/gitlab/-/issues/376218 -->

Secure Files named in a specific way could traverse outside of the target directory in the CI job. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:L/A:N`, 2.7). Only GitLab.com was affected as this feature is not yet enabled on self-managed instances and the patch has been deployed in production.

This vulnerability has been discovered internally by the GitLab team.

## Update openssl

The version of openssl has been updated to [3.0.2-0ubuntu1.7](https://launchpad.net/ubuntu/+source/openssl/3.0.2-0ubuntu1.7) in order to mitigate security concerns.

# Versions affected

Affects all versions of GitLab Dynamic Application Security Testing (DAST) Analyzer prior to 3.0.32.

## Update curl

The version of curl has been updated to 7.85.0 in order to mitigate security concerns.

# Versions affected

Affects all versions of GitLab Omnibus.

## Update pcre2

The version of pcre2 has been updated to 10.40 in order to mitigate security concerns.

# Versions affected

Affects all versions of GitLab Omnibus.

## Non-security fixes

- [15.5.0 upgrade on CentOS 8 Stream in FIPS mode fails](https://gitlab.com/gitlab-org/omnibus-gitlab/-/issues/7275): Backported to 15.5.
- [Ohai fails to build trying to find unavailable version of the dependency chef-utils](https://gitlab.com/gitlab-org/omnibus-gitlab/-/issues/7267): Backported to 15.4 and 15.3.

## Updating

To update GitLab, see the [Update page](/update).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

To update DAST scanner, self-managed customers that are using our built-in DAST CI template after 15.0 can get the latest release from `registry.gitlab.com`. If using the [always pull policy](https://docs.gitlab.com/runner/executors/docker.html#using-the-always-pull-policy) the update will occur automatically. GitLab.com is already running the updated DAST scanner.

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
