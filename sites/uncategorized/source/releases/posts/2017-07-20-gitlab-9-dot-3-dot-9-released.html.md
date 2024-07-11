---
layout: post
title: "GitLab 9.3.9, 9.2.9, 9.1.9 and 9.0.12 released"
description: "Learn more about GitLab Release 9.3.9, 9.2.9, 9.1.9 and 9.0.12 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/07/20/gitlab-9-dot-3-dot-9-released/"
date: 2017-07-20 23:59
author: GitLab
author_twitter: gitlab
categories: releases
tags: patch releases, releases
---

Today we are releasing versions 9.3.9, 9.2.9, 9.1.9 and 9.0.12 for GitLab Community
Edition (CE) and Enterprise Edition (EE).

These versions contain an important fix that solves an [infinite loop bug](https://github.com/mudge/re2/issues/32)
with the mudge/re2 library. This bug locks up Sidekiq processing for instances using GitLab CI. We **strongly recommend** that all affected GitLab installations be upgraded to one of these versions **immediately**.

For more details, see the [issue regarding the original security vulnerability](https://gitlab.com/gitlab-org/gitlab-ce/issues/24570) and [the events that transpired during the prior release](https://gitlab.com/gitlab-com/support/issues/707#note_35538345).


### Versions affected

- GitLab CE+EE: 9.0.11
- GitLab CE+EE: 9.1.8
- GitLab CE+EE: 9.2.8
- GitLab CE+EE: 9.3.8

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a
[subscription](/pricing/). No time to upgrade GitLab
yourself? Subscribers receive upgrade and installation services.
