---
title: "GitLab  Critical Security Release: 12.5.4, 12.4.6, and 12.3.9"
description: "Learn more about GitLab Critical Security Release: 12.5.4, 12.4.6, and 12.3.9 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/12/10/critical-security-release-gitlab-12-5-4-released/"
categories: releases
author: Jeremy Matos
author_gitlab: jeremymatos
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.5.4, 12.4.6, and 12.3.9 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) in approximately 30 days.

Please read on for more information regarding this release.

## Path traversal with potential remote code execution

Insufficient parameter sanitization for Maven package registry could lead to privilege escalation and remote code execution vulnerabilities under certain conditions. The issue is now mitigated in the latest release and is assigned [CVE-2019-19628](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19628).

Thanks to @nyangawa of Chaitin Tech for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of private code via Elasticsearch integration

When transferring a public project to a private group, private code would be disclosed via the Group Search API provided by Elasticsearch integration. The issue is now mitigated in the latest release and is assigned [CVE-2019-19629](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19629).

Thanks to [@rpadovani](https://hackerone.com/rpadovani) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 10.5 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above **with enabled** Elasticsearch integration are upgraded to the latest version as soon as possible. If you are unable to upgrade, consider [disabling Elasticsearch](https://docs.gitlab.com/ee/integration/elasticsearch.html#disabling-elasticsearch).

## Update Git dependency

The Git dependency has been upgraded to 2.22.2 in order to apply security fixes detailed [here](https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.22.2.txt).  

[CVE-2019-19604](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19604) was identified by the GitLab Security Research team. For more information on that issue, please visit the [GitLab Security Research Advisory](https://gitlab.com/gitlab-com/gl-security/disclosures/blob/master/003_git_submodule/advisory.md)

### Versions Affected

Affects all versions of GitLab Omnibus.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating

To update GitLab, see the [update page](/update/).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
