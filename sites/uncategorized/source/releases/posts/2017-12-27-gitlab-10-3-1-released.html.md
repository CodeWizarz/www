---
title: "GitLab Patch Release: 10.3.1"
categories: releases
author: Tiago Nuno Lopes Sarmento Botelho
author_gitlab: tiagonbotelho
author_twitter: tiagonbotelho
description: "GitLab 10.3.1 patch release resolves a number of regressions and bugs in 10.3.0"
tags: patch releases, releases
---

Today we are releasing version 10.3.1 for GitLab Community Edition (CE) and Enterprise Editions (EES, EEP).

This version resolves a number of regressions and bugs in
[this month's 10.3.0 release](/releases/2017/12/22/gitlab-10-3-released/) and
prior versions.

<!-- more -->

## Bug fixes for Community and Enterprise Editions

- **CE/EES/EEP:** [Fix Error 500s with anonymous clones for a project that has moved.][!16128]
- **CE/EES/EEP:** [Don't link LFS-objects multiple times.][!16006]
- **CE/EES/EEP:** [Reduce cardinality of some of GitLab's Prometheus metrics and fix observed duration reporting.][!15881]
- **CE/EES/EEP:** [Execute project hooks and services after commit when moving an issue.][!16108]
- **CE/EES/EEP:** [Fix cluster environment missing.][!15973]
- **CE/EES/EEP:** [Use Concurrent::AtomicReference instead AtomicFixnum][!16138]

## Bug fixes for Enterprise Editions

- **EES/EEP:** [Geo: Show sync percent on bar graph and count within tooltips.][gitlab-ee!3794]

## Bug fixes for Omnibus GitLab

- [Make it possible to configure an external Geo tracking database.][omnibus-gitlab!2140]
- [Process reconfigure failures and print out a message.][omnibus-gitlab!2157]
- [Remove unused redis bin gitlab-shell configuration.][omnibus-gitlab!2158]
- [Bump bundled git version to 2.14.3 a2b4bedf.][omnibus-gitlab!2159]
- [Update pgbouncer recipe to better handle initial configuration.][omnibus-gitlab!2165]
- [Render gitaly-ruby memory settings.][omnibus-gitlab!2169]
- [Add a runit service to probe repository storages.][omnibus-gitlab!2137]

[!16128]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16128
[!16006]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16006
[!15881]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15881
[!16108]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16108
[!15973]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/15973
[!16138]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/16138
[gitlab-ee!3794]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/3794
[omnibus-gitlab!2140]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2140
[omnibus-gitlab!2157]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2157
[omnibus-gitlab!2158]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2158
[omnibus-gitlab!2159]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2159
[omnibus-gitlab!2165]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2165
[omnibus-gitlab!2169]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2169
[omnibus-gitlab!2137]: https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/2137

## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Editions

Interested in GitLab Enterprise Editions? Check out the [features exclusive to
EE](/pricing/).

Access to GitLab Enterprise Editions is granted by a [subscription](/stages-devops-lifecycle/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
