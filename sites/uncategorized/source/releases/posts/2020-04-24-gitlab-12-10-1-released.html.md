---
title: "GitLab Patch Release: 12.10.1"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: rspeicher
description: "GitLab releases 12.10.1"
tags: patch releases, releases
---

Today we are releasing version 12.10.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in [this month's 12.10
release](/releases/2020/04/22/gitlab-12-10-released/) and prior versions.

## GitLab Community Edition and Enterprise Edition

* [Move Group Deploy Tokens to new Group-scoped Repository settings](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/29290)
* [Move project deploy tokens section back to repository settings](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/29280)
* [Migrate dismissals to vulnerabilities](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/29711)
* [Fix requirements permission documentation](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/29714)
* [Add feature flag for merge_ref_head](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/29738)
* [Fix bug creating project from git push through ssh](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/29771)
* [Fix Web IDE deleting newly added files](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/29783)
* [Fix Service Templates missing Active toggle](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/29936)
* [Fix merge requests stuck in checking state](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/30027)
* [Fix null dereference in project_import_status](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/29886)
* [Fix 500 error accessing restricted visibility levels](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/30313)
* [Ensure the pg bin files fallback for geo-postgresql](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4118)
* [Prevent gitlab upgrades from GitLab 11.x](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4138)
* [Fixes Omnibus package HA pg-upgrade scenario](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4146)
* [Print a deprecation notice for postgres upgrades if <11](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4054)

## Upgrade barometer

This version includes one post-deploy migration, but should not require any
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
