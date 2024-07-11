---
title: "GitLab Patch Release: 10.6.1"
categories: releases
author: Filipa Lacerda
author_gitlab: filipa
author_twitter: FilipaLacerda
description: "GitLab 10.6.1 patch release resolves a number of regressions and bugs in 10.6 release."
tags: patch releases
---

Today we are releasing version 10.6.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 10.6 release](/releases/2018/03/22/gitlab-10-6-released/) and
prior versions.

<!-- more -->

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Prevent auto-retry `AccessDenied` error from stopping transition to failed](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17862)
- [Fix 500 error when trying to resolve non-ASCII conflicts in the editor](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17962)
- [Add indexes for user activity queries](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17890)
- [Add documentation for Runner IP address](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17837)
- [Don't capture trailing punctuation when autolinking](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/17965)

Available in [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/):

- [Fix LDAP group sync permission override UI](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5003)
- [Hard failing a mirror no longer fails for a blocked user's personal project](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5063)
- [Define a chat responder for the Slack app](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5077)
- [Geo: Avoid rescheduling the same project again in a backfill condition](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5069)
- [Geo: Mark disabled wikis as fully synced.](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5104)
- [Geo: Fix excessive updates to file_registry when wiki is disabled.](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5119)
- [Geo: Recovery from temporary directory doesn't work if the namespace directory doesn't exist](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5100)
- [Geo: Resolve "undefined method 'log_transfer_error'"](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5018)
- [Geo: Log Geo Prometheus metrics from the primary](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5058)

## Omnibus GitLab
- [Pages: if `logformat` set to `json`, do not append timestamps with `svlogd`.](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2387)
- [Downgrade `jemalloc` to 4.2.1 to avoid segfaults in Ruby](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2391)

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

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](/pricing/#gitlab-com)
to use GitLab's own infrastructure.
