---
title: "GitLab Coordinated Security Release: 15.11.3, 15.10.7, 15.9.8"
description: "Learn more about GitLab Security Release: 15.11.3, 15.10.7, 15.9.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)."
canonical_path: "/releases/2023/05/10/security-release-gitlab-15-11-3-released/"
categories: releases
author: Nick Malcolm
author_gitlab: nmalcolm
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 15.11.3, 15.10.7, 15.9.8 for GitLab Community Edition (CE) and Enterprise Edition (EE). This is a coordinated security release, aligning with a disclosure date provided by Git.

These versions contain important security fixes, and we strongly recommend that all GitLab installations be upgraded to one of these versions immediately. GitLab.com is already running the patched version.

GitLab releases patches for vulnerabilities in dedicated security releases. There are three types of security releases: a monthly, scheduled security release, released a week after the feature release (which deploys on the 22nd of each month), ad-hoc security releases for critical vulnerabilities, as well as coordinated security releases. For more information, you can visit our [security FAQ](https://about.gitlab.com/security/faq/). You can see all of our regular and security release blog posts [here](/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public on our [issue tracker](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=created_date&state=closed&label_name%5B%5D=bug%3A%3Avulnerability&confidential=no&first_page_size=100) 30 days after the release in which they were patched.

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action

We **strongly recommend** that all installations running a version affected by the issues described below are **upgraded to the latest version as soon as possible**.

When no specific deployment type (omnibus, source code, helm chart, etc.) of a product is mentioned, this means all types are affected.

## Table of Fixes

|Title|Severity|
|---|---|
|[Smuggling code changes via merge requests with refs/replace](#smuggling-code-changes-via-merge-requests-with-refs-replace)|Medium|

## Smuggling code changes via merge requests with refs/replace

<!-- https://gitlab.com/gitlab-org/security/gitaly/-/issues/11 -->

An issue has been discovered in GitLab affecting all versions before 15.9.8, 15.10.0 before 15.10.7, and 15.11.0 before 15.11.3. A malicious developer could use a git feature called refs/replace to smuggle content into a merge request which would not be visible during review in the UI. This is a medium severity issue (`CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:L/I:H/A:N`, 6.3 Medium). It is now mitigated in the latest release and is assigned [CVE-2023-2181](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-2181).

Thanks [inspector-ambitious](https://hackerone.com/inspector-ambitious) for reporting this vulnerability through our HackerOne bug bounty program.

## Non-security patches 

This security release also includes the following non-security patches.

Into 15.11.3:

* [Restrict bigint cleanup migrations to GitLab.com only](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/119164)
* [Revert migration squash that breaks 15.11](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/119520)
* [[15.11] ci: Fix omnibus trigger target branch for MR targeting stable branches](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/119742)
* [Fix custom template import permission](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/119456)
* [[15.11] Fix for the rebase merge request state being shown incorrectly](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/119374)
* [Back with UNSTRUCTURED_RAILS_LOG environment variable](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/119299)
* [Fix issue description keeping autosave after save](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/120028)

Into 15.10.7:

* [[15.10] ci: Fix omnibus trigger target branch for MR targeting stable branches](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/119744)
* [Fix custom template import permission](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/119452)
* [[15.10] Fix for the rebase merge request state being shown incorrectly](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/119376)

Into 15.9.8:

* [[15.9] ci: Fix omnibus trigger target branch for MR targeting stable branches](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/119746)
* [[15.9] Fix for the rebase merge request state being shown incorrectly](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/119377)

## Updating

To update GitLab, see the [Update page](/update).
To update Gitlab Runner, see the [Updating the Runner page](https://docs.gitlab.com/runner/install/linux-repository.html#updating-the-runner).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
