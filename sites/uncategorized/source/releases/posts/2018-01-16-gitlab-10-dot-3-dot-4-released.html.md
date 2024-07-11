---
title: "GitLab Security Release: 10.3.4, 10.2.6, and 10.1.6"
description: "Learn more about GitLab Security Release: 10.3.4, 10.2.6, and 10.1.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/01/16/gitlab-10-dot-3-dot-4-released/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
tags: security
---

Today we are releasing versions 10.3.4, 10.2.6, and 10.1.6 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain a number of important security fixes, including two
that prevent remote code execution, and we strongly recommend that all GitLab
installations be upgraded to one of these versions immediately.

This security release blog post is the first part of two. The second blog will
be posted in approximately 30 days, and it will detail the vulnerability
findings.

Please read on for more details regarding this release.

<!-- more -->

## Remote Code Execution Vulnerability in GitLab Projects Import

The GitLab projects import component contained a vulnerability which allowed
an attacker to write files to arbitrary directories on the server and that
could result in remote code execution. The vulnerability has now been
mitigated and is assigned to [CVE-2017-0915] and [CVE-2018-3710].

Thanks to [Jobert Abma][jobert-twitter] of [HackerOne][jobert] and [Brian Neel][brian-twitter]
for responsibly disclosing these issues to us.

[CVE-2017-0915]: http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2017-0915
[CVE-2018-3710]: http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2018-3710

### Versions Affected

* GitLab CE and EE 8.9.0 - 9.5.10
* GitLab CE and EE 10.0.0 - 10.1.5
* GitLab CE and EE 10.2.0 - 10.2.5
* GitLab CE and EE 10.3.0 - 10.3.3

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

#### Additional Workarounds

1. Go to `/admin/application_settings` of your GitLab instance.
2. Under "Import sources", uncheck the "GitLab export" checkbox.
3. Click `Save`.

## GitLab CI Runner Can Read and Poison Cache of All Other Projects

A path traversal vulnerability was found in the CI runner, which allowed a
malicious user to read and poison other project caches. The issue is now
remediated and has been assigned to [CVE-2017-0918].

Thanks to [Jobert Abma][jobert-twitter] of [HackerOne][jobert] for responsibly disclosing this issue to us.

[CVE-2017-0918]: http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2017-0918

### Versions Affected

* GitLab CE and EE 8.4.0 - 9.5.10
* GitLab CE and EE 10.0.0 - 10.1.5
* GitLab CE and EE 10.2.0 - 10.2.5
* GitLab CE and EE 10.3.0 - 10.3.3

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Jupyter Notebook XSS

Projects that have Jupyter Notebooks could execute external JavaScript. This XSS
vulnerability was caused by unsanitized output in Jupyter Notebooks. The output
is now correctly sanitized before being rendered. This issue has been assigned to [CVE-2017-0923].

[CVE-2017-0923]: http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2017-0923

### Versions Affected

* GitLab CE and EE 9.1.0 - 9.5.10
* GitLab CE and EE 10.0.0 - 10.1.5
* GitLab CE and EE 10.2.0 - 10.2.5
* GitLab CE and EE 10.3.0 - 10.3.3

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Sensitive Fields Exposed to Admins / Masters in the Services API

