---
title: "GitLab Patch Release: 10.6.4"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: may-cabrera
description: "GitLab 10.6.4 patch release resolves a number of regressions and bugs in 10.6 release."
tags: patch releases
---

Today we are releasing version 10.6.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 10.6 release](/releases/2018/03/22/gitlab-10-6-released/) and
prior versions.

<!-- more -->

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Fix listing commit branch/tags that contain special characters](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18023)
- [Fix certificate misses intermediates validation error](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17992)
- [Reference parsing conflicting with auto-linking](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18045)
- [Fix code quality example documentation](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18053)
- [Remove jump to discussion button on issues page](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18034)
- [Fix promoting labels and milestones copy text](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17726)
- [Fix background pipeline stages migration](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18076)
- [Free open file descriptors and `libgit2` buffers in UpdatePagesService](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18099)
- [Fix wrong error handling in update page service](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18098)
- [Fix 404 in group boards when moving issue between lists](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18064)
- [Override Prometheus service name to fix integration with GitLab.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18206)

Available in GitLab Starter, Premium, and Ultimate:

- [Fix Scoped Boards bug filtering by No Milestone](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4966)
- [Add `Gitlab::ExclusiveLease` to `ObjectStorage#use_file`](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5158)

Available in [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/):

- [Resolve "Multiple clusters: incorrect cluster details injected - environment scope is ignored"](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17904)
- [Geo: Log JID for sync related jobs](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5007)
- [Geo: Fix inconsistent project registry queries](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5171)
- [Geo: Fix project rename when wiki does not exist](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5076)

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

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
