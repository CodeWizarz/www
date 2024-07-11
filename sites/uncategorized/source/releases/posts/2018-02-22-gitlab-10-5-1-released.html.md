---
title: "GitLab Patch Release: 10.5.1"
categories: releases
author: Ian Baum
author_gitlab: ibaum
author_twitter: ibaum_gitlab
description: "GitLab 10.5.1 patch release resolves issue with omnibus-install"
tags: patch releases
---

Today we are releasing version 10.5.1 for GitLab Community Edition (CE) and Enterprise Editions (EES, EEP).

This version resolves a regression in
[this month's 10.5 release](/releases/2018/02/22/gitlab-10-5-released/). This issue only potentially affects instances being upgraded that are using
a non-default value for `git_data_dirs`.

<!-- more -->

## Omnibus:
- [General 500 error after 10.5 update](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/3188)

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

## Updating

To update, check out our [update page](/update/).

## Enterprise Editions

Interested in GitLab Enterprise Editions? Check out the [features exclusive to
EE](/pricing/).

Access to GitLab Enterprise Editions is granted by a [subscription](/stages-devops-lifecycle/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
