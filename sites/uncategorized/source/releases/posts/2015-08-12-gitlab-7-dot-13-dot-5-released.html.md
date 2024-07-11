---
title: "GitLab 7.13.5 released"
description: "Learn more about GitLab Release 7.13.5 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2015/08/12/gitlab-7-dot-13-dot-5-released/"
date: 2015-08-12
categories: releases
author: Valery Sizov
author_twitter: gitlab
---

We reverted changes so that the satellites are now again used for performing git operations like merging MR and editing file with the web-editor. This because the new way to manage this operations didn't trigger webhooks. We will reintroduce the removal of satellites in GitLab 8.0.



<!-- more -->

## Upgrade barometer

This release upgrade will not require downtime

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition?
For an overview of feature exclusive to GitLab Enterprise Edition please have a look at the [features exclusive to GitLab EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a [subscription](http://www.gitlab.com/pricing).
No time to upgrade GitLab yourself?
A subscription also entitles to our upgrade and installation services.