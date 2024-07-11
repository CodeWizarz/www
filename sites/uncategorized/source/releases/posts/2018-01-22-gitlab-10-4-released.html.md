---
release_number: "10.4"
title: "GitLab 10.4 released with Dynamic Application Security Testing and Web IDE (beta)"
author: James Ramsay
author_gitlab: jramsay
author_twitter: jamesramsay
image_title: '/images/10_4/10_4-cover-image.jpg'
description: "GitLab 10.4 released with Dynamic Application Security Testing, SAST for Docker Containers, Web IDE editor (beta), and improvements to Epics, Merge
Requests, Geo, Runner, Git LFS, SSH, Monitoring, and Auto DevOps!"
twitter_image: '/images/tweets/gitlab-10-4-released.png'
categories: releases
layout: release
tags: features, releases
---

In this month's release of GitLab 10.4 – the first of 2018 – we've added
capabilities to improve planning, testing, merge requests, and deployment. This
release also includes new security testing capabilities and the first iteration of
our Web IDE, part of our ambitious product vision for
[Complete DevOps](/blog/2017/10/11/from-dev-to-devops/).

<!-- more -->

## Security testing
{:.intro-header}

As part of Complete Devops, we want to offer powerful security tools out of the
box. We recently released static application security testing and are now
expanding that with
[Dynamic Application Security Testing (DAST)](#dynamic-application-security-testing-dast)
and
[Static Application Security Testing (SAST) for Docker Containers](#sast-for-docker-containers).
DAST, SAST for Docker Containers, and Browser Performance Testing have also
been added as a best practice to Auto DevOps.

## Faster editing
{:.intro-header}

"If you can do it in less than two minutes, do it now" states the two-minute
rule of [Getting Things Done](https://en.wikipedia.org/wiki/Getting_Things_Done).
Writing a small fix or correcting a typo should be fast, but this is rarely the
case when we need to stash changes and switch to a different context.

Delaying a fix or waiting to address feedback on a merge request increases
cycle time, and it's even worse for distributed teams where hours quickly become days,
all for avoiding a `git stash`. The [new editor](#web-ide-editor-beta), which is
the first release of the GitLab Web IDE,
makes it easier to contribute changes like these from the GitLab interface.

## See all the features
{:.intro-header}

We've also shipped many exciting improvements this month to Epics, Merge
Requests, Geo, Runner, Git LFS, SSH, Monitoring, and Auto DevOps.

Read on to learn more about all of the key features shipped in 10.4!
