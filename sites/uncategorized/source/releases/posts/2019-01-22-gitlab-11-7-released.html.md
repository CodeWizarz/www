---
release_number: "11.7"
title: "GitLab 11.7 shipped with Releases, Multi-level Child Epics, and NPM Registry"
author: Victor Wu
author_gitlab: victorwu
author_twitter: victorwuky
image_title: '/images/11_7/11_7-cover-image.jpg'
description: "GitLab 11.7 shipped with Releases, Multi-level Child Epics, and NPM Registry!"
twitter_image: '/images/tweets/gitlab-11-7-released.png'
categories: releases
layout: release
featured: yes
header_layout_dark: true
---

## Managing releases just got a whole lot easier
{: .intro-header}

GitLab 11.7 delivers [Releases](#publish-releases-for-your-projects) in GitLab Core. Users now have release snapshots that not only include the source code but _all_ related artifacts.
This eliminates the need for manual collection of source code, build output, and other metadata or artifacts associated with a released version of your code. Additionally, Releases sets the stage for broader, more robust release orchestration in the future.

## Portfolio Management supports more complex work breakdown structures
{: .intro-header}

[Multi-level Child Epics](#multi-level-child-epics) are the newest addition to GitLab portfolio management, available in Ultimate. Child Epics enable multi-level work breakdown structures, helping you manage more complex projects and workplans. You can now have an epic containing both issues and epics.
This structure enables a direct connection between planning and actionable issues to implement.

## Streamlining JavaScript development with NPM registries
{: .intro-header}

Gitlab 11.7 Premium delivers [NPM registries](#npm-registry) directly in GitLab, providing a standard, more secure way to share and version control NPM packages across projects. Simply share the package name and NPM and GitLab handles the rest, all within a single interface!

## And so much more
{: .intro-header}

It is always so hard to pick which features are our top features in our monthly releases, so we are calling out a couple of additional cool features:

* [**Remediate vulnerability with patch file**](#remediate-vulnerability-with-patch-file): As you know, GitLab security features help you to detect vulnerabilities. With GitLab 11.7, you now have the ability to remediate that vulnerability and suggest a solution for Node.js projects managed with Yarn. While this is our first official remediation-type feature, you can be sure it is only just the beginning!

* [**API integration with Kubernetes**](#api-support-for-kubernetes-integration): If you are into creating _a lot_ of Kubernetes clusters or consider yourself a Kubernetes ninja, we have a Kubernetes API to greatly reduce manual efforts and make your life a whole lot easier!

* [**Cross-project pipeline browsing**](#cross-project-pipeline-browsing): With the ability to view pipelines across projects, the sky's the limit on what information is readily at your fingertips with this feature!

Read on for the complete list of features for GitLab 11.7!
