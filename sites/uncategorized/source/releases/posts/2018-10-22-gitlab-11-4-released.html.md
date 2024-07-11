---
release_number: "11.4"
title: "GitLab 11.4 released with Merge Request Reviews and Feature Flags"
author: James Ramsay
author_gitlab: jramsay
author_twitter: jamesramsay
image_title: '/images/11_4/11_4-cover-image.jpg'
description: "GitLab 11.4 released with Merge Request Reviews, Feature Flags, Git protocol v2, and much more!"
twitter_image: '/images/tweets/gitlab-11-4-released.png'
categories: releases
layout: release
header_layout_dark: true
featured: yes
---

We're excited to announce the release of GitLab 11.4 with incredible updates to help teams
work together more efficiently. Most teams adopting DevOps are focused on shortening
cycle time, so improvements that reduce waste and extra work are welcome contributions toward
faster delivery and better business results.

With GitLab 11.4 we're making code reviews more efficient with
[Merge Request Reviews](#merge-request-reviews) and a [file tree for diffs](#file-tree-for-browsing-merge-request-diff).
We are introducing [Feature Flags](#create-and-toggle-feature-flags-for-your-applications-alpha) in alpha.
Auto DevOps and CI is more powerful with [PostgreSQL migrations](#support-postgresql-db-migration-and-initialization-for-auto-devops) and [timed incremental rollout](#add-timed-incremental-rollouts-to-auto-devops).
Even Git is faster with support for [Git protocol v2](#git-protocol-v2).

## Code review
{: .intro-header}

[Merge Request Reviews](#merge-request-reviews) will reduce the noise from comments on code and merge requests.
Batch Comments lets a reviewer enter multiple comments on the code or merge request and 
then finalize them in one batch. Now, the people subscribed to the project can more 
efficiently keep track of changes.

Having the right people review and approve code changes is a key step to delivering high-quality code.
Building on Code Owners from the [11.3 release](/releases/2018/09/22/gitlab-11-3-released/),
GitLab can now suggest who should review and approve a specific merge request based on the
`CODEOWNERS` file. This way, you can quickly and efficiently get changes reviewed and approved.
This will also be useful when defining separation of duties and roles on a team, where you want to
have defined reviewers for certain parts of the code.

The addition of the file tree view to the merge request makes it easier and faster for reviewers to
navigate through multiple changed files and then provide their feedback.

Russell Levy, co-founder and CTO of [Chorus.ai](http://www.chorus.ai), explains how the reviews and file-tree
view features are helping their team:

> _We're pretty thorough in code reviews and there are generally 10-20 comments on
a medium-sized merge request, plus a few rounds of conversations based on it. Using
the review feature reduces the noise and interruptions during the review process._
> 
> _For larger merge requests, the new file tree and diffs feature makes reviews that
much faster, as it makes it easy to jump around the code to understand dependencies._

## Feature flags
{: .intro-header}

We are introducing an Alpha version of [Feature Flags](#create-and-toggle-feature-flags-for-your-applications-alpha), a feature toggle system. Teams can
now practice Continuous Delivery by deploying new features to production in small batches,
mitigating risk before a full rollout.

## Auto DevOps and CI/CD
{: .intro-header}

We're also updating the ability for all users to take advantage of having
[Include files in their `.gitlab-ci.yml` files](#move-ability-to-use-includes-in-codegitlab-ciymlcode-from-starter-to-core), moving it from Starter to Core. This will make it easier
for all teams to leverage this best practice and more efficiently manage their CI/CD pipelines.


## Extra polish
{: .intro-header}

Together with the wider GitLab community, there are many more wonderful improvements
we have included in this release including a new profile layout, faster access to
your profile status, highlighted `@mentions`, new quick actions, and the ability
to close epics.

Read on to learn more about all the great features in GitLab 11.4.
