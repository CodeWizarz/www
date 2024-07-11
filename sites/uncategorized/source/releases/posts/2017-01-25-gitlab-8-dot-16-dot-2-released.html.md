---
title: "GitLab 8.16.2 and 8.14.8 released"
description: "Learn more about GitLab Release 8.16.2 and 8.14.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/01/25/gitlab-8-dot-16-dot-2-released/"
author: DJ Mountney
author_twitter: twk3
author_gitlab: twk3
categories: releases
---

Today we are releasing version 8.16.2 and 8.14.8 for GitLab Community Edition (CE) and
Enterprise Edition (EE).

These versions resolve a number of regressions and bugs in the [recent 8.16
release](/releases/2017/01/22/gitlab-8-16-released/) and include some backported bug fixes
for the [8.14 release](/releases/2016/11/22/gitlab-8-14-released/).

Please read on for more details.

<!-- more -->

## 8.16.2 Fixes and Improvements

- **CE/EE:** Added current user filter to assignee dropdown ([!8653])
- **CE/EE:** Fix errors with the Mattermost Notification Service ([!8654])
- **CE/EE:** Allow issue filter bar to be operated with mouse only ([!8681])
- **CE/EE:** Fix Search Bar not working in IE11 ([!8689])
- **CE/EE:** Fixed bug with merge immediately button not working ([!8696])
- **CE/EE:** Add Prometheus docs ([!8699], [!8703])
- **CE/EE:** Resolve "Reveal Variables button may overrun width of screen" ([!8221])
- **CE/EE:** Fixed keyboard navigation not working in filtered search bar ([!8656], [!8777])
- **CE/EE:** Fixes a bug with the filtered search lists rendering the same item several times ([!8710])
- **CE/EE:** Remove blue border from comment box hover ([!8720])
- **CE/EE:** Make cycle_analytics_events_spec.rb side-effect free ([!8594], [!8778])
- **CE/EE:** Fix CI requests concurrency for newer runners that prevents from picking pending builds ([!8760], [!8657])
- **EE:** Track Mattermost usage in usage ping ([!1071])
- **EE:** Fixed incorrect class names used in merge request widget ([!1093])
- **EE:** Fixed the 'Content-Type' bug with Vue Resource ([!1095])
- **EE:** Removed project edit visibility radio buttons ([!1097])
- **EE:** Fix count of required approvals displayed on MR edit form ([!1082])
- **EE:** Don't try to show assignee in approved_merge_request_email if there's no assignee ([!1103])
- **EE:** Show correct exceeding limit value on LFS push when it's rejected ([!1105])
- **EE:** Fix updating approvals count when editing an MR ([!1106])

[!8653]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8653
[!8654]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8654
[!8654]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8681
[!8689]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8689
[!8696]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8696
[!8699]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8699
[!8703]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8703
[!8221]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8221
[!8656]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8656
[!8710]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8710
[!8720]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8720
[!8594]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8594
[!8777]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8777
[!8778]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8778
[!8657]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8657
[!8760]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8760
[!1071]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1071
[!1093]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1093
[!1095]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1095
[!1097]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1097
[!1082]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1082
[!1103]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1103
[!1105]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1105
[!1106]: https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1106

## 8.14.8 Fixes and Improvements

- **CE/EE:** Accept environment variables from the `pre-receive` script ([!7967])
- **CE/EE:** Speed up group milestone index by passing group_id to IssuesFinder ([!8363])
- **CE/EE:** Memoize Milestoneish#issues_visible_to_user to reduce lookups ([!8146])
- **CE/EE:** Bump gitlab-shell to 4.1.1 ([!8143])
- **CE/EE:** Ensure issuable state changes only fire webhooks once ([!8101])
- **CE/EE:** Fix N+1 queries on milestone show pages ([!8185])
- **CE/EE:** Reject blank environment variables in Gitlab::Git::RevList ([!8189])

[!7967]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/7967
[!8363]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8363
[!8146]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8146
[!8143]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8143
[!8101]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8101
[!8185]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8185
[!8189]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8189

## Upgrade barometer

These versions have no migrations and should not require any downtime.

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
