---
title: "GitLab Patch Release: 11.8.2"
categories: releases
author: Yorick Peterse
author_gitlab: yorickpeterse
author_twitter: yorickpeterse
description: "GitLab 11.8.2 is released"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 11.8.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in [this month's 11.8.0
release](/releases/2019/02/22/gitlab-11-8-released/) and prior versions.

## GitLab Community Edition and Enterprise Edition

* [Docs review: MR diffs external storage](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/25433)
* [Remove padding for mr-widget-section](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/25475)
* [Update minimum ruby version to 2.5.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/25496)
* [Properly handle multiple X-Forwarded-For addresses in runner IP](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/25511)
* [Allow `:read_list` when `:read_group` is allowed](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/25524)
* [Fix method to mark a project repository as writable](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/25546)
* [Resolve "Gitlab Project import fails: sidekiq undefined method import_jid"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/25239)
* [Remove feature_flags_environment_scope feature flag](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/9588)
* [Fix GroupSAML metadata feature flag](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/9602)
* [Fix typo in Roadmap sorting causing scrolling to fail on null dates](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/9604)
* [Compute approved approver for merged MR if it is absent](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/9648)
* [Fix multiple approval rules license level](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/9653)
* [Fix bridge jobs than can be hidden keys too](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/9796)
* [Fix Approval UI showing up for free plan](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/9819)
* [Resolve "Add "No approval required" state to approval rules MR component"](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/9899)

### Security fix

#### Public project in a private group makes the group page publicly accessible

Sharing a public project with a private group makes the group page publicly accessible. The issue is now mitigated in the latest release and is assigned [CVE-2019-9732](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9732).

#### Versions Affected

Affects GitLab CE/EE 10.0.3 and later.

#### Remediation

We **strongly recommend** that all installations running an affected version to be upgraded to the latest version as soon as possible.

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
