---
title: "GitLab Patch Release: 12.9.2"
categories: releases
author: Marin Jankovski
author_gitlab: marin
author_twitter: gitlab
description: "GitLab releases 12.9.2"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 12.9.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 12.9.0 release](/releases/2020/03/22/gitlab-12-9-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition


* [Index issues on sent_notifications](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/27034)
* [Fix Gatsby project template](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/27538)
* [Ensure import by URL works after a failed import](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/27547)
* [Fix direct access to individual design on deprecated issue route](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/27650)
* [Add issue/MR state string to Project Export](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/27816)
* [Support design notes in url generator](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/27840)
* [Resolve GCS job.log stored with Content-Type invalid/invalid](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/27864)
* [The GitLab Ultimate AWS marketplace listing name has been changed](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4018)
* [Configure logrotate service for puma](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4024)
* [Allow parenthesis to be included in group name](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/28258)
* [Disable archive rate limit by default](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/28264)
* [Fix rake gitlab:setup failing on new installs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/28270)

Available in GitLab Starter, Premium, and Ultimate:

* [Backwards compatible active_users param](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/28241)
* [Send active users in seat link](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/27481)
* [Allow Seat Link to be disabled through admin toggle](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/28416)
* [Add gitlab.rb setting to enable seat_link service](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4042)

## Upgrade barometer

This version includes a new migration adding a new column, and should not require any downtime.

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
