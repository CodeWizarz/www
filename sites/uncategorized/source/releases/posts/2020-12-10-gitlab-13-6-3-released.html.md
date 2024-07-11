---
title: "GitLab Patch Release: 13.6.3"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "GitLab releases 13.6.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 13.6.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.6 release](/releases/2020/11/22/gitlab-13-6-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Fix error 500s creating projects concurrently](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/48571)
* [Fix container_registry url for relative urls](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/48661)
* [Resolve Members page 500 error after Invitation sent via API](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/48937)
* [Resolve ""400 Bad Request" during authentication due to password format (length or special chars)"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/49044)
* [Fix pages object storage bucket](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/49251)
* [Fix MR rendering issue when user is tool admin](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/49258)
* [Fix Unicorn custom socket not being used by Workhorse](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4778)
* [Fix image used for SLES 12.5 tag builds](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4825)

## Important notes on upgrading

This version does not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

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
