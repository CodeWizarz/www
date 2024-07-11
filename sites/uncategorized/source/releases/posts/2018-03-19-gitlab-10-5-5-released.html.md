---
title: "GitLab Patch Release: 10.5.5"
categories: releases
author: Ian Baum
author_gitlab: ibaum
description: "GitLab 10.5.5 patch release resolves a number of regressions and bugs in 10.5 release"
tags: patch releases
---

Today we are releasing version 10.5.5 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 10.5 release](/releases/2018/02/22/gitlab-10-5-released/).

<!-- more -->

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Fix delete milestone button showing up for all users](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17576)
- [Add index on section_name_id on ci_build_trace_sections table](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17632)
- [Adding missing indexes migrations from taggings table](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17563)
- [Fix code and wiki search results when filename is non-ASCII](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17685)
- [Fix moving local, unhashed upload or pages directories during group transfer](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17658)

Available in [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/):

- [Geo: Fix Wiki resync when Wiki repository does not exist](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4927)

## Omnibus GitLab

- [Resolve "consul service postgresql_service failing on db host - no access to /opt/gitlab/embedded/node"](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2349)

## Upgrade barometer

This version does include new migrations.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/stages-devops-lifecycle/).

Alternatively, [sign up for GitLab.com](/pricing/#gitlab-com)
to use GitLab's own infrastructure.
