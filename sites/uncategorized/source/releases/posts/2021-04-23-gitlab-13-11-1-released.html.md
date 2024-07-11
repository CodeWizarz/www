---
title: "GitLab Patch Release: 13.11.1"
categories: releases
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: gitlab
description: "GitLab releases 13.11.1"
tags: patch releases, releases
---

Today we are releasing version 13.11.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.11 release](/releases/2021/04/22/gitlab-13-11-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Change unsubscribe language for email campaign](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/59121)
* [Remove legacy storage key from notification check](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/59199)
* [Documentation about Pages Deployment migration](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/59475)
* [Fix DAST_AUTH_VERIFICATION_URL docs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/59661)
* [Fix Geo replication for incident metrics uploads](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/59674)
* [Fix zero count of vulnerability severity count](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/59680)
* [Add docs about project upload API size enforcement](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/59692)
* [Fix Rake command for Pages deploys to object storage](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/59764)
* [Change search string that does not return results](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/59945)
* [Bump gitlab-exporter to 10.2.0 (fixes Puma crash)](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5181)
* [Update git vendor to gitlab](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5184)

## Important notes on upgrading

This version does not include any new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/) features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
