---
title: "GitLab Patch Release: 10.8.1"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: may_cabrera
description: "GitLab 10.8.1 patch release resolves a number of regresssions and bugs in 10.8 release."
tags: patch releases, releases
---

Today we are releasing version 10.8.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 10.8 release](/releases/2018/05/22/gitlab-10-8-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Fixes runtime errors related to modifying frozen strings](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19039)
- [Fixes wrong value on CI_DEPLOY_USER environment variable](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19047)
- [Handle connection errors on environment's prometheus clients properly](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18989)
- [Fixes error when deleting an empty list of refs](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19053)
- [Fix system hook not firing for blocked users when LDAP sign-in is used](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18930)
- [Makes `GenericCommitStatus` responds to `Presentable` methods](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18979)
- [Fixes 500 error viewing admin page due to statement timeouts](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18982)
- [Fixes dropdown actions in mini pipeline graphs](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19029)
- [Bump prometheus-client-mmap to 0.9.3](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19085)
- [Fixes IDE file finder ordering](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18948)
- [Fixes web IDE review & commit editors getting into incorrect state](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19038)
- [Render 404 when prometheus adapter is disabled in Prometheus metrics controller](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19110)
- [Fixes upgrade to 10.8.0-ce.0 fails because of AddIndexesToProjectMirrorData](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19109)
- [Fixed U2F authentication when used with LDAP](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19115)

Available in GitLab Starter, Premium, and Ultimate:

- [Add Group's GL.com plan name to payload of system hook](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5724)
- [Fixes dependency scanning report with vulnerability without CVE](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5758)

Available in [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/):

- [Geo: Fixes repo, wiki, and upload replication when renaming a namespace that has subgroups, without hashed storage enabled](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5704)
- [Geo: Verification information section shows incorrect data values for the primary node in Geo admin screen](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5722)
- [Geo: Prevent removing project registry records](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5768)
- [Geo: Exclude tables that start with `pg_` from FDW check](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5777)

## Upgrade barometer

This version includes a new migration that should not require any downtime.
GitLab.com migrations took approximately 0 minutes.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](/pricing/#gitlab-com) to use GitLab's own infrastructure.
