---
title: "GitLab Patch Release: 11.1.4"
categories: releases
author: Alessio Caiazza
author_gitlab: nolith
author_twitter: nolith
description: "GitLab 11.1.4 patch release resolves a number of regresssions and bugs in 11.1.2 release."
---

Today we are releasing version 11.1.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 11.1.2 release](/releases/2018/07/26/security-release-gitlab-11-dot-1-dot-2-released/) and
prior versions.

<!-- more -->

We will not release version 11.1.3 due to performance degradations discovered on our staging infrastructure.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Remove timeouts for long running requests](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20810)
- [Fixed IDE not opening JSON files](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20798)
- [Don't overflow project/group dropdown results](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20704)
- [Improve projects indexes](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20377)

Available in GitLab Starter, Premium, and Ultimate:

- [Resolve "bad alignment in merge request widget (code climate, security report, etc.)"](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/6580)

Available in GitLab Ultimate:

- [Resolve "Environments dropdown is showing on the cluster health page"](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/6528)

## Upgrade barometer

To upgrade to GitLab 11.1.4 from the latest 11.1.2 version, no downtime is required. To upgrade without downtime,
please consult the [documentation on downtimeless upgrades](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

This version includes a post-deploy migration.

GitLab.com post-deploy migrations took approximately 20 seconds.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
