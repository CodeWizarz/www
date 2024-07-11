---
title: "GitLab 5.4 released"
description: "Learn more about GitLab Release 5.4 new features and improvements."
canonical_path: "/releases/2013/07/22/gitlab-5-dot-4-released/"
date: 2013-07-22 14:21
categories: releases
community: true
---

### GitLab 5.4 released

Hi everyone!

Today we release GitLab v5.4. There are not many new features because we are getting close to GitLab v6.0 (to be released on August 22). Nevertheless we hope you will enjoy the tracking of participants in Issues, email notifications for mentions and the ability to edit comments!

### The 3 most important improvements in GitLab 5.4

1. Edit Comments
2. Show Issue Participants

    [![screenshot](/images/5_4/edit_and_participants.png)](/images/5_4/edit_and_participants.png)

3. Notifications for mentioned users

This release's most valuable person (MVP) is __Javier Castro__ for contributing the issue participant notification feature. Thanks Javier!

<!-- more -->

### Changes

New Features:

  * Ability to edit own comments
  * Allow project imports via git:// URLs
  * Show participants on issues, including mentions
  * Notify mentioned users with email

Improvements:

  * Documentation improvements
  * Improve dashboard projects page
  * GitLab Markdown help page
  * Increase snippet content column size

Fixed:

  * Fixed nav for empty repos
  * Fix PostgreSQL database restoration problem
  * Misspelling fixes

API:

  * Added client list to API doc

Other:

  * Added support of unicorn and fog gems

- - -

_This release should be an easy upgrade from 5.3. Please use the upgrade guide doc :)_

- - -



### Links

For new setup follow [Setup Guide](https://github.com/gitlabhq/gitlabhq/blob/5-4-stable/doc/install/installation.md)

__For update instructions see [Update Guide](https://about.gitlab.com/update/)__

No time to upgrade or maintain Gitlab yourself? GitLab.com offers [upgrade consulting services](http://www.gitlab.com/consultancy/) and [support subscriptions](/pricing/).
