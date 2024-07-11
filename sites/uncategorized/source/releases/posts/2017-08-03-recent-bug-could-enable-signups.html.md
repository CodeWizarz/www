---
title: "9.3.7 Patch Release Update - Security Addendum"
author: Brian Neel
author_twitter: b0bby_tables
categories: releases
description: "The 9.3.7 patch release contains a bug fix that has been determined to have a security impact."
tags: security, patch releases
---

GitLab 9.3.7 fixed a security problem that was not listed in the [patch release update](/releases/2017/07/18/gitlab-9-dot-3-dot-7-released/). We recommend users on GitLab 9.3.0 to 9.3.6 to upgrade to 9.3.9 or newer.

<!-- more -->

This bug was introduced in GitLab 9.3.0 and can be triggered when an instance loses connectivity to the Redis cluster. In this situation the server may create a new application settings entry in the database using the GitLab defaults. In a worst-case scenario an instance with sign-ups initially disabled may have that setting enabled, allowing users to register.

A fix for this bug was included with GitLab CE+EE versions 9.3.7 and 9.4.0. The fix _does not_ restore any settings that have been reset to defaults. All users running GitLab instances versions 9.3.0 or newer should verify that their application settings are still correct. Users running instances with sign-ups disabled should verify that no unauthorized accounts have been created.

Users running GitLab CE+EE versions prior to 9.3.0 and users of GitLab.com are not affected.

More details can be found in [the issue](https://gitlab.com/gitlab-org/gitlab-ce/issues/34728).

Thanks to [Ramon Smit](https://twitter.com/ramonsmit94) of [DALTCORE](https://twitter.com/DALTCORE) for reporting the full impact of this vulnerability to us.
