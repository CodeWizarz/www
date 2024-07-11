---
title: "GitLab Patch Release: 12.4.3"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "12.4.3 resolves several issues in the 12.4 release"
tags: patch releases, releases
---

Today we are releasing version 12.4.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[the 12.4.2 release](/releases/2019/11/04/gitlab-12-4-2-released/) and
prior versions.

* [Update docs on how to enable partial clones](https://gitlab.com/gitlab-org/gitlab/merge_requests/19397)
* [Specify hide dismissed vulnerabilities availability](https://gitlab.com/gitlab-org/gitlab/merge_requests/19507)
* [Fix admin welcome illustration not found](https://gitlab.com/gitlab-org/gitlab/merge_requests/19676)
* [Fix Bitbucket Cloud importer pull request state](https://gitlab.com/gitlab-org/gitlab/merge_requests/19734)
* [Only enable protected paths for POST requests](https://gitlab.com/gitlab-org/gitlab/merge_requests/19184)
* [Remove ES parent relation for project snippets](https://gitlab.com/gitlab-org/gitlab/merge_requests/19715)
* [Update conan docs to say 12.5](https://gitlab.com/gitlab-org/gitlab/merge_requests/19230)

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
