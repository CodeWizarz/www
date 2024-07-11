---
title: "GitLab Patch Release: 12.1.1"
categories: releases
author: John Jarvis
author_gitlab: jarv
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "12.1.1 resolves a bug that sends invalid CI quota violation notifications"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 12.1.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a bug discovered in [this month's 12.1.0 release](/releases/2019/07/22/gitlab-12-1-released/)
which was also described in a [recent GitLab blog post](/releases/2019/07/23/bugin12-1-0/).

## GitLab Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Do not send CI quota notifications when quota is unlimited](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/14810)

_Note: There are no updates for GitLab Community Edition_

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
