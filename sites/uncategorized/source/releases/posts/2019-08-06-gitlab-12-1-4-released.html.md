---
title: "GitLab Patch Release: 12.1.4"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "This version resolves regressions and bugs in 12.1.4"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 12.1.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[the 12.1.3 release](/releases/2019/07/31/gitlab-12-1-3-released/).

## GitLab Community Edition and Enterprise Edition

* [Add exclusive lease to mergeability check process](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31082)
* [Set DOCKER_TLS_CERTDIR in CI job templates](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31201)
* [Improve job log rendering performance](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31262)
* [Document required quotes in Mermaid subgraph titles](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31312)
* [Use Mermaid Markdown for testing guide docs](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31322)
* [Resolve docker in docker problems](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31417)
* [Fix translation of 'Updated' term in projects list](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/30958)

## GitLab Enterprise Edition

* [Do not send CI quota notifications when quota is unlimited](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/14810)
* [Fix variable mismatch in code quality widget](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/14829)
* [Resolve "400 Bad request when deploying a maven package"](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/14922)


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
