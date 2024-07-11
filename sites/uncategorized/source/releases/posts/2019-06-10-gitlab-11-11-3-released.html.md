---
title: "GitLab Patch Release: 11.11.3"
categories: releases
author: John Jarvis
author_gitlab: jarv
author_twitter: gitlab
description: "GitLab 11.11.3 released."
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 11.11.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[the 11.11.2 release](/releases/2019/06/05/gitlab-11-11-2-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Fix invalid visibility string comparison in project import](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28612)
* [Revert a default GIT_DEPTH for MR pipeline](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28926)
* [Fix connection to Tiller error while uninstalling](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/29131)
* [Revert "Disable retrying cancelled jobs"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/29201)
* [Fix label click scrolling to top](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/29202)
* [Fixes the authorization callback URL for GitHub project imports](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/29234)
* [Make OpenID Connect work without requiring a name](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/29312)
* [Fix OpenID Connect documentation](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/29314)
* [Update Gitaly to 1.42.4](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/29310)

## Gitlab Enterprise Edition

* [Fix create merge request from vulnerability modal regression](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/13524)


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
