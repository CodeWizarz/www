---
title: "GitLab Critical Security Release: 12.8.6"
description: "Learn more about GitLab Critical Security Release: 12.8.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2020/03/11/critical-security-release-gitlab-12-dot-8-dot-6-released/"
categories: releases
author: Ethan Strike
author_gitlab: estrike
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing version 12.8.6 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version contains an important security fix, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) in approximately 30 days.

Please read on for more information regarding this release.

## Email Confirmation Not Required on Sign-up

With the release of 12.8.0, a soft email confirmation sign-up flow was enabled by default. For instances with sign-up enabled, users were able to sign up and access the instance for a 2 day grace period with an unconfirmed email address, potentially bypassing domain restrictions. The change was reverted and is assigned [CVE-2020-10535](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-10535).

### Versions Affected

Affects GitLab CE/EE 12.8.0 through 12.8.5.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating

To update GitLab, see the [update page](/update/).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
