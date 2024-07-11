---
title: "GitLab Critical Security Release: 13.7.4, 13.6.5 and 13.5.7"
description: "Learn more about GitLab Critical Security Release: 13.7.4, 13.6.5 and 13.5.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2021/01/14/critical-security-release-gitlab-13-7-4-released/"
categories: releases
author: Dominic Couture
author_gitlab: dcouture
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 13.7.4, 13.6.5 and 13.5.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

## Ability to steal a user's API access token through GitLab Pages

A way to bypass the fix released in the [previous security release](https://about.gitlab.com/releases/2021/01/07/security-release-gitlab-13-7-2-released/#ability-to-steal-a-users-api-access-token-through-gitlab-pages) was discovered internally by the GitLab team. This is a high severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:H/I:H/A:N`, 7.3). We have requested a CVE ID and will update this blog post when it is assigned.

### Remediation

We **strongly recommend** that all installations running an affected version above are **upgraded to the latest version as soon as possible**.

## Updating

To update GitLab, see the [Update page](/update/).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
