---
title: "GitLab Patch Release: 13.12.3"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "GitLab releases 13.12.3"
tags: patch releases, releases
---

<!-- For detailed instructions on how to complete this, please see https://gitlab.com/gitlab-org/release/docs/blob/master/general/patch/blog-post.md -->

Today we are releasing version 13.12.3 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[last month's 13.12 release](/releases/2021/05/22/gitlab-13-12-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

* [Fix maven & gradle examples in the docs, enabling line-by-line display of test coverage in merge requests out-of-the-box (for java &
kotlin)](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/62416)
* [Fix issue with frames not loading in Safari](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/62421)
* [Improve SSH key expiration warning emails](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/62496)
* [Add an option to expose `description_html` in Release API [RUN ALL RSPEC] [RUN AS-IF-FOSS]](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/62802)
* [Fix CSP issues related to captchas](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/62849)
* [Set CSP back to disabled by default](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/62961)
* [Fix referrer option passed to Akismet client](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/63117)
* [Fix passing environment variables for migrations](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/5310)

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
