---
title: "GitLab Patch Release: 9.3.6"
categories: releases
author: Clement Ho
author_gitlab: clemmakesapps
author_twitter: clemmakesapps
description: "GitLab 9.3.6 patch release resolves a number of regressions and bugs in 9.3.5"
tags: patch releases, releases
---

Today we are releasing version 9.3.6 for GitLab Community Edition (CE) and Enterprise Edition (EE).

This version resolves a number of regressions and bugs in
[this month's 9.3.5 release](/releases/2017/07/05/gitlab-9-dot-3-dot-5-released/) and
prior versions.

It includes the following fixes:

- **CE/EE:** Username and password are no longer stripped from import url on mirror update ([!12725])
- **CE/EE:** Fixed GFM references not being included when updating issues inline ([!12720])
- **CE/EE:** Update docs to mention that 9.3 also needs `log_bin_trust_function_creators` on MySQL ([!12687])
- **CE/EE:** Fix issues with non-UTF8 filenames by always fixing the encoding of tree and blob paths ([!12636])
- **CE/EE:** Fix API Scoping ([!12300])
- **CE/EE:** Update grpc to 1.4.0 ([!12387])
- **CE/EE:** Extend MR tabs to cover up the avatar holder and collapse icon on scroll ([!12589])
- **CE/EE:** Increase z index of mini pipeline dropdown ([!12767])
- **EE:** Update alpha database documentation to reflect change in attribute ([!2252])
- **EE:** Geo: Fix clone instructions in a secondary node for SSH protocol ([!2319])
- **EE:** Implement progressive elasticsearch indexing for project mirrors ([!2393])

[!12725]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12725
[!12720]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12720
[!12687]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12687
[!12636]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12636
[!12300]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12300
[!12387]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12387
[!12589]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12589
[!12767]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12767
[!2252]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2252
[!2319]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2319
[!2393]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/2393

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
