---
title: "Breaking change: Support for Runners prior to 9.0 will be removed imminently"
author: Fabio Busatto
author_gitlab: bikebilly
author_twitter:
categories: news
twitter_image: '/images/tweets/runners-tweet.png'
description: "With the removal of deprecated CI API v1, runners older than 9.0 will stop working with GitLab 10.0"
tags: releases, news, inside GitLab
---

This month, when we release GitLab 10.0, **deprecated runners will not be able to communicate with the system anymore**, since they rely on an old version of the API that will be removed.
All runners with version 9.0 or newer will continue to work as usual without any modification.
We encourage all of our users who still have old runners deployed to **upgrade them to the latest version as soon as possible** to avoid any downtime.

<!-- more -->

In the GitLab 9.0 release post, we announced that previous runners have been [officially deprecated](/releases/2017/03/22/gitlab-9-0-released/#gitlab-runner-deprecation), and the support for them would have been eventually dropped in a future release.
With another specific [blog post](/releases/2017/04/10/upcoming-runner-changes-for-gitlab-dot-com/) back in April, we also announced that we migrated our shared runners on GitLab.com, and which are the great benefits in upgrading to the latest version, and we started a process to dismiss support for any version prior to 9.0.

## When will this happen?

GitLab 10.0 will be released on September, 22nd. Please consider that old runners connected to GitLab.com will stop working as soon as the first RC gets deployed to production, and this will happen around September 8th.
**Be sure that you upgrade all your runners before that date**.

## Which versions are affected?

All runners with a version older than 9.0 will stop working with GitLab 10.0, as they rely on old API that will be removed in this release. This means that you can continue using your old runners with any GitLab version up to 9.5, even if it is not suggested. Upgrading GitLab to 10.0 or above will require upgrading the runners as well.

## How can I check if I have old runners still active?

If you are an Admin of a GitLab instance, you can find the list of shared runners under **Admin area ➔ Overview ➔ Runners**. Check the **Version** column to find if you have runners older than 9.0.

If you are Owner or Master for a project, go to **Settings ➔ CI/CD** (or **Settings ➔ Pipelines** if you are using the old navigation) and click on each of the runners you may find under **Specific Runners** to see the version.

## How can I upgrade an old runner?

Runners can be upgraded to the latest version following [these instructions](https://docs.gitlab.com/runner/#install-gitlab-runner). After the update, the runner should start working again as before, even better!
