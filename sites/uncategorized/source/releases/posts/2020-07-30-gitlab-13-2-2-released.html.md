---
title: "GitLab Patch Release: 13.2.2"
categories: releases
author: Yorick Peterse
author_gitlab: yorickpeterse
author_twitter: yorickpeterse # please use gitlab if you don't want to use your own
description: "GitLab releases 13.2.2"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 13.2.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.2 release](/releases/2020/07/22/gitlab-13-2-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Coerce repository_storages_weighted, removes repository_storages](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/36376)
* [Add issue to iteration docs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/37472)
* [Fix jira import users startAt parameter](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/37492)
* [Better error message for unconfirmed users when using git](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/37944)
* [Handle special cases when mass unconfirming users](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/38024)

## Omnibus GitLab

* [Disable crond if LetsEncrypt disabled](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4434)

## Important notes on upgrading

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
