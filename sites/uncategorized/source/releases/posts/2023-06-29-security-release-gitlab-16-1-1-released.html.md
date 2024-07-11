---
title: "GitLab Security Release: 16.1.1, 16.0.6, and 15.11.10"
description: "Learn more about GitLab Security Release: 16.1.1, 16.0.6, and 15.11.10 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2023/06/29/security-release-gitlab-16-1-1-released/"
categories: releases
author: Nikhil George
author_gitlab: ngeorge1
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 16.1.1, 16.0.6, and 15.11.10 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=created_date&state=closed&label_name%5B%5D=bug%3A%3Avulnerability&confidential=no&first_page_size=100) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[ReDoS via EpicReferenceFilter in any Markdown fields](#redos-via-epicreferencefilter-in-any-markdown-fields)|high|
|[New commits to private projects visible in forks created while project was public](#new-commits-to-private-projects-visible-in-forks-created-while-project-was-public)|medium|
|[Code Owners approvals are not removed allowing merge into protected branches](#code-owners-approvals-are-not-removed-allowing-merge-into-protected-branches)|medium|
|[Maintainer can leak masked webhook secrets by manipulating URL masking](#maintainer-can-leak-masked-webhook-secrets-by-manipulating-url-masking)|medium|
|[Information disclosure of project import errors](#information-disclosure-of-project-import-errors)|medium|
|[Sensitive information disclosure via value stream analytics controller](#sensitive-information-disclosure-via-value-stream-analytics-controller)|medium|
|[Bypassing Code Owners branch protection rule in GitLab](#bypassing-code-owners-branch-protection-rule-in-gitlab)|medium|
|[HTML injection in email address](#html-injection-in-email-address)|medium|
|[Webhook token leaked in Sidekiq logs if log format is 'default'](#webhook-token-leaked-in-sidekiq-logs-if-log-format-is-default)|low|
|[Private email address of service desk issue creator disclosed via issues API](#private-email-address-of-service-desk-issue-creator-disclosed-via-issues-api)|low|

## ReDoS via EpicReferenceFilter in any Markdown fields

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/902 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 10.3 before 15.11.10, all versions starting from 16.0 before 16.0.6, all versions starting from 16.1 before 16.1.1. A Regular Expression Denial of Service was possible via sending crafted payloads to the preview_markdown endpoint. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H`, 7.5). It is now mitigated in the latest release and is assigned [CVE-2023-3424](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3424).

Thanks [ryhmnlfj](https://hackerone.com/ryhmnlfj) for reporting this vulnerability through our HackerOne bug bounty program.

## New commits to private projects visible in forks created while project was public

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/905 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 13.10 before 15.11.10, all versions starting from 16.0 before 16.0.6, all versions starting from 16.1 before 16.1.1. It may be possible for users to view new commits to private projects in a fork created while the project was public. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2023-2190](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2190).

Thanks [pwnie](https://hackerone.com/pwnie) for reporting this vulnerability through our HackerOne bug bounty program.

## Code Owners approvals are not removed allowing merge into protected branches

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/907 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 15.3 before 15.11.10, all versions starting from 16.0 before 16.0.6, all versions starting from 16.1 before 16.1.1, which allows an attacker to merge arbitrary code into protected branches due to a CODEOWNERS approval bug. This is a medium severity issue (`CVSS:3.1/CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:N/I:H/A:N`, 5.7). It is now mitigated in the latest release and is assigned [CVE-2023-3444](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3444).

Thanks [glan1k](https://hackerone.com/glan1k) for reporting this vulnerability through our HackerOne bug bounty program.

## Maintainer can leak masked webhook secrets by manipulating URL masking

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/908 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 15.1 prior to 15.11.10, all versions from 16.0 prior to 16.0.6, all versions from 16.1 prior to 16.1.1. A maintainer could modify a webhook URL to leak masked webhook secrets by manipulating other masked portions. This addresses an incomplete fix for CVE-2023-0838. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:C/C:L/I:L/A:N`, 5.5). It is now mitigated in the latest release and is assigned [CVE-2023-2620](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2620).

Thanks [theluci](https://hackerone.com/theluci) for reporting this vulnerability through our HackerOne bug bounty program.

## Information disclosure of project import errors

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/903 -->

An information disclosure issue in GitLab CE/EE affecting all versions from 16.0 prior to 16.0.6, and version 16.1.0 allows unauthenticated actors to access the import error information if a project was imported from GitHub. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2023-3362](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3362).

This vulnerability has been discovered internally by GitLab team member [Rodrigo Tomonari](https://gitlab.com/rodrigo.tomonari).

## Sensitive information disclosure via value stream analytics controller

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/898 -->

A sensitive information leak issue has been discovered in GitLab EE affecting all versions starting from 16.0 before 16.0.6, all versions starting from 16.1 before 16.1.1, which allows access to titles of private issues and merge requests. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2023-3102](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3102).

Thanks [pwnie](https://hackerone.com/pwnie) for reporting this vulnerability through our HackerOne bug bounty program.

## Bypassing Code Owners branch protection rule in GitLab

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/894 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 13.7 before 15.11.10, all versions starting from 16.0 before 16.0.6, all versions starting from 16.1 before 16.1.1. This allowed a developer to remove the CODEOWNERS rules and merge to a protected branch. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-2576](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2576).

Thanks [inspector-ambitious](https://hackerone.com/inspector-ambitious) for reporting this vulnerability through our HackerOne bug bounty program.

## HTML injection in email address

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/900 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 7.14 before 15.11.10, all versions starting from 16.0 before 16.0.6, all versions starting from 16.1 before 16.1.1, which allows an attacker to inject HTML in an email address field. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:C/C:N/I:L/A:N`, 4.1). It is now mitigated in the latest release and is assigned [CVE-2023-2200](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2200).

Thanks [cryptopone](https://hackerone.com/cryptopone) for reporting this vulnerability through our HackerOne bug bounty program.

## Webhook token leaked in Sidekiq logs if log format is 'default'

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/904 -->

An information disclosure issue in Gitlab CE/EE affecting all versions from 13.6 prior to 15.11.10, all versions from 16.0 prior to 16.0.6, all versions from 16.1 prior to 16.1.1, resulted in the Sidekiq log including webhook tokens when the log format was set to `default`. This is a low severity issue (`CVSS:3.1/AV:L/AC:H/PR:H/UI:N/S:C/C:L/I:L/A:N`, 3.9). It is now mitigated in the latest release and is assigned [CVE-2023-3363](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3363).

This vulnerability was reported by Martin Vaisset from MyMoneyBank.

## Private email address of service desk issue creator disclosed via issues API

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/897 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 13.7 before 15.11.10, all versions starting from 16.0 before 16.0.6, all versions starting from 16.1 before 16.1.1, which allows an attacker to leak the email address of a user who created a service desk issue. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:L/I:N/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2023-1936](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1936).

Thanks [ricardobrito](https://hackerone.com/ricardobrito) for reporting this vulnerability through our HackerOne bug bounty program.

## Update Mattermost
Mattermost has been updated to version 7.10.2 in GitLab 16.0.6 and version 7.9.4 in GitLab 15.11.10 in order to mitigate security issues.

## Update xmlsoft/libxml2 to version 2.10.4
xmlsoft/libxml2 has been updated to version 2.10.4 in order to mitigate security issues.


## Updating

To update GitLab, see the [Update page](/update).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).

