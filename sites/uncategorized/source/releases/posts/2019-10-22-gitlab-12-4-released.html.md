---
release_number: "12.4" # version number - required
title: "GitLab 12.4 released with improved Merge Request Dependencies and Audit API" # short title (no longer than 62 characters) - required
author: Fabian Zimmer # author name and surname - required
author_gitlab: fzimmer # author's gitlab.com username - required
author_twitter: # author's twitter username - optional
image_title: '/images/12_4/12_4-cover-image.jpg' # cover image - required
description: "GitLab 12.4 is now available with several improvements for governance including an Audit API, Code Owner approvals for Protected Branches, and Access Control for Pages. Merge Request Dependencies help you orchestrate work across teams, while so many more exciting features help you be more efficient and deliver better software faster!" # short description - required
twitter_image: '/images/tweets/gitlab-12-4-released.png' # social sharing image - not required but recommended
categories: releases # required
layout: release # required
featured: yes
header_layout_dark: true #uncomment if the cover image is dark
# release_number_dark: true #uncomment if you want a dark release number
---

GitLab 12.4 is released with several improvements for governance including an Audit API, Code Owner approvals for Protected Branches, and Access Control for Pages. Merge Request Dependencies help you orchestrate work across teams, while so many more exciting features help you be more efficient and deliver better software faster!

## Merge Request Dependencies
{: .intro-header}

GitLab can help you improve visibility, collaboration, and productivity. When developers work together to achieve a larger goal, their small changes often need to be merged in a specific sequence to work as intended. To simplify this, [Merge Request Dependencies](#merge-request-dependencies) allow dependencies to be defined in merge requests, preventing changes from being merged in the wrong order while also improving the visibility of dependencies during code review. This feature was introduced as *Cross-Project* Merge Request Dependencies in [12.2](/releases/2019/08/22/gitlab-12-2-released/#cross-project-merge-request-dependencies) but has been renamed to *Merge Request Dependencies*, and expanded to support more types of dependencies. This includes both cross-project and Merge Request Dependencies within *the same* project.

We recognize governance is important to you. Here are a few of the key features in 12.4 that will make governance easier for you.

### Audit Events API
{:.intro-header-h3}

GitLab helps you achieve end-to-end visibility across your development lifecycle while streamlining processes. To facilitate this, GitLab [plays well with others](/handbook/product/gitlab-the-product/#plays-well-with-others) and, in 12.4, is introducing an API for instance-level audit events. [Audit Events](https://docs.gitlab.com/ee/administration/audit_events.html) are a powerful way to better understand adherance to policies. Using the new [Audit Events API](#audit-events-api), administrators can obtain events programmatically and better enable powerful alerting and monitoring that meets specific needs.

### Pages Access Control on GitLab.com
{:.intro-header-h3}

Access control for [Pages](/stages-devops-lifecycle/pages/) has been [available for self-managed](https://gitlab.com/gitlab-org/gitlab-foss/issues/33422) but is now [available on GitLab.com](#access-control-for-pages-is-now-enabled-on-gitlabcom). It allows an authorized administrator to restrict access to a Pages site or make it available to the public. This is a community contribution that we are very excited to have enabled on GitLab.com!

### Code Owner Approvals for Protected Branches
{:.intro-header-h3}

Another feature to aid in governance is the new [Code Owner Approvals for Protected Branches](#code-owner-approvals-for-protected-branches). Using merge request approvals to restrict how code is pushed to protected branches is helpful for promoting code quality and implementing compliance controls. However, not all merge requests target stable branches, and not all stable branches need the same controls. In GitLab 12.4, it is possible to prevent directly pushing changes to files or merging changes without the code owner's approval for specific branches.

### And much more!
{:.intro-header-h3}

There are so many great features within GitLab 12.4 that we couldn’t possibly highlight them all. A few favorites include [Notifications for Releases](#notifications-for-releases), the ability to [View Pod Logs from Any Environment](#view-pod-logs-from-any-environment), and [Private Project Support for Online View of HTML Artifacts](#private-project-support-for-online-view-of-html-artifacts). Keep reading below to get details on every feature!

Be sure to catch the [recap](https://www.youtube.com/watch?v=YUXeodJgke0) of our first European user conference from October 9th. The next [GitLab Commit User Conference](https://www.eventbrite.com/e/gitlab-commit-2020-san-francisco-tickets-73836706577) will be in San Francisco in January. [Registration](https://www.eventbrite.com/e/gitlab-commit-2020-san-francisco-tickets-73836706577) is now open.
