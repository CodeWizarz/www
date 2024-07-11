---
title: "GitLab Security Release: 14.6.2, 14.5.3, and 14.4.5"
description: "Learn more about GitLab Security Release: 14.6.2, 14.5.3, and 14.4.5 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2022/01/11/security-release-gitlab-14-6-2-released/"
categories: releases
author: Vitor Meireles De Sousa
author_gitlab: vdesousa
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 14.6.2, 14.5.3, and 14.4.5 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

## Table of Fixes

|Title|Severity|
|---|---|
|[Arbitrary file read via group import feature](#arbitrary-file-read-via-group-import-feature)|high|
|[Stored XSS in notes](#stored-xss-in-notes)|high|
|[Lack of state parameter on GitHub import project OAuth](#lack-of-state-parameter-on-github-import-project-oauth)|high|
|[Vulnerability related fields are available to unauthorized users on GraphQL API](#vulnerability-related-fields-are-available-to-unauthorized-users-on-graphql-api)|medium|
|[Deleting packages may cause table locks](#deleting-packages-may-cause-table-locks)|medium|
|[IP restriction bypass via GraphQL](#ip-restriction-bypass-via-graphql)|medium|
|[Repository content spoofing using Git replacement references](#repository-content-spoofing-using-git-replacement-references)|medium|
|[Users can import members from projects that they are not a maintainer on through API](#users-can-import-members-from-projects-that-they-are-not-a-maintainer-on-through-api)|medium|
|[Possibility to direct user to malicious site through Slack integration](#possibility-to-direct-user-to-malicious-site-through-slack-integration)|medium|
|[Bypassing file size limits to the NPM package repository](#bypassing-file-size-limits-to-the-npm-package-repository)|medium|
|[User with expired password can still access sensitive information](#user-with-expired-password-can-still-access-sensitive-informations)|low|
|[Incorrect port validation allows access to services on ports 80 and 443 if GitLab is configured to run on another port](#incorrect-port-validation-allows-access-to-services-on-ports-80-and-443-if-gitlab-is-configured-to-run-on-another-port)|low|

## Arbitrary file read via group import feature

An issue has been discovered in GitLab CE/EE affecting all versions starting with 14.5. Arbitrary file read was possible by importing a group due to incorrect file handling. This is a critical severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:C/C:H/I:N/A:N`, 8.6). It is now mitigated in the latest release and is assigned [CVE-2022-0244](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0244).

Thanks [vakzz](https://hackerone.com/vakzz) for reporting this vulnerability through our HackerOne bug bounty program.

## Stored XSS in notes

Improper neutralization of user input in GitLab CE/EE versions 14.3 to 14.3.6, 14.4 to 14.4.4, and 14.5 to 14.5.2 allowed an attacker to exploit XSS by abusing the generation of the HTML code related to emojis. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:C/C:H/I:H/A:N`, 8.7). It is now mitigated in the latest release and is assigned [CVE-2021-39946](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39946).

Thanks [jarij](https://hackerone.com/jarij) for reporting this vulnerability through our HackerOne bug bounty program.

## Lack of state parameter on GitHub import project OAuth

An issue has been discovered in GitLab affecting all versions starting from 7.7 before 14.4.5, all versions starting from 14.5.0 before 14.5.3, and all versions starting from 14.6.0 before 14.6.2. GitLab was vulnerable to a Cross-Site Request Forgery attack that allows a malicious user to have their GitHub project imported on another GitLab user account. This is a high severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:H/I:H/A:H`, 7.5). It is now mitigated in the latest release and is assigned [CVE-2022-0154](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0154).

Thanks [aryan2808](https://hackerone.com/aryan2808) for reporting this vulnerability through our HackerOne bug bounty program.

## Vulnerability related fields are available to unauthorized users on GraphQL API

An issue has been discovered in GitLab affecting all versions starting from 13.10 before 14.4.5, all versions starting from 14.5.0 before 14.5.3, and all versions starting from 14.6.0 before 14.6.2. GitLab was vulnerable to unauthorized access to some particular fields through the GraphQL API. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-0152](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0152).

This vulnerability has been discovered internally by the GitLab team.

## Deleting packages may cause table locks

An issue has been discovered in GitLab affecting all versions starting from 12.10 before 14.4.5, all versions starting from 14.5.0 before 14.5.3, and all versions starting from 14.6.0 before 14.6.2. GitLab was not correctly handling requests to delete existing packages which could result in a Denial of Service under specific conditions. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:H/A:H`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-0151](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0151).

This vulnerability has been discovered internally by the GitLab team.

## IP restriction bypass via GraphQL

An issue has been discovered in GitLab CE/EE affecting all versions starting with 12.3. Under certain conditions it was possible to bypass the IP restriction for public projects through GraphQL allowing unauthorised users to read titles of issues, merge
requests and milestones. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2022-0172](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0172).

This vulnerability has been discovered internally by the GitLab team.

## Repository content spoofing using Git replacement references

An issue has been discovered affecting GitLab versions prior to 14.4.5, between 14.5.0 and 14.5.3, and between 14.6.0 and 14.6.1. GitLab is configured in a way that it doesn't ignore replacement references with `git` sub-commands, allowing a malicious user to spoof the contents of their commits in the UI. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:H/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-0090](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0090).

Thanks [star-labs](https://hackerone.com/star-labs) for reporting this vulnerability through our HackerOne bug bounty program.

## Users can import members from projects that they are not a maintainer on through API

An issue has been discovered in GitLab affecting all versions starting from 12.0 before 14.4.5, all versions starting from 14.5.0 before 14.5.3, and all versions starting from 14.6.0 before 14.6.2. GitLab was not verifying that a maintainer of a project had the right access to import members from a target project. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-0125](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0125).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Possibility to direct user to malicious site through Slack integration

An issue has been discovered affecting GitLab versions prior to 14.4.5, between 14.5.0 and 14.5.3, and between 14.6.0 and 14.6.1. Gitlab's Slack integration is incorrectly validating user input and allows crafting of malicious URLs that are sent to slack. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-0124](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0124).

Thanks [rafaltrojniak](https://hackerone.com/rafaltrojniak) for reporting this vulnerability through our HackerOne bug bounty program.

## Bypassing file size limits to the NPM package repository

A denial of service vulnerability in GitLab CE/EE affecting all versions starting from 12.0 before 14.3.6, all versions starting from 14.4 before 14.4.4, and all versions starting from 14.5 before 14.5.2, allows low-privileged users to bypass file size limits in the NPM package repository to potentially cause denial of service. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-39942](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39942).

Thanks [0xn3va](https://hackerone.com/0xn3va) for reporting this vulnerability through our HackerOne bug bounty program.

## User with expired password can still access sensitive information

An issue has been discovered affecting GitLab versions prior to 14.4.5, between 14.5.0 and 14.5.3, and between 14.6.0 and 14.6.1. GitLab allows a user with an expired password to access sensitive information through RSS feeds. This is a low severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:U/C:L/I:N/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2022-0093](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0093).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Incorrect port validation allows access to services on ports 80 and 443 if GitLab is configured to run on another port

Server side request forgery protections in GitLab CE/EE versions between 8.4 and 14.4.x, between 14.5.0 and 14.5.x, and between 14.6.0 and 14.6.x would fail to protect against attacks sending requests to localhost on port 80 or 443 if GitLab was configured to run on a port other than 80 or 443. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:C/C:L/I:N/A:N`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2021-39927](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39927).

This vulnerability has been discovered internally by the GitLab team.

## Update Prometheus

The version of Prometheus included in GitLab Omnibus has been updated to 2.25.2 in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab Omnibus.

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).

