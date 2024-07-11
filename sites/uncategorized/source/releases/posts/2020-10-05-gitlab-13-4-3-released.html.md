---
title: "GitLab Patch Release: 13.4.3"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: gitlab
description: "GitLab releases 13.4.3"
tags: patch releases, releases
---

Today we are releasing version 13.4.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.4 release](/releases/2020/09/22/gitlab-13-4-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Ensure nonexistent routes do not redirect to the 2FA page](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/42784)
* [Ensure wikis can be re-enabled after disabling them without an error](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/42910)
* [Limit spam checks to title, description, or confidentiality changes on bot-created issues](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/43463)
* [Use the correct chart for helm command](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/43487)
* [Docs: Fix example manifest.yaml for Kubernetes Agent](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/43490)
* [Fixes store initialization for Productivity Analytics](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/43532)
* [Do not try to copy weight events when promoting an issue](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/43891)
* [Fix large backups not working with Azure Blob storage](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/44233)
* [Geo: Fix scenario where there is a wikis/designs with no repository on the primary](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/43765)
* [Geo: Permanently enable package_file_registries field](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/43434)

## Important notes on upgrading

This version does not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

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
