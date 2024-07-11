---
title: "GitLab Critical Security Release: 14.8.2, 14.7.4, and 14.6.5"
description: "Learn more about GitLab Critical Security Release: 14.8.2, 14.7.4, and 14.6.5 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2022/02/25/critical-security-release-gitlab-14-8-2-released/"
categories: releases
author: Costel Maxim
author_gitlab: cmaxim
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

**Updated 00:00 UTC 2022-04-11**
We have clarified the [hotpatch instructions for self-managed instances running select versions older than 14.6](#hotpatch-for-runner-registration-token-disclosure-through-quick-actions) related to the use of `token-prefix-patch`

**Updated 16:40 UTC 2022-03-04**
If you are using Kubernetes runners, you will be required to manually update the Helm chart values with the new registration token. More information about updating the values can be found here: [https://docs.gitlab.com/runner/install/kubernetes.html#store-registration-tokens-or-runner-tokens-in-secrets](https://docs.gitlab.com/runner/install/kubernetes.html#store-registration-tokens-or-runner-tokens-in-secrets)

**Updated 00:00 UTC 2022-02-26**
We have updated this blog post with [hotpatch instructions for self-managed instances running select versions older than 14.6](#hotpatch-for-runner-registration-token-disclosure-through-quick-actions)

### We strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

**Note regarding Runner registration token disclosure:** This update will reset runner registration tokens for your group and projects. If you use an automated process (scripts that encode the value of the registration token) to register runners, this update will break that process. However, it should have no affect on previously registered runners. If applicable to your processes, your administrator may choose to save a backup of your existing tokens which can later help identify potentially malicious registration tokens, or rogue runners. For example, if an unauthorized actor tries to register a runner using one of the revoked tokens, knowing that value will help admins monitor that type of activity.

Today we are releasing versions 14.8.2, 14.7.4, and 14.6.5 for GitLab Community Edition (CE) and Enterprise Edition (EE). _Please note, this critical release will also serve as our monthly security release for February._

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

## Table of Fixes

|Title|Severity|
|---|---|
|[Runner registration token disclosure through Quick Actions](#runner-registration-token-disclosure-through-quick-actions)|critical|
|[Unprivileged users can add other users to groups through an API endpoint](#unprivileged-users-can-add-other-users-to-groups-through-an-api-endpoint)|medium|
|[Inaccurate display of Snippet contents can be potentially misleading to users](#inaccurate-display-of-snippet-contents-can-be-potentially-misleading-to-users)|medium|
|[Environment variables can be leaked via the sendmail delivery method](#environment-variables-can-be-leaked-via-the-sendmail-delivery-method)|medium|
|[Unauthenticated user enumeration on GraphQL API](#unauthenticated-user-enumeration-on-graphql-api)|medium|
|[Adding a mirror with SSH credentials can leak password](#adding-a-mirror-with-ssh-credentials-can-leak-password)|medium|
|[Denial of Service via user comments](#denial-of-service-via-user-comments)|low|

## Runner registration token disclosure through Quick Actions

An issue has been discovered in GitLab CE/EE affecting all versions starting from 12.10 before 14.6.5, all versions starting from 14.7 before 14.7.4, all versions starting from 14.8 before 14.8.2. An unauthorized user was able to steal runner registration tokens through an information disclosure vulnerability using quick actions commands. This is a critical severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:C/C:H/I:H/A:N`, 9.6). It is now mitigated in the latest release and is assigned [CVE-2022-0735](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0735).

Thanks [0xn3va](https://hackerone.com/0xn3va) for the report on our HackerOne bug bounty program which sparked the internal investigation that uncovered this vulnerability.

## Unprivileged users can add other users to groups through an API endpoint

An issue has been discovered in GitLab CE/EE affecting all versions before 14.3.6, all versions starting from 14.4 before 14.4.4, all versions starting from 14.5 before 14.5.2. Under certain conditions, GitLab REST API may allow unprivileged users to add other users to groups even if that is not possible to do through the Web UI. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:H/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-0549](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0549).

This vulnerability was reported to us by a customer.

## Inaccurate display of Snippet contents can be potentially misleading to users

Inaccurate display of Snippet files containing special characters in all versions of GitLab CE/EE allows an unauthorized actor to create Snippets with misleading content, which could trick unsuspecting users into executing arbitrary commands. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:H/A:N`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-0751](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0751).

Thanks [st4nly0n](https://hackerone.com/st4nly0n) for reporting this vulnerability through our HackerOne bug bounty program.

### Note

This fix modifies our GraphQL API by adding the `hasUnretrievableBlobs` field to the `SnippetBlobConnection` type. It indicates if the snippet has unretrievable blobs. Please be aware of deploying this change if you use multi-version deployments. We encourage users to include this patch in all deployed server instances.

## Environment variables can be leaked via the sendmail delivery method

Improper input validation in all versions of GitLab CE/EE using sendmail to send emails allowed an unauthorized actor to steal environment variables via specially crafted email addresses. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:H/UI:N/S:C/C:H/I:N/A:N`, 5.8). It is now mitigated in the latest release and is assigned [CVE-2022-0741](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0741).

Thanks [vakzz](https://hackerone.com/vakzz) for reporting this vulnerability through our HackerOne bug bounty program.

## Unauthenticated user enumeration on GraphQL API

An issue has been discovered in GitLab CE/EE affecting versions 13.0 to 14.6.5, 14.7 to 14.7.4, and 14.8 to 14.8.2. Private GitLab instances with restricted sign-ups may be vulnerable to user enumeration by unauthenticated users through the GraphQL API. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2021-4191](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-4191).

Thanks [mungsul](https://hackerone.com/mungsul) and [todb-r7](https://hackerone.com/todb-r7) for reporting this vulnerability through our HackerOne bug bounty program.

## Adding a mirror with SSH credentials can leak password

An issue has been discovered in GitLab affecting all versions starting from 14.6 before 14.6.5, all versions starting from 14.7 before 14.7.4, and all versions starting from 14.8 before 14.8.2. GitLab was leaking user passwords when adding mirrors with SSH credentials under specific conditions. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:H/UI:R/S:U/C:H/I:N/A:N`, 4.2). It is now mitigated in the latest release and is assigned [CVE-2022-0738](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0738).

This vulnerability has been discovered internally by the GitLab team.

## Denial of Service via user comments

An issue has been discovered in GitLab CE/EE affecting all versions starting with 8.15. It was possible to trigger a DOS by using the math feature with a specific formula in issue comments. This is a low severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:U/C:N/I:N/A:L`, 3.5). It is now mitigated in the latest release and is assigned [CVE-2022-0489](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0489).

Thanks [cancerz](https://hackerone.com/cancerz) for reporting this vulnerability through our HackerOne bug bounty program.

## Update Grafana

The version of Grafana has been updated to 7.5.12 in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab CE/EE.


## Update Mattermost

The version of Mattermost has been updated to 6.3.3 in order to mitigate security concerns.

### Versions affected

Affects GitLab Omnibus prior to 14.8.


## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Hotpatch for Runner registration token disclosure through Quick Actions

For self-managed instances not on versions 14.6 or greater, GitLab has [published patches](https://gitlab.com/gitlab-org/omnibus-gitlab/-/tree/14.8.2-Security-Hotpatches/config/patches/gitlab-rails) which can be applied to
mitigate the [Runner registration token disclosure through Quick Actions](#runner-registration-token-disclosure-through-quick-actions) vulnerability. These patches should be considered temporary. Any instances of GitLab should be upgraded to a patched version of 14.8.2, 14.7.4, or 14.6.5 as soon as possible.

Patches named `security-patch-$VERSION.patch` close the vulnerability which exposed runner registration tokens via quick action commands, and
patches named `token-prefix-patch-$VERSION.patch` can be applied to automate a one-time rotation of all project & group registration tokens.

Version-specific patches are available for GitLab releases 14.5.4, 14.4.5, 14.3.6, 14.2.7, 14.1.8, 14.0.12 and 13.12.15.

To apply the desired patch(es) on a GitLab omnibus instance, first retrieve the appropriate patchfile(s) based on the version of your instance,
and then follow the below commands (example here uses patches for 14.0.12):

```bash
sudo su
cd ~
curl -JLO https://gitlab.com/gitlab-org/omnibus-gitlab/-/raw/14.8.2-Security-Hotpatches/config/patches/gitlab-rails/security-patch-14.0.patch
curl -JLO https://gitlab.com/gitlab-org/omnibus-gitlab/-/raw/14.8.2-Security-Hotpatches/config/patches/gitlab-rails/token-prefix-patch-14.0.patch
cd /opt/gitlab/embedded/service/gitlab-rails/
patch -p1 <  ~/security-patch-14.0.patch
patch -p1 < ~/token-prefix-patch-14.0.patch
gitlab-ctl restart
```

After applying the `token-prefix-patch`, instances with a small number of groups and projects (under 10,000) can optionally use the following rails console commands to immediately reset all project & group runner registration tokens:

```ruby
Project.in_batches(of: 100).update_all(runners_token_encrypted: nil)
Group.in_batches(of: 100).update_all(runners_token_encrypted: nil)
```

GitLab has conducted limited testing to validate these patches. As such these patches are provided AS-IS and GitLab makes no warranties of any kind. GITLAB HEREBY DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, WITHOUT LIMITATION, ALL IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE, AND NON-INFRINGEMENT.

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
