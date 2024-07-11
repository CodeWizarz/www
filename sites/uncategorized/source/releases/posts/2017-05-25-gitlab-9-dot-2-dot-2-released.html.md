---
title: "GitLab Patch Release: 9.2.2"
author: Timothy Andrew
author_gitlab: timothyandrew
author_twitter: timothyandrew
categories: releases
description: "GitLab 9.2.2 patch release resolves a number of regressions in 9.2"
---

Today we're releasing version 9.2.2 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in [this month's 9.2 release](/releases/2017/05/22/gitlab-9-2-released/).

Please read on for more details.

<!-- more -->

- **CE/EE:** Improve merge request widget state calculation ([!11668])
- **CE/EE:** Fix right-sidebar gap on mobile ([!11625])
- **CE/EE:** Fix pipeline ETag ([!11615])
- **CE/EE:** Prevent errors from non-functional notify_post_receive endpoint ([!11509])
- **CE/EE:** Read HEAD commit and use it as sentry "releases" value ([!11565])
- **CE/EE:** Use refresh icon for retried jobs ([!11667])
- **CE/EE:** Make all notes use equal padding ([!11616])
- **CE/EE:** Fix ambiguous routing issues by teaching router about reserved words ([!11570])
- **CE/EE:** Show loading indicator while waiting for assignees first fetch ([!11434])
- **EE:** Fix return value when Geo nodes are not in sync ([!1969])
- **EE:** Fixed positioning of milestone dropdown in create board dropdown ([!1972])
- **Omnibus:** Fix cron worker being set to "" when no value was provided ([!1580])

[!11668]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11668
[!11625]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11625
[!11615]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11615
[!11509]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11509
[!11565]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11565
[!11667]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11667
[!11616]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11616
[!11570]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11570
[!11434]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/11434
[!1969]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1969
[!1972]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1972
[!1580]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1580

## Upgrade barometer

This version contains no migrations and should not require any downtime.

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
