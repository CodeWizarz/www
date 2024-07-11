---
title: "Demo - Auto Deploy from GitLab to an OpenShift container cluster"
author: Erica Lindberg
author_gitlab: erica
author_twitter: elindberg_
categories: engineering
image_title: '/images/blogimages/devops-openshift-webcast-blog-cover.png'
description: "See how to reliably and repeatably build, test, and deploy an application in a container from GitLab to the OpenShift container cluster."
twitter_image: '/images/tweets/container-devops-tweet.jpg'
cta_button_text: 'Watch our webcast, <strong>The DevOps Journey: Using Containers</strong> on demand!'
cta_button_link: 'https://www.youtube.com/watch?v=uofcDMclUnk&feature=youtu.be'
---

Containers are an essential tool for achieving [DevOps](/stages-devops-lifecycle/) at scale. Bringing code and infrastructure closer together, containers provide consistency across environments and tools for developers, QA, and IT. Using GitLab's [built-in CI/CD](/features/continuous-integration/) and our integration with OpenShift, you can run all of your CI/CD jobs in a container cluster.

<!-- more -->

## What is a container?

Containers work much like a virtual machine except that, instead of packaging your code with an operating system, containers are run as a Linux process inside of the kernel. This means that each container only contains the code and dependencies needed to run that specific application, making them smaller and faster to run.

For developers, containers make it possible to build one version of an application that can be easily deployed to multiple types of environments. Essentially, whatever developers and QA runs, is exactly what finds its way to production. What you see in development is what you see in testing, staging, and production. Code can be shipped faster when packaged in a container because errors and bugs are caught earlier in process.

Communication and collaboration between developers and operations also improves because developers have seen exactly what it is that operations is getting, and operations are running exactly what the developers gave them. The result is that everyone can focus more on shipping quality code faster because applications don't have to be rebuilt as they move through the development lifecycle.

GitLab integrates with both Kubernetes and OpenShift container orchestration platforms, making it possible to run [continuous integration and continuous delivery](/topics/ci-cd/) related jobs in the cluster. It also gives you the ability to set up different environments, called [Review Apps](/stages-devops-lifecycle/review-apps/), for different branches of your code base. Review Apps make it easy to view and test changes in an environment, in the cluster, so you can iterate and test faster.


### Demo

In this demonstration, Senior Build Engineer DJ Mountney, will show how you can build, test, and deploy a basic application in a container from GitLab to an OpenShift container cluster.

<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/EwbhA53Jpp4" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

### Watch the webcast

To learn more about containers, how they can help scale your [DevOps workflow](/topics/devops/), and the GitLab/OpenShift integration, [watch](https://www.youtube.com/watch?v=uofcDMclUnk&feature=youtu.be) **The DevOps Journey: Using Containers webcast**.
