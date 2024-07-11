---
title: "GitLab 8.0.5 Released"
description: "Learn more about GitLab Release 8.0.5 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2015/10/14/gitlab-8-dot-0-dot-5-released/"
date: 2015-10-14
categories: releases
author: GitLab
author_twitter: gitlab
---

Today we are releasing version 8.0.5 for Community Edition (CE) and Enterprise
Edition (EE).

It includes the following fixes:

- **CE/EE**: Correct lookup-by-email for LDAP logins
- **EE**: "Multi-project" and "Treat unstable builds as passing" parameters for
  the Jenkins CI service are now correctly persisted.
- **EE**: Correct the build URL when "Multi-project" is enabled for the Jenkins
  CI service.

<!-- more -->

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`
file](http://doc.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition?
Check out the [features exclusive to GitLab EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a [subscription](http://www.gitlab.com/pricing).
No time to upgrade GitLab yourself?
Subscribers receive upgrade and installation services.
