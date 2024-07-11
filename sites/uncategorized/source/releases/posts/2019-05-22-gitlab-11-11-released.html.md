---
release_number: "11.11"
title: "GitLab 11.11 released with Multi-Assignment for MRs and container enhancements"
author: Jason Yavorska
author_gitlab: jyavorska
author_twitter: j4yav
image_title: '/images/11_11/11_11-cover-image.jpg'
description: "GitLab 11.11 released with Multi-Assignment for Merge Requests, Windows Container Executor, Dependency Proxy, and much more!"
twitter_image: '/images/tweets/gitlab-11-11-released.png'
categories: releases
layout: release
featured: yes
header_layout_dark: true
# release_number_dark: true #uncomment if you want a dark release number
---

## Increased collaboration and visibility

One of the areas we focus on at GitLab is to find new ways to increase collaboration throughout the entire DevOps lifecycle. In this release, we're happy to announce that we now support [Multiple Assignees for a Merge Request](/releases/2019/05/22/gitlab-11-11-released/#multiple-assignees-for-merge-requests)! This is available in GitLab Starter and truly embodies our **everyone can contribute** motto. We know that many people may be working/collaborating in the same merge request to make sure things are on track, and Multiple Assignees for Merge Requests provides an environment to do just that!

Additionally, we have heightened the visibility for DevOps teams by supporting [automated deployment event notifications for Slack and Mattermost](/releases/2019/05/22/gitlab-11-11-released/#deployment-notifications-for-slack-and-mattermost). Adding to the list of push events for these two collaborative environments allows a notification to kick off near real-time to update your team every time a deployment occurs.

## Reduce overhead with Windows support of Docker containers and provisioning instance-level Kubernetes clusters

We 💖 containers! Containers require fewer system resources than your traditional or virtual machine environments while increasing the portability of your application. With GitLab 11.11, we now support a [Windows Container Executor for GitLab Runners](/releases/2019/05/22/gitlab-11-11-released/#windows-container-executor-for-gitlab-runner), something that will enable the use of Docker containers on Windows, allowing for more advanced pipeline orchestration and management.

GitLab Premium (self-managed instances only) now has a [Caching Dependency Proxy for your Docker images](/releases/2019/05/22/gitlab-11-11-released/#caching-dependency-proxy-for-container-registry). This MVC iteration helps to speed up time to delivery by providing a caching proxy for frequently used Docker images.

Users of self-managed GitLab instances are now able to provision an [Instance Level Kubernetes Cluster](/releases/2019/05/22/gitlab-11-11-released/#instance-level-kubernetes-cluster-configuration), enabling all groups and projects in the instance to make use of it for their deployments. This GitLab Kubernetes integration will automatically create project-specific resources for added security.

## And much more!

In addition to increased collaboration and visibility capabilities, we've also added [Guest Access to Releases](/releases/2019/05/22/gitlab-11-11-released/#guest-access-to-releases), extended the [Add-on CI Runner minutes to GitLab Free](/releases/2019/05/22/gitlab-11-11-released/#add-on-ci-runner-minutes-have-been-extended-to-free-plans), simplified reviews by [auto-resolving a discussion whenever a suggestion is applied](/releases/2019/05/22/gitlab-11-11-released/#applying-a-suggestion-now-automatically-resolves-the-discussion), and much more!
