---
title: "GitLab Critical Security Release: 10.5.6, 10.4.6, and 10.3.9"
description: "Learn more about GitLab Critical Security Release: 10.5.6, 10.4.6, and 10.3.9 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/03/20/critical-security-release-gitlab-10-dot-5-dot-6-released/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
tags: security, security releases
---

Today we are releasing versions 10.5.6, 10.4.6, and 10.3.9 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our issue tracker in approximately 30 days.

Please read on for more information regarding this release.

## SSRF in services and web hooks

There were multiple server-side request forgery issues in the Services feature. An attacker could make requests to servers within the same network of the GitLab instance. This could lead to information disclosure, authentication bypass, or potentially code execution. This issue has been assigned [CVE-2018-8801].

Thanks to [@jobert] from [HackerOne] for reporting this.

[CVE-2018-8801]: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-8801
[@jobert]: https://twitter.com/jobertabma
[HackerOne]: https://hackerone.com/jobert

### Versions Affected

* Affects GitLab CE/EE 8.3 and up

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.


## Gitlab Auth0 integration issue

There was an issue with the GitLab `omniauth-auth0` configuration which resulted in the Auth0 integration signing in the wrong users.

Thanks to [Trond Hindenes] for reporting this issue.

[Trond Hindenes]: https://gitlab.com/trondhindenes

### Versions Affected

* Affects GitLab CE 8.6 and up

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Updating

To update, check out our [update page](/update/).

#### Update (2018-03-21 7:00PM UTC)

In order to address the SSRF issue, we created a new checkbox setting to allow outbound requests to local networks (IPv4 and IPv6 private address ranges). This is currently unchecked by default.

The setting is located in `Admin area->Settings->Outbound Requests`. If you need to allow outbound requests to your local network for hooks and services, please enable this checkbox. Note that by checking this, your GitLab instance will be vulnerable to the SSRF issue mentioned above.

To provide a more flexible and improved solution, we may add a configurable whitelist at a future date.

#### Update (2018-03-23 9:00AM UTC)

If you are currently using Auth0, the configuration will need to be updated slightly.

Check the [Auth0 integration documentation](https://docs.gitlab.com/ee/integration/auth0.html) for the correct syntax.
