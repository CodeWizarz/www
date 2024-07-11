---
title: "GitLab Critical Security Release: 13.1.3, 13.0.9 and 12.10.14"
description: "Learn more about GitLab Critical Security Release: 13.1.3, 13.0.9 and 12.10.14 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2020/07/06/critical-security-release-gitlab-13-1-3-released/"
categories: releases
author: Andrew Kelly
author_gitlab: ankelly
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 13.1.3, 13.0.9 and 12.10.14 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

GitLab releases patches for vulnerabilities in dedicated security releases. There are [two types of security releases](/security/#gitlab-security-releases): a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), and ad-hoc security releases for critical vulnerabilities. You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.


## Workhorse bypass allows files in /tmp to be read via Maven Repository APIs
The Maven package upload endpoint could be used to override restrictions and result in the GitLab Workhorse disclosing the existence and contents of files in the `/tmp` directory. This issue is now mitigated in the latest release and is assigned [CVE-2020-15525](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-15525).

Thanks [@ledz1996](https://hackerone.com/ledz1996) for responsibly reporting this vulnerability to us.

### Versions Affected
Affects GitLab EE 11.3 and later.

### Remediation
We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

### Maven package upload broken in 12.10.14
The fix for this security issue caused a regression in the 12.10 code base. Uploading Maven packages no longer works, generating the error `400 Bad Request`.

For more information, see [the issue](https://gitlab.com/gitlab-org/gitlab/-/issues/229482).

The GitLab Maven Repository is a Premium feature in GitLab 12.10. Premium and Ultimate customers running GitLab 12.10 who use the Maven Repository feature should upgrade to 13.0.9 or higher.

Our documented upgrade path from 12.10 to 13.x specifies that the last 12.10 patch release should be one of the steps. This is to ensure that any code updates required for upgrading are installed. Customers using the Maven Repository would be advised to use 12.10.13 as the last 12.10 patch release, and upgrade to a 13.0.9 or higher as soon as possible.

## Updating
To update GitLab, see the [update page](/update/).

## Receive Security Release Notifications
To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
