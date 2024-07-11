---
title: "GitLab Patch Release: 10.0.2"
categories: releases
date: 2017-09-27
author: Jaroslava Kadlecová
author_gitlab: jarka
description: "Gitlab 10.0.2 patch release resolves a number of regressions and bugs in 10.0.1"
tags: patch releases, releases
---

Today we are releasing version 10.0.2 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[this month's 10.0.1 release](/releases/2017/09/24/gitlab-10-dot-0-dot-1-released/) and
prior versions.

<!-- more -->

It includes the following fixes:

- **CE/EE:** Resize comment form after note submit and discard it ([!14401])
- **CE/EE:** Fix rendering double note issue ([!14429])
- **CE/EE:** Ensure that Blob.raw returns always a valid blob object ([!14412])
- **CE/EE:** Remove navbar gradient ([!14457])
- **CE/EE:** Re-allow `name` attribute on user-provided anchor HTML ([!14452])
- **CE/EE:** Fix checks failing with 'undefined method `run_command` in `rake gitlab:check` ([!14469])
- **CE/EE:** Fix PG::UniqueViolation external_email migration ([!14474])
- **CE/EE:** Prevent URL concatenation for avatars ([!14437])
- **CE/EE:** IssueNotes: Switch back to Write pane when note cancel or submit ([!14402])
- **CE/EE:** Fix a dash being rendered in the note's access role ([!14450])
- **CE/EE:** Make locked setting of Runner to not affect jobs scheduling ([!14483])
- **CE/EE:** Avoid wrapping users in dropdown ([!14410])
- **EE:** Fix delta size check to handle commit or nil objects ([!2976])
- **EE:** Fix 500 error due to promote group Web hooks ([!2972])
- **EE:** Add notes on authentication to PG HA document ([!2851])
- **EE:** Send valid project path as name for Jira dev panel ([!3005])
- **EE:** Remove duplicate group boards doc ([!2991])
- **EE:** Point to embedded Consul ([!2980])
- **EE:** Fix internal link in docs([!3003])
- **Omnibus:** Fix an issue where enabling a GitLab Geo role would also disable all default services ([!1963])
- **Omnibus:** Add option to configure redis snapshot frequency ([!1964])
- **Omnibus:** Update pg-upgrade output to be more clear when a bundled PostgreSQL is not in use ([!1962])
- **Omnibus:** Reload consul on config change instead of restarting ([!1966])

[!14401]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14401
[!14429]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14429
[!14412]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14412
[!14457]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14457
[!14452]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14452
[!14469]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14469
[!14474]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14474
[!14437]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14437
[!14402]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14402
[!14450]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14450
[!14483]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14483
[!14410]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14410
[!2976]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2976
[!2972]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2972
[!2851]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2851
[!3005]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3005
[!2991]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2991
[!2980]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2980
[!3003]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3003
[!1963]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1963
[!1964]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1964
[!1962]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1962
[!1966]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1966

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

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/pricing/).

Access to GitLab Enterprise Edition is granted by a [subscription](/stages-devops-lifecycle/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
