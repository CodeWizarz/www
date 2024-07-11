---
release_number: "11.6"
title: "GitLab 11.6 released with Serverless and Group-level Clusters"
author: James Ramsay
author_gitlab: jramsay
author_twitter: jamesramsay
image_title: '/images/11_6/11_6-cover-image.jpg'
description: "GitLab 11.6 released with Serverless and Group-level Kubernetes Clusters for even greater cloud native simplicity."
twitter_image: '/images/tweets/gitlab-11-6-released.png'
categories: releases
layout: release
featured: yes
---

## Deploy serverless workloads to any cloud via GitLab
{: .intro-header}

Serverless computing dynamically allocates cloud resources whenever a piece of code is executed, optimizing allocation and distribution of the resources used to run your code. It is growing in popularity with developers because it allows them to focus on what matters most, namely writing code, without worrying about the underlying information technology infrastructure.

[GitLab Serverless](/topics/serverless/) uses Knative, a Kubernetes-based platform, to build, deploy, and manage serverless workloads. This feature provides developers with an easy way to build and manage serverless workloads alongside the rest of their code, in a familiar user interface. For businesses, serverless enables a multi-cloud strategy and prevents being locked into a specific cloud provider.

## GitLab continues to simplify development of cloud native applications
{:.intro-header-h3}

With a built-in [Container Registry](https://docs.gitlab.com/ee/user/packages/container_registry/index.html) and [Kubernetes integration](https://docs.gitlab.com/ee/user/project/clusters/index.html), GitLab makes it easier than ever to get started with containers and cloud native development. With 11.6, users will be able to create [Kubernetes clusters for groups](#kubernetes-clusters-for-groups-beta) that can be used by all the projects contained within the group or sub-groups. This further simplifies cloud native configuration and allow developers to focus on developing great applications.

## It's the holidays! Get excited! We've stuffed many more features into 11.6!
{:.intro-header-h3}

A few of our favorites include [Suggested Changes](#suggested-changes), [Web Terminal for Web IDE](#web-terminal-for-web-ide-beta), and the [Group Security Dashboard Vulnerability Chart](#vulnerability-chart-for-group-security-dashboards). Team contributions are more easily accepted now that changes suggested (when leaving a comment on a merge request diff) can be accepted with a single click. Also, from the Web IDE, you can now launch a Web Terminal, the first server-side evaluation feature of the popular Web IDE. Building upon [Group Security Dashboards](https://docs.gitlab.com/ee/user/application_security/security_dashboard/) released last month, the new Vulnerability Chart shows the security team how the number of vulnerabilities is changing day by day to provide resolution metrics.

Read on for all of the holiday goodies delivered with GitLab 11.6!
