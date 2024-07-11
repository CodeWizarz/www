---
title: "GitLab Security Release: 15.9.2, 15.8.4, and 15.7.8"
description: "Learn more about GitLab Security Release: 15.9.2, 15.8.4, and 15.7.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2023/03/02/security-release-gitlab-15-9-2-released/"
categories: releases
author: Greg Myers
author_gitlab: greg
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.9.2, 15.8.4, and 15.7.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=created_date&state=closed&label_name%5B%5D=bug%3A%3Avulnerability&confidential=no&first_page_size=100) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Stored XSS via Kroki diagram](#stored-xss-via-kroki-diagram)|high|
|[Prometheus integration Google IAP details are not hidden, may leak account details from instance/group/project settings](#prometheus-integration-google-iap-details-are-not-hidden-may-leak-account-details-from-instancegroupproject-settings)|medium|
|[Improper validation of SSO and SCIM tokens while managing groups](#improper-validation-of-sso-and-scim-tokens-while-managing-groups)|medium|
|[Maintainer can leak Datadog API key by changing Datadog site](#maintainer-can-leak-datadog-api-key-by-changing-datadog-site)|medium|
|[Clipboard based XSS in the title field of work items](#clipboard-based-xss-in-the-title-field-of-work-items)|medium|
|[Improper user right checks for personal snippets](#improper-user-right-checks-for-personal-snippets)|medium|
|[Release Description visible in public projects despite release set as project members only](#release-description-visible-in-public-projects-despite-release-set-as-project-members-only)|medium|
|[Group integration settings sensitive information exposed to project maintainers](#group-integration-settings-sensitive-information-exposed-to-project-maintainers)|medium|
|[Improve pagination limits for commits](#improve-pagination-limits-for-commits)|medium|
|[Gitlab Open Redirect Vulnerability](#gitlab-open-redirect-vulnerability)|medium|
|[Maintainer may become an Owner of a project](#maintainer-may-become-an-owner-of-a-project)|low|

## Stored XSS via Kroki diagram

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/833 -->

An issue has been discovered in GitLab affecting all versions starting from 13.7 before 15.7.8, all versions starting from 15.8 before 15.8.4, all versions starting from 15.9 before 15.9.2. A specially crafted Kroki diagram could lead to a stored XSS on the client side which allows attackers to perform arbitrary actions on behalf of victims. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:C/C:H/I:H/A:N`, 8.7). It is now mitigated in the latest release and is assigned [CVE-2023-0050](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0050).

Thanks [vakzz](https://hackerone.com/vakzz) for reporting this vulnerability through our HackerOne bug bounty program.

## Prometheus integration Google IAP details are not hidden, may leak account details from instance/group/project settings

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/844 -->

An issue has been discovered in GitLab affecting all versions starting from 15.3 before 15.7.8, versions of 15.8 before 15.8.4, and version 15.9 before 15.9.2. Google IAP details in Prometheus integration were not hidden, could be leaked from instance, group, or project settings to other users. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:L/I:L/A:N`, 6.4). It is now mitigated in the latest release and is assigned [CVE-2022-4289](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4289).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Improper validation of SSO and SCIM tokens while managing groups

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/819 -->

An issue has been discovered in GitLab EE affecting all versions starting from 15.1 before 15.7.8, all versions starting from 15.8 before 15.8.4, all versions starting from 15.9 before 15.9.2. If a group with SAML SSO enabled is transferred to a new namespace as a child group, it's possible previously removed malicious maintainer or owner of the child group can still gain access to the group via SSO or a SCIM token to perform actions on the group. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:H/UI:R/S:U/C:H/I:H/A:N`, 5.7). It is now mitigated in the latest release and is assigned [CVE-2022-4331](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4331).

Thanks [vaib25vicky](https://hackerone.com/vaib25vicky) for reporting this vulnerability through our HackerOne bug bounty program.

## Maintainer can leak Datadog API key by changing Datadog site

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/843 -->

An issue has been discovered in GitLab affecting all versions starting from 12.1 before 15.7.8, all versions starting from 15.8 before 15.8.4, all versions starting from 15.9 before 15.9.2. It was possible for a project maintainer to extract a Datadog integration API key by modifying the site. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:C/C:L/I:L/A:N`, 5.5). It is now mitigated in the latest release and is assigned [CVE-2023-0483](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0483).

Thanks [akadrian](https://hackerone.com/akadrian) for reporting this vulnerability through our HackerOne bug bounty program.

## Clipboard based XSS in the title field of work items

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/836 -->

A issue has been discovered in GitLab CE/EE affecting all versions from 15.3 prior to 15.7.8, version 15.8 prior to 15.8.4, and version 15.9 prior to 15.9.2  A cross-site scripting vulnerability was found in the title field of work items that allowed attackers to perform arbitrary actions on behalf of victims at client side. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:C/C:L/I:L/A:N`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2022-4007](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4007).

Thanks [ryotak](https://hackerone.com/ryotak) for reporting this vulnerability through our HackerOne bug bounty program.

## Improper user right checks for personal snippets

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/816 -->

An issue has been discovered in GitLab affecting all versions starting from 15.5 before 15.7.8, all versions starting from 15.8 before 15.8.4, all versions starting from 15.9 before 15.9.2. Due to improper permissions checks an unauthorised user was able to read, add or edit a users private snippet. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:L/A:N`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2022-3758](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3758).

Thanks [cryptopone](https://hackerone.com/cryptopone) for reporting this vulnerability through our HackerOne bug bounty program.

## Release Description visible in public projects despite release set as project members only

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/832 -->

An issue has been discovered in GitLab affecting all versions starting from 15.5 before 15.7.8, all versions starting from 15.8 before 15.8.4, all versions starting from 15.9 before 15.9.2. Non-project members could retrieve release descriptions via the API, even if the release visibility is restricted to project members only in the project settings. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2023-0223](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0223).

Thanks [ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for reporting this vulnerability through our HackerOne bug bounty program.

## Group integration settings sensitive information exposed to project maintainers

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/842 -->

An issue has been discovered in GitLab affecting all versions starting from 12.8 before 15.7.8, all versions starting from 15.8 before 15.8.4, all versions starting from 15.9 before 15.9.2. This vulnerability could allow a user to unmask the Discord Webhook URL through viewing the raw API response. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:L/I:N/A:N`, 5.0). It is now mitigated in the latest release and is assigned [CVE-2022-4462](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4462).

Thanks [vaib25vicky](https://hackerone.com/vaib25vicky) for reporting this vulnerability through our HackerOne bug bounty program.

## Improve pagination limits for commits

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/839 -->

An issue has been discovered in GitLab affecting all versions starting from 9.0 before 15.7.8, all versions starting from 15.8 before 15.8.4, all versions starting from 15.9 before 15.9.2. It was possible to trigger a resource depletion attack due to improper filtering for number of requests to read commits details. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-1072](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1072).

Thanks [Nico Jones](https://gitlab.com/nico28) for reporting this vulnerability.

## Gitlab Open Redirect Vulnerability

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/836 -->

An issue has been discovered in GitLab affecting all versions starting from 10.0 to 15.7.8, 15.8 prior to 15.8.4 and 15.9 prior to 15.9.2. A crafted URL could be used to redirect users to arbitrary sites. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-3381](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3381).

Thanks [burpheart](https://hackerone.com/burpheart) for reporting this vulnerability through our HackerOne bug bounty program.

## Maintainer may become an Owner of a project

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/841 -->

An issue has been discovered in GitLab CE/EE affecting all versions before 15.7.8, all versions starting from 15.8 before 15.8.4, all versions starting from 15.9 before 15.9.2. A malicious project Maintainer may create a Project Access Token with Owner level privileges using a crafted request. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:L/A:N`, 2.7). It is now mitigated in the latest release and is assigned [CVE-2023-1084](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1084).

Thanks [@shubham_sohi](https://hackerone.com/shubham_sohi,) for reporting this vulnerability through our HackerOne bug bounty program.

## Update `libksba`

`libksba` and `libksba_project` have been updated to version 1.6.3 to mitigate potential security issues.

## Update `gnupg`

`gnupg` has been updated to 2.2.41 to mitigate potential security issues.

## Updating

To update GitLab, see the [Update page](/update).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
