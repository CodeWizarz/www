---
title: "GitLab 8.17.1 released"
description: "Learn more about GitLab Release 8.17.1 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/02/28/gitlab-8-dot-17-dot-1-released/"
author: James Lopez
author_gitlab: jameslopez
author_twitter: jlopezofficial
categories: releases
---

Today we're releasing version 8.17.1 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in the [recent 8.17
release](/releases/2017/02/22/gitlab-8-17-released/).

If you're wondering what happened to the packages `8.17.1+(ce|ee).0` and
`8.17.1+(ce|ee).1`, good eye! The first version was accidentally packaged with
some Javascript tooling errors that we tried to fix in the `.1` version but
there was an error tagging the release. The correct packages are `8.17.1+ce.2`
and `8.17.1+ee.2` now.

Please read on for more details.

<!-- more -->

- **CE/EE:** Utilize bundler-ready Vue distribution ([!9357])
- **CE/EE:** Improve performance of User Agent Detail ([!9129])
- **CE/EE:** Fix the commit search UI ([!9411])
- **CE/EE:** Spam check and reCAPTCHA improvements ([!9248])
- **CE/EE:** Fix issue where files on a fork could not be edited ([!9349])
- **CE/EE:** Create compare object with default branch when target branch is missing ([!9263])
- **CE/EE:** Chat slash commands show labels correctly ([!9408])
- **CE/EE:** Added tooltip to add issues button on issue boards ([!9142])
- **CE/EE:** Upgrade GitLab Pages to v0.3.2 ([!9474])
- **CE/EE:** Disable unused tags count cache for Projects, Builds and Runners ([!9467])
- **CE/EE:** Fix MR changes tab size count ([!9091])
- **CE/EE:** Allow searching issues for strings containing colons ([!9400])
- **CE/EE:** Query performance regression fix affecting "Dashboard::ProjectsController#index.atom" ([!9526])
- **CE/EE:** Replace setInterval with setTimeout to prevent highly frequent requests ([!9271])
- **CE/EE:** Disable invalid service templates ([!8850])
- **EE:** Squash default ([!1272])
- **EE:** Don't try to update a project's external service caches on a secondary Geo node ([!1273])
- **EE:** Chat slash commands show labels correctly ([!1280])
- **EE:** Fix admin email notification recipient group select list ([!1277])
- **EE:** remove Turbolinks from lockfile.js, do page refresh instead ([!1299])
- **EE:** Add repository storage field back to projects API ([!1300])
- **EE:** Improve error messages when squashing fails ([!1318])
- **EE:** Re-compile merge request Vue app after jQuery ajax ([!1264])

[!9357]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9357
[!9129]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9129
[!9411]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9411
[!9248]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9248
[!9349]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9349
[!9263]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9263
[!9408]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9408
[!9142]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9142
[!9474]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9474
[!9467]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9467
[!9091]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9091
[!9400]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9400
[!9526]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9526
[!9271]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9271
[!8850]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8850
[!1272]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1272
[!1273]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1273
[!1280]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1280
[!1277]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1277
[!1299]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1299
[!1300]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1300
[!1318]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1318
[!1264]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1264

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
