---
title: "GitLab 8.16 release webcast recording and highlights"
author: Rebecca Dodd
author_gitlab: rebecca
author_twitter: gitlab
categories: releases
image_title: '/images/blogimages/8-16-webcast-recap.png'
description: "Auto Deploy on GKE, Web Terminal, Monitoring with Prometheus Plus Time Tracking Comes to CE!"
---

In this webcast, our Head of Product [Mark Pundsack](https://gitlab.com/markpundsack) and Product Manager [Régis Freyd](https://gitlab.com/regisf) show us what's new in our latest release, demo auto deploy, web terminal and monitoring, let us in on what's next for GitLab, and take your questions.

<!-- more -->

With GitLab 8.15 and 8.16 we brought you auto deploy with Kubernetes using Google Kubernetes Engine, introduced our popular Time Tracking tool to the Community Edition, made it easier to fix bugs right within our UI with the Web Terminal, released monitoring functionality with Prometheus and added Merge Request Approvals to our Enterprise Edition. You can watch the recording of our release webcast and check out the highlights below.

<figure class="video_container">
<iframe src="https://www.youtube.com/embed/iYPhXm8RlxI" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

## Highlights

### [01:37] Introduction to Git and GitLab
### [03:53] GitLab's Idea to Production Vision

> At the end of 2016 we completed our vision of [Idea to Production](https://gitlab.highspot.com/spots/615dd7e3911d70c4887812a7) and with the release of [GitLab 8.16](/releases/2017/01/22/gitlab-8-16-released/), we took the first step toward our new goal of making world-class monitoring easier for everyone by bundling in Prometheus and its Node Exporter with our Omnibus package.

### [06:05] Auto Deploy

> Auto deploy adds a single button to your project which, when clicked, creates a merge request with a template that will automatically deploy your application using Docker to your container scheduler. This immediately leverages Review Apps, meaning you can see it working before even merging the merge request – as close as you can get to one-click deploys. Jump ahead to 09:33 for a demo.

### [07:33] Web Terminal

>Traditionally, gaining direct access to review apps or a staging or production environment for your project has been a little painful. We've made it much easier with the Web Terminal which shipped in 8.15: just visit the environments page in your project and click on the terminal button. GitLab will SSH into the instance for you and allow you to tinker away or debug a problem quickly. You'll find a demo for this at 14:47.

### [08:14] Monitoring with Prometheus

>This release included Prometheus and its Node Exporter as part of our Omnibus package, providing high-quality, time-series monitoring of your GitLab server's resources. After you've enabled Prometheus you have access to the Prometheus console, or you connect a compatible dashboard tool such as Grafana. The demo starts at 15:56.

### [17:21] Time Tracking for CE

>Time tracking lets you record estimates and time spent on issues and merge requests, making it not only a powerful reporting tool, but a useful planning tool as well. And we've brought it to CE! Visit our [8.14 webcast recap](/releases/2016/12/08/gitlab-8-14-webcast/) for a demo. We've also added an API, so from now on, everything you can do in the UI, you can do with the API.

### [18:49] Merge Request Approval (EE)

>The merge request approvals mechanism is simple: you can define a set of approvers for merge requests that are submitted, and you won’t be able to merge unless all approvers have given their consent. Until now, once the approval was given, there was no way of undoing the action, but we've now added a handy button that lets you remove your approval if you’ve given it. You now also see who have already approved a merge request.

### [19:39] Other Improvements in 8.15 & 8.16

- New issues search and filter bar
- Limit Shared Runner usage (EE)
- New slash command: /merge
- Plus some great contributions from our community

Check out the [8.16 release blog post](/releases/2017/01/22/gitlab-8-16-released/) for the full list of improvements.

### [21:03] What's next

>Squash commits and auto rebase for merge requests are a highly requested feature and we're happy to say it’s coming soon. We’re also working on improving our issue boards – we think they're a valuable project-planning tool with a lot of potential. We're also working on introducing a License Finder and better audit logs. GitLab 9.0 is coming on March 22nd!

### [22.54] Q&A

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a [subscription](/pricing/).
No time to upgrade GitLab yourself? Subscribers receive upgrade and installation
services.

_Tweet us [@GitLab](https://twitter.com/gitlab), check out our [job openings](/jobs/), or add your questions and suggestions to our [issue tracker](https://gitlab.com/gitlab-org/gitlab-ce/issues)!_

Image by [David França](https://gitlab.com/dfranca)
{: .note}
