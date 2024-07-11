---
title: "GitLab  Security Release: 12.5.1, 12.4.4, and 12.3.7"
description: "Learn more about GitLab Security Release: 12.5.1, 12.4.4, and 12.3.7 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/11/27/security-release-gitlab-12-5-1-released/"
categories: releases
author: Andrew Kelly
author_gitlab: ankelly
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.5.1, 12.4.4, and 12.3.7 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. If you are unable to upgrade, consider [disabling Elasticsearch](https://docs.gitlab.com/ee/integration/elasticsearch.html#disabling-elasticsearch).

**Update** Two fixes for GitLab Omnibus inadvertently did not make it into this release, so we are releasing new minor versions in order to include those changes in all versions of GitLab. We **strongly recommend** that all installations be updated to the new versions (12.5.2, 12.4.5, 12.3.8) once they are available.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) in approximately 30 days.

Please read on for more information regarding this release.

## Path traversal with potential remote code execution

Improper parameter sanitization for Maven package registry could lead to privilege escalation and remote code execution vulnerabilities under certain conditions. The issue is now mitigated in the latest release and is assigned [CVE-2019-19088](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19088).

Thanks to @nyangawa of Chaitin Tech for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Private objects exposed through project import

Using the project import feature, it was possible for someone to obtain issue, merge request, and other data from private projects. The issue is now mitigated in the latest release and is assigned [CVE-2019-19309](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19309).

Thanks to @nyangawa of Chaitin Tech for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.9.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of notes via Elasticsearch integration

Private notes would be disclosed via the API of the Group Search feature provided by Elasticsearch integration. The issue is now mitigated in the latest release and is assigned [CVE-2019-19086](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19086).

Thanks to [@rpadovani](https://hackerone.com/rpadovani) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.17 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above **with enabled** Elasticsearch integration are upgraded to the latest version as soon as possible. If you are unable to upgrade, consider [disabling Elasticsearch](https://docs.gitlab.com/ee/integration/elasticsearch.html#disabling-elasticsearch).

## Disclosure of comments via Elasticsearch integration

Comments on restricted public projects could be guessed via the Group Search feature provided by Elasticsearch integration. The issue is now mitigated in the latest release and is assigned [CVE-2019-19087](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19087).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.17 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above **with enabled** Elasticsearch integration are upgraded to the latest version as soon as possible. If you are unable to upgrade, consider [disabling Elasticsearch](https://docs.gitlab.com/ee/integration/elasticsearch.html#disabling-elasticsearch).

## DNS Rebind SSRF in various chat notifications

An internal review identified several situations in which particular chat notifications could be used to perform DNS rebind SSRF attacks. The issue is now mitigated in the latest release and is assigned [CVE-2019-19261](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19261).

### Versions Affected

Affects GitLab EE 6.7 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of vulnerability status in dependency list

It was internally identified that the vulnerability status of a particular dependency was being displayed to unauthenticated users. The issue is now mitigated in the latest release and is assigned [CVE-2019-19256](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19256).

### Versions Affected

Affects GitLab EE 12.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of commit count in Cycle Analytics

Project members with the Guest access level were erronneously able to see the number of commits in the Cycle Analytics area. The issue is now mitigated in the latest release and is assigned [CVE-2019-19254](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19254).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Exposure of related branch names

Under certain circumstances, guests and non-members were able to see branch names. The issue is now mitigated in the latest release and is assigned [CVE-2019-19257](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19257).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all previous GitLab CE/EE versions.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Tags pushes from blocked users

In some situations, a blocked user was still able to push git tags depsite other git access being revoked. The issue is now mitigated in the latest release and is assigned [CVE-2019-19263](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19263).

### Versions Affected

Affects GitLab EE 8.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Branches and Commits exposed to Guest members via integration

It was discovered that using certain integrations a guest user was able to view branch names and commit messages. The issue is now mitigated in the latest release and is assigned [CVE-2019-19258](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19258).

### Versions Affected

Affects GitLab EE 10.8 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## IDOR when adding users to protected environments

Non-project members were unintentionally allowed to be added to protected environments. The issue is now mitigated in the latest release and is assigned [CVE-2019-19259](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19259).

### Versions Affected

Affects GitLab EE 11.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Former project members able to access repository information

Under specific circumstances, a former project member was still able to access repositories from which their access had been removed. The issue is now mitigated in the latest release and is assigned [CVE-2019-19260](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19260).

Thanks to [@mclaren650sspider](https://hackerone.com/mclaren650sspider) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all previous GitLab CE/EE versions.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Unauthorized access to grafana metrics

Grafana metrics were unintentionally being exposed to unauthorized users. The issue is now mitigated in the latest release and is assigned [CVE-2019-19262](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19262).

Thanks to [@d0xing](https://hackerone.com/d0xing) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 11.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Todos created for former project members

Under specific circumstances, a former project member would potentially receive Todos even after being removed from the project. The issue is now mitigated in the latest release and is assigned [CVE-2019-19255](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19255).

Thanks to Jimmy Soh for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 12.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Update Mattermost dependency

The Mattermost dependency has been upgraded to 5.14.5 in order to mitigate security concerns.

### Versions Affected

Affects GitLab Omnibus 12.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Disclosure of AWS secret keys on certain Admin pages

Certain Admin pages potentially disclosed AWS secret keys in plain text. The issue is now mitigated in the latest release and is assigned [CVE-2019-19310](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19310).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 9.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Stored XSS in Group and User profile fields

Multiple group and user profile fields were not being sanitized properly and potentially resulting in a stored cross-site scripting vulnerability. The issue is now mitigated in the latest release and is assigned [CVE-2019-19311](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19311).

Thanks to @constructor2019 for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.14 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Forked project information disclosed via Project API

After a project changed to private, previously forked repositories were still able to get information about the private project through the API. The issue is now mitigated in the latest release and is assigned [CVE-2019-19312](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19312).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.14 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Denial of Service in the issue and commit comment pages

Certain characters were making it impossible to create, edit, or view issues and commits. The issue is now mitigated in the latest release and is assigned [CVE-2019-19313](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19313).

Thanks to [@dfens](https://hackerone.com/dfens) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 12.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Tokens stored in plaintext

Several tokens that were being stored in plaintext are now being encrypted. The issue is now mitigated in the latest release and is assigned [CVE-2019-19314](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19314).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Updating

To update GitLab, see the [update page](/update/).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive security release blog notifications via RSS, subscribe to our [RSS feed](https://about.gitlab.com/security-releases.xml).
