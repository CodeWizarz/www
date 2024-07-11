---
title: "GitLab Security Release: 15.10.1, 15.9.4, and 15.8.5"
description: "Learn more about GitLab Security Release: 15.10.1, 15.9.4, and 15.8.5 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2023/03/30/security-release-gitlab-15-10-1-released/"
categories: releases
author: Greg Alfaro
author_gitlab: truegreg
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.10.1, 15.9.4, and 15.8.5 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=created_date&state=closed&label_name%5B%5D=bug%3A%3Avulnerability&confidential=no&first_page_size=100) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Cross-site scripting in "Maximum page reached" page](#cross-site-scripting-in-maximum-page-reached-page)|medium|
|[Private project guests can read new changes using a fork](#private-project-guests-can-read-new-changes-using-a-fork)|medium|
|[Mirror repository error reveals password in Settings UI](#mirror-repository-error-reveals-password-in-settings-ui)|medium|
|[DOS and high resource consumption of Prometheus server through abuse of Prometheus integration proxy endpoint](#dos-and-high-resource-consumption-of-prometheus-server-through-abuse-of-prometheus-integration-proxy-endpoint)|medium|
|[Unauthenticated users can view Environment names from public projects limited to project members only](#unauthenticated-users-can-view-environment-names-from-public-projects-limited-to-project-members-only)|medium|
|[Copying information to the clipboard could lead to the execution of unexpected commands](#copying-information-to-the-clipboard-could-lead-to-the-execution-of-unexpected-commands)|medium|
|[Maintainer can leak masked webhook secrets by adding a new parameter to the webhook URL](#maintainer-can-leak-masked-webhook-secrets-by-adding-a-new-parameter-to-the-webhook-url)|medium|
|[Arbitrary HTML injection possible when :soft_email_confirmation feature flag is enabled in the latest release](#arbitrary-html-injection-possible-when-soft_email_confirmation-feature-flag-is-enabled-in-the-latest-release)|medium|
|[Framing of arbitrary content (leading to open redirects) on any page allowing user controlled markdown](#framing-of-arbitrary-content-leading-to-open-redirects-on-any-page-allowing-user-controlled-markdown)|medium|
|[MR for security reports are available to everyone](#mr-for-security-reports-are-available-to-everyone)|medium|
|[API timeout when searching for group issues](#api-timeout-when-searching-for-group-issues)|medium|
|[Unauthorised user can add child epics linked to victim's epic in an unrelated group](#unauthorised-user-can-add-child-epics-linked-to-victims-epic-in-an-unrelated-group)|medium|
|[GitLab search allows to leak internal notes](#gitlab-search-allows-to-leak-internal-notes)|medium|
|[Ambiguous branch name exploitation in GitLab](#ambiguous-branch-name-exploitation-in-gitlab)|low|
|[Improper permissions checks for moving an issue](#improper-permissions-checks-for-moving-an-issue)|low|
|[Private project branches names can be leaked through a fork](#private-project-branches-names-can-be-leaked-through-a-fork)|low|

## Cross-site scripting in "Maximum page reached" page

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/849 -->

An issue has been discovered in GitLab affecting all versions starting from 12.8 before 15.8.5, all versions starting from 15.9 before 15.9.4, all versions starting from 15.10  before 15.10.1. A specially crafted payload could lead to a reflected XSS on the client side which allows attackers to perform arbitrary actions on behalf of victims on self-hosted instances running without strict CSP. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:C/C:L/I:L/A:N`, 6.1)). It is now mitigated in the latest release and is assigned [CVE-2022-3513](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3513).

Thanks [ryotak](https://hackerone.com/ryotak) for reporting this vulnerability through our HackerOne bug bounty program.

## Private project guests can read new changes using a fork

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/838 -->

An issue has been discovered in GitLab affecting all versions starting from 13.11 before 15.8.5, all versions starting from 15.9 before 15.9.4, all versions starting from 15.10  before 15.10.1. It was possible that a project member demoted to a user role could read project updates by doing a diff with a pre-existing fork. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2023-0485](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0485).

Thanks [shells3c](https://hackerone.com/shells3c) for reporting this vulnerability through our HackerOne bug bounty program.

## Mirror repository error reveals password in Settings UI

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/834 -->

An information disclosure vulnerability has been discovered in GitLab EE/CE affecting all versions starting from 11.5 before 15.8.5, all versions starting from 15.9 before 15.9.4, all  versions starting from 15.10  before 15.10.1 will allow an admin to leak password from repository mirror configuration. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:H/UI:N/S:C/C:H/I:N/A:N`, 5.8). It is now mitigated in the latest release and is assigned [CVE-2023-1098](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1098).

Thanks [tennox_](https://hackerone.com/tennox_) for reporting this vulnerability through our HackerOne bug bounty program.

## DOS and high resource consumption of Prometheus server through abuse of Prometheus integration proxy endpoint

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/861 -->

A denial of service condition exists in the Prometheus server bundled with GitLab affecting all versions from 11.10 to 15.8.5, 15.9 to 15.9.4 and 15.10 to 15.10.1. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:N/I:N/A:L`, 5.8). It is now mitigated in the latest release and is assigned [CVE-2023-1733](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1733).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## Unauthenticated users can view Environment names from public projects limited to project members only

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/837 -->

An issue has been discovered in GitLab affecting all versions starting from 13.6 before 15.8.5, all versions starting from 15.9 before 15.9.4, all versions starting from 15.10  before 15.10.1, allowing reading of environment names supposed to be restricted to project members only. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:L/I:N/A:N`, 5.8). It is now mitigated in the latest release and is assigned [CVE-2023-0319](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0319).

Thanks [ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for reporting this vulnerability through our HackerOne bug bounty program.

## Copying information to the clipboard could lead to the execution of unexpected commands

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/858 -->

An issue was identified in GitLab CE/EE affecting all versions from 1.0 prior to 15.8.5, 15.9 prior to 15.9.4, and 15.10 prior to 15.10.1 where non-printable characters are copied from clipboard, allowing unexpected commands to be executed on the victim machine. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:N/I:H/A:N`, 5.7). It is now mitigated in the latest release and is assigned [CVE-2023-1708](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1708).

Thanks [st4nly0n](https://hackerone.com/st4nly0n) for reporting this vulnerability through our HackerOne bug bounty program.

## Maintainer can leak masked webhook secrets by adding a new parameter to the webhook URL

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/856 -->

An issue has been discovered in GitLab affecting versions starting from 15.1 before 15.8.5, 15.9 before 15.9.4, and 15.10 before 15.10.1. A maintainer could modify a webhook URL to leak masked webhook secrets by adding a new parameter to the url. This addresses an incomplete fix for CVE-2022-4342. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:C/C:L/I:L/A:N`, 5.5). It is now mitigated in the latest release and is assigned [CVE-2023-0838](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0838).

Thanks [0xn3va](https://hackerone.com/0xn3va) for reporting this vulnerability through our HackerOne bug bounty program.

## Arbitrary HTML injection possible when :soft_email_confirmation feature flag is enabled in the latest release

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/840 -->

An issue has been discovered in GitLab affecting all versions starting from 15.6 before 15.8.5, 15.9 before 15.9.4, and 15.10 before 15.10.1. On certain instances, a stored XSS was possible via a malicious email address, which only affected the admins when they tried to impersonate the account with the malicious payload. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:C/C:L/I:L/A:N`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2023-0523](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0523).

Thanks [cryptopone](https://hackerone.com/cryptopone) for reporting this vulnerability through our HackerOne bug bounty program.

## Framing of arbitrary content (leading to open redirects) on any page allowing user controlled markdown

An issue has been discovered in GitLab affecting all versions starting from all versions starting from 15.7 before 15.8.5, all versions starting from 15.9 before 15.9.4, all versions starting from 15.10  before 15.10.1. It was possible to iframe arbitrary origins in the browser via specially crafted markdown on any page. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:C/C:N/I:L/A:L`, 5.4). It is now mitigated in the latest release and is assigned [CVE-2023-0155](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0155).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.

## MR for security reports are available to everyone

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/845 -->

Improper authorization in GitLab EE affecting all versions from 12.3.0 before 15.8.5, all versions starting from 15.9 before 15.9.4, all versions starting from 15.10 before 15.10.1 allows an unauthorized access to security reports in merge requests. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2023-1167](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1167).

This vulnerability has been discovered internally by GitLab team member [@minac](https://gitlab.com/minac).

## API timeout when searching for group issues

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/851 -->

An issue has been discovered in GitLab affecting all versions starting from 15.9 before 15.9.4, all versions starting from 15.10 before 15.10.1. A search timeout could be triggered if a specific HTML payload was used in the issue description. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-1787](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1787).

This vulnerability has been discovered internally by a GitLab team member.

## Unauthorised user can add child epics linked to victim's epic in an unrelated group

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/857 -->

An issue has been discovered in GitLab affecting all versions starting from 15.9 before 15.9.4, all versions starting from 15.10  before 15.10.1. It was possible for an unauthorised user to add child epics linked to a victim's epic in an unrelated group. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2023-1417](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1417).

Thanks [cryptopone](https://hackerone.com/cryptopone) for reporting this vulnerability through our HackerOne bug bounty program.


## GitLab search allows to leak internal notes

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/852 -->

A sensitive information disclosure vulnerability in GitLab affecting all versions from 15.0 prior to 15.8.5, 15.9 prior to 15.9.4 and 15.10 prior to 15.10.1 allows an attacker to view the count of internal notes for a given issue. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2023-1710](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1710 )

Thanks [shells3c](https://hackerone.com/shells3c) for reporting this vulnerability through our HackerOne bug bounty program.

## Ambiguous branch name exploitation in GitLab

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/846 -->

An issue has been discovered in GitLab affecting all versions starting from 8.1 to 15.8.5, and from 15.9 to 15.9.4, and from 15.10 to 15.10.1. It was possible to add a branch with an ambiguous name that could be used to social engineer users. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:R/S:U/C:L/I:L/A:N`, 3.7). It is now mitigated in the latest release and is assigned [CVE-2023-0450](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0450).

Thanks [inspector-ambitious](https://hackerone.com/inspector-ambitious) for reporting this vulnerability through our HackerOne bug bounty program.

## Improper permissions checks for moving an issue

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/835 -->

An issue has been discovered in GitLab affecting all versions from 15.5 before 15.8.5, all versions starting from 15.9 before 15.9.4, all versions starting from 15.10 before 15.10.1. Due to improper permissions checks it was possible for an unauthorised user to remove an issue from an epic. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:N/I:L/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2023-1071](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-1071).

This vulnerability has been discovered internally by the GitLab team.

## Private project branches names can be leaked through a fork

<!-- https://gitlab.com/gitlab-org/security/gitlab/-/issues/826 -->

An issue has been discovered in GitLab affecting all versions starting from 11.10 before 15.8.5, all versions starting from 15.9 before 15.9.4, all versions starting from 15.10  before 15.10.1. It was possible to disclose the branch names when an attacker has a fork of a project that was switched to private. This is a low severity issue (`CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:L/I:N/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2022-3375](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-3375).

Thanks [shells3c](https://hackerone.com/shells3c) for reporting this vulnerability through our HackerOne bug bounty program.

## Update Mattermost

<!-- https://gitlab.com/gitlab-org/security/omnibus-gitlab/-/issues/84 -->

Mattermost has been updated to versions 7.7.3 and 7.8.2 in order to mitigate security issues. 

## Update curl

<!-- https://gitlab.com/gitlab-org/security/omnibus-gitlab/-/issues/82 -->

Curl has been updated to version 8.0.1 in order to mitigate security issues. 

## Update redis

<!-- https://gitlab.com/gitlab-org/security/omnibus-gitlab/-/issues/83 -->

Redis has been updated to version 6.2.11 in order to mitigate security issues. 

## Update OpenSSL

<!-- https://gitlab.com/gitlab-org/security/omnibus-gitlab/-/issues/81 -->

OpenSSL has been updated to version 'OpenSSL_1_1_1t' in order to mitigate security issues. 

## Non Security Patches
This security release also includes the following non-security patches.

### Into 15.10.1

- [Cherry pick "Use the ubi packaged libedit-devel" to 15-10-stable](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1347)
- [Don't autofocus comment field with content editor](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/115465)
- [Sync security policy rule schedules that may have been deleted by bug](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/115579)
- [Fix issue dashboard returning issues from archived projects](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/115668)

### Into 15.9.4

- [Resolve "Duplicate todo is created for already mentioned user"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/114287)


## Updating

To update GitLab, see the [Update page](/update).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).


