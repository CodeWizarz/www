---
title: "GitLab Security Release: 11.7.3, 11.6.8, 11.5.10"
description: "Learn more about GitLab Security Release: 11.7.3, 11.6.8, 11.5.10 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/01/31/security-release-gitlab-11-dot-7-dot-3-released/"
categories: releases
author: Ethan Strike
author_gitlab: estrike
tags: security, security releases
---

Today we are releasing versions 11.7.3, 11.6.8, and 11.5.10 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

These versions are the public releases following 11.7.0, 11.6.5, and 11.5.7. The intermediate versions were not made public for quality assurance reasons.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

##  Remote Command Execution via GitLab Pages

GitLab Pages contained a directory traversal vulnerability that could lead to remote command execution. The issue is now mitigated in the latest release and is assigned [CVE-2019-6783](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6783).

Thanks to [@bink](https://hackerone.com/bink) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE 8.17, and EE 8.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Covert Redirect to Steal GitHub/Bitbucket Tokens

For installations using GitHub or Bitbucket OAuth integrations, it was possible to use a [covert redirect](http://tetraph.com/covert_redirect/) to obtain the user OAuth token for those services. This release moves the OAuth callbacks to a common path to mitigate the issue.  The issue is now mitigated in the latest release and is assigned [CVE-2019-6788](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6788).

Thanks to @mishre and [@yipman](https://hackerone.com/yipman) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

*Necessary Action:* It is necessary to append `/users/auth` to the callback URL in GitHub or Bitbucket to fully protect against this issue. Please see our pages on the [GitHub](https://docs.gitlab.com/ee/integration/github.html) and [Bitbucket](https://docs.gitlab.com/ee/integration/bitbucket.html) integrations for more information.

## Remote Mirror Branches Leaked by Git Transfer Refs

A Gitv2 feature used to hide certain internal references does not function correctly, and can reveal hidden refs. This release disables Gitv2 in GitLab until the problem is resolved. No additional action is required, even if Gitv2 was manually configured.

### Versions Affected

Affects GitLab CE/EE 11.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Denial of Service with Markdown

It was found that inputting an overly long string into a Markdown field could cause a denial of service. The issue is now mitigated in the latest release and is assigned [CVE-2019-6785](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6785).

Thanks to [@8ayac](https://hackerone.com/8ayac) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 7.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Guests Can View List of Group Merge Requests

Guest users were able to view the list of a group's merge requests. The issue is now mitigated in the latest release and is assigned [CVE-2019-6790](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6790).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.14 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Guest Can View Merge Request Titles via System Notes

System notes contained an access control issue that permitted a guest user to view merge request titles. The issue is now mitigated in the latest release and is assigned [CVE-2019-6997](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6997).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.7 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

##  Persistent XSS via KaTeX

Markdown fields contained a lack of input validation and output encoding when processing KaTeX that resulted in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2019-6784](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6784).

Thanks to [@jouko](https://hackerone.com/jouko) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all versions of GitLab CE/EE.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Emails Sent to Unauthorized Users

In some cases, users without project permissions received emails after a project move. For private projects, this would disclose the new project namespace to an unauthorized user. The issue is now mitigated in the latest release and is assigned [CVE-2019-6789](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6789).

### Versions Affected

Affects GitLab CE/EE 6.5 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Hyperlink Injection in Notification Emails

It was possible to use the profile name to inject a potentially malicious link into notification emails. The issue is now mitigated in the latest release and is assigned [CVE-2019-6781](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6781).

Thanks to [@corb3nik](https://hackerone.com/corb3nik) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all versions of GitLab CE/EE.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Unauthorized Access to LFS Objects

The contents of an LFS object could be accessed by an unauthorized user, if the file size and OID were known. The issue is now mitigated in the latest release and is assigned [CVE-2019-6786](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6786).

Thanks to Maxim Ivanov for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.16 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Trigger Token Exposure

The GitLab API contained an authorization issue that permitted project Maintainers and Owners to view the trigger tokens of other project users. The issue is now mitigated in the latest release and is assigned [CVE-2019-6787](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6787).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.12 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Upgrade Rails to 5.0.7.1 and 4.2.11

This release upgrades the version of Ruby on Rails included in GitLab to address [CVE-2018-16476](https://groups.google.com/forum/#!topic/rubyonrails-security/FL4dSdzr2zw). GitLab versions 11.7 and 11.6 will now use Rails 5.0.7.1, and GitLab 11.5 will now use 4.2.11

### Versions Affected

Affects GitLab CE/EE 8.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Contributed Project Information Visible in Private Profile

Due to an authorization issue the contributed project information of a private profile could be viewed. The issue is now mitigated in the latest release and is assigned [CVE-2019-6782](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6782).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Imported Project Retains Prior Visibility Setting

When a project with visibility more permissive than the target group was imported, it would retain its prior visibility. This release will now change the visibility of the project to the visibility of the group. The issue is now mitigated in the latest release and is assigned [CVE-2019-6791](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6791).

### Versions Affected

Affects GitLab CE/EE 8.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Error disclosure on Project Import

When an error was encountered on project import, the error message would display instance internal information. The issue is now mitigated in the latest release and is assigned [CVE-2019-6792](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6792).

Thanks to @nyangawa for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Persistent XSS in User Status

The user status field contained a lack of input validation and output encoding that resulted in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2019-6796](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6796).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Last Commit Status Leaked to Guest Users

A project guest user could view the last commit status of the default branch. The issue is now mitigated in the latest release and is assigned [CVE-2019-6794](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6794).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all versions of GitLab CE/EE.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Mitigations for IDN Homograph and RTLO Attacks

IDN homographs and RTLO characters were rendered to unicode, which could be used for social engineering. The issue is now mitigated in the latest release and is assigned [CVE-2019-6795](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6795).

Thanks to [@edoverflow](https://hackerone.com/edoverflow) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all versions of GitLab CE/EE.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Access to Internal Wiki When External Wiki Enabled

Access to the internal wiki was permitted when an external wiki service was enabled. With this release, each type of wiki will be managed and displayed separately in the UI. The issue is now mitigated in the latest release and is assigned [CVE-2019-6960](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6960).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## User Can Comment on Locked Project Issues

Users were able to comment on locked project issues. The issue is now mitigated in the latest release and is assigned [CVE-2019-6995](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6995).

Thanks to [@flashdisk](https://hackerone.com/flashdisk) and [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Unauthorized Reaction Emojis by Guest Users

Guest users were able to add reaction emojis on comments to which they had no visibility. The issue is now mitigated in the latest release and is assigned [CVE-2019-7176](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-7176).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## User Retains Project Role After Removal from Private Group

A user would retain their role within a project in a private group after being removed from the group, if their privileges within the project were different from the group. The issue is now mitigated in the latest release and is assigned [CVE-2019-7155](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-7155).

Thanks to [@rpadovani](https://hackerone.com/rpadovani) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## GitHub Token Leaked to Maintainers

The GitHub token used in **CI/CD for External Repos** was being leaked to project maintainers in the UI. The issue is now mitigated in the latest release and is assigned [CVE-2019-6797](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6797).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 10.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Unauthenticated Blind SSRF in Jira Integration

The Jira integration feature was vulnerable to an unauthenticated blind SSRF issue. The issue is now mitigated in the latest release and is assigned [CVE-2019-6793](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6793).

Thanks to [@jobert](https://hackerone.com/jobert) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 10.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Unauthorized Access to Group Membership

The merge request approvers section had an access control issue that permitted project maintainers to view membership of private groups. The issue is now mitigated in the latest release and is assigned [CVE-2019-6996](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6996).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 10.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Validate SAML Response in Group SAML SSO

In preparation for enhanced group SAML SSO support in GitLab.com, additional validations were added to the group SAML implementation to validate that an SSO request was initiated from GitLab.com. This will ensure that a malicious user is unable to trick users into linking their account to a malicious IdP.

### Versions Affected

Affects GitLab EE 10.8 and later.

### Remediation

This enhancement currently applies only to GitLab.com

*Updated: 2019-02-07*
## Pipelines section is available to unauthorized users

The GitLab pipelines feature was vulnerable to authorization issues that allowed unauthorized users to view job information. The issue is now mitigated in the latest release and is assigned [CVE-2019-7549](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-7549).

Thanks to [Sullivan Senechal](https://gitlab.com/Soullivaneuh), [@xanbanx](https://hackerone.com/xanbanx), and [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 10.1 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).
