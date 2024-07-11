---
title: "GitLab Patch Release: 10.4.1"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: rspeicher
description: "GitLab 10.4.1 patch release resolves a number of regressions and bugs in 10.4 release"
tags: patch releases
---

Today we are releasing GitLab version 10.4.1.

This version resolves a number of regressions and bugs in [this month's 10.4
release](/releases/2018/01/22/gitlab-10-4-released/).

<!-- more -->

## Bug fixes for Community and Enterprise Editions

- **CE/EES/EEP:** [Ensure that users can reclaim a namespace or project path that is blocked by an orphaned route](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16242)
- **CE/EES/EEP:** [Correctly escape UTF-8 path elements for uploads](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16560)
- **CE/EES/EEP:** [Fix issues when rendering groups and their children](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16584)
- **CE/EES/EEP:** [Fix bug in which projects with forks could not change visibility settings from Private to Public](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16595)
- **CE/EES/EEP:** [Fix Error 500 when repository has no avatar](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16601)
- **CE/EES/EEP:** [Add a confirmation when navigating away from an unsaved inline edit](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16518)
- **CE/EES/EEP:** [Rework indexes on `redirect_routes`](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16211)
- **CE/EES/EEP:** [Remove unnecessary query from labels dropdown](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16520)

## Bug fixes for Enterprise Editions

- **EEU:** [Web IDE is now EEU-only](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4080)
- **EEP:** [Fix route for Geo 'Repair authentication'](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4186)
- **EES/EEP:** [Fix failed LDAP logins when `sync_ssh_keys` is included in config](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/4202)

## Bug fixes for Omnibus GitLab

- **Omnibus:** [Update gitlab-monitor to 2.5.0](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2233)
- **Omnibus:** [Add GitLab pages status page configuration](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2232)

## Upgrade barometer

This version includes one new migration, and should [not require any
downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Editions

Interested in GitLab Enterprise Editions? Check out the [features exclusive to
EE](/pricing/).

Access to GitLab Enterprise Editions is granted by a [subscription](/stages-devops-lifecycle/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
