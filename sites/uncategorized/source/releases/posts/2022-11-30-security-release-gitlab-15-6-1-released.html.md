---
title: "GitLab Security Release: 15.6.1, 15.5.5 and 15.4.6"
description: "Learn more about GitLab Security Release: 15.6.1, 15.5.5 and 15.4.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2022/11/30/security-release-gitlab-15-6-1-released/"
categories: releases
author: Nikhil George
author_gitlab: ngeorge1
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.6.1, 15.5.5 and 15.4.6 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[DAST API scanner exposes Authorization headers in vulnerabilities](#dast-api-scanner-exposes-authorization-headers-in-vulnerabilities)|medium|
|[Group IP allow-list not fully respected by the Package Registry](#group-ip-allow-list-not-fully-respected-by-the-package-registry)|medium|
|[Deploy keys and tokens may bypass External Authorization service if it is enabled](#deploy-keys-and-tokens-may-bypass-external-authorization-service-if-it-is-enabled)|medium|
|[HTML content injection in README file](#html-content-injection-in-readme-file)|medium|
|[Repository import still allows to import 40 hexadecimal branches](#repository-import-still-allows-to-import-40-hexadecimal-branches)|medium|
|[Webhook secret tokens leaked in webhook logs](#webhook-secret-tokens-leaked-in-webhook-logs)|medium|
|[Maintainer can leak webhook secret token by changing the webhook URL](#maintainer-can-leak-webhook-secret-token-by-changing-the-webhook-url)|medium|
|[Cross-site scripting in Jira Integration affecting self-hosted instances without strict CSP](#cross-site-scripting-in-jira-integration-affecting-self-hosted-instances-without-strict-csp)|medium|
|[Release names visible in public projects despite release set as project members only](#release-names-visible-in-public-projects-despite-release-set-as-project-members-only)|medium|
|[Sidekiq background job DoS by uploading malicious NuGet packages](#sidekiq-background-job-dos-by-uploading-malicious-nuget-packages)|medium|
|[Email ID leaked through Webhook payloads](#email-id-leaked-through-webhook-payloads)|medium|
|[Blind SSRF in repository mirroring using DNS rebinding](#blind-ssrf-in-repository-mirroring-using-dns-rebinding)|medium|
|[SSRF in Web Terminal advertise_address](#SSRF in Web Terminal advertise_address)|low|

## DAST API scanner exposes Authorization headers in vulnerabilities

<!-- https://gitlab.com/gitlab-org/gitlab/-/issues/383083 -->

A sensitive information leak issue has been discovered in all versions of DAST API scanner from 1.6.50 prior to 2.0.102, exposing the Authorization header in the vulnerability report. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:L/I:N/A:N`, 5.0). It is now mitigated in the latest release of DAST API scanner and is assigned [CVE-2022-4206](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4206).

This vulnerability has been discovered internally by the GitLab team.

## Group IP allow-list not fully respected by the Package Registry

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/782 -->

An issue has been discovered in GitLab affecting all versions starting from 15.4 prior to 15.4.4, and 15.5 prior to 15.5.2. GitLab was not performing correct authentication with some Package Registries when IP address restrictions were configured, allowing an attacker already in possession of a valid Deploy Token to misuse it from any location. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:H/I:H/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-3820](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3820).

This vulnerability has been discovered internally by the GitLab team.

## Deploy keys and tokens may bypass External Authorization service if it is enabled

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/773 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 12.9 prior to 15.3.5, 15.4 prior to 15.4.4, and 15.5 prior to 15.5.2. A group owner may be able to bypass External Authorization check, if it is enabled, to access git repositories and package registries by using Deploy tokens or Deploy keys. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:H/I:H/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-3740](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3740).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Repository import still allows to import 40 hexadecimal branches

In GitLab EE/CE before 15.6.1, 15.5.5 and 15.4.6 using a branch with a hexadecimal name could override an existing hash. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:N/I:H/A:L`, 6.3). It is now mitigated in the latest release and is assigned [CVE-2022-4205](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4205).

This vulnerability has been discovered internally by the GitLab team.

## HTML content injection in README file
An issue has been discovered in GitLab EE affecting all versions starting from 15.6 before 15.6.1. It was possible to create a malicious README page due to improper neutralisation of user supplied input. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:H/I:N/A:N`, 5.7). It is now mitigated in the latest release and is assigned [CVE-2022-4092](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4092).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

## Webhook secret tokens leaked in webhook logs

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/797 -->

An issue has been discovered in GitLab affecting all versions starting from 9.3 before 15.4.6, all versions starting from 15.5 before 15.5.5, all versions starting from 15.6 before 15.6.1. It was possible for a project maintainer to unmask webhook secret tokens by reviewing the logs after testing webhooks. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:C/C:L/I:L/A:N`, 5.5). It is now mitigated in the latest release and is assigned [CVE-2022-3902](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3902).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Maintainer can leak webhook secret token by changing the webhook URL

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/795 -->

An issue has been discovered in GitLab affecting all versions starting from 9.3 before 15.4.6, all versions starting from 15.5 before 15.5.5, all versions starting from 15.6 before 15.6.1. It was possible for a project maintainer to leak a webhook secret token by changing the webhook URL to an endpoint that allows them to capture request headers. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:C/C:L/I:L/A:N`, 5.5). It is now mitigated in the latest release and is assigned [CVE-2022-4054](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4054).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Cross-site scripting in Jira Integration affecting self-hosted instances without strict CSP

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/799 -->

A cross-site scripting issue has been discovered in GitLab CE/EE affecting all versions from 13.5 prior to 15.3.5, 15.4 prior to 15.4.4, and 15.5 prior to 15.5.2. It was possible to exploit a vulnerability in setting the Jira Connect integration which could lead to a reflected XSS that allowed attackers to perform arbitrary actions on behalf of victims. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:C/C:L/I:L/A:N`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2022-3572](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3572).

Thanks [ryotak](https://hackerone.com/ryotak) for reporting this vulnerability through our HackerOne bug bounty program.

## Release names visible in public projects despite release set as project members only

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/794 -->

An improper access control issue in GitLab CE/EE affecting all versions from 11.3 prior to 15.3.5, 15.4 prior to 15.4.4, and 15.5 prior to 15.5.2 allowed an unauthorized user to see release names even when releases were set to be restricted to project members only. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2022-3482](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3482).

Thanks [ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for reporting this vulnerability through our HackerOne bug bounty program.

## Email ID leaked through Webhook payloads

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/790 -->

An info leak issue was identified in all versions of GitLab EE from 13.7 prior to 15.4.6, 15.5 prior to 15.5.5, and 15.6 prior to 15.6.1 which exposes user email id through webhook payload. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-4255](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4255).

This vulnerability has been discovered internally by the GitLab team.

## Sidekiq background job DoS by uploading malicious NuGet packages

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/793 -->

An issue has been discovered in GitLab affecting all versions starting from 12.8 before 15.4.6, all versions starting from 15.5 before 15.5.5, all versions starting from 15.6 before 15.6.1. It was possible to trigger a DoS attack by uploading a malicious NuGet package. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-3478](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3478).

Thanks [luryus](https://hackerone.com/luryus) for reporting this vulnerability through our HackerOne bug bounty program.

## Blind SSRF in repository mirroring using DNS rebinding

A blind SSRF vulnerability was identified in all versions of GitLab EE prior to 15.4.6, 15.5 prior to 15.5.5, and 15.6 prior to 15.6.1 which allows an attacker to connect to a local host. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-4335](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4335).

Thanks [ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for reporting this vulnerability through our HackerOne bug bounty program.

## SSRF in Web Terminal advertise_address

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/785 -->

A blind SSRF in GitLab CE/EE affecting all from 11.3 prior to 15.4.6, 15.5 prior to 15.5.5, and 15.6 prior to 15.6.1 allows an attacker to connect to local addresses when configuring a malicious GitLab Runner. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:C/C:L/I:N/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2022-4201](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4201).

This vulnerability has been discovered internally by the GitLab team.

## Update xmlsoft/libxml2

xmlsoft/libxml2 has been updated to version 2.10.3 in order to mitigate security issues.

### Versions affected

Affects all versions of GitLab Omnibus from 13.6.6.

## Update haxx/curl

haxx/curl has been updated to version 7.86.0 in order to mitigate security issues.

### Versions affected

Affects all versions of GitLab Omnibus 15.4 and 15.6.

## Update ruby

ruby has been updated to version 2.7.6 in order to mitigate security issues.

### Versions affected

Affects all versions of GitLab Omnibus and GitLab Chart.

## Update ncurses

ncurses has been updated to version 6.3-20220416 to mitigate security issues.

### Versions affected

Affects all versions of GitLab Omnibus.

## Update zlib 

zlib has been updated to version 1.2.13 to mitigate security issues.

### Versions affected

Affects all versions of GitLab Omnibus prior to 15.7.

## Update rsync 

rsync has been updated to version 3.2.6 to mitigate security issues.

### Versions affected

Affects all versions of GitLab Omnibus 15.3, 15.4, and 15.5.

## Update PostgreSQL

PostgreSQL has been updated to versions 12.12 and 13.8 to mitigate security issues. By default Omnibus [automatically restarts PostgreSQL](https://docs.gitlab.com/omnibus/settings/database.html#automatic-restart-when-the-postgresql-version-changes) after the update. However, if automatic restart is disabled manual restarts would be required.

### Versions affected

Affects all versions of GitLab Omnibus 15.3, 15.4, and 15.5.

## Backport fix for Gitaly NTP request issue

A non-security issue in Gitaly is being backported to this release. Customers that rely on public NTP services such as `pool.ntp.org` are at risk of receiving rate limited responses due to increased NTP request volume. Every readiness check results in each Praefect node making a request to the configured NTP service. Failed NTP responses result in failed readiness check. If a NTP service is not specified `pool.ntp.org` is used as the default. Deployments that rely on healthy readiness checks can experience outages. Issue Link: [Gitaly 15.4.3 spams NTP requests](https://gitlab.com/gitlab-org/gitlab/-/issues/383440).

## Backport fix for Watchdog RssMemoryLimit monitor

A non-security issue in Puma is being backported to this release. This affects self-managed instances that uses PumaWorkerKiller. PumaWorkerKiller is disabled by default on Gitlab.com and self-managed instances using helm charts. This means that gitlab.com is not affected. It is enabled by default for omnibus installations and installations from source. Issue Link: [Convert memory_limit to bytes for RssMemoryLimit](https://gitlab.com/gitlab-org/gitlab/-/issues/383440).

## Updating

To update GitLab, see the [Update page](/update).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).
To update DAST API scanner, self-managed customers that are using our built-in DAST CI template after 15.0 can get the latest release from registry.gitlab.com. If using the always pull policy the update will occur automatically. GitLab.com is already running the updated DAST scanner.

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).


