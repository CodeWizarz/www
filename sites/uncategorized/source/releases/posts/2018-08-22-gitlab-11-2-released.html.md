---
release_number: "11.2"
title: "GitLab 11.2 released with live preview in the Web IDE and Android project import"
author: Mike Lewis
author_gitlab: mikelewis
author_twitter: miketechnically
image_title: '/images/11_2/gitlab-11-2-released-cover.jpg'
description: "11.2 offers live preview in the Web IDE, instance-wide project templates, Android imports, GitLab installs on Kubernetes with GA chart, and more!"
twitter_image: '/images/tweets/gitlab-11-2-released.png'
categories: releases
layout: release
---

We are super excited to deliver new features with 11.2 that will help you
get started and iterate faster. Today we deliver enhancements to the Web IDE,
support for manifest files to import Android projects, and enable custom
project templates.

## Preview changes in the Web IDE

The Web IDE makes it faster and easier to contribute changes to your projects
by providing an advanced code editor with commit staging right within your
browser. With GitLab 11.2 we’ve made it even easier to see the effect of
your code changes and debug even before you commit. You can now
[preview your JavaScript web app in the Web IDE](#client-side-evaluation-in-web-ide),
viewing your changes in real time, right next to the code for client-side evaluation.

In addition, with 11.2, you can delete and rename files and switch branches
without ever leaving the Web IDE.

## Android project import

Until now, importing complex project structures with multiple sub-structures
was a tedious, time-consuming task. With our [new support for XML manifest files](#support-for-android-project-import),
you can now import larger project structures with multiple repositories altogether,
in bulk, including Android OS code from the [Android Open Source Project (AOSP)](https://source.android.com).

## Cloud native simplified

The [Cloud Native Helm Chart is now generally available](#cloud-native-gitlab-helm-chart-generally-available)
to help you more quickly install GitLab on Kubernetes. This chart features a
more cloud native architecture, with a container for each component of GitLab
and no requirement for shared storage. The result is increased resilience,
scalability, and performance of GitLab on Kubernetes. A
[GitLab Runner](https://docs.gitlab.com/runner/) is also deployed, making it
easy to get started with GitLab CI/CD.

## Lots more!

Several other additions will help you and your teams handle projects more
efficiently. With 11.2, GitLab administrators can offer
**[instance-wide custom project templates](#custom-project-templates-on-the-instance-level)**,
allowing users to start new projects quickly by automating repetitive setup tasks.

At the same time, features such as issue board
**[milestone lists](#issue-board-milestone-lists)**,
**[summed weights](#summed-weights-in-issue-board-list)**
for issue board lists, **[group milestones on the milestone dashboard page](#group-milestones-on-dashboard-milestones-list-page)**,
and **[todos for epics](#todos-for-epics)** enable
better work management.

## Everyone can contribute

Many of these improvements were contributed by the greater GitLab community.
We look forward to your feedback and improvements on these great new features.
Together, we make an awesome team! 🏆

Let us know what you think in the comments below. What are you looking
forward to in this release? What can we continue to improve on?

Thanks for being a part of GitLab!
