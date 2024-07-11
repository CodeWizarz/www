---
title: "GitLab Security Release: 13.5.2, 13.4.5, and 13.3.9"
description: "Learn more about GitLab Security Release: 13.5.2, 13.4.5, and 13.3.9 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2020/11/02/security-release-gitlab-13-5-2-released/"
categories: releases
author: Dominic Couture
author_gitlab: dcouture
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 13.5.2, 13.4.5, and 13.3.9 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are [two types of security releases](/security/#gitlab-security-releases): a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

## Path Traversal in LFS Upload

An issue has been discovered in GitLab CE/EE affecting all versions starting from 8.14. A path traversal is found in LFS Upload that allows attacker to overwrite certain specific paths on the server. This issue is now mitigated in the latest release and is assigned [CVE-2020-13355](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13355).

Thanks [saltyyolk](https://hackerone.com/saltyyolk) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Path traversal allows saving packages in arbitrary location

Path traversal vulnerability in package upload functionality in GitLab CE/EE starting from 12.8 allows an attacker to save packages in arbitrary locations. This issue is now mitigated in the latest release and is assigned [CVE-2020-26405](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-26405).

Thanks [@vakzz](https://hackerone.com/vakzz) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Kubernetes agent API leaks private repos

A vulnerability in the internal Kubernetes agent api in GitLab CE/EE version 13.3 and above allows unauthorised access to private projects. This issue is now mitigated in the latest release and is assigned [CVE-2020-13358](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13358).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Terraform state deletion API exposes object storage URL

The Terraform API in GitLab CE/EE 12.10 and above exposed the object storage signed URL on the delete operation allowing a malicious project maintainer to overwrite the Terraform state, bypassing audit and other business controls. This issue is now mitigated in the latest release and is assigned [CVE-2020-13359](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13359).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Stored-XSS in error message of build-dependencies

A stored XSS in CI Job Log has been discovered in GitLab CE/EE 12.4 and above. This issue is now mitigated in the latest release and is assigned [CVE-2020-13340](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13340).

Thanks [yvvdwf](https://hackerone.com/yvvdwf) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Git credentials persisted on disk

When importing repos via URL, one time use git credentials were persisted beyond the expected time windows in Gitaly 1.79.0 or above. This issue is now mitigated in the latest release and is assigned [CVE-2020-13353](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13353).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Potential Denial of service via container registry

A potential DOS vulnerability was discovered in GitLab CE/EE starting with version 12.6 and above. The container registry name check could cause exponential number of backtracks for certain user supplied values resulting in high CPU usage. This issue is now mitigated in the latest release and is assigned [CVE-2020-13354](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13354).

Thanks [@anyday](https://hackerone.com/anyday) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Info leak when group is transferred from private to public group.

Private group info is leaked leaked in GitLab CE/EE version 10.2 and above, when the project is moved from private to public group. This issue is now mitigated in the latest release and is assigned [CVE-2020-13352](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13352).

Thanks [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Limited File Disclosure Via Multipart Bypass

An issue has been discovered in GitLab CE/EE affecting all versions starting from 8.8.9. A specially crafted request could bypass Multipart protection and read files in certain specific paths on the server. This issue is now mitigated in the latest release and is assigned [CVE-2020-13356](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13356).

Thanks [ledz1996](https://hackerone.com/ledz1996) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Unauthorized user is able to access scheduled pipeline variables and values

Insufficient permission checks in scheduled pipeline API in GitLab CE/EE 13.0+ allows an attacker to read variable names and values for scheduled pipelines on projects visible to the attacker. This issue is now mitigated in the latest release and is assigned [CVE-2020-13351](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13351).

Thanks [@vaib25vicky](https://hackerone.com/vaib25vicky) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## CSRF in runner administration page allows an attacker to pause/resume runners

CSRF in runner administration page in all versions of GitLab CE/EE allows an attacker who's able to target GitLab instance administrators to pause/resume runners. This issue is now mitigated in the latest release and is assigned [CVE-2020-13350](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13350).

Thanks [@ngalog](https://hackerone.com/ngalog) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Regex backtracking attack in path parsing of Advanced Search result

An issue has been discovered in GitLab EE affecting all versions starting from 9.2. A regular expression related to a file path resulted in the Advanced Search feature susceptible to catastrophic backtracking. This issue is now mitigated in the latest release and is assigned [CVE-2020-13349](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13349).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Bypass of required CODEOWNERS approval

An issue has been discovered in GitLab EE affecting all versions starting from 11.9. Required CODEOWNERS approval could be bypassed by targeting a branch without the CODEOWNERS file. This issue is now mitigated in the latest release and is assigned [CVE-2020-13348](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13348).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## SAST CiConfiguration information visible without permissions

Certain SAST CiConfiguration information could be viewed by unauthorized users in GitLab EE starting with 13.3. This information was exposed through GraphQL to non-members of public projects with repository visibility restricted as well as guest members on private projects. This issue is now mitigated in the latest release and is assigned [CVE-2020-26406](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-26406).

Thanks [ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
