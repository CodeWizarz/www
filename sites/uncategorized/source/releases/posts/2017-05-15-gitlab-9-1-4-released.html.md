---
title: "GitLab Patch Release 9.1.4"
author: Felipe Artur
author_gitlab: felipe_artur
author_twitter: FelipeArtur
categories: releases
description: "The GitLab 9.1.4 patch release resolves a number of regressions and bugs in 9.1"
categories: releases
---

Today we're releasing version 9.1.4 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version adds some improvements and resolves a number of regressions and bugs in [the 9.1 release](/releases/2017/04/22/gitlab-9-1-released/).

Please read on for more details.

<!-- more -->

- **CE/EE:** Fixed search terms highlight. ([!11198])
- **CE/EE:** Fixed bug where merge request JSON would be displayed. ([!11096])
- **CE/EE:** Handle incoming emails from aliases correctly. ([!11079])
- **CE/EE:** Sort the network graph both by commit date and topographically. ([!11057])
- **CE/EE:** Handle failures for incoming emails. ([!11014]/[!1810])
- **CE/EE:** Fix error on CI/CD Settings page related to invalid pipeline trigger. ([!10948])
- **CE/EE:** Fix cross referencing for private and internal projects. ([!11243])
- **CE/EE:** Add missing project attributes to Import/Export. ([!10880])
- **EE:** GitLab Geo: Backfill projects where the last attempt to backfill failed. ([!1785])

[!11198]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11198
[!11096]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11096
[!11079]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11079
[!11057]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11057
[!11014]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11014
[!1810]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1810
[!10948]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10948
[!11243]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11243
[!10880]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/10880
[!1785]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1785

## Upgrade barometer

This version has no new migrations and should not require any downtime.

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
