---
release_number: "12.2" # version number - required
title: "GitLab 12.2 released with Directed Acyclic Graphs for Pipelines and Design Management" # short title (no longer than 62 characters) - required
author: Joshua Lambert # author name and surname - required
author_gitlab: joshlambert # author's gitlab.com username - required
author_twitter: # author's twitter username - optional
image_title: '/images/12_2/12_2-cover-image.jpg' # cover image - required
description: "GitLab 12.2 released with Directed Acyclic Graphs for Pipelines, Design Management, Cross-project Merge Request dependencies, and much more!" # short description - required
twitter_image: '/images/tweets/gitlab-12-2-released.png' # social sharing image - not required but recommended
categories: releases # required
layout: release # required
featured: yes
header_layout_dark: true #uncomment if the cover image is dark
# release_number_dark: true #uncomment if you want a dark release number
---

GitLab 12.2 is an exciting release that will help teams optimize their pipelines, improve collaboration, and manage interdependencies between projects. Read on to learn more.

## Faster, more flexible pipelines
{:.intro-header}

The goal of CI pipelines are to automate manual build and testing tasks, accelerating software delivery while reducing errors and mistakes. However for some use cases, GitLab CI/CD pipelines are not as efficient as they could be. With GitLab 12.2, we now support [Directed Acyclic Graphs (DAG)](#directed-acyclic-graphs-dag-for-gitlab-pipelines) as a method to create and manage detailed job dependencies, rather than relying on sequential stages. This is incredibly powerful and makes it possible for your CI pipelines to become both **faster** and more **efficient**.

## Design Management
{:.intro-header}

Software development is a team sport, and our goal is to make it easy for everyone to contribute. In 12.2, we’re delivering new capabilities to include designers and design management in GitLab. [Design Management](#annotations-for-designs) will make it easy to share, version, and collaborate on design artifacts, helping teams to be more efficient with a single source of truth.

This is just the beginning of focusing on designer specific workflows inside of GitLab and we'd love for you to contribute to our [Design Management Strategy](https://about.gitlab.com/direction/plan/design_management/).


## Cross Project Merge Request Dependencies
{: .intro-header}

Complex systems often span multiple projects with interdependencies between code changes, where the sequence of merging changes matters. GitLab now supports [Cross-project Merge Request Dependencies](#cross-project-merge-request-dependencies), making it possible to define these dependency relationships and prevent mistakes due to changes being merged in the wrong order. Fewer mistakes mean you’re able to reduce rework, and deploy your changes faster.


## And much more!
{: .intro-header}

There are so many great features within GitLab 12.2 that
we couldn’t possibly highlight them all. [Restrict group membership by domain](#restrict-group-membership-by-domain), [Feature Flag Percent Rollout Strategy and Feature Flag User ID rollout Strategy](#percent-rollout-strategy-for-feature-flags), [Security approval in Merge Requests](#security-approval-in-merge-requests), and now [scoped environment variables being included in Core](#scoped-environment-variables-feature-moved-to-core). Keep reading below to get details on every feature!

[Register now to join us at our first user conferences in Brooklyn and London!](/events/commit/)
{: .alert .alert-info .text-center}
