---
title: "GitLab Security Release: 15.2.1, 15.1.4, and 15.0.5"
description: "Learn more about GitLab Security Release: 15.2.1, 15.1.4, and 15.0.5 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2022/07/28/security-release-gitlab-15-2-1-released/"
categories: releases
author: Rohit Shambhuni
author_gitlab: rshambhuni
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.2.1, 15.1.4, and 15.0.5 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Breaking change

In July 2019 we fixed a vulnerability related to very large CI/CD configuration files and the `ci_yaml_limit_size` feature flag was introduced as a way to disable the patch, if needed. We are now removing that feature flag as well, to remove the possibility of disabling the patch.

You are not affected by this change if the feature flag was not manually disabled. You can refer to [our documentation](https://docs.gitlab.com/ee/administration/feature_flags.html#check-if-a-feature-flag-is-enabled) for instructions on how to check the state of a feature flag.

If you've disabled this feature flag and like to maintain the existing behavior and avoid a breaking change, you can refer to our [documentation](https://docs.gitlab.com/ee/administration/instance_limits.html#maximum-size-and-depth-of-cicd-configuration-yaml-files) for instructions on how to configure the size of your CI/CD configuration file from the rails console.
## Table of Fixes

|Title|Severity|
|---|---|
|[Revoke access to confidential notes todos](#revoke-access-to-confidential-notes-todos)|medium|
|[Pipeline subscriptions trigger new pipelines with the wrong author](#pipeline-subscriptions-trigger-new-pipelines-with-the-wrong-author)|medium|
|[Ability to gain access to private project through an email invite by using other user's email address as an unverified secondary email](#ability-to-gain-access-to-private-project-through-an-email-invite-by-using-other-users-email-address-as-an-unverified-secondary-email)|medium|
|[Import via git protocol allows to bypass checks on repository](#import-via-git-protocol-allows-to-bypass-checks-on-repository)|medium|
|[Unauthenticated IP allowlist bypass when accessing job artifacts through GitLab Pages](#unauthenticated-ip-allowlist-bypass-when-accessing-job-artifacts-through-gitlab-pages)|medium|
|[Maintainer can leak Packagist and other integration access tokens by changing integration URL](#maintainer-can-leak-packagist-and-other-integration-access-tokens-by-changing-integration-url)|medium|
|[Unauthenticated access to victims Grafana datasources through path traversal](#unauthenticated-access-to-victims-grafana-datasources-through-path-traversal)|medium|
|[Unauthorized users can filter issues by contact and organization](#unauthorized-users-can-filter-issues-by-contact-and-organization)|medium|
|[Malicious Maintainer may change the visibility of project or a group](#malicious-maintainer-may-change-the-visibility-of-project-or-a-group)|medium|
|[Stored XSS in job error messages](#stored-xss-in-job-error-messages)|medium|
|[Enforced group MFA can be bypassed when using Resource Owner Password Credentials grant](#enforced-group-mfa-can-be-bypassed-when-using-resource-owner-password-credentials-grant)|medium|
|[Non project members can view public project's Deploy Keys](#non-project-members-can-view-public-projects-deploy-keys)|medium|
|[IDOR in project with Jira integration leaks project owner's other projects Jira issues](#idor-in-project-with-jira-integration-leaks-project-owners-other-projects-jira-issues)|low|
|[Group Bot Users and Tokens not deleted after group deletion](#group-bot-users-and-tokens-not-deleted-after-group-deletion)|low|
|[Email invited members can join projects even after the member lock has been enabled](#email-invited-members-can-join-projects-even-after-the-member-lock-has-been-enabled)|low|
|[Datadog integration returns user emails](#datadog-integration-returns-user-emails)|low|

## Revoke access to confidential notes todos

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/705 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 15.0 before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1. Membership changes are not reflected in TODO for confidential notes, allowing a former project members to read updates via TODOs. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-2512](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2512).

This vulnerability has been discovered internally by the GitLab team.

## Pipeline subscriptions trigger new pipelines with the wrong author

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/642 -->

An issue in pipeline subscriptions in GitLab EE affecting all versions starting from 12.8 before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1 triggered new pipelines with the person who created the tag as the pipeline creator instead of the subscription's author. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:U/C:H/I:H/A:N`, 6.4). It is now mitigated in the latest release and is assigned [CVE-2022-2498](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2498).

Thanks [vaib25vicky](https://hackerone.com/vaib25vicky) for reporting this vulnerability through our HackerOne bug bounty program.

## Ability to gain access to private project through an email invite by using other user's email address as an unverified secondary email

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/685 -->

An issue has been discovered in GitLab CE/EE affecting all versions before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1. It may be possible to gain access to a private project through an email invite by using other user's email address as an unverified secondary email. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:U/C:H/I:H/A:N`, 6.4). It is now mitigated in the latest release and is assigned [CVE-2022-2326](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2326).

Thanks [vaib25vicky](https://hackerone.com/vaib25vicky) for reporting this vulnerability through our HackerOne bug bounty program.

## Import via git protocol allows to bypass checks on repository

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/715 -->

Insufficient validation in GitLab CE/EE affecting all versions starting from 12.10 before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1 allows an authenticated and authorised user to import a project that includes branch names which are 40 hexadecimal characters, which could be abused in supply chain attacks where a victim pinned to a specific Git commit of the project. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:R/S:C/C:N/I:H/A:N`, 6.2). It is now mitigated in the latest release and is assigned [CVE-2022-2417](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2417).

This vulnerability has been discovered internally by the GitLab team.

## Unauthenticated IP allowlist bypass when accessing job artifacts through GitLab Pages

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/722 -->

An improper access control issue in GitLab EE affecting all versions starting from 12.0 before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1 allows an attacker to bypass IP allow-listing and download artifacts. This attack only bypasses IP allow-listing, proper permissions are still required. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:N/A:N`, 5.9). It is now mitigated in the latest release and is assigned [CVE-2022-2501](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2501).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Maintainer can leak Packagist and other integration access tokens by changing integration URL

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/703 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 12.6 before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1. A malicious maintainer could exfiltrate an integration's access token by modifying the integration URL such that authenticated requests are sent to an attacker controlled server. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:C/C:L/I:L/A:N`, 5.5). It is now mitigated in the latest release and is assigned [CVE-2022-2497](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2497).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Unauthenticated access to victims Grafana datasources through path traversal

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/701 -->

An issue has been discovered in GitLab EE affecting all versions starting from 12.5 before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1. GitLab was not performing correct authentication on Grafana API under specific conditions allowing unauthenticated users to perform queries through a path traversal vulnerability. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2022-2531](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2531).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Unauthorized users can filter issues by contact and organization

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/716 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 14.6 before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1, allowed a project member to filter issues by contact and organization. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2022-2539](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2539).

This vulnerability has been discovered internally by the GitLab team.

## Malicious Maintainer may change the visibility of project or a group

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/708 -->

An issue has been discovered in GitLab CE/EE affecting all versions before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1. It may be possible for malicious group or project maintainers to change their corresponding group or project visibility by crafting a malicious POST request. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:H/I:N/A:N`, 4.9). It is now mitigated in the latest release and is assigned [CVE-2022-2456](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2456).

Thanks [suruli](https://hackerone.com/suruli) for reporting this vulnerability through our HackerOne bug bounty program.

## Stored XSS in job error messages

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/720 -->

A cross-site scripting issue has been discovered in GitLab CE/EE affecting all versions before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1. A stored XSS flaw in job error messages allows attackers to perform arbitrary actions on behalf of victims at client side. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:C/C:L/I:L/A:N`, 4.4). It is now mitigated in the latest release and is assigned [CVE-2022-2500](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2500).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

## Enforced group MFA can be bypassed when using Resource Owner Password Credentials grant

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/698 -->

An issue has been discovered in GitLab CE/EE affecting all versions before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1. It may be possible for group members to bypass 2FA enforcement enabled at the group level by using Resource Owner Password Credentials grant to obtain an access token without using 2FA. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-2303](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2303).

Thanks [albatraoz](https://hackerone.com/albatraoz) for reporting this vulnerability through our HackerOne bug bounty program.

## Non project members can view public project's Deploy Keys

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/724 -->

An improper access control check in GitLab CE/EE affecting all versions starting from 13.7 before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1 allows a malicious authenticated user to view a public project's Deploy Key's public fingerprint and name when that key has write permission. Note that GitLab never asks for nor stores the private key. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-2095](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2095).

Thanks [jimeno](https://hackerone.com/jimeno) for reporting this vulnerability through our HackerOne bug bounty program.

## IDOR in project with Jira integration leaks project owner's other projects Jira issues

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/702 -->

An issue has been discovered in GitLab EE affecting all versions starting from 13.10 before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1. GitLab's Jira integration has an insecure direct object reference vulnerability that may be exploited by an attacker to leak Jira issues. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:C/C:L/I:N/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2022-2499](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2499).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Group Bot Users and Tokens not deleted after group deletion

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/694 -->

A lack of cascading deletes in GitLab CE/EE affecting all versions starting from 13.0 before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1 allows a malicious Group Owner to retain a usable Group Access Token even after the Group is deleted, though the APIs usable by that token are limited. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:R/S:U/C:L/I:L/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2022-2307](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2307).

This vulnerability has been discovered by the JiHu team.

## Email invited members can join projects even after the member lock has been enabled

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/718 -->

An issue has been discovered in GitLab EE affecting all versions before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1. It may be possible for email invited members to join a project even after the Group Owner has enabled the setting to prevent members from being added to projects in a group, if the invite was sent before the setting was enabled. This is a low severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:L/A:N`, 2.7). It is now mitigated in the latest release and is assigned [CVE-2022-2459](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2459).

Thanks [justas_b](https://hackerone.com/justas_b) for reporting this vulnerability through our HackerOne bug bounty program.

## Datadog integration returns user emails

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/704 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 9.3 before 15.0.5, all versions starting from 15.1 before 15.1.4, all versions starting from 15.2 before 15.2.1. GitLab was returning contributor emails due to improper data handling in the Datadog integration. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:H/UI:N/S:U/C:L/I:N/A:N`, 2.2). It is now mitigated in the latest release and is assigned [CVE-2022-2534](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-2534).

This vulnerability has been discovered internally by the GitLab team.

## Update bzip2

The version of bzip2 has been updated to 1.0.8 in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab Omnibus.

## Update exiftool

The version of exiftool has been updated to 12.42 in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab Omnibus.

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
