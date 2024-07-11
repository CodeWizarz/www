---
title: "GitLab  Security Release: 12.5.2, 12.4.5, and 12.3.8"
description: "Learn more about GitLab Security Release: 12.5.2, 12.4.5, and 12.3.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/11/27/security-release-gitlab-12-5-2-released/"
categories: releases
author: Andrew Kelly
author_gitlab: ankelly
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.5.2, 12.4.5, and 12.3.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes that were inadvertently not included in our most recent security release. We strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) in approximately 30 days.

Please read on for more information regarding this release.

## Unauthorized access to grafana metrics

Grafana metrics were unintentionally being exposed to unauthorized users. The issue is now mitigated in the latest release and is assigned [CVE-2019-19262](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19262).

Thanks to [@d0xing](https://hackerone.com/d0xing) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update Mattermost dependency

The Mattermost dependency has been upgraded to 5.14.5 in order to mitigate security concerns.

### Versions Affected

Affects GitLab Omnibus 12.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating

To update GitLab, see the [update page](/update/).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
