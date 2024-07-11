---
layout: post
title: "GitLab 9.4.4, 9.3.10, 9.2.10, 9.1.10, 9.0.13, and 8.17.8 Critical Security Release"
description: "Learn more about GitLab Critical Security Release: 9.4.4, 9.3.10, 9.2.10, 9.1.10, 9.0.13, and 8.17.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/08/10/gitlab-9-dot-4-dot-4-released/"
date: 2017-08-10 18:00
author: GitLab
author_twitter: gitlab
categories: releases
tags: releases, security
---

Today we are releasing versions 9.4.4, 9.3.10, 9.2.10, 9.1.10, 9.0.13, and 8.17.8
for GitLab Community Edition (CE) and Enterprise Edition (EE).

These versions contain two critical security fixes. The first is a security fix
for a vulnerability in `git` that can be exploited in GitLab to execute arbitrary
shell commands. The second security fix addresses the usage of symlinks inside
GitLab Export files that could be used to copy the contents of arbitrary
repositories.

We **strongly recommend** that all affected GitLab installations
be upgraded to one of these versions **immediately**.

*Note: This is a coordinated release with several other companies and projects,
including `git` itself, which is why it is occurring at 18:00 UTC. As those
projects release their updates this release post will be updated with more
information.*

## Other Announcements
- Git: [CVE-2017-1000117](https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1466490.html)
- Apache Subversion: [CVE-2017-9800](https://subversion.apache.org/security/CVE-2017-9800-advisory.txt)
- Mercurial: [CVE-2017-1000116](https://www.mercurial-scm.org/wiki/WhatsNew#Mercurial_4.3_.282017-08-10.29)
- Recurity Labs: [SCM Vulnerabilities](http://blog.recurity-labs.com/2017-08-10/scm-vulns)

Please read on for more details.

<!-- more -->

## Remote Command Execution in `git` client (CVE-2017-12426)

An external code review performed by Recurity Labs identified a remote command
execution vulnerability in `git` that could be exploited via the "Repo by URL"
import option in GitLab. The command line `git` client was not properly escaping
command line arguments in URLs using the SSH protocol before invoking the SSH client. A
specially crafted URL could be used to execute arbitrary shell commands on the
GitLab server.

To fully patch this vulnerability two fixes were needed. The Omnibus versions
of GitLab contain a patched `git` client. For source users who may still be
running an older version of `git`, GitLab now also blocks import URLs containing
invalid host and usernames. [35212]

This issue has been assigned [CVE-2017-12426][CVE].

Thanks to [Joern Schneeweisz] and [Recurity Labs] for discovering this vulnerability, providing
immediate notification, and helping us coordinate a release across several projects.

[35212]: https://gitlab.com/gitlab-org/gitlab-ce/issues/35212
[CVE]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-12426
[Recurity Labs]: http://www.recurity-labs.com/
[Joern Schneeweisz]: http://twitter.com/joernchen

### Versions affected

- 7.9.0 through 8.17.7
- 9.0.0 through 9.0.12
- 9.1.0 through 9.1.9
- 9.2.0 through 9.2.9
- 9.3.0 through 9.3.9
- 9.4.0 through 9.4.3

We **strongly recommend** that all installations running a version mentioned
above be upgraded as soon as possible.

### Workarounds

If you're unable to upgrade right away, you can secure your GitLab installation
against this vulnerability using the workaround outlined below until you
have time to upgrade.

Note: Disabling the "Repo by URL" import option does not fully mitigate this
vulnerability as existing projects will still be able to change their import URLs.

### Removing support for SSH URLs

GitLab CE+EE instances that cannot be patched immediately can disable support
for SSH URLs in project imports and mirrors by editing the GitLab source code
and removing `ssh` from the list of valid protocols.

For source users edit: `/app/validators/addressable_url_validator.rb`.

For Omnibus users edit: `/opt/gitlab/embedded/service/gitlab-rails/app/validators/addressable_url_validator.rb`.

Change:
```
DEFAULT_OPTIONS = { protocols: %w(http https ssh git) }.freeze
```

To:
```
DEFAULT_OPTIONS = { protocols: %w(http https git) }.freeze
```
Then restart GitLab.

For Omnibus users: `gitlab-ctl restart`.

### Verifying the workaround

1. Choose to create a new project
1. Choose "Import by URL".
1. Specify a URL such as `ssh://gitlab.com/foo.git`.
1. Verify that GitLab returns an invalid URL error.

Be certain that you do not revert this patch until you have installed an updated
version of `git`.

## Improper sanitization of GitLab export files on import

GitLab versions 8.13.3, 8.12.8, 8.11.10, 8.10.13, and 8.9.12 contained a patch
for a [critical directory traversal vulnerability][CVE-2016-9086] in the GitLab export feature
that could be exploited by including symlinks in the export file and then re-importing
it to a GitLab instance. This vulnerability was patched by checking for and removing
symlinks in these files on import.

[Recurity Labs] also determined that this fix did not properly remove symlinks for
hidden files. Though not as dangerous as the original vulnerability hidden file
symlinks could still be used to steal copies of `git` repositories belonging to
other users if the path to the `git` repository was known by the attacker. An
updated fix has been included in these releases that properly removes all symlinks. [36091]

This import option was not made available to non-admin users until GitLab 8.13.0.

[36091]: https://gitlab.com/gitlab-org/gitlab-ce/issues/36091
[CVE-2016-9086]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-9086

### Versions affected

- 8.9.0 through 8.17.7
- 9.0.0 through 9.0.12
- 9.1.0 through 9.1.9
- 9.2.0 through 9.2.9
- 9.3.0 through 9.3.9
- 9.4.0 through 9.4.3

We **strongly recommend** that all installations running a version mentioned
above be upgraded as soon as possible.

### Workarounds

GitLab instances that cannot be patched immediately can disable the "GitLab export"
option for project imports in their admin settings.

### Verifying the workaround

1. Choose to create a new project
1. Verify that the "GitLab export" option is not available.

## Upgrade barometer

These versions do not include any migrations and will not require downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`
file](http://doc.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a
[subscription](/pricing/). No time to upgrade GitLab
yourself? Subscribers receive upgrade and installation services.
