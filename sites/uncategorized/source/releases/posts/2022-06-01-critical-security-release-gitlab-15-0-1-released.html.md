---
title: "GitLab Critical Security Release: 15.0.1, 14.10.4, and 14.9.5"
description: "Learn more about GitLab Critical Security Release: 15.0.1, 14.10.4, and 14.9.5 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2022/06/01/critical-security-release-gitlab-15-0-1-released/"
categories: releases
author: Nick Malcolm
author_gitlab: nmalcolm
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.0.1, 14.10.4, and 14.9.5 for GitLab Community Edition (CE) and Enterprise Edition (EE). _Please note, this critical release will also serve as our monthly security release for May._


These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released approximately one week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Account take over via SCIM email change](#account-take-over-via-scim-email-change)|critical|
|[Stored XSS in Jira integration](#stored-xss-in-jira-integration)|high|
|[Quick action commands susceptible to XSS](#quick-action-commands-susceptible-to-xss)|high|
|[IP allowlist bypass when using Trigger tokens](#ip-allowlist-bypass-when-using-trigger-tokens)|medium|
|[IP allowlist bypass when using Project Deploy Tokens](#ip-allowlist-bypass-when-using-project-deploy-tokens)|medium|
|[Improper authorization in the Interactive Web Terminal](#improper-authorization-in-the-interactive-web-terminal)|medium|
|[Subgroup member can list members of parent group](#subgroup-member-can-list-members-of-parent-group)|medium|
|[Group member lock bypass](#group-member-lock-bypass)|low|

## Account take over via SCIM email change

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/669 -->

An account takeover issue has been discovered in GitLab EE affecting all versions starting from 11.10 before 14.9.5, all versions starting from 14.10 before 14.10.4, all versions starting from 15.0 before 15.0.1. When group SAML SSO is configured, the SCIM feature (available only on Premium+ subscriptions) may allow any owner of a Premium group to invite arbitrary users through their username and email, then change those users' email addresses via SCIM to an attacker controlled email address and thus - in the absence of 2FA - take over those accounts. It is also possible for the attacker to change the display name and username of the targeted account. This is a critical severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:C/C:H/I:H/A:H`, 9.9). It is now mitigated in the latest release and is assigned [CVE-2022-1680](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1680).

This vulnerability was discovered internally by a member of the GitLab team.

Self-managed administrators can check whether `group_saml` is enabled by reviewing ["Configuring Group SAML on a self-managed GitLab instance"](https://docs.gitlab.com/ee/integration/saml.html#configuring-group-saml-on-a-self-managed-gitlab-instance).

## Stored XSS in Jira integration

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/674 -->

A Stored Cross-Site Scripting vulnerability in Jira integration in GitLab EE affecting all versions from 13.11 prior to 14.9.5, 14.10 prior to 14.10.4, and 15.0 prior to 15.0.1 allows an attacker to execute arbitrary JavaScript code in GitLab on a victim's behalf via specially crafted Jira Issues. This is a high severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:R/S:C/C:H/I:H/A:N`, 7.7). It is now mitigated in the latest release and is assigned [CVE-2022-1940](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1940).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Quick action commands susceptible to XSS

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/673 -->

An issue has been discovered in GitLab affecting all versions starting from 15.0 before 15.0.1. Missing validation of input used in quick actions allowed an attacker to exploit XSS by injecting HTML in contact details. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:C/C:H/I:H/A:N`, 8.7). It is now mitigated in the latest release and is assigned [CVE-2022-1948](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1948).

Thanks [cryptopone](https://hackerone.com/cryptopone) for reporting this vulnerability through our HackerOne bug bounty program.

## IP allowlist bypass when using Trigger tokens

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/678 -->

Incorrect authorization in GitLab EE affecting all versions from 12.0 before 14.9.5, all versions starting from 14.10 before 14.10.4, all versions starting from 15.0 before 15.0.1 allowed an attacker already in possession of a valid Project Trigger Token to misuse it from any location even when IP address restrictions were configured. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:N/S:U/C:H/I:H/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-1935](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1935).

This vulnerability has been discovered internally by the GitLab team.

## IP allowlist bypass when using Project Deploy Tokens

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/677 -->

Incorrect authorization in GitLab EE affecting all versions from 12.0 before 14.9.5, all versions starting from 14.10 before 14.10.4, all versions starting from 15.0 before 15.0.1 allowed an attacker already in possession of a valid Project Deploy Token to misuse it from any location even when IP address restrictions were configured. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:N/S:U/C:H/I:H/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-1936](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1936).

This was reported by a customer through our Responsible Vulnerability Disclosure process.

## Improper authorization in the Interactive Web Terminal

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/662 -->

When the feature is configured, improper authorization in the Interactive Web Terminal in GitLab CE/EE affecting all versions from 11.3 prior to 14.9.5, 14.10 prior to 14.10.4, and 15.0 prior to 15.0.1 allows users with the Developer role to open terminals on other Developers' running jobs. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:R/S:U/C:H/I:L/A:N`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2022-1944](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1944).

This vulnerability has been discovered internally by the GitLab team.

## Subgroup member can list members of parent group

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/672 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 10.8 before 14.9.5, all versions starting from 14.10 before 14.10.4, all versions starting from 15.0 before 15.0.1. It may be possible for a subgroup member to access the members list of their parent group. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-1821](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1821).

This vulnerability was discovered internally by a member of the GitLab team.

## Group member lock bypass

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/660 -->

An issue has been discovered in GitLab CE/EE affecting all versions starting from 14.3 before 14.9.5, all versions starting from 14.10 before 14.10.4, all versions starting from 15.0 before 15.0.1. It may be possible for malicious group maintainers to add new members to a project within their group, through the REST API, even after their group owner enabled a setting to prevent members from being added to projects within that group. This is a low severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:L/A:N`, 2.7). It is now mitigated in the latest release and is assigned [CVE-2022-1783](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1783).

Thanks [salh4ckr](https://hackerone.com/salh4ckr) for reporting this vulnerability through our HackerOne bug bounty program.

##  Update Mattermost

The version of Mattermost has been updated to 6.6.1 in order to mitigate security concerns.

### Versions affected

Affects GitLab Omnibus prior to 15.0.

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).

