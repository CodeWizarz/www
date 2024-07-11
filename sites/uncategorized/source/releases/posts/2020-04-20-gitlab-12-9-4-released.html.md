---
title: "GitLab Patch Release: 12.9.4"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: rspeicher
description: "GitLab releases 12.9.4"
tags: patch releases, releases
---

Today we are releasing version 12.9.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 12.9 release](/releases/2020/03/22/gitlab-12-9-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Fix project show file upload not working](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/26828)
* [Fix regression on storage rollback causing repositories to report as 404](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/28496)
* [Fix incorrect regex used in FileUploader#extract_dynamic_path](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/28683)
* [Fix Slack notifications when upgrading from old GitLab versions](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/29111)
* [Update index_options to fix advanced search queries](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/28712)
* [Fully qualify id columns for keyset pagination](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/29026)
* [Geo: Fix repository verification on the primary](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/28893)
* [Upgrade to Git 2.24.2](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4102)

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
