---
title: "GitLab Patch Release: 13.3.5, 13.2.9 and 13.1.11"
categories: releases
author: Marin Jankovski
author_gitlab: marin
author_twitter: gitlab
description: "GitLab releases 13.3.5, 13.2.9 and 13.1.11 addressing various regressions"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing versions 13.3.5, 13.2.9 and 13.1.11 for GitLab Community Edition and Enterprise Edition.

These versions are resolving a high severity functionality bug from [earlier security release](/releases/2020/09/02/security-release-gitlab-13-3-3-released/), as well as a number of other earlier regressions.

## GitLab Community Edition and Enterprise Edition

### GitLab 13.3.5

* [Update the 2FA user check to use timestamps](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/41327)
* [Coerce string object storage options to booleans](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/39901)
* [Fix Jira importer user mapping limit](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/40310)
* [Fix auto-deploy-image external chart dependencies](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/40730)
* [Fix ActiveRecord::IrreversibleOrderError during restore from backup](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/40789)
* [Fix wrong caching logic in ProcessRefChangesService](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/40821)
* [Do not set default values for deprecated fdw settings](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4528)
* [Add path helper method for vulnerability todo](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/40935)

### GitLab 13.2.9

* [Update the 2FA user check to use timestamps](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/41327)
* [Fix ActiveRecord::IrreversibleOrderError during restore from backup](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/40789)
* [Update deprecated os messages](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4477)
* [Add rhel 8 to helper and selinux files](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4501)
* [Geo - Create repository updated events when mirrors are updated](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/39295)
* [Fix hanging info/refs cache when error occurs](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/2497)

### GitLab 13.1.11

* [Update the 2FA user check to use timestamps](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/41327)
* [Fix ActiveRecord::IrreversibleOrderError during restore from backup](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/40789)
* [Geo - Create repository updated events when mirrors are updated](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/39295)
* [Fix hanging info/refs cache when error occurs](https://gitlab.com/gitlab-org/gitaly/-/merge_requests/2497)

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
