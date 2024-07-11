---
release_number: "10.7"
title: "GitLab 10.7 released with open source Web IDE and SAST for Go and C/C++!"
author: Joshua Lambert
author_gitlab: joshlambert
image_title: '/images/10_7/10_7-cover-image.jpg'
description: "GitLab 10.7 is released with the Web IDE now open source, SAST for Go and C/C++, Deploy Tokens, and lots more!"
twitter_image: '/images/tweets/gitlab-10-7-released.png'
categories: releases
layout: release
tags: features, releases
---

Contributing features, reviewing changes, and deploying code is a day in the life of a developer.
Today we are making these tasks easier and more efficient with an amazing Web IDE, more flexible pipelines, additional security testing, and so much more.

<!-- more -->

## Web IDE is now open source and generally available
{:.intro-header}

At GitLab, we want everyone to be able to contribute, whether you are working on your first commit and getting familiar with git, or an experienced developer reviewing a stack of changes. Setting up a local development environment, or needing to stash changes and switch branches locally, can add friction to the development process. Using the Web IDE you can change multiple files, preview Markdown, review the changes and commit directly all from a browser. You can even open the diff from a merge request and get a side by side view of the changes. The Web IDE
is generally available in 10.7 and [is now open source](#web-ide-is-now-open-source), so everyone can benefit.

### Deploy Tokens
{:.intro-header-h3}

For any organization working with [containers](https://www.docker.com/what-container),
their registry is a key component in their infrastructure. It serves as a versioned
repository, providing an easy and secure way of interacting with
your container images. A common use for the registry is to serve images to an orchestrator
like [Kubernetes](https://kubernetes.io/). It's important for Kubernetes to have access on an ongoing basis.
For example, Kubernetes will pull an image on initial deployment, any time a pod restarts, or when scaling additional pods.

Previously there were two ways to grant access to the registry and repository. One way is the [CI job token](https://docs.gitlab.com/ee/user/project/new_ci_build_permissions_model.html#job-token) which provides temporary access for length of the job, after which it expires. [Personal Access Tokens](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html) provide long term access but are tied to a specific user. When using the CI Job Token, Kubernetes loses access once the CI job has completed, so ongoing events like pod restarts and scaling fail. Using Personal Access Tokens is also undesirable, because access has to be either shared with a user, or a separate service account must be created which takes up a license.

To address these needs more cleanly we have added [Deploy Tokens](#deploy-tokens), providing long lived read-only authentication. With a Deploy Token, Kubernetes can now get the images it needs, when it needs them, without being associated with a particular user or having unnecessary access rights.

### CI/CD flow control based on variables
{:.intro-header-h3}

A company's CI/CD service is the engine of their software engineering process,
performing a wide variety of roles from building and testing software, deploying
it to production, and frequently more creative tasks as well. With such a varied
and open-ended set of uses, it is important for users to be able to run specific
jobs only when they need to. GitLab CI/CD already provides a rich set of options
for [managing flow control](https://docs.gitlab.com/ee/ci/jobs/job_control.html#specify-when-jobs-run-with-only-and-except),
but there were some use cases like a nightly build that were not easy to address. In 10.7 jobs can now be
started based on the [value of specific variables](#variables-support-in-only-and-except-keywords), enabling new use cases like jobs specific to particular a
[pipeline schedule](https://docs.gitlab.com/ee/ci/pipelines/schedules.html) or [API trigger](https://docs.gitlab.com/ee/ci/triggers/#making-use-of-trigger-variables).

### SAST for Go and C/C++ languages
{:.intro-header-h3}

As part of [Complete DevOps](/blog/2017/10/09/gitlab-raises-20-million-to-complete-devops/), we are providing a great set of security tools out of the box. [Static Application Security Testing (SAST)](https://docs.gitlab.com/ee/user/application_security/sast/) analyzes your source code for known vulnerabilities, and outputs the results directly on the merge request for easy review. In order to analyze your code however, SAST needs to have support for your language. For this reason we have been broadening the scope of SAST, and now [support Go and C/C++](#sast-for-go-and-cc).
