---
title: "GitLab Security Release: 16.4.1, 16.3.5, and 16.2.8"
description: "Learn more about GitLab Security Release: 16.4.1, 16.3.5, and 16.2.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2023/09/28/security-release-gitlab-16-4-1-released/"
categories: releases
author: Félix Veillette-Potvin
author_gitlab: fvpotvin
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 16.4.1, 16.3.5, and 16.2.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=created_date&state=closed&label_name%5B%5D=bug%3A%3Avulnerability&confidential=no&first_page_size=100) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Attacker can add other projects policy bot as member to their own project and use that bot to trigger pipelines in victims project](#attacker-can-add-other-projects-policy-bot-as-member-to-their-own-project-and-use-that-bot-to-trigger-pipelines-in-victims-project)|high|
|[Group import allows impersonation of users in CI pipelines](#group-import-allows-impersonation-of-users-in-ci-pipelines)|high|
|[Developers can bypass code owners approval by changing a MR's base branch](#developers-can-bypass-code-owners-approval-by-changing-a-mrs-base-branch)|high|
|[Leaking source code of restricted project through a fork](#leaking-source-code-of-restricted-project-through-a-fork)|medium|
|[Third party library Consul requires enable-script-checks to be False to enable patch](#third-party-library-consul-requires-enable-script-checks-to-be-false-to-enable-patch)|medium|
|[Service account not deleted when namespace is deleted allowing access to internal projects](#service-account-not-deleted-when-namespace-is-deleted-allowing-access-to-internal-projects)|medium|
|[Enforce SSO settings bypassed for public projects for Members without identity](#enforce-sso-settings-bypassed-for-public-projects-for-members-without-identity)|medium|
|[Removed project member can write to protected branches](#removed-project-member-can-write-to-protected-branches)|medium|
|[Unauthorised association of CI jobs for Machine Learning experiments](#unauthorised-association-of-ci-jobs-for-machine-learning-experiments)|medium|
|[Force pipelines to not have access to protected variables and will likely fail using tags](#force-pipelines-to-not-have-access-to-protected-variables-and-will-likely-fail-using-tags)|medium|
|[Maintainer can create a fork relationship between existing projects](#maintainer-can-create-a-fork-relationship-between-existing-projects)|medium|
|[Disclosure of masked CI variables via processing CI/CD configuration of forks](#disclosure-of-masked-ci-variables-via-processing-cicd-configuration-of-forks)|medium|
|[Asset Proxy Bypass using non-ASCII character in asset URI](#asset-proxy-bypass-using-non-ascii-character-in-asset-uri)|low|
|[Unauthorized member can gain `Allowed to push and merge` access and affect integrity of protected branches](#unauthorized-member-can-gain-allowed-to-push-and-merge-access-and-affect-integrity-of-protected-branches)|low|
|[Removed Developer can continue editing the source code of a public project](#removed-developer-can-continue-editing-the-source-code-of-a-public-project)|low|
|[A project reporter can leak owner's Sentry instance projects](#a-project-reporter-can-leak-owners-sentry-instance-projects)|low|
|[Math rendering in markdown can escape container and hijack clicks](#math-rendering-in-markdown-can-escape-container-and-hijack-clicks)|low|

## Attacker can add other projects policy bot as member to their own project and use that bot to trigger pipelines in victims project

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/982 -->

A vulnerability was discovered in GitLab CE and EE affecting all versions starting 16.0 prior to 16.2.8, 16.3 prior to 16.3.5, and 16.4 prior to 16.4.1. An authenticated attacker could perform arbitrary pipeline execution under the context of another user. This is a high severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:C/C:H/I:H/A:N`, 8.2). It is now mitigated in the latest release and is assigned [CVE-2023-5207](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-5207).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Group import allows impersonation of users in CI pipelines

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/980 -->

Two issues have been discovered in Ultimate-licensed GitLab EE affecting all versions starting 13.12 prior to 16.2.8, 16.3.0 prior to 16.3.5, and 16.4.0 prior to 16.4.1 that could allow an attacker to impersonate users in CI pipelines through direct transfer group imports. These are a high severity issues (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:C/C:H/I:H/A:N`, 8.2). They are now mitigated in the latest release and are assigned [CVE-2023-5106](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-5106).

These issues have been discovered internally by GitLab team member [Joern Schneeweisz](https://gitlab.com/joernchen).

## Developers can bypass code owners approval by changing a MR's base branch

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/976 -->

An issue has been discovered in GitLab EE affecting all versions starting 15.3 prior to prior to 16.2.8, 16.3 prior to 16.3.5, and 16.4 prior to 16.4.1. Code owner approval was not removed from merge requests when the target branch was updated. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:R/S:C/C:H/I:H/A:N`, 8.1). It is now mitigated in the latest release and is assigned [CVE-2023-4379](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-4379).

This issue was reported by a customer.

## Leaking source code of restricted project through a fork

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/939 -->

An issue has been discovered in GitLab affecting all versions starting from 16.2 before 16.2.8, all versions starting from 16.3 before 16.3.5, all versions starting from 16.4 before 16.4.1. It was possible that an unauthorised user to fork a public project. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2023-3413](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3413).

Thanks [shells3c](https://hackerone.com/shells3c) for reporting this vulnerability through our HackerOne bug bounty program.

## Third party library Consul requires enable-script-checks to be False to enable patch

<!-- https://gitlab.com/gitlab-org/security/omnibus-gitlab/-/issues/99 -->

Patch in third party library Consul requires 'enable-script-checks' to be set to False. This only affects GitLab-EE. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:H/UI:N/S:U/C:H/I:H/A:N`, 5.9). It is now mitigated in the latest release and is assigned [CVE-2023-5332](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-5332).

This issue was reported by a customer.

## Service account not deleted when namespace is deleted allowing access to internal projects

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/962 -->

A business logic error in GitLab EE affecting all versions prior to 16.2.8, 16.3 prior to 16.3.5, and 16.4 prior to 16.4.1 allows access to internal projects. A service account is not deleted when a namespace is deleted, allowing access to internal projects. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:L/A:N`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2023-3914](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3914).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Enforce SSO settings bypassed for public projects for Members without identity

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/930 -->

An issue has been discovered in GitLab EE affecting all versions affecting all versions from 11.11 prior to 16.2.8, 16.3 prior to 16.3.5, and 16.4 prior to 16.4.1. Single Sign On restrictions were not correctly enforced for indirect project members accessing public members-only project repositories. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:L/A:N`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2023-3115](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3115).

Thanks [theluci](https://hackerone.com/theluci) for reporting this vulnerability through our HackerOne bug bounty program.

## Removed project member can write to protected branches

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/972 -->

An issue has been discovered in GitLab affecting all versions prior to 16.2.7, all versions starting from 16.3 before 16.3.5, and all versions starting from 16.4 before 16.4.1. It was possible for a removed project member to write to protected branches using deploy keys. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-5198](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-5198).

Thanks [theluci](https://hackerone.com/theluci) for reporting this vulnerability through our HackerOne bug bounty program.

## Unauthorised association of CI jobs for Machine Learning experiments

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/960 -->

An issue has been discovered in GitLab affecting all versions starting from 16.2 before 16.2.8, all versions starting from 16.3 before 16.3.5, all versions starting from 16.4 before 16.4.1. Users were capable of linking CI/CD jobs of private projects which they are not a member of. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-4532](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-4532).

Thanks [ricardobrito](https://hackerone.com/ricardobrito) for reporting this vulnerability through our HackerOne bug bounty program.

## Force pipelines to not have access to protected variables and will likely fail using tags

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/955 -->

Denial of Service in pipelines affecting all versions of Gitlab EE and CE prior to 16.2.8, 16.3 prior to 16.3.5, and 16.4 prior to 16.4.1 allows attacker to cause pipelines to fail. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-3917](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3917).

Thanks [js_noob](https://hackerone.com/js_noob) for reporting this vulnerability through our HackerOne bug bounty program.

## Maintainer can create a fork relationship between existing projects

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/963 -->

An issue has been discovered in GitLab affecting all versions starting from 11.2 before 16.2.8, all versions starting from 16.3 before 16.3.5, all versions starting from 16.4 before 16.4.1. It was possible that a maintainer to create a fork relationship between existing projects contrary to the documentation. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-3920](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3920).

Thanks [theluci](https://hackerone.com/theluci) for reporting this vulnerability through our HackerOne bug bounty program.

## Disclosure of masked CI variables via processing CI/CD configuration of forks

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/964 -->

An information disclosure issue in GitLab CE/EE affecting all versions from 13.11 prior to 16.2.8, 16.3 prior to 16.3.5, and 16.4 prior to 16.4.1 allows an attacker to extract non-protected CI/CD variables by tricking a user to visit a fork with a malicious CI/CD configuration. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-0989](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0989).

Thanks [shells3c](https://hackerone.com/shells3c) for reporting this vulnerability through our HackerOne bug bounty program.

## Asset Proxy Bypass using non-ASCII character in asset URI

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/973 -->

An input validation issue in the asset proxy in GitLab EE, affecting all versions from 12.3 prior to 16.2.8, 16.3 prior to 16.3.5, and 16.4 prior to 16.4.1, allowed an authenticated attacker to craft image urls which bypass the asset proxy. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:L/I:N/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2023-3906](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3906).

Thanks [afewgoats](https://hackerone.com/afewgoats) for reporting this vulnerability through our HackerOne bug bounty program.

## Unauthorized member can gain `Allowed to push and merge` access and affect integrity of protected branches

An issue has been discovered in GitLab EE affecting all versions starting from X.Y before 16.X, all versions starting from 16.X before 16.X. It was possible for an attacker to abuse the `Allowed to merge` permission as a guest user, when granted the permission through a group. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:N/I:L/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2023-4658](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-4658).

Thanks [theluci](https://hackerone.com/theluci) for reporting this vulnerability through our HackerOne bug bounty program.

## Removed Developer can continue editing the source code of a public project

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/953 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 10.6 before 16.2.8, all versions starting from 16.3 before 16.3.5, all versions starting from 16.4 before 16.4.1. It was possible that upstream members to collaborate with you on your branch get permission to write to the merge request’s source branch. . This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:N/I:L/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2023-3979](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3979).

Thanks [theluci](https://hackerone.com/theluci) for reporting this vulnerability through our HackerOne bug bounty program.

## A project reporter can leak owner's Sentry instance projects

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/968 -->

An improper authorization issue has been discovered in GitLab CE/EE affecting all versions starting from 11.8 before 16.2.x8, all versions starting from 16.3 before 16.3.5 and all versions starting from 16.4.0 before 16.4.1. It allows a project reporter to leak the owner's Sentry instance projects. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:L/I:N/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2023-2233](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2233).

Thanks [js_noob](https://hackerone.com/js_noob) for reporting this vulnerability through our HackerOne bug bounty program.

## Math rendering in markdown can escape container and hijack clicks

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/974 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 8.15 before 16.2.8, all versions starting from 16.3 before 16.3.5, all versions starting from 16.4 before 16.4.1. It was possible to hijack some links and buttons on the GitLab UI to a malicious page. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:C/C:N/I:N/A:L`, 3.0). It is now mitigated in the latest release and is assigned [CVE-2023-3922](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-3922).

Thanks [ammar2](https://hackerone.com/ammar2) for reporting this vulnerability through our HackerOne bug bounty program.

# Update Exiftool
Exiftool has been updated to version 1.12 in order to mitigate security issues.

# Update Mattermost
Mattermost has been updated to version 8.1.2 in order to mitigate security issues.

# Update Auto deploy image
Auto deploy image has been updated to version 2.55.0 in order to mitigate security issues.

## Non Security Patches

### 16.3.5

* [Backport disable v1 package metadata sync](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/132398)

## Updating

To update GitLab, see the [Update page](/update).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).


