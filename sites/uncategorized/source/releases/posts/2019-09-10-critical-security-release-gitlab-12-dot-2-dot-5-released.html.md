---
title: "GitLab Critical Security Release: 12.2.5, 12.1.9, and 12.0.9"
description: "Learn more about GitLab Critical Security Release: 12.2.5, 12.1.9, and 12.0.9 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/09/10/critical-security-release-gitlab-12-dot-2-dot-5-released/"
categories: releases
author: Ethan Strike
author_gitlab: estrike
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.2.5, 12.1.9, and 12.0.9 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

## Project Template Functionality Could Be Used to Access Restricted Project Data

Project creation using custom group templates had a permission issue that
allowed an unauthorized user to clone a project to which they had partial
visibility, allowing them to see the restricted information. The issue is
now mitigated in the latest release and is assigned
[CVE-2019-16170](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-16170).

Thanks to [@jobert](https://hackerone.com/jobert) for responsibly reporting this
vulnerability to us.

### Versions Affected

Affects GitLab EE 11.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version
above to be upgraded to the latest version as soon as possible.

## Security Enhancements in GitLab Pages

GitLab Pages is updated in this release with several security enhancements
to GitLab Pages Access Control. Improvements include use of the `Secure`
flag on the session cookie, and shortening of the valid session time.

These improvements were identified as part of an internal security review.

### Versions Affected

Affects GitLab CE/EE 11.5 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Nginx Update

We have patched Nginx, which is included in the GitLab Omnibus package for CVE-2019-9511, CVE-2019-9513, and CVE-2019-9516.

## Mattermost Updates

We've included respective Mattermost security versions in 12.2, 12.1 and 12.0.

For more information, see [Mattermost security updates page](https://about.mattermost.com/security-updates/)

## Updating

To update, check out our [update page](/update/).
