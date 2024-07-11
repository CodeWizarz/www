---
title: "GitLab Patch Release: 15.8.3"
categories: releases
author: Reuben Pereira
author_gitlab: rpereira2
author_twitter: gitlab # please use gitlab if you don't want to use your own
description: "GitLab releases 15.8.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 15.8.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 15.8 release](/releases/2023/01/22/gitlab-15-8-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

<!--
- [Description](GitLab MR LINK)
- [Description](GitLab MR LINK)
-->

* [Deprecate backup upload using Openstack Swift and Rackspace APIs](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/108838)
* [Note about Openstack and Rackspace API removal](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/108849)
* [Updating nav and top level](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/109161)
* [Update feature flag status of GitHub gists feature](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/109297)
* [What's New post for 15.8](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/109386)
* [Add version note to email feature](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/109636)
* [Revert changes on wiki replication/verification legacy code](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/109882)
* [Handle client disconnects better in workhorse](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/109945)
* [Attempt reading schema file instead of a file named `#{report_version}`](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/110886)
* [Upgrade Alert - Add proper API support](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/110934)
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

Access to GitLab Premium and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
