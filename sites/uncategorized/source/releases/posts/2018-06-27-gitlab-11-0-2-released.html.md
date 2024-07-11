---
title: "GitLab Patch Release: 11.0.2"
categories: releases
author: Mayra Cabrera
author_gitlab: mayra-cabrera
author_twitter: may_cabrera
description: "GitLab 11.0.2 patch release resolves a number of regresssions and bugs in 11.0 release."
---

Today we are releasing version 11.0.2 for GitLab Community Edition and Enterprise Edition.

This version resolves a number of regressions and bugs in
[this month's 11.0 release](/releases/2018/06/22/gitlab-11-0-released/) and
prior versions.

## GitLab Community Edition and Enterprise Edition

Available in GitLab Core, Starter, Premium, and Ultimate:

- [Adds feature automation for project wiki creation](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19568)
- [Fix: Serve favicon image always from the main GitLab domain to avoid issues with CORS](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19810)
- [Fix diff comment alignment for parallel code additions](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20006)
- [Fix Prometheus installation on Clusters](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20010)
- [Fix navigation bar links get underline style when active](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20035)
- [Fix custom logo rendering improperly on sign-in page](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20037)
- [Skips generation of MO files](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20048)
- [Fix multiple active tabs when Crowd or LDAP is in use](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20049)
- [Allow omnibus to disable sourcemaps in memory constrained environments](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20053)
- [Restore custom hooks for wiki](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20065)
- [Bump sprockets to `3.7.2` to address `CVE-2018-3760`](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20109)
- [Remove top padding on GPG popovers](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20110)
- [Fix notifications when MR becomes unmergeable](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19548)
- [Enforce setting string as value of the CI/CD variable](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20061)
- [Show a reCAPTCHA on signin page if custom header is set](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20076)
- [Notify conflict only for opened/locked merge requests](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20125)
- [Add support for verifying remote uploads, artifacts, and LFS objects in check rake tasks](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19501)
- [Use Go `1.10` for source installations](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/19989)
- [Fix alert button styling so that they don't show up white](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20163)
- [Enable webpack nodeEnv optimization](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20075)
- [Fix sorting by name on explore projects page.](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20162)
- [Fix a performance bottleneck in rendering wiki pages](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/20174)

Available in GitLab Starter, Premium, and Ultimate:

- [Fix admin group plan row alignment](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/6209)
- [Fix multiple active tabs when Crowd or LDAP is in use](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/6215)

Available in [GitLab Premium](/pricing/premium/) and [Ultimate](/pricing/ultimate/):

- [Geo: Fix load balancing configuration not working with Geo tracking database](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/6178)


## Upgrade barometer

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.

