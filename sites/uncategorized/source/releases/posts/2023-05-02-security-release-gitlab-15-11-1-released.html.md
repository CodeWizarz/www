---
title: "GitLab Security Release: 15.11.1, 15.10.5, and 15.9.6"
description: "Learn more about GitLab Security Release: 15.11.1, 15.10.5, and 15.9.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2023/05/02/security-release-gitlab-15-11-1-released/"
categories: releases
author: Dominic Couture
author_gitlab: dcouture
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.11.1, 15.10.5, and 15.9.6 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=created_date&state=closed&label_name%5B%5D=bug%3A%3Avulnerability&confidential=no&first_page_size=100) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Privilege escalation for external users when OIDC is enabled under certain conditions](#privilege-escalation-for-external-users-when-oidc-is-enabled-under-certain-conditions)|medium|
|[Account takeover through open redirect for Group SAML accounts](#account-takeover-through-open-redirect-for-group-saml-accounts)|medium|
|[Users on banned IP addresses can still commit to projects](#users-on-banned-ip-addresses-can-still-commit-to-projects)|medium|
|[User with developer role (group) can modify Protected branches setting on imported project and leak group CI/CD variables](#user-with-developer-role-group-can-modify-protected-branches-setting-on-imported-project-and-leak-group-cicd-variables)|medium|
|[The GitLab web interface does not guarantee file integrity when downloading source code or installation packages from a tag or from a release.](#the-gitlab-web-interface-does-not-guarantee-file-integrity-when-downloading-source-code-or-installation-packages-from-a-tag-or-from-a-release)|medium|
|[Banned group member continues to have access to the public projects of a public group with the access level as same as before the ban.](#banned-group-member-continues-to-have-access-to-the-public-projects-of-a-public-group-with-the-access-level-as-same-as-before-the-ban)|medium|
|[The main branch of a repository with a specially designed name allows an attacker to create repositories with malicious code.](#the-main-branch-of-a-repository-with-a-specially-designed-name-allows-an-attacker-to-create-repositories-with-malicious-code)|medium|
|[XSS and content injection and iframe injection when viewing raw files under specific circumstances](#xss-and-content-injection-and-iframe-injection-when-viewing-raw-files-under-specific-circumstances)|medium|
|[Authenticated users can find other users by their private email](#authenticated-users-can-find-other-users-by-their-private-email)|low|

## Privilege escalation for external users when OIDC is enabled under certain conditions

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/871 -->

An issue has been discovered in GitLab EE affecting all versions starting from 15.10 before 15.10.5, all versions starting from 15.11 before 15.11.1. Under certain conditions when OpenID Connect is enabled on an instance, it may allow users who are marked as 'external' to become 'regular' users thus leading to privilege escalation for those users. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:H/I:H/A:N`, 6.8). It is now mitigated in the latest release and is assigned [CVE-2023-2182](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2182).

This vulnerability was reported to us by a customer.

## Account takeover through open redirect for Group SAML accounts

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/876 -->

An issue has been discovered in GitLab EE affecting all versions starting from 14.2 before 15.9.6, all versions starting from 15.10 before 15.10.5, all versions starting from 15.11 before 15.11.1. Lack of verification on RelayState parameter allowed a maliciously crafted URL to obtain access tokens granted for 3rd party Group SAML SSO logins. This feature isn't enabled by default. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:N/UI:R/S:U/C:H/I:H/A:N`, 6.8). It is now mitigated in the latest release and is assigned [CVE-2023-1965](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1965).

If you are seeing an unexpected redirect after sign in through SAML, ensure the [`RelayState` setting](https://docs.gitlab.com/ee/integration/saml.html#additional-configuration-for-saml-apps-on-your-idp) on the identity provider side is set to a valid URL.

Thanks [bull](https://hackerone.com/bull) for reporting this vulnerability through our HackerOne bug bounty program.

## Users on banned IP addresses can still commit to projects

An issue has been discovered in GitLab EE affecting all versions starting from 12.0 before 15.10.5, all versions starting from 15.11 before 15.11.1. A malicious group member may continue to commit to projects even from a restricted IP address. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:H/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2023-1621](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1621).


## User with developer role (group) can modify Protected branches setting on imported project and leak group CI/CD variables

An issue has been discovered in GitLab affecting all versions starting from 10.0 before 12.9.8, all versions starting from 12.10 before 12.10.7, all versions starting from 13.0 before 13.0.1. A user with the role of developer could use the import project feature to leak CI/CD variables. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:L/I:L/A:N`, 6.4). It is now mitigated in the latest release and is assigned [CVE-2023-2069](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2069).

Thanks [js_noob](https://hackerone.com/js_noob) for reporting this vulnerability through our HackerOne bug bounty program.

Fix for this issue was to [restrict imports to users with Maintainer and above role](https://gitlab.com/gitlab-org/gitlab/-/issues/387891). That however affected usage of [custom project templates, on group and instance levels](https://docs.gitlab.com/ee/user/project/index.html#create-a-project-from-a-custom-template) as well, and Developers are no longer able to create projects from custom templates. We are working on the fix, that will allow users with Developer role to create projects from templates again, and will release a patch with this fix to GitLab versions 15.11.1, 15.10.5.

## The GitLab web interface does not guarantee file integrity when downloading source code or installation packages from a tag or from a release.

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/877 -->

An issue has been discovered in GitLab CE/EE affecting all versions from 8.6 before 15.9.6, all versions starting from 15.10 before 15.10.5, all versions starting from 15.11 before 15.11.1. File integrity may be compromised when source code or installation packages are pulled from a tag or from a release containing a ref to another commit. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:N/I:H/A:N`, 5.7). It is now mitigated in the latest release and is assigned [CVE-2023-1178](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1178).

Thanks [st4nly0n](https://hackerone.com/st4nly0n) for reporting this vulnerability through our HackerOne bug bounty program.

## Banned group member continues to have access to the public projects of a public group with the access level as same as before the ban.

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/868 -->

An issue has been discovered in GitLab EE affecting all versions starting from 15.2 before 15.9.6, all versions starting from 15.10 before 15.10.5, all versions starting from 15.11 before 15.11.1. A malicious group member may continue to have access to the public projects of a public group even after being banned from the public group by the owner. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:H/A:N`, 4.9). It is now mitigated in the latest release and is assigned [CVE-2023-0805](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0805).

Thanks [albatraoz](https://hackerone.com/albatraoz) for reporting this vulnerability through our HackerOne bug bounty program.

## The main branch of a repository with a specially designed name allows an attacker to create repositories with malicious code.

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/873 -->

An issue has been discovered in GitLab affecting all versions before 15.9.6, all versions starting from 15.10 before 15.10.5, all versions starting from 15.11 before 15.11.1. The main branch of a repository with a specially crafted name allows an attacker to create repositories with malicious code, victims who clone or download these repositories will execute arbitrary code on their systems. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:U/C:N/I:H/A:N`, 4.8). It is now mitigated in the latest release and is assigned [CVE-2023-0756](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0756).

Thanks [st4nly0n](https://hackerone.com/st4nly0n) for reporting this vulnerability through our HackerOne bug bounty program.

## XSS and content injection and iframe injection when viewing raw files under specific circumstances

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/869 -->

A cross-site scripting issue has been discovered in GitLab affecting all versions starting from 5.1 before 15.9.6, all versions starting from 15.10 before 15.10.5, all versions starting from 15.11 before 15.11.1. When viewing an XML file in a repository in "raw" mode, it can be made to render as HTML if viewed under specific circumstances. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:C/C:L/I:L/A:N`, 4.4). It is now mitigated in the latest release and is assigned [CVE-2023-1836](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1836).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Authenticated users can find other users by their private email

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/878 -->

An issue has been discovered in GitLab affecting all versions before 15.9.6, all versions starting from 15.10 before 15.10.5, all versions starting from 15.11 before 15.11.1. Under certain conditions, an attacker may be able to map a private email of a GitLab user to their GitLab account on an instance. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:L/I:N/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2022-4376](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4376).

Thanks [shells3c](https://hackerone.com/shells3c) for reporting this vulnerability through our HackerOne bug bounty program.

## Update Mattermost

Mattermost has been updated to versions 7.9.1 and 7.9.2 in order to mitigate security issues.

## Patch OpenSSL

A patch has been applied to mitigate CVE-2023-0464 in GitLab Omnibus.

## Patch Grafana

A patch has been applied to mitigate CVE-2023-1410 in GitLab Omnibus.

## Non Security Patches

This security release also includes the following non-security patches.

### 15.11.1

* [15.11: Fix Web IDE Beta icons not loading in Safari](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/118637)
* [Move approved filter behind `mr_approved_filter` feature flag](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/118956)
* [Fix search cron worker when indexing is disabled](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/118849)

### 15.10.5

* [Use proxied_site for geo proxied clone urls](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/118219)

## Updating

To update GitLab, see the [Update page](/update).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).

