---
layout: markdown_page
title: CVE Numbering Authority
description: "CNAs (CVE Numbering Authorities) may issue CVE identifiers to vulnerabilities in projects within the CNA's scope."
canonical_path: "/security/cve/"
---

## CVEs and CNAs

CVEs ([Common Vulnerability Enumeration)](https://cve.mitre.org/index.html) are
unique identifiers assigned to specific vulnerabilities within a product,
having the form `CVE-YYYY-NNNNN`, with `YYYY` being the year and `NNNNN` being
a unique number for that year.

CNAs ([CVE Numbering Authorities](https://cve.mitre.org/cve/cna.html)) may
issue CVE identifiers to vulnerabilities in projects within the
CNA's scope. To obtain a CVE identifier for an identified vulnerability within
a CNA's scope, parties must contact the CNA and request a CVE identifier for the
vulnerability.

## GitLab's Role as a CNA

GitLab [is a participant in MITRE's CNA program](https://cve.mitre.org/cve/request_id.html#g).

GitLab's scope as a CNA is:

> The GitLab application, any project hosted on GitLab.com in a *public*
> repository, and any vulnerabilities discovered by GitLab that are not in
> another CNA’s scope

CVEs that have been assigned and published by GitLab can be found in the
[gitlab-org/cves project](https://gitlab.com/gitlab-org/cves).

## Requesting a CVE from GitLab

Maintainers of public projects hosted on GitLab.com may request CVEs for
vulnerabilities within their project by creating a
[confidential issue on gitlab-org/cves](https://gitlab.com/gitlab-org/cves/-/issues/new?issue[confidential]=true&issuable_template=Manual%20Submission&issue[title]=Vulnerability%20Submission&from_handbook=true)
for their CVE request.

Non-maintainers must work with the maintainer of the project to request a CVE
for a vulnerability. It is recommended that a confidential issue first be created
on the project itself to report the vulnerability to the maintainer. The
maintainer of the project is responsible for requesting the CVE identifier from
GitLab.

We will acknowledge receipt of CVE requests the next business day
and strive to send regular updates about our progress. Our goal is to
determine if the vulnerability is valid and communicate back to the submitter
within 30 business days.

If the status of the CVE request is unclear, please feel free to ping us
(`@gitlab-org/secure/vulnerability-research`) within the created issue. If
encrypted email is preferred, download our key from
the [MIT PGP key server](https://pgp.mit.edu/pks/lookup?op=get&search=0xB9CD9B76E1F54DB7)
or find it [below](#cve-public-gpg-key), and email us at `cve@gitlab.com`.

## CVE Public GPG Key

 * `GitLab CVE <cve@gitlab.com>`
 * ID: B9CD9B76E1F54DB7
 * Fingerprint 5C82114264C00F79BE81BC6CB9CD9B76E1F54DB7

```
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=UkYZ
-----END PGP PUBLIC KEY BLOCK-----
```
