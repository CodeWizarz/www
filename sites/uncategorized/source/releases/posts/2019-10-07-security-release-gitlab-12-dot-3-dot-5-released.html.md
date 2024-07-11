---
title: "GitLab Critical Security Release: 12.3.5, 12.2.8, and 12.1.14"
description: "Learn more about GitLab Critical Security Release: 12.3.5, 12.2.8, and 12.1.14 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/10/07/security-release-gitlab-12-dot-3-dot-5-released/"
categories: releases
author: Jeremy Matos
author_gitlab: jeremymatos
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.3.5, 12.2.8, and 12.1.14 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain an important security fix, and we strongly recommend that all **GitLab EE** installations **with enabled** Elasticsearch integration be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) in approximately 30 days.

Please read on for more information regarding this release.

## Disclosure of Private Merge Requests and Issues via Elasticsearch integration

Private merge requests and issues would be disclosed with the Group Search feature provided by Elasticsearch integration. The issue is now mitigated in the latest release and is assigned [CVE-2019-15590](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15590).

Thanks to [@rpadovani](https://hackerone.com/rpadovani) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.5 and later.
GitLab CE versions are unaffected.

### Remediation

We **strongly recommend** that all installations running an affected version above **with enabled** Elasticsearch integration are upgraded to the latest version as soon as possible.
## Fixed Geo not syncing new LFS files

We [found a regression](https://gitlab.com/gitlab-org/gitlab/issues/32696) in the GitLab Geo code that makes it very likely that any new LFS objects are not synchronized to secondary nodes. This means that these LFS files cannot be pulled from secondary nodes and impacts Disaster Recovery.

### Versions Affected

Affects GitLab EE 12.1 and later.
GitLab CE versions are unaffected.

### Remediation

We **strongly recommend** that all installations running an affected version above **with enabled** LFS and Geo are upgraded to the latest version as soon as possible.
## Updating

To update GitLab, see the [update page](/update/).
