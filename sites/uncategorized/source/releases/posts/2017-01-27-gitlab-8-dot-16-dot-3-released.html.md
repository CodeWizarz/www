---
title: "GitLab 8.16.3 released"
description: "Learn more about GitLab Release 8.16.3 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/01/27/gitlab-8-dot-16-dot-3-released/"
author: Robert Speicher
author_twitter: rspeicher
author_gitlab: rspeicher
categories: releases
guest: false
---

Today we're releasing version 8.16.3 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

This version resolves a number of regressions and bugs in the [recent 8.16
release](/releases/2017/01/22/gitlab-8-16-released/).

Please read on for more details.

<!-- more -->
UPDATE (2017-01-28): We've bumped the 8.16.3 Omnibus package version to fix a problem with
[bundler complaining about "Your home directory is not set properly"](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/1913).
For CE, you should check that version `8.16.3-ce.1` is installed instead of `8.16.3-ce.0`.
For EE, you should check that version `8.16.3-ee.1` is installed instead of `8.16.3-ee.0`.
If you are upgrading from .0 to .1 and the install fails, you may have to skip the backup step
[as described here](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/1913#note_22301050).

- **CE/EE:** Fixed label select toggle not updating correctly. ([!8601])
- **CE/EE:** Fix autocomplete initial undefined state (loading). ([!8667])
- **CE/EE:** Introduced an offset limit to prevent the dropdown from going far
  right. ([!8679])
- **CE/EE:** Fix race conditions for AuthorizedProjectsWorker. ([!8701])
- **CE/EE:** Add caching of droplab ajax requests. ([!8725])
- **CE/EE:** Fixed flexbox and wrap issues. ([!8745])
- **CE/EE:** Make the time estimate migrations reversible. ([!8749])
- **CE/EE:** Fix filtered search so that labels selected from discussion notes
  display correctly. ([!8756])
- **CE/EE:** Fix access to the wiki code via HTTP when repository feature
  disabled. ([!8758])
- **CE/EE:** Don't call `#uniq` on a relation. ([!8784])
- **CE/EE:** Revert filter-assigned-to-me. [!8785]
- **CE/EE:** Resolve "Clicking line anchor multiple times causes scroll position
  to over-correct". ([!8791])
- **CE/EE:** Fix /explore sorting trending. ([!8792])
- **CE/EE:** Fix Error 500 when repositories contain annotated tags pointing to
  blobs. ([!8800])
- **EE:** Document removing approval. ([!1086])
- **EE:** EE port: Fix race conditions for AuthorizedProjectsWorker. ([!1100])
- **EE:** Fix sidekiq cluster mishandling of queue names. ([!1117])
- **EE:** Fix GitLab Pages not refreshing upon new content. ([!1134])

[!8601]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8601
[!8667]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8667
[!8679]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8679
[!8701]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8701
[!8725]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8725
[!8745]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8745
[!8749]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8749
[!8756]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8756
[!8758]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8758
[!8784]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8784
[!8785]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8785
[!8791]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8791
[!8792]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8792
[!8800]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8800

[!1134]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1134
[!1117]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1117
[!1100]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1100
[!1086]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1086

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
EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a [subscription](/pricing/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.
