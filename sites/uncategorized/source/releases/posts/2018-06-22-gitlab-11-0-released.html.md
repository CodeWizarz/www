---
release_number: "11.0"
title: "GitLab 11.0 released with Auto DevOps and License Management"
author: Marcia Ramos
author_gitlab: marcia
author_twitter: XMDRamos
image_title: '/images/11_0/gitlab-11-0-released-cover.jpg'
description: "GitLab 11.0 released with Auto DevOps Generally Available, License Management, SAML SSO for Groups, open source Squash and Merge, and much more!"
twitter_image: '/images/tweets/gitlab-11-0-released.png'
categories: releases
layout: release
---

<figure class="video_container">
<iframe src="https://www.youtube.com/embed/EcFOx-FBrlQ" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

Writing and delivering quality software poses many challenges.
First, you must solve tough business problems and craft great code.
But the challenges don't stop there. You have to ensure your code
is fast, secure, and bug-free. You will need to build, integrate,
test, secure, review, configure, and deploy your code. Creating
and managing this pipeline is time consuming and complex.

Beyond making it easy to host and collaborate on public and private
repositories, GitLab also simplifies the rest of the process by
offering the whole delivery toolchain, built in. And now, it's not
only built in, it's automated. Simply commit your code and
[**Auto DevOps**](https://about.gitlab.com/stages-devops-lifecycle/auto-devops/) can do the rest. Auto DevOps is a pre-built, fully
featured CI/CD pipeline that automates the entire delivery process.
It is Generally Available and ready for prime time in GitLab 11.0.

Other key features we have released in GitLab 11.0 include
**License Management** to automatically detect licenses of
your project's dependencies; enhanced **Security Testing**
of your code, containers, and dependencies; further **Kubernetes**
integration features; an enhanced **Web IDE**; enhanced
**Epic and Roadmap** views; **Incremental Rollouts**; and much more.

<!-- more -->

First, some more detail about these key features.

**[Auto DevOps](#auto-devops-generally-available) covers the end-to-end
lifecycle:**
Simply commit your code to GitLab, then Auto DevOps does the rest:
[building](https://docs.gitlab.com/ee/topics/autodevops/#auto-build),
[testing](https://docs.gitlab.com/ee/topics/autodevops/#auto-test),
[code quality scanning](https://docs.gitlab.com/ee/topics/autodevops/#auto-code-quality),
[security scanning](https://docs.gitlab.com/ee/topics/autodevops/#auto-sast),
[license scanning](https://docs.gitlab.com/ee/topics/autodevops/#auto-license-management),
[packaging](https://docs.gitlab.com/ee/topics/autodevops/#auto-review-apps),
[performance testing](https://docs.gitlab.com/ee/topics/autodevops/#auto-dast),
[deploying](https://docs.gitlab.com/ee/topics/autodevops/#auto-deploy), and
[monitoring](https://docs.gitlab.com/ee/topics/autodevops/#auto-monitoring)
your application.

> “GitLab is a key part of our software-delivery processes and because
of them, we’ve improved our delivery velocity by four times and made
it immensely easier for our teams to collaborate,” said Chris Hill,
head of systems engineering for infotainment at Jaguar Land Rover.  
>  
> “We’re excited about Auto DevOps, because it will allow us to focus
on writing code and business value. GitLab can then handle the rest;
automatically building, testing, deploying, and even monitoring our
application.”

<figure class="video_container">
<iframe src="https://www.youtube.com/embed/0Tc0YYBxqi4" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

**[License Management](#license-management) (software composition analysis):**
Software is often a complex amalgamation of code that includes external components
(libraries, frameworks, and utilities). Each component typically includes
specific license permissions and limitations, so you need to track and manage
these dependencies for your application. GitLab 11.0 includes License Management
(software composition analysis) built into the Merge Request so you can track
and manage the included licenses.

**Security:** This month we continue to improve GitLab's built-in security
capabilities so you can "shift security left" and catch vulnerabilities early
via integrated Static and Dynamic Application Security Testing, along with
Dependency and Container Scanning. Specifically, we’ve extended coverage of
Static Analysis Security Testing (SAST) to
[include Scala and .Net](#sast-for-net-and-scala). We’re also including more
details in the SAST reports so you can get insight about specific issues
right there.

**Kubernetes:** As part of our ongoing effort to improve the integration
with Kubernetes and make it easy for you to manage and monitor Kubernetes
from GitLab, there are several new features. Most notably, when you need
to debug or check on a pod, you can review the
[Kubernetes pod logs](#view-kubernetes-pod-logs) directly from GitLab's
deployment board.

**GitLab Web IDE:** The more work you can do directly from the IDE, the
more productive you can be. Now, you are able to
[view your CI/CD pipelines from the IDE](#cicd-pipeline-status-and-job-traces-in-the-web-ide)
and get immediate feedback if a pipeline fails. Switching tasks
can be disruptive, so the updated Web IDE makes it easy to quickly switch
to the next merge request, to create, improve, or review without leaving
the Web IDE. This way, you can stay in the flow of writing and reviewing
code changes.

**Navigate Epics / Roadmaps:** When you want to visualize how
[Epics and Roadmaps flow over time](#roadmap-date-ranges), it can be helpful
to change the time scale and zoom out. We’ve updated the Epic/Roadmap navigation
interface to make it easier to see the big picture and make planning easier.
