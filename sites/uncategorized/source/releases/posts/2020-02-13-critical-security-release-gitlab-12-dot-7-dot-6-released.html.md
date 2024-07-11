---
title: "GitLab  Critical Security Release: 12.7.6, 12.6.7, and 12.5.10"
description: "Learn more about GitLab Critical Security Release: 12.7.6, 12.6.7, and 12.5.10 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2020/02/13/critical-security-release-gitlab-12-dot-7-dot-6-released/"
categories: releases
author: Jeremy Matos
author_gitlab: jeremymatos
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.7.6, 12.6.7, and 12.5.10 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain an important security fix, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) in approximately 30 days.

Please read on for more information regarding this release.

## Incorrect membership handling of group sharing feature

Sharing a group with another group could grant project access to unauthorized users. The issue is now mitigated in the latest release and is assigned [CVE-2020-8795](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-8795).

### Versions Affected

Affects GitLab CE/EE 12.5.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating

To update GitLab, see the [Update page](/update/).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
