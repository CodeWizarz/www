---
title: "Breaking change: Support for API v3 will be removed June 4"
author: James Ramsay
author_gitlab: jramsay
author_twitter: jamesramsay
categories: company
description: "With the removal of deprecated GitLab API v3 in GitLab 11.0, requests to the API v3 will fail."
tags: news, releases, integrations
---

On June 4, 2018 integrations using API v3 connected to GitLab.com will stop
working. With the release of GitLab 11 on June 22, 2018 the API v3 will be
removed completely. **Update all integrations before June 4 to avoid downtime.**

<!-- more -->

In the GitLab 8.17 release post, we announced the [deprecation of API v3](/releases/2017/02/22/gitlab-8-17-released/), and that support for API
v3 would be dropped in a future release.

Please ensure that you upgrade any integrations to API v4 to avoid any
downtime. Documentation is available for [upgrading from v3 to v4](
https://docs.gitlab.com/ee/api/v3_to_v4.html).

## When will this happen?

The API v3 will be removed in GitLab 11.0 on 22 June, 2018.
Please consider that integrations using API v3 connected to GitLab.com will
stop working as soon as the first RC is deployed to production, and this will
happen around 4 June, 2018. **Update all integrations before this date**.
