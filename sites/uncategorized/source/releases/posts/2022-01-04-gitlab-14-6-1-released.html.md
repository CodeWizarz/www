---
title: "GitLab Patch Release: 14.6.1"
categories: releases
author: Henri Philipps
author_gitlab: hphilipps
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 14.6.1"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 14.6.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[last month's 14.6 release](/releases/2021/12/22/gitlab-14-6-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Fix re-use of extensions between instances](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/77319)
* [Ignore new line differences when deciding whether to squash MR](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/77429)
* [Drop LetsEncrypt X3 expired root test](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/77454)
* [Fix date-dependent failing spec in export_service_spec.rb](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/77474)
* [Fix an issue with sidekiq starting in docker compose](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/849)
* [Fix the final chown of the rails ubi image](https://gitlab.com/gitlab-org/build/CNG/-/merge_requests/850)
* [Fix sha256 digest of nginx-ingress controller image](https://gitlab.com/gitlab-org/charts/gitlab/-/merge_requests/2333)
* [Fix duplicate NGINX labels](https://gitlab.com/gitlab-org/charts/gitlab/-/merge_requests/2327)
* [Restore loadBalancerIP=global.hosts.externalIP on NGINX Controller Service](https://gitlab.com/gitlab-org/charts/gitlab/-/merge_requests/2317)
<!-- {{ MERGE_REQUEST_LIST }} -->

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
