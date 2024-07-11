---
title: "GitLab Security Release: 13.9.2, 13.8.5 and 13.7.8"
description: "Learn more about GitLab Security Release: 13.9.2, 13.8.5 and 13.7.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2021/03/04/security-release-gitlab-13-9-2-released/"
categories: releases
author: Andrew Kelly
author_gitlab: ankelly
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 13.9.2, 13.8.5 and 13.7.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

## JWT token leak via Workhorse

A path traversal vulnerability via the GitLab Workhorse in all versions of GitLab could result in the leakage of a JWT token. This issue is now mitigated in the latest release and is assigned [CVE-2021-22190](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22190).

Thanks [@ledz1996](https://hackerone.com/ledz1996?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Stored XSS in wiki pages

Insufficient input sanitization in wikis in GitLab version 13.8 and up allows an attacker to exploit a stored cross-site scripting vulnerability via a specially-crafted commit to a wiki. It is now mitigated in the latest release and is assigned [CVE-2021-22185](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22185).

Thanks [@yvvdwf](https://hackerone.com/yvvdwf?type=user) for reporting this vulnerability through our HackerOne bug bounty program.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Group Maintainers are able to use the Group CI/CD Variables API

An authorization issue in GitLab CE/EE version 9.4 and up allowed a group maintainer to modify group CI/CD variables which should be restricted to group owners. It is now mitigated in the latest release and is assigned [CVE-2021-22186](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22186).

Thanks to a customer for reporting this vulnerability to the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Insecure storage of GitLab session keys

In all versions of GitLab, marshalled session keys were being stored in Redis. This issue is now mitigated in the latest release and is assigned [CVE-2021-22194](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-22194).

Thanks to a customer for reporting this vulnerability to the GitLab team.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Update thrift gem

The thrift gem has been upgraded to 0.14.0 in order to mitigate security concerns.

### Versions Affected

Affects versions 11.8 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Update swagger-ui-dist dependency

The dependency on swagger-ui-dist has been upgraded to 3.43.0 in order to mitigate security concerns.

Thanks [@kannthu](https://hackerone.com/kannthu?type=user) for reporting this through our HackerOne bug bounty program.

### Versions Affected

Affects versions 13.7 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
