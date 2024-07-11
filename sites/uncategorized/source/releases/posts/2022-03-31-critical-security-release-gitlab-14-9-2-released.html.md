---
title: "GitLab Critical Security Release: 14.9.2, 14.8.5, and 14.7.7"
description: "Learn more about GitLab Critical Security Release: 14.9.2, 14.8.5, and 14.7.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2022/03/31/critical-security-release-gitlab-14-9-2-released/"
categories: releases
author: Dominic Couture
author_gitlab: dcouture
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

**Updated 14:50 UTC 2022-04-01** We have updated this blog post with [a script to be used by self-managed instance admins to identify user accounts potentially impacted by CVE-2022-1162](#script-to-identify-users-potentially-impacted-by-cve-2022-1162).

Today we are releasing versions 14.9.2, 14.8.5, and 14.7.7 for GitLab Community Edition (CE) and Enterprise Edition (EE). _Please note, this critical release will also serve as our monthly security release for March._

### We strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

These versions contain important security fixes. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Static passwords inadvertently set during OmniAuth-based registration](#static-passwords-inadvertently-set-during-omniauth-based-registration)|critical|
|[Stored XSS in notes](#stored-xss-in-notes)|high|
|[Stored XSS on Multi-word milestone reference](#stored-xss-on-multi-word-milestone-reference)|high|
|[Denial of service caused by a specially crafted RDoc file](#denial-of-service-caused-by-a-specially-crafted-rdoc-file)|medium|
|[GitLab Pages access tokens can be reused on multiple domains](#gitlab-pages-access-tokens-can-be-reused-on-multiple-domains)|medium|
|[GitLab Pages uses default (disabled) server Timeouts and a weak TCP Keep-Alive timeout](#gitlab-pages-uses-default-disabled-server-timeouts-and-a-weak-tcp-keep-alive-timeout)|medium|
|[Incorrect include in pipeline definition exposes masked CI variables in UI](#incorrect-include-in-pipeline-definition-exposes-masked-ci-variables-in-ui)|medium|
|[Regular expression denial of service in release asset link](#regular-expression-denial-of-service-in-release-asset-link)|medium|
|[Latest Commit details from private projects leaked to guest users via Merge Requests](#latest-commit-details-from-private-projects-leaked-to-guest-users-via-merge-requests)|medium|
|[CI/CD analytics are available even when public pipelines are disabled](#cicd-analytics-are-available-even-when-public-pipelines-are-disabled)|medium|
|[Absence of limit for the number of tags that can be added to a runner can cause performance issues](#absence-of-limit-for-the-number-of-tags-that-can-be-added-to-a-runner-can-cause-performance-issues)|medium|
|[Client DoS through rendering crafted comments](#client-dos-through-rendering-crafted-comments)|medium|
|[Blind SSRF Through Repository Mirroring](#blind-ssrf-through-repository-mirroring)|low|
|[Bypass of branch restriction in Asana integration](#bypass-of-branch-restriction-in-asana-integration)|low|
|[Readable approval rules by Guest user](#readable-approval-rules-by-guest-user)|low|
|[Redact InvalidURIError error messages](#redact-invalidurierror-error-messages)|low|
|[Project import maps members' created_by_id users based on source user ID](#project-import-maps-members-created_by_id-users-based-on-source-user-id)|low|

## Static passwords inadvertently set during OmniAuth-based registration


A hardcoded password was set for accounts registered using an OmniAuth provider (e.g. OAuth, LDAP, SAML) in GitLab CE/EE versions 14.7 prior to 14.7.7, 14.8 prior to 14.8.5, and 14.9 prior to 14.9.2 allowing attackers to potentially take over accounts. This is a critical severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:N`, 9.1). It is now mitigated in the latest release and is assigned [CVE-2022-1162](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1162).

This vulnerability has been discovered internally by the GitLab team.

**_Note:_** We executed a reset of GitLab.com passwords for a selected set of users as of 15:38 UTC. Our investigation shows no indication that users or accounts have been compromised but we’re taking precautionary measures for our users’ security.

## Stored XSS in notes

Improper neutralization of user input in GitLab CE/EE versions 14.4 before 14.7.7, all versions starting from 14.8 before 14.8.5, all versions starting from 14.9 before 14.9.2 allowed an attacker to exploit XSS by injecting HTML in notes. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:C/C:H/I:H/A:N`, 8.7). It is now mitigated in the latest release and is assigned [CVE-2022-1175](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1175).

Thanks [joaxcar](https://hackerone.com/joaxcar) for reporting this vulnerability through our HackerOne bug bounty program.


## Stored XSS on Multi-word milestone reference

Improper handling of user input in GitLab CE/EE versions 8.3 prior to 14.7.7, 14.8 prior to 14.8.5, and 14.9 prior to 14.9.2 allowed an attacker to exploit a stored XSS by abusing multi-word milestone references in issue descriptions, comments, etc. This is a high severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:C/C:H/I:H/A:N`, 8.7). It is now mitigated in the latest release and is assigned [CVE-2022-1190](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1190).

Thanks [ryhmnlfj](https://hackerone.com/ryhmnlfj) for reporting this vulnerability through our HackerOne bug bounty program


## Denial of service caused by a specially crafted RDoc file



A denial of service vulnerability when rendering RDoc files in GitLab CE/EE versions 10 to 14.7.7, 14.8.0 to 14.8.5, and 14.9.0 to 14.9.2 allows an attacker to crash the GitLab web application with a maliciously crafted RDoc file. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2022-1185](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1185).

Thanks [vakzz](https://hackerone.com/vakzz) for reporting this vulnerability through our HackerOne bug bounty program.


## GitLab Pages access tokens can be reused on multiple domains

Improper authorization in GitLab Pages included with GitLab CE/EE affecting all versions from 11.5 prior to 14.7.7, 14.8 prior to 14.8.5, and 14.9 prior to 14.9.2 allowed an attacker to steal a user's access token on an attacker-controlled private GitLab Pages website and reuse that token on the victim's other private websites. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:N/UI:R/S:U/C:H/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2022-1148](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1148).

Thanks [ehhthing](https://hackerone.com/ehhthing) for reporting this vulnerability through our HackerOne bug bounty program.

## GitLab Pages uses default (disabled) server Timeouts and a weak TCP Keep-Alive timeout

A lack of appropriate timeouts in GitLab Pages included in GitLab CE/EE all versions prior to 14.7.7, 14.8 prior to 14.8.5, and 14.9 prior to 14.9.2 allows an attacker to cause unlimited resource consumption. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:L`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2022-1121](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1121).

Thanks [feistel](https://gitlab.com/feistel) for reporting this vulnerability.


## Incorrect include in pipeline definition exposes masked CI variables in UI



Missing filtering in an error message in GitLab CE/EE affecting all versions prior to 14.7.7, 14.8 prior to 14.8.5, and 14.9 prior to 14.9.2 exposed sensitive information when an include directive fails in the CI/CD configuration. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:R/S:U/C:H/I:N/A:N`, 4.8). It is now mitigated in the latest release and is assigned [CVE-2022-1120](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1120).

Thanks [bdrich](https://hackerone.com/bdrich) for reporting this vulnerability through our HackerOne bug bounty program.

## Regular expression denial of service in release asset link



A potential DOS vulnerability was discovered in GitLab CE/EE affecting all versions from 13.1 prior to 14.7.7, 14.8.0 prior to 14.8.5, and 14.9.0 prior to 14.9.2. The api to update an asset as a link from a release had a regex check which caused exponential number of backtracks for certain user supplied values resulting in high CPU usage. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-1100](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1100).

This vulnerability has been discovered internally by the GitLab team.

## Latest Commit details from private projects leaked to guest users via Merge Requests



Improper access control in GitLab CE/EE since version 10.7 allows a malicious actor to obtain details of the latest commit in a private project via Merge Requests under certain circumstances. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-1193](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1193).

Thanks [albatraoz](https://hackerone.com/albatraoz) for reporting this vulnerability through our HackerOne bug bounty program.

## CI/CD analytics are available even when public pipelines are disabled



An improper access control vulnerability in GitLab CE/EE affecting all versions from 13.11 prior to 14.7.7, 14.8 prior to 14.8.5, and 14.9 prior to 14.9.2 allows an unauthorized user to access pipeline analytics even when public pipelines are disabled. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-1105](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1105).

This vulnerability has been discovered internally by the GitLab team.

## Absence of limit for the number of tags that can be added to a runner can cause performance issues



Adding a very large number of tags to a runner in GitLab CE/EE affecting all versions prior to 14.7.7, 14.8 prior to 14.8.5, and 14.9 prior to 14.9.2 allows an attacker to impact the performance of GitLab. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-1099](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1099).

This vulnerability has been discovered internally by the GitLab team.

## Client DoS through rendering crafted comments



A potential DoS vulnerability was discovered in Gitlab CE/EE versions 13.7 before 14.7.7, all versions starting from 14.8 before 14.8.5, all versions starting from 14.9 before 14.9.2  allowed an attacker to trigger high CPU usage via a special crafted input added in Issues, Merge requests, Milestones, Snippets, Wiki pages, etc. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2022-1174](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1174).

Thanks [scaramouche31](https://hackerone.com/scaramouche31) for reporting this vulnerability through our HackerOne bug bounty program.

## Blind SSRF Through Repository Mirroring



An issue has been discovered in GitLab CE/EE affecting all versions starting from 12.1 before 14.7.7, all versions starting from 14.8 before 14.8.5, all versions starting from 14.9 before 14.9.2 where a blind SSRF attack through the repository mirroring feature was possible. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:N/A:N`, 3.7). It is now mitigated in the latest release and is assigned [CVE-2022-1188](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1188).

Thanks [jimeno](https://hackerone.com/jimeno) for reporting this vulnerability through our HackerOne bug bounty program.

## Bypass of branch restriction in Asana integration



Incorrect authorization in the Asana integration's branch restriction feature in all versions of GitLab CE/EE starting from version 7.8.0 before 14.7.7, all versions starting from 14.8 before 14.8.5, all versions starting from 14.9 before 14.9.2 makes it possible to close Asana tasks from unrestricted branches. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:N/I:L/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2022-0740](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0740).

Thanks [ooooooo_q](https://hackerone.com/ooooooo_q) for reporting this vulnerability through our HackerOne bug bounty program.

## Readable approval rules by Guest user



An issue has been discovered in GitLab CE/EE affecting all versions starting from 12.2 before 14.7.7, all versions starting from 14.8 before 14.8.5, all versions starting from 14.9 before 14.9.2 that allowed for an unauthorised user to read the the approval rules of a private project. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:L/I:N/A:N`, 3.1). It is now mitigated in the latest release and is assigned [CVE-2022-1189](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1189).

This vulnerability has been discovered internally by the GitLab team.

## Redact InvalidURIError error messages


Missing sanitization of logged exception messages in all versions prior to 14.7.7, 14.8 prior to 14.8.5, and 14.9 prior to 14.9.2 of GitLab CE/EE causes potential sensitive values in invalid URLs to be logged. This is a low severity issue (`CVSS:3.0/AV:N/AC:H/PR:H/UI:R/S:C/C:L/I:N/A:N`, 2.6). It is now mitigated in the latest release and is assigned [CVE-2022-1157](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1157).

This vulnerability has been discovered internally by the GitLab team.

## Project import maps members' created_by_id users based on source user ID

A business logic error in Project Import in GitLab CE/EE versions 14.9 prior to 14.9.2, 14.8 prior to 14.8.5, and 14.0 prior to 14.7.7 under certain conditions caused imported projects to show an incorrect user in the 'Access Granted' column in the project membership pages. This is a low severity issue (`CVSS:3.0/AV:N/AC:L/PR:H/UI:R/S:U/C:N/I:L/A:N`, 2.4). It is now mitigated in the latest release and is assigned [CVE-2022-1111](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-1111).

This vulnerability has been discovered internally by the GitLab team.

## Update commonmarker

<!-- https://gitlab.com/gitlab-org/gitlab/-/issues/355752 //-->

The version of commonmarker has been updated to `0.23.4` in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab CE/EE

## Update Grafana

<!-- https://gitlab.com/gitlab-org/omnibus-gitlab/-/issues/6729 //-->

The version of Grafana has been updated to `7.5.15` in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab Omnibus

## Update Mattermost

<!-- https://gitlab.com/gitlab-org/omnibus-gitlab/-/issues/6714 //-->

The version of Mattermost has been updated to `6.4.2`, `6.3.5`, and `6.2.5` in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab CE/EE.

## Update Swagger

<!-- https://gitlab.com/gitlab-org/gitlab/-/issues/339696 //-->

The version of Swagger has been updated to `4.0.0` in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab CE/EE

## Update Python

<!-- https://gitlab.com/gitlab-org/charts/gitlab/-/issues/3111 //-->

The version of Python has been updated to `3.8.12` in order to mitigate security concerns.

### Versions affected

Affects all versions of [GitLab Charts](https://gitlab.com/gitlab-org/charts/gitlab).

## Update go-proxyproto

<!-- https://gitlab.com/gitlab-org/gitlab-pages/-/issues/699 //-->

The version of go-proxyproto has been updated to `0.6.2` in order to mitigate security concerns.

### Versions affected

Affects all versions of GitLab Pages

## Update Devise

<!-- https://gitlab.com/gitlab-org/gitlab/-/issues/357102 //-->

The version of devise-two-factor has been updated to `4.0.2` in order to mitigate security concerns.

### Versions affected

Affects all versions of Gitlab CE/EE


## Non-security updates

14.7.7 and 14.8.5 include a non-security bug fix addressing Merge Request Approval Rules. The bug is not present in 14.9 releases.

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Script to identify users potentially impacted by CVE-2022-1162

<!-- Source: https://gitlab.com/gitlab-com/gl-infra/production/-/snippets/2282996 //-->

GitLab has prepared a script which can be used by self-managed instance admins to identify user accounts potentially impacted by CVE-2022-1162.

```ruby
# This script identifies users who may have been impacted by 
# CVE-2022-1162.
# The list is not exhaustive and may not include attackers who have 
# gained access and modified an account.
#
# The START_DATE can be changed to the date a vulnerable version was
# installed.
#
# The result is a CSV printed to STDOUT containing potentially affected
# users. The columns are:
#   - User ID (integer)
#   - Username (string)
#   - User's email (string)
#   - Whether the user still has an automatically set password (boolean)
#
# We strongly recommend that all GitLab installations be upgraded to
# 14.9.2, 14.8.5, or 14.7.7 immediately.
# See: https://about.gitlab.com/releases/2022/03/31/critical-security-release-gitlab-14-9-2-released/
#
# To run the script, place this script into a file ie. /tmp/find-impacted-users.rb 
# on your GitLab instance and then run the following command to execute the script:
#
#     gitlab-rails runner /tmp/find-impacted-users.rb
#
ActiveRecord::Base.connection.execute('set statement_timeout to 600000')

START_DATE = Time.utc(2022, 1, 20)

user_id = 0

csv = CSV.new(STDOUT)
begin
    users = User.
        joins(:identities).
        where('users.created_at >= ?', START_DATE).
        where('identities.created_at >= ?', START_DATE).
        where('users.id > ?', user_id)
          
    users.in_batches(of: 250).each_record do |user|
      csv << [user.id, user.username, user.email, user.password_automatically_set?]
      user_id = user.id
    end
rescue
    retry  
end

```

A `false` value in the `user.password_automatically_set?` column means that the user had overwritten the random password that was originally set when creating the user via an Omniauth method (e.g. OAuth, LDAP, or SAML). Double-check these accounts to ensure that this change was intentional and not the result of exploitation. 

Out of an abundance of caution it is recommended to reset the passwords for all users returned by the script. Users where `password_automatically_set?` is `true` will not notice that the password reset happened and can continue logging in using OAuth, LDAP, or SAML. Those where the value is `false` can also keep logging in using those authentication methods, however the password they had set themselves will not work anymore.

Users created before the installation of GitLab 14.7.0 or after the update to GitLab 14.9.2, 14.8.5, or 14.7.7 are not affected and no actions are required.

GitLab has conducted limited testing to validate this script. As such 
this script is provided AS-IS and GitLab makes no warranties of any
kind. GITLAB HEREBY DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED,
INCLUDING, WITHOUT LIMITATION, ALL IMPLIED WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE, AND 
NON-INFRINGEMENT.

After identifying potentially affected user accounts, it is recommended to [reset a user's password](https://docs.gitlab.com/ee/security/reset_user_password.html#reset-a-users-password).
## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
