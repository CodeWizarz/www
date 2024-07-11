---
title: "GitLab Patch Release: 15.4.5"
categories: releases
author: Reuben Pereira
author_gitlab: rpereira2
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 15.4.5"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.4.5 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[September's 15.4 release](/releases/2022/09/22/gitlab-15-4-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

- [gitlab-base: set /tmp sticky, RH bug 2138434 [15.4]](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1199)
- [CI: UBI: cleanup artifacts after completion of tarball [15.4]](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1200)
- [Revert Sidekiq default routing rules](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/103641)
- [Gitaly: add config.toml back, as mock template](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/1149)
<!-- {{ MERGE_REQUEST_LIST }} -->

## Important notes on upgrading

GitLab 15.4.0 introduced a default [Sidekiq routing rule](https://docs.gitlab.com/ee/administration/operations/extra_sidekiq_routing.html) that routes all jobs to the `default` queue. For instances using [queue selectors](https://docs.gitlab.com/ee/administration/operations/extra_sidekiq_processes.html#queue-selector), this will cause [performance problems](https://gitlab.com/gitlab-com/gl-infra/scalability/-/issues/1991) as some Sidekiq processes will be idle.

1. The default routing rule has been reverted in this release (15.4.5), so upgrading to this version or later will return to the previous behavior.
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
