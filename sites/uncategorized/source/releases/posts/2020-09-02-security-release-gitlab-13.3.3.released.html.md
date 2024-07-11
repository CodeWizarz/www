---
title: "GitLab Security Release: 13.3.4, 13.2.8, and 13.1.10"
description: "Learn more about GitLab Security Release: 13.3.4, 13.2.8 and 13.1.10 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2020/09/02/security-release-gitlab-13-3-3-released/"
categories: releases
author: Vitor Meireles De Sousa
author_gitlab: vdesousa
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

## Attention

Versions 13.3.3, 13.2.7, and 13.1.9 were improperly packaged and did not contain
the security fixes outlined below. We've released 13.3.4, 13.2.8, and 13.1.10 to
correct the packaging error. See [#1176](https://gitlab.com/gitlab-com/gl-infra/delivery/-/issues/1176) for
details and corrective actions on the packaging error.

---

Today we are releasing versions 13.3.4, 13.2.8 and 13.1.10 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are [two types of security releases](/security/#gitlab-security-releases): a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

## Vendor Cross-Account Assume-Role Attack
GitLab EKS integration was vulnerable to a cross-account assume role attack which could allow privileged access and possibly AWS account takeover. This issue is now mitigated in the latest release and is assigned [CVE-2020-13318](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13318).

### Versions Affected
Affects GitLab 8.9 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Stored XSS on the Vulnerability Page
GitLab was vulnerable to a stored XSS on the standalone vulnerability page. This issue is now mitigated in the latest release and is assigned [CVE-2020-13301](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13301).

Thanks [xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 13.0 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Outdated Job Token Can Be Reused to Access Unauthorized Resources
GitLab was not validating that job tokens were associated with running jobs. This issue is now mitigated in the latest release and is assigned [CVE-2020-13284](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13284).

### Versions Affected
Affects GitLab 11.3 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## File Disclosure Via Workhorse File Upload Bypass
Conan package upload functionality was not properly validating the supplied parameters, which resulted the limited files disclosure. This issue is now mitigated in the latest release and is assigned [CVE-2020-13298](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13298).

Thanks [ledz1996](https://hackerone.com/ledz1996) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 13.0 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Unauthorized Maintainer Can Edit Group Badge
An unauthorized project maintainer could edit the subgroup badges due to the lack of authorization control. This issue is now mitigated in the latest release and is assigned [CVE-2020-13313](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13313).

Thanks [ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all previous GitLab versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Denial of Service Within Wiki Functionality
An internal investigation revealed that GitLab's Wiki was vulnerable to a parser attack that prohibits anyone from accessing the Wiki functionality through the user interface. This issue is now mitigated in the latest release and is assigned [CVE-2020-13311](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13311).

### Versions Affected
Affects all GitLab versions prior 13.0.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Sign-in Vulnerable to Brute-force Attacks
GitLab was vulnerable to brute-force attacks due to an improper handling of sign-in parameters. This issue is now mitigated in the latest release and is assigned [CVE-2020-13289](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13289).

### Versions Affected
Affects GitLab 8.7 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Invalidated Session Allows Account Access With an Old Password
Under certain conditions GitLab was not properly revoking user sessions and allowed a malicious user to access a user account with an old password. This issue is now mitigated in the latest release and is assigned [CVE-2020-13302](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13302).

Thanks [rogov](https://hackerone.com/rogov) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 7.11 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## GitLab Omniauth Endpoint Renders User Controlled Messages
GitLab Omniauth endpoint allowed a malicious user to submit content to be displayed back to the user within error messages. This issue is now mitigated in the latest release and is assigned [CVE-2020-13314](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13314).

Thanks [h33t](https://hackerone.com/h33t) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 7.1 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Blind SSRF Through Repository Mirroring
GitLab was vulnerable to a blind SSRF attack through the repository mirroring feature. This issue is now mitigated in the latest release and is assigned [CVE-2020-13309](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13309).

Thanks [sky003](https://hackerone.com/sky003) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all previous GitLab versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Information Disclosure Through Incorrect Group Permission Verifications 
GitLab was vulnerable to information disclosure by not performing proper verification on permissions for confidential epics. This issue is now mitigated in the latest release and is assigned [CVE-2020-13287](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13287).

Thanks [ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 13.0 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## No Rate Limit on GitLab Webhook Feature
GitLab Webhook feature could be abused to perform denial of service attacks due to the lack of rate limitation. This issue is now mitigated in the latest release and is assigned [CVE-2020-13306](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13306).

Thanks [noddyn12](https://hackerone.com/noddyn12) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all previous GitLab versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## GitLab Session Revocation Feature Does Not Invalidate All Sessions
The revocation feature was not revoking all session tokens and one could re-use it to obtain a valid session. This issue is now mitigated in the latest release and is assigned [CVE-2020-13299](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13299).

Thanks [vaib25vicky](https://hackerone.com/vaib25vicky) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all previous GitLab versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## OAuth Authorization Scope for an External Application Can Be Changed Without User Consent
GitLab was vulnerable to an OAuth authorization scope change without user consent in the middle of the authorization flow. This issue is now mitigated in the latest release and is assigned [CVE-2020-13300](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13300).

Thanks fushbey for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 13.3 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Unauthorized Maintainer Can Delete Repository
A project Maintainer was able to delete a repository through GraphQL due to insufficient verification of permissions. This issue is now mitigated in the latest release and is assigned [CVE-2020-13317](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13317).

Thanks [ledz1996](https://hackerone.com/ledz1996) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 12.6 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Improper Verification of Deploy-Key Leads to Access Restricted Repository
Due to improper verification of permissions, an unauthorized user can access a private repository within a public project. This issue is now mitigated in the latest release and is assigned [CVE-2020-13303](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13303).

Thanks [ledz1996](https://hackerone.com/ledz1996) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all previous GitLab versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disabled Repository Still Accessible With a Deploy-Token
GitLab was not validating a Deploy-Token and allowed a disabled repository be accessible via a git command line. This issue is now mitigated in the latest release and is assigned [CVE-2020-13316](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13316).

Thanks [vaib25vicky](https://hackerone.com/vaib25vicky) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all previous GitLab versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Duplicated Secret Code Generated by 2 Factor Authentication Mechanism
Same 2 factor Authentication secret code was generated which resulted an attacker to maintain access under certain conditions. This issue is now mitigated in the latest release and is assigned [CVE-2020-13304](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13304).

Thanks [rgupt](https://hackerone.com/rgupt) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all previous GitLab versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Lack of Validation Within Project Invitation Flow
GitLab was not invalidating project invitation link upon removing a user from a project. This issue is now mitigated in the latest release and is assigned [CVE-2020-13305](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13305).

Thanks [rgupt](https://hackerone.com/rgupt) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all previous GitLab versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Current Sessions Not Invalidated Upon Enabling 2 Factor Authentication
GitLab was not revoking current user sessions when 2 factor authentication was activated allowing a malicious user to maintain their access. This issue is now mitigated in the latest release and is assigned [CVE-2020-13307](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13307).

Thanks [xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all previous GitLab versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Users Without 2 Factor Authentication Can Be Blocked Accessing GitLab
A user without 2 factor authentication enabled could be prohibited from accessing GitLab by being invited into a project that had 2 factor authentication inheritance. This issue is now mitigated in the latest release and is assigned [CVE-2020-13308](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13308).

Thanks marshall0705 for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all previous GitLab versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Lack of Upper Bound Check Leading to Possible Denial of Service
The profile activity page was not restricting the amount of results one could request, potentially resulting in a denial of service. This issue is now mitigated in the latest release and is assigned [CVE-2020-13315](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13315).

Thanks [brandonnnn](https://hackerone.com/brandonnnn) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab 11.4 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## 2 Factor Authentication for Groups Was Not Enforced Within API Endpoint
When 2 factor authentication was enabled for groups, a malicious user could bypass that restriction by sending a specific query to the API endpoint. This issue is now mitigated in the latest release and is assigned [CVE-2020-13297](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13297).

Thanks [xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects all previous GitLab versions.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## GitLab Runner Denial of Service via CI Jobs
It was possible to make the gitlab-runner process crash by sending malformed queries, resulting in a denial of service. This issue is now mitigated in the latest release and is assigned [CVE-2020-13310](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13310).

### Versions Affected
Affects all previous versions of GitLab Runner.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update websocket-extensions Gem
The websocket-extensions gem has been upgraded to 0.1.5. This upgrade includes a security fix for [CVE-2020-7663](https://nvd.nist.gov/vuln/detail/CVE-2020-7663).

## Update jQuery Dependency
The jQuery dependency has been upgraded to 3.5 . This upgrade includes a security fix for [CVE-2020-11022](https://github.com/jquery/jquery/security/advisories/GHSA-gxr4-xjj5-5px2)

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
