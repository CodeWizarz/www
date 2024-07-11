---
title: "GitLab Patch Release: 10.7.3"
categories: releases
author: Filipa Lacerda
author_gitlab: filipa
author_twitter: FilipaLacerda
description: "GitLab 10.7.3 patch release resolves a number of regressions and bugs in 10.7 release."
tags: patch releases, releases
---

Today we are releasing version 10.7.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 10.7 release](/releases/2018/04/22/gitlab-10-7-released/) and
prior versions.

<!-- more -->

## GitLab Community Edition and Enterprise Edition

Available in GitLab Libre, Starter, Premium, and Ultimate:

- [Fixed wrong avatar URL when the avatar is on object storage.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18092)
- [Fix errors on pushing to an empty repository.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18462)
- [Update `doorkeeper` to 4.3.2 to fix GitLab OAuth authentication.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18543)
- [Ports `omniauth-jwt` gem onto GitLab OmniAuth Strategies suite.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18580)
- [Fix redirection error for applications using OpenID.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/!18599)
- [Fix commit trailer rendering when Gravatar is disabled.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18586)
- [Fix `file_store` for artifacts and lfs when saving.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18624)
- [Fix users not seeing labels from private groups when being a member of a child project.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/18544)

Available in GitLab Starter, Premium, and Ultimate:

- [Geo - Fix undefined method pending_delete for nil class.](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5470)
- [Geo: Admin page will not crash with 500 because of InvalidSignatureTimeError.](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5495)
- [Fix DB LB errors when escaping input.](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/5481)

## Omnibus GitLab
- [Add support for the -daemon-inplace-chroot command-line flag to GitLab Pages](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2483)

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
