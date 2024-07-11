---
title: "GitLab Security Release: 11.9.4, 11.8.6, and 11.7.10"
description: "Learn more about GitLab Security Release: 11.9.4, 11.8.6, and 11.7.10 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2019/04/01/security-release-gitlab-11-dot-9-dot-4-released/"
categories: releases
author: James Ritchey
author_gitlab: jritchey
image_title: '/images/blogimages/security-cover-new.png'
tags: security, security releases
---

Today we are releasing versions 11.9.4, 11.8.6, and 11.7.10 for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately.

<!-- more -->

The vulnerability details will be made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab-ce/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=security) in approximately 30 days.

Please read on for more information regarding this release.

## DoS potential for regex in CI/CD `refs`

An regex input validation issue for the `.gitlab-ci.yml` [`refs` value](https://docs.gitlab.com/ee/ci/yaml/index.html#onlyrefs--exceptrefs) was discovered which could allow an attacker to execute a denial of service on the platform. The issue is now mitigated in the latest release and is assigned [CVE-2019-10640](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10640).

### Notes

Due to this fix, certain regular expression patterns in `refs` values may no longer be supported and will require modification.

This fix will go live for GitLab.com users on April 8, 2019. 

Related issues:

* https://gitlab.com/gitlab-org/gitlab-ce/issues/59703
* https://gitlab.com/gitlab-com/customer-success/professional-services/issues/421
* https://gitlab.com/gitlab-org/gitlab-ce/issues/49665 (confidential for first 30 days past publication)

### Explanation

Previously, GitLab used [Ruby's Regexp](https://ruby-doc.org/core-2.4.2/Regexp.html) for pattern matching. This change switches the regular expression engine to [RE2](https://github.com/google/re2/) while maintaining the previous syntax. GitLab internally converts `/pattern/flags` into valid RE2 patterns.

However, this is considered a breaking change because RE2 does not support some patterns, such as negative lookahead, due to computational complexity. For the list of supported syntaxes, see https://github.com/google/re2/wiki/Syntax.

#### Example 1

```
  only:
    - tags
  except:
    - /^(?!master).+@/
```

The intent of this matcher is to possibly create a job only on tags that are created for `master`. However, this did not work as intended, as Git does not have a concept of creating a reference on top of another reference. Tag, branch, and any reference are always created on top of a revision.

The valid equivalent syntax here is:

```
only:
  - tags
```

#### Example 2

```
  only:
    - //@gitlab-org/gitlab-ce
```

The intent of this matcher is to create a job only for an upstream repository. It fails, as RE2 requires a pattern to be matching. In the above example the behavior is undefined.

```
  only:
    - /./@gitlab-org/gitlab-ce
```

This syntax will successfully match any refname.

### Versions Affected

Affects GitLab CE/EE 8.0 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Related branches visible in issues for guests

An authorization issue was discovered which allowed Guests of a project to see Related Branches created for an issue. The issue is now mitigated in the latest release and is assigned [CVE-2019-10116](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10116).

Thanks to [@ashish_r_padelkar](https://hackerone.com/ashish_r_padelkar) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.7 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Persistent XSS at merge request resolve conflicts

An input validation and output encoding issue was discovered in the merge request "resolve conflicts" page which resulted in a persistent XSS. The issue is now mitigated in the latest release and is assigned [CVE-2019-10111](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10111).

Thanks to [@valis_](https://hackerone.com/valis_) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.0 to 11.8.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Improper authorization control "move issue"

An authorization issue was discovered in the "move issue" feature which could allow an attackers to create projects under any namespace on any GitLab instance on which they already hold credentials. The issue is now mitigated in the latest release and is assigned [CVE-2019-10110](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10110).

Thanks to @mishre for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.7 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Guest users of private projects have access to releases

An authorization issue was discovered for the GitLab Releases feature which could allow guest users access to private information like release details. The issue is now mitigated in the latest release and is assigned [CVE-2019-10115](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10115).

Thanks to [@xanbanx](https://hackerone.com/xanbanx) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.7 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## DoS potential on project languages page

A potential denial of service attack vector was discovered on the project languages endpoint. The issue is now mitigated in the latest release and is assigned [CVE-2019-10113](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10113).

Thanks to [@opalmer](https://github.com/opalmer) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.2 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Recurity assessment: information exposure through timing discrepancy

During the OAuth authentication process, the application attempts to validate a parameter in an insecure way, potentially exposing data. The issue is now mitigated in the latest release and is assigned [CVE-2019-10114](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10114).

Thanks to [Recurity](https://www.recurity-labs.com/) for reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Recurity assessment: loginState HMAC issues

The construction of the HMAC key was insecurely derived. The issue is now mitigated in the latest release and is assigned [CVE-2019-10112](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10112).

Thanks to [Recurity](https://www.recurity-labs.com/) for reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## Recurity assessment: open redirect

Within the `GeoAuthController` for the secondary Geo node, a redirect is triggered after successful authentication which was subject to an open redirect vulnerability. The issue is now mitigated in the latest release and is assigned [CVE-2019-10117](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10117).

Thanks to [Recurity](https://www.recurity-labs.com/) for reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 11.9 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## PDF.js vulnerable to CVE-2018-5158

The version of PDF.js embedded in Gitlab is 1.8.172, which is vulnerable to CVE-2018-5158. Per the summary, attacker-supplied JavaScript will be executed in a web worker context. Please see https://bugzilla.mozilla.org/show_bug.cgi?id=1452075 for more details about the CVE. The issue is now mitigated in the latest release.

Thanks to [@certifiable](https://hackerone.com/certifiable) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 9.5 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## IDOR labels of private projects/groups

An authorization issue was discovered which allowed non-members of a private project/group to add and read labels. The issue is now mitigated in the latest release and is assigned [CVE-2019-10108](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10108).

Thanks to @vijay_kumar1110](https://hackerone.com/indoappsec?type=user) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects GitLab CE/EE 8.11.4 and later.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

## EXIF geolocation data not stripped from uploaded images

Images uploaded to GitLab were not stripped of EXIF geolocation data. As a result, anyone with access to the uploaded image could obtain the its geolocation, device, and software version data, if present. The issue is now mitigated in the latest release and is assigned [CVE-2019-10109](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10109).

**Note:** if you are using CentOS Minimal, you may need to install `perl` package: `yum install perl`

Thanks to [@jackb898](https://hackerone.com/jackb898?type=user) and [@rgupt](https://hackerone.com/rgupt) for responsibly reporting this vulnerability to us.

### Versions Affected

Affects all previous versions of GitLab.

### Remediation

We **strongly recommend** that all installations running an affected version above are upgraded to the latest version as soon as possible.

### Additional notes for removing existing uploads

Since 11.9, EXIF data are automatically stripped from JPG or TIFF image uploads.
Because EXIF data may contain sensitive information (e.g. GPS location), you
may also choose to remove EXIF data from images which were uploaded to older versions of GitLab
with [the rake task](https://docs.gitlab.com/ee/administration/raketasks/uploads/sanitize.html)

## Updating

To update GitLab, see the [update page](/update/).
