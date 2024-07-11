---
title: "GitLab Patch Release: 13.8.1"
categories: releases
author: Alessio Caiazza
author_gitlab: nolith
author_twitter: nolith
description: "GitLab releases 13.8.1"
tags: patch releases, releases
---
Today we are releasing version 13.8.1 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 13.8 release](/releases/2021/01/22/gitlab-13-8-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Fix LFS not working with S3 specific-storage settings](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/52296)
- [Skip the auth settings for pages when access control is not enabled](https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/4952)
- [Fix missing setting LDAP servers](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/52512)
- [Add notification email event for SAML/SCIM](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/51760)
- [Create What's New for 13.8](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/51761)
- [Clean up artifact expiry migration problem](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/51821)
- [Resolve "Update Approval Rule documentation"](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/51830)
- [Docs: Reviewer approval rules](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/51979)

Available in [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/):

- [Fix browser performance widget issue body import](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/52088)
- [Geo: clarify how to migrate single PostgreSQL to Patroni on secondary node](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/51775)

Available in GitLab Ultimate:

- [Failsafe access to current user's email](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/52069)

## Important notes on upgrading

This version does include new migrations, and for multi-node deployments, [should not require any downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime).

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
