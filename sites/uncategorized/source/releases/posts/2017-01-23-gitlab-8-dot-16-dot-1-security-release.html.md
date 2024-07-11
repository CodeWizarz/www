---
title: "GitLab 8.16.1, 8.15.5, 8.14.7, and 8.13.12 Security Release"
description: "Learn more about GitLab Release 8.16.1, 8.15.5, 8.14.7, and 8.13.12 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/01/23/gitlab-8-dot-16-dot-1-security-release/"
author: Robert Speicher
author_twitter: rspeicher
author_gitlab: rspeicher
categories: releases
---

Today we are releasing versions 8.16.1, 8.15.5, 8.14.7, and 8.13.12 for GitLab
Community Edition (CE) and Enterprise Edition (EE).

These versions contain important security fixes, and we recommend that all
affected GitLab installations be upgraded to one of these versions.

<!-- more -->

## Prevent users from creating notes on resources they can't access

An attacker was able to use the API to post comments on resources that they
would not otherwise be able to view, which would "subscribe" them to the
notifications for that resource and allow them to receive future updates about
it, which may contain sensitive information. See
[#26249](https://gitlab.com/gitlab-org/gitlab-ce/issues/26249) and
[#26250](https://gitlab.com/gitlab-org/gitlab-ce/issues/26250) for more details.

## Prevent users from deleting system deploy keys via the project deploy key API

An attacker was able to delete a system-level deploy key by deleting it from a
project they owned via the Deploy Key API. See
[#26243](https://gitlab.com/gitlab-org/gitlab-ce/issues/26243) for more details.

## Ensure export files are removed after a namespace is deleted

If a user performed a project export and then deleted (or moved) its containing
namespace, an attacker could claim the namespace and access the existing project
export if less than an hour had passed. We now ensure that project exports are
immediately removed along with the namespace. See
[#26242](https://gitlab.com/gitlab-org/gitlab-ce/issues/26242) for more details.

Thanks to [Jobert Abma](https://twitter.com/jobertabma) of
[HackerOne](https://hackerone.com/jobert) for responsibly disclosing these
issues to us.

## Upgrade omniauth gem to 1.3.2

OmniAuth 1.3.1 improperly stored POST data in callback parameters. See [the
issue](https://gitlab.com/gitlab-org/gitlab-ce/issues/26813) for more details.

## Upgrade barometer

These versions have no migrations and should not require any downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`
file](http://doc.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a [subscription](/pricing/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
