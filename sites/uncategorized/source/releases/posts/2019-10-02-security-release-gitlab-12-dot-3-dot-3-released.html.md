---
title: "GitLab Critical Security Release: 12.3.3, 12.2.7, and 12.1.13"
description: "Learn more about GitLab Critical Security Release: 12.3.3, 12.2.7, and 12.1.13 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/10/02/security-release-gitlab-12-dot-3-dot-3-released/"
categories: releases
author: Jeremy Matos
author_gitlab: jeremymatos
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.3.3, 12.2.7, and 12.1.13 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain an important security fix, and we strongly recommend that all GitLab installations **with enabled** Elasticsearch integration be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) in approximately 30 days.

Please read on for more information regarding this release.

## Disclosure of Private Code, Merge Requests and Commits via Elasticsearch integration

Private code, merge requests and commits would be disclosed with the Group Search feature provided by Elasticsearch integration. The issue is now mitigated in the latest release and is assigned [CVE-2019-5487](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5487).

Thanks to [@rpadovani](https://hackerone.com/rpadovani) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.17 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above **with enabled** Elasticsearch integration are upgraded to the latest version as soon as possible.

## Disclosure of container and dependency scanning reports

Container and dependency scanning reports were available via the merge request widget even though public pipelines were disabled. The issue is now mitigated in the latest release and is assigned [CVE-2019-15591](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-15591). 

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 12.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating

To update GitLab, see the [update page](/update/).
