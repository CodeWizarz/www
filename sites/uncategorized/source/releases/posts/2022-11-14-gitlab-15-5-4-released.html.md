---
title: "GitLab Patch Release: 15.5.4"
categories: releases
author: John Skarbek
author_gitlab: skarbek
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 15.5.4"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.5.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.5 release](/releases/2022/10/22/gitlab-15-5-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Add Hashie::Array to allowed YAML serialization classes](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/102663)
* [Allow links to be opened from Swagger UI documentations](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/102845)
* [Revert Sidekiq default routing rules](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/103483)
<!-- {{ MERGE_REQUEST_LIST }} -->

## Important notes on upgrading

GitLab 15.4.0 introduced a default [Sidekiq routing rule](https://docs.gitlab.com/ee/administration/operations/extra_sidekiq_routing.html) that routes all jobs to the `default` queue. For instances using [queue selectors](https://docs.gitlab.com/ee/administration/operations/extra_sidekiq_processes.html#queue-selector), this will cause [performance problems](https://gitlab.com/gitlab-com/gl-infra/scalability/-/issues/1991) as some Sidekiq processes will be idle.

1. The default routing rule has been reverted in this release (15.5.4), so upgrading to this version or later will return to the previous behavior.
1. If a GitLab instance now listens only to the `default` queue (which is not currently recommended), it will be required to add this routing rule back in `gitlab.rb`:

   ```ruby
   sidekiq['routing_rules'] = [['*', 'default']]
   ```

This version does not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Premium and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
