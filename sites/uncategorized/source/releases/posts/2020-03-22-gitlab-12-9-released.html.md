---
release_number: "12.9"
title: "GitLab 12.9 released with Vault App, Code Quality Reports and Group Deploy Tokens"
author: Larissa Lane
author_gitlab: ljlane
author_twitter: # author's twitter username - optional
image_title: '/images/12_9/12_9-cover-image.jpg'
description: "GitLab 12.9 released with Secrets Management, Container Scanning Vulnerability Remediation, Customizable Cycle Analytics, Full Code Quality Reports, Group Deploy Tokens and much more!"
twitter_image: '/images/tweets/gitlab-12-9-released.png'
categories: releases
layout: release
featured: yes
header_layout_dark: true
cover_img:
  image_url: "https://unsplash.com/photos/NSXp1Eon-PI"
  licence: Unsplash free license
  licence_url: "https://unsplash.com/license"
---

GitLab 12.9 is now available to help DevOps leaders achieve **enhanced security** with management of your secrets via HashiCorp Vault managed application, **better visibility** with code quality reports & customizable value stream analytics, and **easier administration** with group deploy tokens and API administration of deploy tokens.

## Secure your applications with Secrets Management and Vulnerability Remediation
{:.intro-header}

Many organizations are centralizing the storage of secrets for infrastructure and applications in external secrets management solutions, including HashiCorp Vault. With GitLab 12.9, we enable users to leverage [HashiCorp Vault](https://www.vaultproject.io/) to securely manage keys, tokens, and other secrets at the project level by installing it as a [managed application](#hashicorp-vault-gitlab-cicd-managed-application) within a Kubernetes Cluster. For current HashiCorp Vault users, you can follow our Bring Your Own Vault Integration progress in [gitlab&2868](https://gitlab.com/groups/gitlab-org/-/epics/2868). 

When Container Scanning detects vulnerabilities, GitLab 12.9 can now give [a suggested solution for the vulnerability](#suggested-solution-for-container-scanning), when available. You can choose to remediate the vulnerability with a merge request, which will automatically update the packages in the container base image, helping you resolve container security issues swiftly and efficiently.

## Better visibility with Customizable Value Stream Analytics and Code Quality Reports
{:.intro-header}

[Value Stream Analytics](/solutions/value-stream-management/) helps organizations visualize their end-to-end workstream and identify inefficiencies, in order to continuously improve how they deliver value. Previously the lifecycle stages were fixed to the [DevOps loop](https://about.gitlab.com/stages-devops-lifecycle/), which may not be suitable for everyone, as some teams may follow a different workflow. With GitLab 12.9, you have more control to [customize the stages](#customizable-value-stream-analytics) to reflect the right metrics for your business. Each new stage can have specific trigger events that define the entry or exit of the stage, allowing you to focus on improvements based on your defined key performance indicators. Be on the lookout for [more capabilities](/direction/plan/value_stream_management/) in our upcoming releases.

Previously, developers used the Code Quality feature in the merge request to understand the impact on quality of the target branch. However, this does not give insight to developers and managers into other code quality issues across the project. With GitLab 12.9, we have introduced a [Full Code Quality Report](#full-code-quality-report) that summarizes the quality issues across the project.

## Improve efficiencies with Group Deploy Tokens
{:.intro-header}

For any organization working with containers, it is critical for their orchestrator to have secure and ongoing access to their container registry. Previously, we introduced [Project Deploy Tokens](https://docs.gitlab.com/ee/user/project/deploy_tokens/) to provide long lived read-only authentication to the registry without being associated with a particular user or having unnecessary access rights.

With GitLab 12.9, managing deploy tokens in bulk is now more efficient, as we are not only introducing [deploy tokens at the group level](#group-deploy-tokens) but also APIs to [create, list and revoke deploy tokens](https://docs.gitlab.com/ee/api/deploy_tokens.html). If a specific project requires to use different tokens, project-level deploy tokens override group level deploy tokens.

## And much more!
{:.intro-header}

There are so many great features in GitLab 12.9, that we couldn't possibly highlight them all. A few favorites include [WAF Statistics Report](#web-application-firewall-waf-statistics-reporting), [Group level Roadmaps now available in Premium](#group-level-roadmap-now-available-in-premium), and [Log Aggregation now available in Core](#log-aggregation-in-core)! Keep reading below to get details on every feature release.
