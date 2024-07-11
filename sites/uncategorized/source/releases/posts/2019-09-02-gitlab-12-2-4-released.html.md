---
title: "GitLab Patch Release: 12.2.4"
categories: releases
author: John Jarvis
author_gitlab: jarv
author_twitter: gitlab
description: "12.2.4 resolves several issues in the 12.2 release"
tags: patch releases, releases
---

Today we are releasing version 12.2.4 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 12.2.3 release](/releases/2019/08/29/security-release-gitlab-12-dot-2-dot-3-released/)

## GitLab Community Edition and Enterprise Edition

* [Match syntax highlighting theme for line expansion rows](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/31821)
* [Fix issuable sidebar icon of notification disabled](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/32134)
* [Fix N+1 Gitaly calls in /api/v4/projects/:id/issues](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/32171)
* [Removes double '%' in text-box description](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/32178)
* [Add helpers to exactly undo cleanup_concurrent_column_rename](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/32183)
* [Fix Piwik templating](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/32234)
* [Fix snippets API not working with visibility level](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/32286)
* [Update Mermaid to v8.2.6 ](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/32502)
* [Fix permissions check in `RelativeLinkFilter`](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/32448)

## GitLab Enterprise Edition

* [Fix group hooks not firing in PostReceive](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/15598)

## Omnibus GitLab

* [Update Mattermost to 5.13.3](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/3551)

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

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
