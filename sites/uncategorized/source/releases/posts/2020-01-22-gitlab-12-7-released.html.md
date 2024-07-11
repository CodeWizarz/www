---
release_number: "12.7"
title: "GitLab 12.7 released with Parent-Child Pipelines and Windows Shared Runners Beta"
author: James Ramsay
author_gitlab: jramsay
image_title: '/images/12_7/12_7-cover-image.jpg'
description: "GitLab 12.7 released with Parent-Child Pipelines, Windows Shared Runners Beta, Pipeline Resource Groups, and much more!" # short description - required
twitter_image: '/images/tweets/gitlab-12-7-released.png'
categories: releases
layout: release
featured: yes
---

GitLab 12.7 is now available with improvements to make your pipelines and teams more efficient and effective. Automation and pipelines are foundational for effective DevOps teams, and in 12.7 we’re delivering multiple improvements to make you faster and more efficient, including [Parent-Child Pipelines](#parent-child-pipelines), [Pipeline Resource Groups](#pipeline-resource-groups), and [Windows Shared Runners in beta on GitLab.com](#windows-shared-runners-on-gitlabcom-beta).

Because teams manage so much of their work in Merge Requests, [Code Review Analytics](#code-review-analytics) and [more informative Merge Request widgets](#display-the-deployment-time-of-a-merge-request) will make it easier to optimize quality and cycle time.

## **Faster and More Efficient Pipelines and Teams**
{: .intro-header}

Large, complex pipelines can be both slow to execute and hard to understand. [Parent-child pipelines](#parent-child-pipelines) will speed things up by allowing separate, child pipelines to run concurrently. By also separating and simplifying visualization and configuration per pipeline, and even allowing shared, reusable configuration, parent-child pipelines are easier to manage and will make both your CI/CD and your team more efficient.

### **Manage Shared Pipeline Resources**
{:.intro-header-h3}

Many organizations have shared environments and resources where they want to prevent multiple changes from being made at the same time. [Resource Groups](#pipeline-resource-groups) help you limit pipeline concurrency to more efficiently and effectively manage jobs and resources.

### **Windows Shared Runners Beta**
{:.intro-header-h3}

Windows developers can now choose to take advantage of [Shared Runners on GitLab.com](#windows-shared-runners-on-gitlabcom-beta), instead of or in addition to setting up their own. This beta release enables running CI/CD jobs on Windows virtual machines with the added efficiency of a fully-managed, auto-scaling, and secure environment, managed by the GitLab.com team.

### **Faster Merge Request Management**
{:.intro-header-h3}

Timely code review keeps your team shipping. [Code Review Analytics](#code-review-analytics) will make it easy to find Merge Requests in review that need intervention, helping teams manage their cycle time. [Improved Merge Request widgets](#display-the-deployment-time-of-a-merge-request) now show when changes have made it to a specific environment, saving time tracking down the latest deploy.

### **And Much More**
{:.intro-header-h3}

These are just a few highlights from the 45 new and improved features, and 12 performance improvements described below, and a small selection from the 1,593 merge requests made in 12.7. Check out more great updates below, such as [automatically staging all changes in our Web IDE](#automatically-stage-all-changes-in-web-ide) and [the ability to share group access with another group](#share-group-access-with-another-group).
