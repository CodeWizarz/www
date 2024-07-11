---
title: "GitLab  Critical Security Release: 12.9.3, 12.8.9, and 12.7.9"
description: "Learn more about GitLab Security Release: 12.9.3, 12.8.9, and 12.7.9 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2020/04/14/critical-security-release-gitlab-12-dot-9-dot-3-released/"
categories: releases
author: Jeremy Matos
author_gitlab: jeremymatos
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.9.3, 12.8.9, and 12.7.9 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

NOTE: The GPG keys used to sign GitLab packages has changed. If you see
errors due to signature verification or GPG errors, be sure to
update these public keys. See [this blog post](https://about.gitlab.com/blog/2020/03/30/gpg-key-for-gitlab-package-repositories-metadata-changing/)
for more details.

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) in approximately 30 days.

Please read on for more information regarding this release.

## NuGet Package and File Disclosure through GitLab Workhorse

An internal investigation revealed that a particular header could be used to override restriction and results in GitLab Workhorse disclosing NuGet packages and files in the `/tmp` directory. The issue is now mitigated in the latest release and is assigned [CVE-2020-11505](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-11505).

Thanks to [@vakzz](https://hackerone.com/vakzz) for also responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 12.8.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Job Artifact Uploads and File Disclosure through GitLab Workhorse

An internal investigation revealed that a particular header could be used to override restrictions and results in GitLab Workhorse disclosing job artifact uploads and files in the `/tmp` directory. The issue is now mitigated in the latest release and is assigned [CVE-2020-11506](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-11506).

Thanks to [@manassehzhou](https://hackerone.com/manassehzhou) for also responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE/CE 10.7.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Incorrect membership following group removal

An internal investigation revealed that members of a group could still have access after a group is deleted. The issue is now mitigated in the latest release and is assigned [CVE-2020-11649](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-11649).

### Versions Affected

Affects GitLab EE/CE 8.15 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Logging of Praefect tokens

An internal investigation revealed that Praefect tokens were logged by Gitaly. The issue is now fixed.

### Versions Affected

Affects GitLab Omnibus 12.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update Rack dependency

The Rack dependency and its related gems have been upgraded to 2.0.9. This upgrade includes a security fix for [CVE-2019-16782](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-16782).

### Versions Affected

Affects all previous versions of GitLab CE/EE.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update OpenSSL dependency

The OpenSSL dependency has been upgraded from 1.1.d to 1.1.1f to include those [improvements](https://www.openssl.org/news/changelog.html#openssl-111).

### Versions Affected

Affects all previous versions of GitLab Omnibus.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating

To update GitLab, see the [update page](/update/).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).

