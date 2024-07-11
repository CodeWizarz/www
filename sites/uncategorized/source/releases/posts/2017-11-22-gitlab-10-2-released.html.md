---
release_number: "10.2"
title: "GitLab 10.2 released with Configurable Issue Boards and GitLab Geo General Availability"
author: Joshua Lambert
author_gitlab: joshlambert
image_title: '/images/10_2/10_2-cover-image.jpg'
description: "In this month’s release of GitLab 10.2 we’ve added capabilities to improve planning, reliability, deployment, and so much more!"
twitter_image: '/images/tweets/gitlab-10-2-released.png'
categories: releases
layout: release
tags: releases, features
---

In this month’s release of GitLab 10.2 we’ve added capabilities to improve
planning, reliability, deployment, and so much more.

<!-- more -->

## Plan your work more efficiently
{:.intro-header}

If you’re like me, GitLab issues are water. Essential for life, but huge
volumes make you drown.

Getting a view of only the issues you care about for a particular context
is crucial to being effective, especially in shared views with teams.
Previously, GitLab let you use filters to
show a set of issues tied to a particular milestone or label in an issue board,
but that was only temporary. Your workflow may have depended on bookmarking a board
URL and sharing it with team members as a workaround.

Today, with [Configurable Issue Boards](#configurable-issue-boards) you can
now save the scope itself (milestone, labels, assignee
and weight) to a board, ensuring that every team member sees exactly the same issues.

## Fetch faster
{:.intro-header}

Teams are increasingly distributed across larger geographical areas. This is
one reason why Git is so popular, Git is distributed by nature – your local
Git repository has a copy of every commit, file, and branch in the history of
the project. Once the history is downloaded, development is fast!

But if you only have one physical instance, it may be located far away from your distributed teams. The latency caused by this distance can significantly slow fetch operations when large quantities of small files are
being downloaded. Today, we're excited to share that [GitLab Geo has been released into General Availability](#gitlab-geo-is-now-generally-available). GitLab Geo allows you to run read-only replicas of GitLab, including the GitLab
interface, close to your distributed teams.

## Stay up and running at scale
{:.intro-header}

GitLab’s single application architecture gives you one unified
data store across your issue tracking, source code repository, CI/CD,
and monitoring. This unified approach enables additional insights, a better user experience, and greater efficiencies throughout your development organization.

With GitLab at the core of many software engineering groups, it's important however to ensure it is running at peak performance, no matter the time of day. Today we’re proud to announce that [PostgreSQL High Availability is now Generally Available](#postgres-ha-is-now-generally-available), making it easy to set up and run a Postgres cluster for GitLab.
With a simple Omnibus-based installation and automatic failover, your developers can work without disruption.

{::options parse_block_html="true" /}

<div class="panel panel-gitlab-purple">
In a nutshell:
{: .panel-heading}
<div class="panel-body">
- Single Source of Truth == 😃
- Single Point of Failure == 😱
</div>
</div>

{::options parse_block_html="false" /}

## Deploy on Kubernetes even faster
{:.intro-header}

With each release, we are making the GitLab Kubernetes experience even better.
Last month, we made it easy to spin up new Kubernetes clusters with a few clicks.
But once you have a new cluster ready, you need to set up additional services
such as an external access controller. In this month’s release,
we’re removing that time sink from your schedule by adding [one-click installs for Tiller and Ingress](#easy-deployment-of-helm-and-ingress-on-kubernetes). Be on the lookout
next month for multi-cluster deployments. We aim to make each iterative step a
value-packed ship in and of itself.

## See all the features
{:.intro-header}

We’ve shipped a lot of exciting features this month including
[Commit Author Restriction](#commit-author-restriction) and
[Promote Project Milestones to Group Milestones](#promote-project-milestones-to-group-milestones).

Read on to learn more about all of the key features shipped in 10.2!

<style type="text/css">
  .intro-header {
    font-size: 33px !important;
  }
</style>
