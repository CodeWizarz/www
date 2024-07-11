---
release_number: "11.5"
title: "GitLab 11.5 released with Group Security and Operations Dashboards, and Access Control for Pages"
author: Fabio Busatto
author_gitlab: bikebilly
image_title: '/images/11_5/11_5-cover-image.jpg'
description: "GitLab 11.5 released with Group Security and Operations Dashboards, Access Control for GitLab Pages, Knative for Kubernetes, and much more!"
twitter_image: '/images/tweets/gitlab-11-5-released.png'
categories: releases
layout: release
header_layout_dark: true
featured: yes
---

## Group dashboard for security teams
{: .intro-header}

For a long time, developers have used GitLab as a tool to secure their code. But now,
GitLab is making security teams first-class citizens so they can use GitLab to effect better application security and ensure compliance. With 11.5, the
[Group Security Dashboard](#group-security-dashboard) pulls together all of the information security personnel need into one place, so folks like CISOs,
CIOs, and application security leaders get a specific view designed for them.
The group dashboard has a redesigned look and new visualizations, bringing together
security information across multiple projects and providing a high-level view while
also enabling the ability to drill down into specific reports. With 11.5, we're
starting with SAST reports, and we'll be adding more to the group dashboard in
the future. Our goal is to build a single tool that security teams can use
instead of needing to switch back and forth between multiple tools.

## New dashboard for operations teams
{: .intro-header}

In the same way that the Group Security Dashboard makes security teams first-class citizens, the [Operations Dashboard](#operations-dashboard) provides a
tailored experience for operations professionals. This instance-wide dashboard
provides a single view across projects to get a summary of each project’s
operational health, including pipeline and alert status.

## Control access to GitLab Pages
{: .intro-header}

[GitLab Pages](/stages-devops-lifecycle/pages/) is an easy way to
serve static content on the web, making it perfect for use cases such as
documentation for your project. But what about private projects where
documentation and other static artifacts should only be accessed by project
members? In the past, you'd either have to make your assets public to take
advantage of Pages, or you would not be able to use the feature at all.

Now, in GitLab 11.5, the same access control permissions that apply to your
issues and code can also be applied to static webpages served by GitLab Pages.
Unauthenticated users will get a 404 when visiting the link. As of today,
[access controls for GitLab pages](#access-control-for-pages) is available for self-managed GitLab,
with GitLab.com support coming soon.

This is a unique feature that we're particularly proud of because it comes
from our open source community. Access control for Pages has been one of our
[most requested features](https://gitlab.com/gitlab-org/gitlab-ce/issues/33422)
and [the code has been community contributed](https://gitlab.com/gitlab-org/gitlab-pages/merge_requests/94) as well!

## Knative for Kubernetes
{: .intro-header}

“Serverless” is a popular, yet often misunderstood industry term. Some folks equate
serverless with "Function as a Service," or FaaS, but this [isn't quite accurate](https://martinfowler.com/articles/serverless.html). In a nutshell, serverless enables a programming paradigm where you are able
to focus on writing business logic without having to understand or even
worry about the underlying infrastructure where your software is deployed.
As such, both functions and applications can be serverless.

[Knative](https://cloud.google.com/knative/) is a Kubernetes-based platform
to build, deploy, and manage modern serverless workloads, and GitLab 11.5
comes with the ability to [easily deploy and integrate Knative with GitLab](#easily-deploy-and-integrate-knative-with-gitlab). You can now install Knative to your [connected Kubernetes cluster](/solutions/kubernetes/) with a single click. With GitLab 11.5, you'll be able to use Knative for your serverless applications, with
[serverless functions coming in 11.6](https://gitlab.com/gitlab-org/gitlab-ce/issues/43959).

Today, Knative is still in alpha, but there are some compelling reasons to deploy applications using Knative as it comes with some powerful functionality out-of-the-box. In particular, Knative manages pod scaling for you so you can automatically scale up, or even scale down to zero without additional configuration. Additionally, Knative comes with eventing built in so using it to deploy microservices makes it easier to manage inter-process communication between your producer and consumer services.

## And so much more!
{: .intro-header}

With so many great features in this release, we couldn't pack them all into
the intro. Be sure to read up on other exciting new features like
[the parallel attribute for faster pipelines](#parallel-attribute-for-faster-pipelines),
[redesigned Issue Board cards](#issue-board-cards-redesigned), and an initial
[Jaeger integration](#open-jaeger-from-gitlab).
We’ve made big improvements in this release to make code review easier and more useful, including the ability to
[comment on unchanged lines in merge requests](#comment-on-unchanged-lines-in-merge-request),
[preview merge request reviews before submitting](#preview-merge-request-review-before-submitting-it), and
[assign approvers based on Code Owners](#assign-approvers-based-on-code-owners) along with
[Review App direct links](#review-app-direct-link).
Keep reading to see all of the features that are part of this release.
