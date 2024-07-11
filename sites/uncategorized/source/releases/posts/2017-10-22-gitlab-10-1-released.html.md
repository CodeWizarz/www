---
release_number: "10.1"
title: "GitLab 10.1 released with Image Discussions and Rejection of Unsigned Commits"
author: Achilleas Pipinellis
author_gitlab: axil
author_twitter: _axil
image_title: '/images/10_1/10_1-cover-image.jpg'
description: "GitLab 10.1 Released with LDAP Group Sync Filters, GPG Subkeys Support, and a Moderation Lock of Issues and Merge Requests."
twitter_image: '/images/tweets/gitlab-10-1-released.png'
categories: releases
layout: release
tags: releases, features
---

Καλημέρα! (Good morning!) This month we're coming to you live from GitLab all
hands in Heraklion, Greece, to release GitLab 10.1. 🚀

Since GitLab's inception, we envisioned a world where
[everyone can contribute](/direction/#vision), and with each release we're one
step closer. With GitLab 10.1, we bring more tools for better collaboration,
enhanced security and authentication, as well as improved performance and UX.

<!-- more -->

For far too long a group of folks have been left out of the discussion and we
think it's time that got fixed. With GitLab 10.1 we're changing how you should
think about version control and discussion.
Commenting on lines of code works great when the discussion centers around text,
but what about images? After all, if the code being written has an app UI, web
page, or generates a printed asset then it makes sense that you'd want to be
able to talk about text and images in the same way. With
[Image Discussions](#image-discussions) we're opening up a whole new way to
collaborate. Extending on collaboration, you can now
[create merge requests across forks](#merge-requests-across-forks) of a
canonical repository.

Being able to work under a secure environment is very important, and with each
release we are constantly improving the security and authentication mechanisms.
This time, we have added [LDAP group sync filters](#ldap-group-sync-filters),
as well as the ability to [reject unsigned commits](#reject-unsigned-commits).
The [admin audit log](#improved-admin-audit-log) has been improved to also
include more metrics and [GPG subkeys support](#signing-commits-with-gpg-subkeys) has
been added.

An open source project can attract a lot of visitors and contributors. Although
one would expect civilized discussions to take place, that's not always
the case. With GitLab 10.1, a moderation tool is in place and you are able to
[lock discussions on issues and merge requests](#lock-discussions)
to avoid unnecessary friction among your community.

Going strong with our [DevOps vision](/blog/2017/10/11/from-dev-to-devops/), we've
made it really easy to [create clusters on Google Kubernetes Engine from within
GitLab](#easy-creation-of-kubernetes-clusters-on-google-container-engine-(beta)).
The [online view of HTML artifacts](#online-view-of-html-artifacts)
is also another great addition that will make it even easier to view your test
reports right from your web browser.

Dedicated to our open source stewardship, the
[fast-forward option in merge requests](#semi-linear-history-and-fast-forward-merge-requests-in-ce)
previously on Enterprise Edition Starter is now brought to Community Edition.

In the UX side of things, GitLab now comes with an [improved new project page](#improved-new-project-page)
so that it's easier to decide the kind of project you want to create. Whether
you want to start from scratch, use a template or import from another provider,
you can now achieve it easier than before.

We're dedicated to making GitLab perform better and faster under heavy load,
and GitLab 10.1 is no exception. This release comes with many
[performance improvements](#performance-improvements) including faster viewing
of merge requests and general initial page load improvements.
