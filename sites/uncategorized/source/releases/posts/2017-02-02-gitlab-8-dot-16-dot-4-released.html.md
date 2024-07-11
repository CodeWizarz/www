---
title: "GitLab 8.16.4 released"
description: "Learn more about GitLab Release 8.16.4 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/02/02/gitlab-8-dot-16-dot-4-released/"
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: rspeicher
categories: releases
---

Today we're releasing version 8.16.4 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in the [recent 8.16
release](/releases/2017/01/22/gitlab-8-16-released/).

Please read on for more details.

<!-- more -->

- **CE/EE:** Fix user validation error in Import/Export. ([!8909])
- **CE/EE:** Add settings dropdown to mobile screens. ([!8896])
- **CE/EE:** Fix an issue that prevented LDAP users from logging in with 2FA and U2F.
  ([!8730])
- **CE/EE:** Fix search bar search param encoding. ([!8753])
- **CE/EE:** Associate the “Project name” label with the correct input field in Project
  settings. ([!8795])
- **CE/EE:** Prevent the Profile settings form from submitting twice. ([!8825])
- **CE/EE:** Fix filtering label and milestone with multiple words. ([!8830])
- **CE/EE:** Fixed cancel button in the services form not redirecting back to the
  integrations settings view. ([!8843])
- **CE/EE:** Improve performance of triggered chat commands. ([!8876])
- **CE/EE:** Add project ID index to `project_authorizations` table to optimize queries.
  ([!8890])
- **CE/EE:** Fix permalink discussion note being collapsed. ([!8773])
- **CE/EE:** Fix filtering usernames with multiple words in issues filter. ([!8851])
- **EE:** Disable all merge acceptance buttons pending MR approval. ([!1101])

[!8909]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8909
[!8896]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8896
[!8730]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8730
[!8753]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8753
[!8795]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8795
[!8825]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8825
[!8830]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8830
[!8843]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8843
[!8847]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8847
[!8876]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8876
[!8890]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8890
[!8773]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8773
[!8851]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8851
[!8926]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8926
[!8729]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8729
[!1101]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1101
[!1122]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1122

## Upgrade barometer

This version includes a migration that adds an index concurrently and should
not require any downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`
file](http://doc.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/pricing/).

Access to GitLab Enterprise Edition is included with a [subscription](/pricing/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
