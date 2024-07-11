---
title: "GitLab Security Release: 13.7.2, 13.6.4, and 13.5.6"
description: "Learn more about GitLab Security Release: 13.7.2, 13.6.4, and 13.5.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2021/01/07/security-release-gitlab-13-7-2-released/"
categories: releases
author: Dominic Couture
author_gitlab: dcouture
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 13.7.2, 13.6.4, and 13.5.6 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are [two types of security releases](/security/#gitlab-security-releases): a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

## Upgrade Note

This release applies a database migration to configure as `Confidential` all instance-wide OAuth applications that are configured as `Trusted`. This will require the applications to send the `client_secret` as part of the OAuth flow, which is a best practice. The change is required to correct one of the issues in this security release. If you have any custom instance-wide applications that are having issues following this migration, it means that you have clients that aren't sending the `client_secret` or are using the implicit flow during the OAuth authentication process. Here is how to solve the problem:

- The preferred way is to make the client send the `client_secret` using the Authorization Code flow.
- If impossible, or if there's no way to keep the `client_secret` secret, then you can switch the application back to non-confidential. However, we suggest making the application non-trusted as well so that users are required to explicitly authorize the application when it requests access tokens on their behalf without the `client_secret`.

## Ability to steal a user's API access token through GitLab Pages

Insufficient validation of authentication parameters in GitLab Page for GitLab 11.5+. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:N`, 8.1). It is now mitigated in the latest release and is assigned [CVE-2021-22171](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22171).

Thanks [@ngalog](https://hackerone.com/ngalog) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Prometheus denial of service via HTTP request with custom method

An attacker could cause a Prometheus denial of service in GitLab 13.7+ by sending an HTTP request with a malformed method. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:L`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2021-22166](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22166).
.

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Unauthorized user is able to access private repository information under specific conditions

An issue has been discovered in GitLab affecting all versions starting from 12.1. Incorrect headers within a specific project page allows attacker to have temporary read access to a public repository with project features restricted to only members. This is a medium severity issue (`CVSS:3.1/AV:N/AC:H/PR:N/UI:R/S:U/C:H/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2021-22167](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22167).

Thanks @anshraj_srivastava for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Regular expression denial of service in NuGet API

A regular expression denial of service issue has been discovered in NuGet API affecting all versions of GitLab starting from version 12.8. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2021-22168](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22168).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Regular expression denial of service in package uploads

An issue has been discovered in GitLab affecting all versions starting from 12.4. The regex used for package names is written in a way that makes execution time have quadratic growth based on the length of the malicious input string. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:L`, 4.3). It is now mitigated in the latest release and is assigned [CVE-2020-26414](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-26414).

This vulnerability has been discovered internally by the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Update curl dependency

The curl dependency has been upgraded to 7.74.0 in order to mitigate security concerns.

### Versions Affected

Affects all GitLab Omnibus versions.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## CVE-2019-3881 mitigation

A patch has been applied to mitigate CVE-2019-3881 in the bundler dependency.

### Versions Affected

Affects all GitLab Omnibus versions.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
