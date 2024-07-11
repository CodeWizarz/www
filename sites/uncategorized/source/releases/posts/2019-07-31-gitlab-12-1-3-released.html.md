---
title: "GitLab Patch Release: 12.1.3"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "12.1.3 resolves several issues in the 12.1 release"
tags: patch releases, releases
---

Today we are releasing version 12.1.3 for GitLab Community Edition and Enterprise Edition.

This version resolves several issues in [this month's 12.1
release](/releases/2019/07/22/gitlab-12-1-released/).

## GitLab Community Edition

* [Fix the project auto devops API](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/30946)
* [Resolve "Can't save pages domain form with Let's Encrypt enabled if current certificate is outdated"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/30995)
* [Ensure SubmoduleHelper works outside view context](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31005)
* [Fix xterm CSS not loading](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31023)
* [Optimise import performance](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31045)
* [Fix incorrect web server selection parameter in init.d script](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31076)
* [Set DOCKER_TLS_CERTDIR in Auto Dev-Ops CI template](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31078)
* [Set DOCKER_TLS_CERTDIR in CI job templates](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31080)
* [Support Docker OCI images](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31127)
* [Fix error rendering submodules in MR diffs when there is no .gitmodules](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31162)
* [Fix pdf.js rendering pages in the wrong order](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31222)
* [Fix exception handling in Gitaly autodetection](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31285)

## GitLab Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

* [Vulnerabilities API now takes optional pipeline_id](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/14376)
* [Add policy for dependencies](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/14561)
* [Filter DependencyList by package_manager](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/14562)
* [Add basic dependencies endpoint](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/14612)
* [Resolve "Bulk editing group issues only works with owner access level"](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/14744)
* [Hide "Buy additional minutes" button for self-managed installs](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/14826)
* [Resolve "Geo - Gitlab::Geo::DatabaseTasks.pending_migrations returns migrations already applied"](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/14831)

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
