---
title: "GitLab Patch Release: 9.5.6"
categories: releases
date: 2017-09-28
author: Jose Ivan Vargas
author_gitlab: jivanvl
author_twitter: jivanvl
description: "GitLab 9.5.6 patch release resolves a number of regressions and bugs in 9.5.5"
tags: patch releases, releases
---

Today we are releasing version 9.5.6 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[this month's 9.5.5 release](/releases/2017/09/18/gitlab-9-dot-5-dot-5-released/) and
prior versions.

It includes the following fixes:

- **CE/EE** Fix MR widget with ready to merge buttons/controls at mobile breakpoint ([!14242])
- **CE/EE** Fix MR widget with external CI services/integrations ([!13977])
- **CE/EE** Update "x/x discussions resolved" checkmark icon to be green when all discussions resolved ([!14255])
- **CE/EE** Upgrade Nokogiri because of CVE-2017-9050 ([!14427])
- **CE/EE** Handle error when fetching ref for MR with deleted source branch ([!14550])
- **EE** Show group tab if member lock is enabled ([!3025])
- **Omnibus CE/EE** Bump ruby version to 2.3.5 for security fixes ([!1930])
- **Omnibus CE/EE** Resolve "update_databases assumes a populated databases.json" ([!1924])
- **Omnibus CE/EE** Resolve "restart repmgrd after node register" ([!1928])
- **Omnibus CE/EE** Resolve "repmgr unregister doesn't accept --node" ([!1927])

[!14242]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14242
[!13977]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13977
[!14255]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14255
[!14427]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14427
[!14550]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14550
[!3025]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3025
[!1930]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1930/
[!1924]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1924/
[!1928]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1928/
[!1927]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1927/

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
