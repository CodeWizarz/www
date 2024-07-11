---
title: "GitLab 8.16.6 released"
description: "Learn more about GitLab Release 8.16.6 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/02/17/gitlab-8-dot-16-dot-6-released/"
author: DJ Mountney
author_gitlab: twk3
author_twitter: twk3
categories: releases
---

Today we're releasing version 8.16.6 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in the [recent 8.16
release](/releases/2017/01/22/gitlab-8-16-released/).

Please read on for more details.

<!-- more -->

- **CE/EE:** API: Fix file downloading. ([!8953])
- **CE/EE:** Reduce hits to LDAP on Git HTTP auth by reordering auth mechanisms. ([!8752])
- **CE/EE:** Fix filtered search user autocomplete for gitlab instances that are hosted on a subdirectory. ([!8891])
- **CE/EE:** Fix wrong call to ProjectCacheWorker.perform. ([!8910])
- **CE/EE:** Remove unnecessary queries for .atom and .json in Dashboard::ProjectsController#index. ([!8956])
- **CE/EE:** Fix broken anchor links when special characters are used. ([!8961])
- **CE/EE:** Do not display deploy keys in user's own ssh keys list. ([!9024])
- **CE/EE:** Show merge errors in merge request widget. ([!9229])
- **CE/EE:** Don't delete assigned MRs/issues when user is deleted. ([!8634])
- **CE/EE:** Refresh authorizations when transferring projects. ([!9029])
- **CE/EE:** Don't use backup Active Record connections for Sidekiq. ([!9001])
- **CE/EE:** Check public snippets for spam. ([!8911])
- **EE:** Read true-up info from license and validate it. ([!1159])
- **EE:** Geo: send the new event type with the backfill function. ([!1157])
- **EE:** Move RepositoryUpdateRemoteMirrorWorker jobs to project_mirror Sidekiq queue. ([!1234])
- **EE:** Fixed merge request environment link not displaying. ([!1154])
- **EE:** Reduce queries needed to check if node is a primary or secondary Geo node. ([!1178])
- **EE:** Make sure ssh_keygen creates the directory first ([!1249])

[!8953]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8953
[!8752]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8752
[!8891]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8891
[!8910]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8910
[!8956]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8956
[!8961]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8961
[!9024]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9024
[!9229]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9229
[!8634]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8634
[!9029]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9029
[!9001]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9001
[!8911]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8911
[!1159]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1159
[!1157]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1157
[!1234]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1234
[!1154]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1154
[!1178]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1178
[!1249]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1249


## Upgrade barometer

This version includes a migration that adds an index concurrently and should
not require any downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`
file](http://doc.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/pricing/).

Access to GitLab Enterprise Edition is included with a [subscription](/pricing/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
