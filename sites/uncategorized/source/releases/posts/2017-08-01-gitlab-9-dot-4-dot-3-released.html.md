---
title: "GitLab Patch Release: 9.4.3"
categories: releases
date: 2017-08-01
author: James Edwards-Jones
author_gitlab: jamedjo
author_twitter: jamedjo
description: "GitLab 9.4.3 patch release resolves a number of regressions and bugs in 9.4.2"
tags: patch releases, releases
---

Today we are releasing version 9.4.3 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[the 9.4.2 release](/releases/2017/07/28/gitlab-9-dot-4-dot-2-released/) and
prior versions.

<!-- more -->

It includes the following fixes:

- **CE/EE:** Fix LDAP authentication to Git repository or container registry ([!13185])
- **CE/EE:** Fix Prometheus client PID reuse bug ([!13130])
- **CE/EE:** Ensure filesystem metrics test files are deleted ([!13080])
- **CE/EE:** Improve deploy environment chatops slash command ([!13150])
- **CE/EE:** Fix asynchronous JavaScript paths when GitLab is installed under a relative URL ([!13165])
- **CE/EE:** Properly affix navigation bar in job view in Microsoft Edge ([!13175])
- **CE/EE:** Fix new navigation breadcrumb title on help pages ([!13151])
- **CE/EE:** Fix badge positioning in new navigation for Firefox ([!13186])
- **CE/EE:** Fix `:focus` styles for selected filter dropdown items ([!13070])
- **CE/EE:** Fix height of issue boards with new navigation ([!12985])
- **CE/EE:** Make issuable search bar full height ([!13046])
- **EE:** Present Related Issues widget for logged-out users when available ([!2525])
- **EE:** Fix `500` error in view when remote mirror `last_update_at` is `nil` ([!2542])
- **Omnibus:** Update Mattermost to `4.0.2`, fixing GitLab SSO for non `en` locales ([!1808])

[!13130]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13130
[!13080]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13080
[!13150]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13150
[!13165]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13165
[!13185]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13185
[!13175]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13175
[!13151]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13151
[!13186]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13186
[!13070]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13070
[!12985]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12985
[!13046]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/13046
[!2525]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2525
[!2542]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2542
[!1808]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1808


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
