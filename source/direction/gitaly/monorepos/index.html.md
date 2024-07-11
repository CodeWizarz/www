---
layout: handbook-page-toc
title: "Product Direction - Monorepos"
description: "GitLab want to improve the monorepo experience. Learn more here!"
---

- TOC
{:toc}

## Overview
Monolithic repositories, more commonly known as monorepos, are a software development approach where code for many projects is stored in a single repository.

Monorepos provide a number of advantages such as reduced complexity, code reuse, easier collaboration amongst teams, and streamlined dependency management. Additionally, there are [several drawbacks](https://medium.com/@mattklein123/monorepos-please-dont-e9a279be011b) such as difficult to scale, performance concerns, requires large amounts of storage, and loss of per-service semantic versioning. 

View our [Monorepo Issues List](https://gitlab.com/gitlab-org/gitlab/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=monorepo)

### When to use a monorepo

As noted before, monorepos offer some great advantages. Here are some examples when a monorepo is a great choice:

1. Cross container (microservices) shared library code that is direct copied into containers 
1. Development of test automation frameworks using CLI tooling 

### When not to use a monorepo

1. Microservice application with multiple dependencies that must be coordinated 
1. Mutli-project pipelines are employed for separation of duties, testing, or other requirement 

## Existing monorepo experience inside of GitLab

We want to improve the monorepo experience - whether it has multiple services that all get deployed together, or if it's a mobile app in a single repo that needs to be built completely differently for iOS and Android. 

The primary stages that will be supporting our development of a better monorepo experience are: 
- [Create](/direction/dev/#create-1)
- [Verify](/direction/verify/)
- [Secure::SAST](/direction/secure/static-analysis/sast/)

Secondary stages contributing to the betterment of monorepos in GitLab are:
- [Package](/direction/ops/#package)
- [Configure](https://about.gitlab.com/direction/ops/#configure)

GitLab already has a number of important features that help monorepos:

- [Git partial clone](https://docs.gitlab.com/ee/topics/git/partial_clone.html)
- [Git LFS](https://docs.gitlab.com/ee/topics/git/lfs/index.html#git-lfs)
- [Parent-child pipelines](https://docs.gitlab.com/ee/ci/parent_child_pipelines.html)
- [Dynamic pipeline creation for artifact includes](https://docs.gitlab.com/ee/ci/parent_child_pipelines.html#dynamic-child-pipelines)
- [Monorepo package management](https://docs.gitlab.com/ee/user/packages/npm_registry/index.html)

## What's next & why
The primary way for us to improve the monorepo experience is by focusing on the performance of large files inside of repositories and streamlining the CI pipeline for them. We're currently working on the following two initiatives to help with both of those features:

- [Git for enormous repositories](https://gitlab.com/groups/gitlab-org/-/epics/773)
- [Expand SAST scanner support for monorepos](https://gitlab.com/groups/gitlab-org/-/epics/4895)

Check out our Verify:Pipeline Security group's ThinkBig about testing in Monorepos: 

<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/ZAAzBViRhF4" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

## Top Vision Items 

We are looking at adding native experiences in GitLab such as using [AutoDevops to build and deploy to multiple containers in a monorepo](https://gitlab.com/guided-explorations/devops-patterns/multi-container-monorepo). This type of functionality would be a game-changer for large monorepos looking to use Auto DevOps. Enabling users managing large repositories using mutliple containers per repository with CI templates, solves some of the top challenges that are facing organizations adopting DevOps and using monorepos. 

### Competitive landscape 

GitHub has released a [Remote Repository Plug-in](https://marketplace.visualstudio.com/items?itemName=github.remotehub) to better meet the developer needs around monorepo experiences. This extension enables users to quickly commit to GitHub directly from Visual Studio. This empowers users to easily navigate some of the git complexities that come with monorepos. 

GitHub and Perforce recently announced a [strategic partnership](https://developer.microsoft.com/en-us/games/blog/microsoft-perforce-reimagining-game-production/) to combat the limitations of Git when it comes to developing on large mono repositories. Perforce authored a set of GitHub Actions that allow the user to spin up a Perforce Helix Core server when working on repositories that would otherwise not be performant in GitHub alone. 

