---
title: "GitLab Patch Release: 11.10.6"
categories: releases
author: John Jarvis
author_gitlab: jarv
author_twitter: gitlab
description: "This version resolves regressions and bugs in 11.10.5"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 11.10.6 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[the 11.10 release](/releases/2019/06/03/security-release-gitlab-11-dot-11-dot-1-released/)
and prior versions.

## GitLab Community Edition and Enterprise Edition

* [Allow a member to have an access level equal to parent group](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/27913)
* [Fix uploading of LFS tracked file through UI](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28052)
* [Use a path for the related merge requests endpoint](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28171)
* [Add remove_foreign_key_if_exists](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28172)
* [Don't run full gc in AfterImportService](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28239)
* [Fix project visibility level validation](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28305)
* [API: Fix recursive flag not working with Rugged get_tree_entries flag](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28494)
* [Fix height of input groups](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28495)
* [Use source ref in pipeline webhook](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28772)

## GitLab Enterprise Edition

* [Resolve "Removing the project that holds the Insights configuration raises an error"](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/11030)
* [Fix ee/app/assets/javascripts/epic/components/epic_body.vue. Types can not use i18n. See ee/app/assets/javascripts/related_issues/constants.js](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/11312)
* [Fix approvals section when merge requests disabled](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/12070)
* [Use path instead of a URL for accessing approval settings](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/12414)
* [Fix missing expose_path for license api paths](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/12488)

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