The [Services API](https://docs.gitlab.com/ee/api/services.html) responses
were exposing sensitive fields to the Admins and Masters of the service's
project. We now filter out those sensitive fields from the Services API
responses. This issue has been assigned to [CVE-2017-0925].

Thanks to [Artur Jan Fijałkowski](https://gitlab.com/WarX) for responsibly
disclosing this issue to us.

[CVE-2017-0925]: http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2017-0925

### Versions Affected

* GitLab CE and EE 8.0.0 - 9.5.10
* GitLab CE and EE 10.0.0 - 10.1.5
* GitLab CE and EE 10.2.0 - 10.2.5
* GitLab CE and EE 10.3.0 - 10.3.3

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Login with Disabled OAuth Provider via POST

OAauth providers are configured per instance and can be disabled from the Admin settings page under "Sign-in Restrictions".

It was possible to login with a disabled OAuth provider when bypassing the form with a malicious request.
A check has been added to prevent this. This issue has been assigned to [CVE-2017-0926].

Thanks to [Steve Norman](https://gitlab.com/stevenorman) for responsibly
disclosing this issue to us.

[CVE-2017-0926]: http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2017-0926

### Versions Affected

* GitLab CE and EE 8.8.0 - 9.5.10
* GitLab CE and EE 10.0.0 - 10.1.5
* GitLab CE and EE 10.2.0 - 10.2.5
* GitLab CE and EE 10.3.0 - 10.3.3

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## XSS in Label Dropdown

A persistent XSS vulnerability was discovered in the issue/merge request sidebar label dropdown. Label names inside the sidebar label dropdown are now escaped. This issue has been assigned to [CVE-2017-0924].

Thanks to [c05m0ch405](https://hackerone.com/c05m0ch405) for responsibly disclosing this issue to us through HackerOne.

[CVE-2017-0924]: http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2017-0924

### Versions Affected

* GitLab CE and EE 9.0.0 - 9.5.10
* GitLab CE and EE 10.0.0 - 10.1.5
* GitLab CE and EE 10.2.0 - 10.2.5
* GitLab CE and EE 10.3.0 - 10.3.3

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Critical SQL Injection in MilestoneFinder

A SQL injection vulnerability was discovered in the MilestoneFinder component. The affected SQL query has now been mitigated. This issue has been assigned to [CVE-2017-0914].

[CVE-2017-0914]: http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2017-0914

### Versions Affected

* GitLab CE and EE 9.4.0 - 9.5.10
* GitLab CE and EE 10.0.0 - 10.1.5
* GitLab CE and EE 10.2.0 - 10.2.5
* GitLab CE and EE 10.3.0 - 10.3.3

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Critical Vulnerability with Command Injection via Webhooks

A new line injection vulnerability was discovered in the Webhook component that allowed an attacker to inject non-HTTP commands in a TCP stream. The issue has now been mitigated and assigned to [CVE-2017-0916].

[CVE-2017-0916]: http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2017-0916

### Versions Affected

* GitLab CE and EE 8.8.0 - 10.1.5
* GitLab CE and EE 10.2.0 - 10.2.5
* GitLab CE and EE 10.3.0 - 10.3.3

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Cross-site scripting (XSS) vulnerability in CI job output

A persistent XSS vulnerability was discovered in the CI job component, and the issue has now been resolved by performing stricter input validation. This issue has been assigned to [CVE-2017-0917].

Thanks to [Jobert Abma][jobert-twitter] of [HackerOne][jobert] for
responsibly disclosing this issue to us.

[CVE-2017-0917]: http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2017-0917

### Versions Affected

* GitLab CE and EE 10.1.0 - 10.1.5
* GitLab CE and EE 10.2.0 - 10.2.5
* GitLab CE and EE 10.3.0 - 10.3.3

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Guest Users Can Give Deploy Keys in Other Projects Write Access

An improper authorization vulnerability was discovered in the deployment keys component which resulted in unauthorized use of deployment keys by guest users. The issue has now been resolved and is assigned to [CVE-2017-0927].
This change altered the `/deploy_keys` API endpoint, which no longer returns `can_push` attribute. See [our updated documentation](https://gitlab.com/gitlab-org/gitlab-ee/blob/v10.3.4-ee/doc/api/deploy_keys.md).

[CVE-2017-0927]: http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2017-0927

### Versions Affected

* GitLab CE and EE 8.16.0 - 9.5.10
* GitLab CE and EE 10.0.0 - 10.1.5
* GitLab CE and EE 10.2.0 - 10.2.5
* GitLab CE and EE 10.3.0 - 10.3.3

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Milestone Authorization Issue on Boards

An authorization bypass vulnerability was discovered in the Boards component which resulted in an information disclosure. The issue has now been resolved and is assigned to [CVE-2017-0922].

[CVE-2017-0922]: http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2017-0922

### Versions Affected

* GitLab EE 9.1.0 - 9.5.10
* GitLab EE 10.0.0 - 10.1.5
* GitLab EE 10.2.0 - 10.2.5
* GitLab EE 10.3.0 - 10.3.3

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Authorization Issue When Creating Merge Requests

A vulnerability regarding authorization to create merge requests allowed users to see names of private projects, which also extended to already forked projects. The issue is now mitigated and is assigned to [CVE-2017-0920].

[CVE-2017-0920]: http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=2017-0920

### Versions Affected

* GitLab CE and EE 8.8.0 - 10.1.5
* GitLab CE and EE 10.2.0 - 10.2.5
* GitLab CE and EE 10.3.0 - 10.3.3

### Remediation

We **strongly recommend** that all installations running an affected version above to be upgraded to the latest version as soon as possible.

## Upgrade Barometer

These versions include a migration to add a column to `deploy_keys` table and
a post-deploy migration to populate it. No downtime is required.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations` file](http://doc.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a
[subscription](/pricing/). No time to upgrade GitLab
yourself? Subscribers receive upgrade and installation services.

[jobert-twitter]: https://twitter.com/jobertabma
[brian-twitter]: https://twitter.com/b0bby_tables
[jobert]: https://hackerone.com/jobert
