---
title: "GitLab 7.4.3 Security Release"
description: "Learn more about GitLab Release 7.4.3 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2014/10/30/gitlab-7-4-3-released/"
date: 2014-10-30
categories: releases
author: Valery Sizov
---

Today we released GitLab Community Edition 7.4.3 and GitLab Enterprise Edition
7.4.3. This is a security release which fixes a groups API vulnerability.
Snippet raw view and buildbox integration are fixed with this release as well.

_Update 2014-11-03 10:02 CEST:_ The groups API vulnerability has been assigned the CVE identifier CVE-2014-8540.

## Affected versions

The groups API vulnerability affects GitLab 6.0 and up.

## Impact

The vulnerability patched by this release allows a guest user to delete the owner of a group and to assign any other member as owner through the groups API.

## Upgrading
Omnibus-gitlab packages for GitLab 7.4.3 are [now
available](/install/). To upgrade an installation
from source please use the
[upgrader](http://doc.gitlab.com/ce/update/upgrader.html) or the [patch update
guide](http://doc.gitlab.com/ce/update/patch_versions.html).
