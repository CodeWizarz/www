---
title: "GitLab 7.13.1 released"
description: "Learn more about GitLab Release 7.13.1 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2015/07/23/gitlab-7-dot-13-dot-1-released/"
date: 2015-07-23
categories: releases
author: Valery Sizov
author_twitter: gitlab
---

We've released GitLab 7.13.1 for GitLab CE, EE and CI.

It includes the following fixes for CE:

  - Fix: Label modifications are not reflected in existing notes and in the issue list
  - Fix: Label not shown in the Issue list, although it's set through web interface
  - Fix: Group/project references are linked incorrectly
  - Improve documentation
  - Fix of migration: Check if session_expire_delay column exists before adding the column
  - Fix: ActionView::Template::Error
  - Fix: "Create Merge Request" isn't always shown in event for newly pushed branch
  - Fix bug causing "Remove source-branch" option not to work for merge requests from the same project.

fixes for EE:

  - Merge community edition changes for version 7.13.1
  - Fix: "Rebase before merge" doesn't work when source branch is in the same project

and CI:

  - Security Fix: If user was assigned to project as non-master he could assign specific runners from that project to their own project.
  - Fix: Don't send notifications for jobs with allow_failure set
  - Fix invalid link to doc.gitlab.com

<!-- more -->

## Upgrade barometer

No downtime is necessary.

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition?
For an overview of feature exclusive to GitLab Enterprise Edition please have a look at the [features exclusive to GitLab EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a [subscription](http://www.gitlab.com/pricing).
No time to upgrade GitLab yourself?
A subscription also entitles to our upgrade and installation services.