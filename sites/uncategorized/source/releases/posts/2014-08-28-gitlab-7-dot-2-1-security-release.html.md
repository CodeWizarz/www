---
title: "GitLab 7.2.1 Security Release"
description: "Learn more about GitLab Release 7.2.1 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2014/08/28/gitlab-7-dot-2-1-security-release/"
date: 2014-08-28
categories: releases
author: Jacob Vosmaer
---

Today we released GitLab Community Edition 7.2.1 and GitLab Enterprise Edition
7.2.1. This is a security release which remedies an XSS vulnerability in
GitLab. In addition to this 7.2.1 makes the tag-to-label migration for users
upgrading from GitLab 7.1 and earlier more
robust.

## Affected versions

This XSS vulnerability affects GitLab 7.2.0 and earlier.

## Impact

The vulnerability patched by this release allows an attacker to carry out a
cross-site scripting (XSS) attack against users with a session on an affected
GitLab server. In order to exploit this vulnerability, the attacker needs to
have commit access to a repository on the affected GitLab server.

## Upgrading

Omnibus-gitlab packages for GitLab 7.2.1 are [now
available](/install/). To upgrade an installation
from source please use the
[upgrader](http://doc.gitlab.com/ce/update/upgrader.html) or the [patch update
guide](http://doc.gitlab.com/ce/update/patch_versions.html).

## Acknowledgments

We would like to thank [Jakub Zoczek](http://zoczus.blogspot.com/) for his
responsible disclosure of this issue to us.

_Update 2014-08-28 18:02 CEST:_ Add affected version and acknowledgments.

_Update 2014-08-28 18:07 CEST:_ Add link to GitHub issue for the label migration.
