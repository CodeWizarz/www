---
title: "GitLab Patch Release: 11.3.3"
categories: releases
author: Bob Van Landuyt
author_gitlab: reprazent
author_twitter: bobvlanduyt
description: "GitLab 11.3.3 patch release resolves a number of regressions and bugs in 11.3."
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 11.3.3 for GitLab Community Edition and
Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 11.3 release](/releases/2018/09/22/gitlab-11-3-released/) and
prior versions.

We've skipped releasing 11.3.2, because we found a [blocking
regression](https://gitlab.com/gitlab-org/gitlab-ce/issues/52171) when
incorrectly picking a change. This has been reverted in 11.3.3.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Fix link to file in the merge request changes tab](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/21727)
- [Fix hidden truncated diff lines not showing when expanded](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/21801)
- [Fix Error 500 when forking projects with Gravatar disabled](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/21985)
- [Fix importing a project that was just exported](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/21875)
- [Fix auto populating project name when creating project via import URL](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/21770)

Available in GitLab Starter, Premium, and Ultimate:

- [Fix resetting default branch to master for push mirrors](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/7454)

Available in [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/):

- [Geo: Fix failing repository verification for multiple shards](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/7474)

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](https://docs.gitlab.com/ee/update/patch_versions.html).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](/pricing/#gitlab-com)
to use GitLab's own infrastructure.
