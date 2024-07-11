---
title: "GitLab Patch Release: 9.3.1"
author: Clement Ho
author_gitlab: ClemMakesApps
author_twitter: ClemMakesApps
categories: releases
description: "GitLab 9.3.1 patch release resolves a number of regressions and bugs in 9.3"
tags: patch releases, releases
---

Today we're releasing version 9.3.1 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in [this month's 9.3 release](/releases/2017/06/22/gitlab-9-3-released/).

Please read on for more details.

<!-- more -->

- **CE/EE:** Fixes ctrl+enter not submit issue edit form ([!12422])
- **CE/EE:** Perform project housekeeping after importing projects ([!12323])
- **CE/EE:** Resolve "Replace 'Settings ➔ CI/CD Pipelines' with 'Settings ➔ Pipelines' in docs" ([!12433])
- **CE/EE:** Don't match tilde and exclamation mark as part of requirements.txt package name ([!12431])
- **CE/EE:** Fix breadcrumb order ([!12322])
- **CE/EE:** Fix 500 on failure to create a private group ([!12394])
- **CE/EE:** Encode Gitaly diff patches properly ([!12368])
- **CE/EE:** Add padding to target branch container ([!12353])
- **CE/EE:** Remove layout nav from scroll calculation ([!12399])
- **CE/EE:** Fix offset for fixed nav ([!12365])
- **CE/EE:** Resolve ""Add Members" drop-down doesn't separate Name/Username" ([!12376])
- **CE/EE:** Fix mobile environment detail view ([!12382])
- **CE/EE:** Fix dropdown position for the new button on mobile for the top navbar ([!12388])
- **CE/EE:** Fix linking to line number on parallel diff creating empty discussion box ([!12332])
- **CE/EE:** Resolve "Can't sort Groups" ([!12204])
- **CE/EE:** Resolve "Rename settings panel "close" action to "collapse" to avoid confusion" ([!12027])
- **CE/EE:** don't show "Someone edited the issue" warning when saving issue ([!12371])
- **CE/EE:** Only show gray footer space if environment actions exist ([!12315])
- **CE/EE:** Update templates for 9.3 ([!12041])
- **CE/EE:** Update dependencies list for 9.3 ([!12042])
- **CE/EE:** Update guide for 9.3 ([!12038])
- **EE:** Add CE-to-EE guide for 9.3 ([!2101])
- **EE:** Remove "Write to authorized_keys file" setting while it is being fixed ([!2257])
- **Omnibus:** Ensure the postgresql user is created for use in the postgres exporter ([!1669])
- **Omnibus:** Use the new `gettext:compile` script to process PO files ([!1666])

[!12422]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12422
[!12323]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12323
[!12433]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12433
[!12431]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12431
[!12322]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12322
[!12394]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12394
[!12368]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12368
[!12353]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12353
[!12399]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12399
[!12365]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12365
[!12376]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12376
[!12382]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12382
[!12388]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12388
[!12332]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12332
[!12204]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12204
[!12027]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12027
[!12371]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12371
[!12315]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12315
[!12041]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12041
[!12042]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12042
[!12038]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12038
[!2101]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2101
[!2257]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2257
[!1669]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1669
[!1666]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1666

## SSH key issue

The "Write to authorized_keys file" setting that was added in 9.3.0 has been
[temporarily removed](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2257)
while it is being fixed, but installations that were upgraded to 9.3.0 may have
an out-of-date authorized_keys file. It can be rebuilt with
[the rake task](https://docs.gitlab.com/ee/administration/raketasks/maintenance.html#rebuild-authorized_keys-file).

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
EE](/pricing/).

Access to GitLab Enterprise Edition is granted by a [subscription](/stages-devops-lifecycle/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
