---
title: "GitLab Patch Release: 13.1.4"
categories: releases
author: Yorick Peterse
author_gitlab: yorickpeterse
author_twitter: yorickpeterse # please use gitlab if you don't want to use your own
description: "GitLab releases 13.1.4"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 13.1.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in [last month's 13.1
release](/releases/2020/06/22/gitlab-13-1-released/) and prior versions.

## GitLab Community Edition and Enterprise Edition

* [Resolve "Merge request approval button style inadvertently changed"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/35213)
* [Enable code_navigation for feature specs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/35309)
* [Document the doctor:secrets rake task](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/35393)
* [Fix conflict on the migration that adds routes for orphaned projects](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/35425)
* [Fix existing repository_storages_weighted migrations](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/35814)
* [Fix error 500s creating new projects due to empty weights](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/35829)
* [Fix gitlab:\*:check Rake tasks](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/35944)
* [Geo - Does not sync LFS objects from fork networks](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/35692)

## Omnibus GitLab

* [Ensure we are properly restarting the unicorn service](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4354)
* [Absolute SSL path should work for postgres recipe](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4356)
* [Run vacuumdb with 2 commands simultaneously](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4373)

## Gitaly

* [Add GL_PROJECT_PATH for custom hooks ](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/2313)

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
