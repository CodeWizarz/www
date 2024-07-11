---
title: "GitLab Patch Release: 11.11.2"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "GitLab 11.11.2 released."
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 11.11.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 11.11.0 release](/releases/2019/05/22/gitlab-11-11-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Fix height of input groups](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28495)
* [Update SAST.gitlab-ci.yml - Add SAST_GITLEAKS_ENTROPY_LEVEL](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28607)
* [Fix display of promote to group label](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28637)
* [Fix OmniAuth OAuth2Generic strategy not loading](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28680)
* [Use source ref in pipeline webhook](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28772)
* [Disable two_step_rebase feature flag](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/28778)
* [Fix migration failure when groups are missing route](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/29022)

## Gitlab Enterprise Edition

* [Geo: Does not apply selective sync restrictions while counting registries on the tracking database](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/13257)

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
