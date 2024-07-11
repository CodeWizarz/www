---
title: "GitLab Security Release: 12.0.3, 11.11.5, and 11.10.8"
description: "Learn more about GitLab Security Release: 12.0.3, 11.11.5, and 11.10.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/07/03/security-release-gitlab-12-dot-0-dot-3-released/"
categories: releases
author: Costel Maxim
author_gitlab: cmaxim
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 12.0.3, 11.11.5, and 11.10.8 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab-ce/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=security) in approximately 30 days.

Please read on for more information regarding this release.

## Ability to Write a Note to a Private Snippet

GitLab Snippets were vulnerable to an authorization issue that allowed unauthorized users to add comments to a private snippet. The issue is now mitigated in the latest release and is assigned [CVE-2019-13001](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-13001).

Thanks to [@executor](https://hackerone.com/executor) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Recent Pipeline Information Disclosed to Unauthorised Users

Unauthorised users were able to read pipeline information of the last merge request. The issue is now mitigated in the latest release and is assigned [CVE-2019-13002](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-13002).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.10 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Resource Exhaustion Attack

One of the parsers used by Gitlab CI was vulnerable to a resource exhaustion attack. The issue is now mitigated in the latest release and is assigned [CVE-2019-13003](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-13003).

Thanks to [@leipert](https://gitlab.com/leipert) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all versions of GitLab CE/EE.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Error Caused by Encoded Characters in Comments

When specific encoded characters were added to comments, the comments section would become inaccessible. The issue is now mitigated in the latest release and is assigned [CVE-2019-13004](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-13004).

Thanks to [@newbiemole](https://hackerone.com/newbiemole) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.1 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Authorization Issues in GraphQL

The GitLab graphql service was vulnerable to multiple authorization issues that disclosed restricted user, group, and repository metadata to unauthorized users. The issue is now mitigated in the latest release and is assigned [CVE-2019-13005](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-13005).

Thanks to [@rpadovani](https://hackerone.com/rpadovani) and [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.10 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Number of Merge Requests was Accessible

Users with access to issues, but not the repository were able to view the number of related merge requests on an issue. The issue is now mitigated in the latest release and is assigned [CVE-2019-13006](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-13006).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Enabling One of the Service Templates Could Cause Resource Depletion

When an admin enabled one of the service templates, it was triggering an action that leads to resource depletion. The issue is now mitigated in the latest release and is assigned [CVE-2019-13007](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-13008).

### Versions Affected

Affects GitLab CE/EE 11.11 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Broken Access Control for the Content of Personal Snippets

Uploaded files associated with unsaved personal snippets were accessible to unauthorized users due to improper permission settings. The issue is now mitigated in the latest release and is assigned [CVE-2019-13009](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-13009).

Thanks to [@mkozono](https://gitlab.com/mkozono) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible

## Decoding Color Codes Caused Resource Depletion

The color codes decoder was vulnerable to a resource depletion attack if specific formats were used. The issue is now mitigated in the latest release and is assigned [CVE-2019-13010](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-13010).

Thanks to [@8ayac](https://hackerone.com/8ayac) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.3 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible

## Merge Request Template Name Disclosure

By using brute-force a user with access to a project, but not it's repository could create a list of merge requests template names. The issue is now mitigated in the latest release and is assigned [CVE-2019-13011](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-13011).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 8.11.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible

## SSRF Vulnerability in Project GitHub Integration

The GitHub project integration was vulnerable to an SSRF vulnerability which allowed an attacker to make requests to local network resources. The issue is now mitigated in the latest release and is assigned [CVE-CVE-2019-13121](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-13121).

Thanks to [@ngalog](https://hackerone.com/ngalog) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab EE 10.6 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible

## Updating

To update GitLab, see the [update page](/update/).
