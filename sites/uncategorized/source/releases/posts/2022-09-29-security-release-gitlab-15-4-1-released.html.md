---
title: "GitLab Security Release: 15.4.1, 15.3.4, and 15.2.5"
description: "Learn more about GitLab Security Release: 15.4.1, 15.3.4, and 15.2.5 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2022/09/29/security-release-gitlab-15-4-1-released/"
categories: releases
author: Nick Malcolm
author_gitlab: nmalcolm
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.4.1, 15.3.4, and 15.2.5 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Denial of Service via cloning an issue](#denial-of-service-via-cloning-an-issue)|high|
|[Arbitrary PUT request as victim user through Sentry error list](#arbitrary-put-request-as-victim-user-through-sentry-error-list)|high|
|[Content injection via External Status Checks](#content-injection-via-external-status-checks)|high|
|[Project maintainers can access Datadog API Key from logs](#project-maintainers-can-access-datadog-api-key-from-logs)|medium|
|[Unsafe serialization of Json data could lead to sensitive data leakage](#unsafe-serialization-of-json-data-could-lead-to-sensitive-data-leakage)|medium|
|[Import bug allows importing of private local git repos](#import-bug-allows-importing-of-private-local-git-repos)|medium|
|[Maintainer can leak Github access tokens by changing integration URL (even after 15.2.1 patch)](#maintainer-can-leak-github-access-tokens-by-changing-integration-url-even-after-1521-patch)|medium|
|[Unauthorized users able to create issues in any project](#unauthorized-users-able-to-create-issues-in-any-project)|medium|
|[Bypass group IP restriction on Dependency Proxy](#bypass-group-ip-restriction-on-dependency-proxy)|medium|
|[Healthcheck endpoint allow list can be bypassed when accessed over HTTP in an HTTPS enabled system](#healthcheck-endpoint-allow-list-can-be-bypassed-when-accessed-over-http-in-an-https-enabled-system)|medium|
|[Disclosure of Todo details to guest users](#disclosure-of-todo-details-to-guest-users)|medium|
|[A user's primary email may be disclosed through group member events webhooks](#a-users-primary-email-may-be-disclosed-through-group-member-events-webhooks)|medium|
|[Content manipulation due to branch/tag name confusion with the default branch name](#content-manipulation-due-to-branchtag-name-confusion-with-the-default-branch-name)|low|
|[Leakage of email addresses in WebHook logs](#leakage-of-email-addresses-in-webhook-logs)|low|
|[Specially crafted output makes job logs inaccessible](#specially-crafted-output-makes-job-logs-inaccessible)|low|

## Denial of Service via cloning an issue

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/766 -->

A potential DOS vulnerability was discovered in GitLab CE/EE affecting all versions before before 15.2.5, all versions starting from 15.3 before 15.3.4, all versions starting from 15.4 before 15.4.1 While cloning an issue with special crafted content added to the description could have been used to trigger high CPU usage. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H` 7.5). It is now mitigated in the latest release and is assigned [CVE-2022-3283](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3283).

Thanks [legit-security](https://hackerone.com/legit-security) for reporting this vulnerability through our HackerOne bug bounty program.

## Arbitrary PUT request as victim user through Sentry error list

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/739 -->

Improper control of a resource identifier in Error Tracking in GitLab CE/EE affecting all versions from 12.7 allows an authenticated attacker to generate content which could cause a victim to make unintended arbitrary requests. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:H/I:H/A:N`, 7.3). It is now mitigated in the latest release and is assigned [CVE-2022-3060](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3060).

Thanks [@joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Content injection via External Status Checks

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/736 -->

A cross-site scripting issue has been discovered in GitLab CE/EE affecting all versions starting from 15.2 before 15.2.5, all versions starting from 15.3 before 15.3.4, all versions starting from 15.4 before 15.4.1 It was possible to exploit a vulnerability in the external status checks feature  which could lead to a stored XSS that allowed attackers to perform arbitrary actions on behalf of victims at client side. This is a high severity issue (`CVSS:3.1/AV:N/AC:H/PR:H/UI:R/S:C/C:H/I:H/A:N`, 7.3). It is now mitigated in the latest release and is assigned [CVE-2022-2904](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2904).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

## Project maintainers can access Datadog API Key from logs

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/717 -->

An information disclosure vulnerability in GitLab CE/EE affecting all versions starting from 9.3 before 15.2.5, all versions starting from 15.3 before 15.3.4, all versions starting from 15.4 before 15.4.1 allows a project maintainer to access the DataDog integration API key from webhook logs. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:C/C:H/I:N/A:N`, 6.8). It is now mitigated in the latest release and is assigned [CVE-2022-3018](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3018)

This vulnerability has been discovered internally by the GitLab team.

## Unsafe serialization of Json data could lead to sensitive data leakage

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/735 -->

Serialization of sensitive data in GitLab EE affecting all versions from 14.9 prior to 15.2.5, 15.3 prior to 15.3.4, and 15.4 prior to 15.4.1 can leak sensitive information via cache. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-3291](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3291).

This vulnerability has been discovered internally by the GitLab team.

## Import bug allows importing of private local git repos

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/758 -->

An issue has been discovered in the Import functionality of GitLab CE/EE affecting all versions starting from 14.4 before 15.2.5, all versions starting from 15.3 before 15.3.4, all versions starting from 15.4 before 15.4.1. It was possible for an authenticated user to read arbitrary projects' content given the project's ID. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-3067](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3067)

Thanks [vakzz](https://hackerone.com/vakzz) for reporting this vulnerability through our HackerOne bug bounty program.

## Maintainer can leak Github access tokens by changing integration URL (even after 15.2.1 patch)

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/762 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 12.6 before 15.2.5, all versions starting from 15.3 before 15.3.4, all versions starting from 15.4 before 15.4.1. A malicious maintainer could exfiltrate a GitHub integration's access token by modifying the integration URL such that authenticated requests are sent to an attacker controlled server. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:C/C:L/I:L/A:N`, 5.5). It is now mitigated in the latest release and is assigned [CVE-2022-2882](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2882).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Unauthorized users able to create issues in any project

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/759 -->

An issue has been discovered in GitLab affecting all versions starting from 10.0 before 15.2.5, all versions starting from 15.3 before 15.3.4, all versions starting from 15.4 before 15.4.1. It was possible for an unauthorised user to create issues in a project. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:L/A:N`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2022-3066](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3066)

Thanks [vakzz](https://hackerone.com/vakzz) for reporting this vulnerability through our HackerOne bug bounty program.

## Bypass group IP restriction on Dependency Proxy

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/740 -->

Lack of IP address checking in GitLab EE affecting all versions from 14.2 prior to 15.2.5, 15.3 prior to 15.3.4, and 15.4 prior to 15.4.1 allows a group member to bypass IP restrictions when using a deploy token. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2022-3286](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3286).

This vulnerability has been discovered internally by the GitLab team.

## Healthcheck endpoint allow list can be bypassed when accessed over HTTP in an HTTPS enabled system

<!-- https://gitlab.com/gitlab-org/security/omnibus-gitlab/-/issues/64 -->

Bypass of healthcheck endpoint allow list affecting all versions from 12.0 prior to 15.2.5, 15.3 prior to 15.3.4, and 15.4 prior to 15.4.1 allows an unauthorized attacker to prevent access to GitLab. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:L`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2022-3285](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3285).

This vulnerability has been discovered internally by the GitLab team.

## Disclosure of Todo details to guest users

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/726 -->

It was possible for a guest user to read a todo targeting an inaccessible note in Gitlab CE/EE affecting all versions from 15.0 prior to 15.2.5, 15.3 prior to 15.3.4, and 15.4 prior to 15.4.1. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-3330](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3330).

This vulnerability has been discovered internally by the GitLab team.

## A user's primary email may be disclosed through group member events webhooks

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/772 -->

An issue has been discovered in GitLab EE affecting all versions starting from 13.7 before 15.2.5, all versions starting from 15.3 before 15.3.4, all versions starting from 15.4 before 15.4.1. A user's primary email may be disclosed to an attacker through group member events webhooks. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-3351](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3351).

Thanks [@joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Content manipulation due to branch/tag name confusion with the default branch name

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/713 -->

A branch/tag name confusion in GitLab CE/EE affecting all versions prior to 15.2.5, 15.3 prior to 15.3.4, and 15.4 prior to 15.4.1 allows an attacker to manipulate pages where the content of the default branch would be expected. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:N/I:L/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2022-3288](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3288)

Thanks [st4nly0n](https://hackerone.com/st4nly0n) for reporting this vulnerability through our HackerOne bug bounty program.

## Leakage of email addresses in WebHook logs

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/756 -->

Email addresses were leaked in WebHook logs in GitLab EE affecting all versions from 9.3 prior to 15.2.5, 15.3 prior to 15.3.4, and 15.4 prior to 15.4.1. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:L/I:N/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2022-3293](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3293).

This vulnerability has been discovered internally by the GitLab team.

## Specially crafted output makes job logs inaccessible

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/767 -->

An unhandled exception in job log parsing in GitLab CE/EE affecting all versions prior to 15.2.5, 15.3 prior to 15.3.4, and 15.4 prior to 15.4.1 allows an attacker to prevent access to job logs. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:N/A:L`, 2.7). It is now mitigated in the latest release and is assigned [CVE-2022-3279](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3279)

Thanks [exem_pt](https://hackerone.com/exem_pt) for reporting this vulnerability through our HackerOne bug bounty program.

## Enforce editing approval rules on project level

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/760 -->

Improper access control in the GitLab CE/EE API affecting all versions starting from 12.8 before 15.2.5, all versions starting from 15.3 before 15.3.4, all versions starting from 15.4 before 15.4.1. Allowed for editing the approval rules via the API by an unauthorised user. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:L/A:N`, 2.7). It is now mitigated in the latest release and is assigned [CVE-2022-3325](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3325).

This vulnerability has been discovered internally by the GitLab team.

## Update Grafana

<!-- https://gitlab.com/gitlab-org/security/omnibus-gitlab/-/issues/63 -->

Grafana has been patched in order to mitigate "CVE-2022-31107 - Grafana account takeover via OAuth vulnerability".

### Versions affected

Affects all versions of GitLab Omnibus.

## Update Mattermost

Mattermost has been updated to version 7.1.3 in order to mitigate security issues.

### Versions affected

Affects all versions of GitLab CE/EE.

## Backport fix for Geo LFS issue

A non-security issue in Geo LFS is being backported to our `15.2.5` release: ["Geo: invalid lfs object deletion on secondary when managed object replication is disabled"](https://gitlab.com/gitlab-org/gitlab/-/issues/371397).


## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
