---
title: "GitLab Patch Release: 11.9.1"
categories: releases
author: Alex Hanselka
author_gitlab: ahanselka
author_twitter: gitlab
description: "GitLab 11.9.1 released"
tags: patch releases, releases
---

Today we are releasing version 11.9.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 11.9.0 release](/releases/2019/03/22/gitlab-11-9-released/).

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

* [Resolve "Z-Index Issue on Pipeline Dropdown"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26274)
* [Add option to whitelist _html fields from attributes on CacheMarkdownField](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26374)
* [Fix duplicated bottom match line](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26402)
* [Allow users to create protected branches via CLI](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26413)
* [Resolve "Android template is missing .gitlab-ci.yml"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26415)
* [Refresh commit count after repository head changes](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26473)
* [Set proper default-branch on GitHub Import](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/26476)


Available in GitLab Starter, Premium, and Ultimate:

* [Remove `feature_flag_audit` feature flag](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/9949)
* [Fix date save for Epic to reflect on UI immediately after save](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/10321)


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
