---
release_number: "10.3"
title: "GitLab 10.3 released with Static Application Security Testing and Browser Performance Testing"
author: Mark Pundsack
author_gitlab: markpundsack
author_twitter: markpundsack
image_title: '/images/10_3/10_3-cover-image.jpg'
description: "GitLab 10.3 released with Static Application Security Testing, Browser Performance Testing, Multiple Kubernetes clusters per project, and much more!"
twitter_image: '/images/tweets/gitlab-10-3-released.png'
categories: releases
layout: release
tags: features, releases
---

In this month’s release of GitLab 10.3 we’ve added new ways to ensure that your
code changes are both secure and fast, enhanced your planning and collaboration
workflow, and improved your ability to build and ship.

<!-- more -->

## Security and testing
{:.intro-header}

Not too long ago, we announced our ambitious [vision for Complete
DevOps](/blog/2017/10/09/gitlab-raises-20-million-to-complete-devops/) and with
GitLab 10.3 we're adding several exciting new features that help bring that
vision to life. [Static Application Security
Testing](#static-application-security-testing-sast) and [Browser Performance
Testing](#browser-performance-testing) expand the scope of your CI/CD pipeline
with security and performance checks, respectively. SAST
has already been added as a best practice to Auto DevOps, with Browser
Performance Testing soon to follow.

## Discussion and collaboration
{:.intro-header}

In 10.3, we also include [Merge Request Commit Discussions](#merge-request-commit-discussions) to allow you to start a
conversation on specifics commits within a merge request.

Thanks to our [MVP](#mvp), you can now
[customize the branch name when you start a merge request from an issue](#customize-branch-name-when-creating-merge-request-from-issue). This
improvement is important to allow you to rapidly start MRs directly from
issues without having to break your branching strategy.

Sometimes an image is worth a million words. With GitLab 10.3, we added
support for [flow charts, sequence diagrams, and Gantt diagrams in GitLab Flavored Markdown (GFM) with Mermaid](#flow-charts-sequence-diagrams-and-gantt-diagrams-in-gitlab-flavored-markdown-gfm-with-mermaid).

## Build and ship
{:.intro-header}

GitLab 10.3 adds support for [multiple Kubernetes clusters per
project](#multiple-kubernetes-clusters-per-project-beta), which enables a common
best practice of keeping your production cluster isolated from your dev and test
cluster(s).

With 10.3 we're shipping an enhancement to Auto DevOps. Now, when you enable
Auto DevOps for your project, the [first pipeline will run automatically](#automatically-run-first-pipeline-when-enabling-auto-devops),
without needing to trigger it manually.

Artifacts can expire or be manually deleted so we're introducing [strict checking on artifact dependencies](#strict-check-on-artifacts-dependencies), so that jobs
will fail if their dependencies cannot be found.

## See all the features
{:.intro-header}

We're also shipping improvements to Merge Requests, Epics, Milestones,
Repository Mirroring, API, Geo, Runner, Protected Branches, Quick Actions, and
Issue Boards.

Read on to see everything that was released in GitLab 10.3!

We thank you for helping us to create great software with GitLab in 2017! We wish
you a Merry Christmas, happy holidays, and a new year full of great surprises!
Cheers!

<style type="text/css">
  .intro-header {
    font-size: 33px !important;
  }
</style>
