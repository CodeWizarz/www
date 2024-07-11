---
title: "GitLab  Critical Security Release: 13.0.4, 12.10.9, 12.9.9"
description: "Learn more about GitLab Critical Security Release: 13.0.4, 12.10.9, 12.9.9 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2020/06/03/critical-security-release-13-0-4-released/"
categories: releases
author: Costel Maxim
author_gitlab: cmaxim
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 13.0.4, 12.10.9, 12.9.9 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->


GitLab releases patches for vulnerabilities in dedicated security releases. There are [two types of security releases](/security/#gitlab-security-releases): a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.  

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards.  As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to  the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](https://about.gitlab.com/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.


## CI Token Access Control

An authorization issue discovered in the CI jobs token handling allowed read access to public projects with restricted repositories. This issue is now mitigated in the latest release and is waiting for a CVE ID to be assigned.

Thanks to [@u3mur4](https://hackerone.com/u3mur4) and @enumzero for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 10.6+ and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.


## Updating

To update GitLab, see the [update page](/update/).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).

