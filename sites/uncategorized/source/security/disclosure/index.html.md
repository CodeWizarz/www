---
layout: markdown_page
title: Coordinated Disclosure Process
description: "Coordinated Disclosure Process- reporting any security vulnerabilities in GitLab or in a project hosted on GitLab.com"
canonical_path: "/security/disclosure/"
---

## Reporting a Vulnerability about GitLab or GitLab.com

Please report any security vulnerabilities in GitLab itself via our [HackerOne](https://hackerone.com/gitlab) bug bounty program. If you do not desire to use HackerOne or if your finding is out of scope of the bug bounty program but you believe it's important to communicate it to us our next preferred method is to have you create a confidential issue following the instructions in our [handbook](https://about.gitlab.com/handbook/security/#creating-new-security-issues). Please refrain from requesting compensation for reporting vulnerabilities.

If you are looking to discover vulnerabilities in GitLab, please see our [HackerOne bug bounty policy](https://hackerone.com/gitlab?type=team) for details on rules of engagement, scope, and additional information. 

Emailing `security@gitlab.com` is no longer a supported disclosure method and will result in an automated response with further instructions.

## Vulnerability Disclosure

All vulnerabilities will be made public via our [issue tracker](https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=security&scope=all&state=opened) 30 days after releasing the fix. We try and redact all information considered sensitive (such as cookies, tokens, data details). The only time we will make an exception and not make a vulnerability public is when it contains sensitive data which we are unable to redact or remove from the report.

## Security Releases

You can find details on how we handle [security releases here](https://gitlab.com/gitlab-org/release/docs/blob/master/general/security/process.md). On our website you can also find more about [the availability and security of GitLab.com](/pricing/).

## Reporting a Vulnerability in Public Projects Hosted on GitLab.com

Please see our [CVE Request Process](/security/cve/#requesting-a-cve-from-gitlab) to learn
how to request a CVE for a public project hosted on GitLab.com.

## Penetration Testing Rules of Engagement

If you want to conduct penetration testing against GitLab.com you will need written permission upfront. Customers can [contact Support](https://about.gitlab.com/support/) or [the Field Security team](/handbook/security/security-assurance/field-security/answerbase.html#contact-the-field-security-team).

While you are engaged in penetration testing activities you should coordinate with the Security Team so escalation can be avoided.
The Security Team will notify the Infrastructure Team as well as the VP of Engineering so that awareness is maintained.

### Public GPG Key

 * `GitLab Security <security@gitlab.com>`
 * ID: 98FA455B9ECCCF0E
 * Fingerprint B9EF E21E 6340 FFC3 4B55  16E3 98FA 455B 9ECC CF0E

```
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
5sAvSC9IfugmydKTV2qg1RnirLb13XEL
=gYTI
-----END PGP PUBLIC KEY BLOCK-----

```

[](){: name="external"}
## Disclosure Guidelines for Vulnerabilities in 3rd Party Software

When a security vulnerability in some 3rd party product is discovered by GitLab
team members the following disclosure guideline should apply:

* The first priority is our users. 
  * Therefore for any vulnerability discovered in a dependency of GitLab we'll make sure our users are not affected.
* For the following disclosure process our priority is to get the reported vulnerability fixed.
* If the 3rd party acknowledges the vulnerability and is working on a patch, we will keep vulnerability details confidential until the issue is fixed.
  * If possible, we will verify the fix before it is being published.
  * In special cases we might release details without a fix to make the public aware. This might, for instance, be the case when a vulnerability is being actively exploited.
* We aim for a fix within a 90 days deadline.
  * We will treat this as a soft deadline and help to meet the deadline when reporting.
  * We will try to coordinate with the affected 3rd party to have a patch released before we release an advisory.
* Resulting advisories will be published in the [disclosures repository](https://gitlab.com/gitlab-com/gl-security/disclosures).
