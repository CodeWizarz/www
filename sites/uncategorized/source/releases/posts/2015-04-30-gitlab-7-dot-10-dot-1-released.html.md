---
title: "GitLab 7.10.1 Released"
description: "Learn more about GitLab Release 7.10.1 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2015/04/30/gitlab-7-dot-10-dot-1-released/"
date: 2015-04-30
categories: releases
author: Job van der Voort
author_twitter: Jobvo
---

We've just released GitLab 7.10.1 (CE, EE and CI).

This patch release removes `GroupMembers` that have `nil` as group from the database, for both
GitLab CE and EE.

<!-- more -->

## Upgrade barometer

There is a small migration in the patch that'll only take a few milliseconds to run.
This patch can be performed online if you're coming from 7.10.

## Upgrading

See our [upgrade page](/update/).

## Enterprise Edition

Omnibus packages for GitLab Enterprise Edition 7.10.1 are available for subscribers [here](https://gitlab.com/subscribers/gitlab-ee/blob/master/doc/install/packages.md). For installations from source, use [this guide](https://gitlab.com/subscribers/gitlab-ee/blob/master/doc/update/patch_versions.md).

Interested in GitLab Enterprise Edition?
For an overview of feature exclusive to GitLab Enterprise Edition please have a look at the [features exclusive to GitLab EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a [subscription](/pricing/).
No time to upgrade GitLab yourself?
A subscription also entitles to our upgrade and installation services.
