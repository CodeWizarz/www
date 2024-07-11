---
title: "Auto Deploy a GitLab.com project to Google Cloud"
author: Dmitriy Zaporozhets
author_gitlab: dzaporozhets
author_twitter: dzaporozhets
categories: engineering
image_title: '/images/blogimages/auto-deploy-google-cloud.jpg'
description: "How to get started with our auto deploy feature using Google Kubernetes Engine."
tags: google, GKE
---

For up-to-date information on GitLab's native integration with Google Kubernetes Engine, please visit the announcement blog post: [GitLab + Google Cloud Platform = simplified, scalable deployment](/blog/2018/04/05/gke-gitlab-integration/).
{: .alert .alert-gitlab-orange}

Once you write your code the next question is, "How do you deploy it?" There are plenty of ways to do it but none of them is perfect. You need to configure external tools, write your own scripts and maybe even do manual command execution every time you want a new version deployed. At GitLab we believe deployment should be an essential part of workflows, like code review and CI. Several months ago we shipped an amazing feature, [auto deploy](https://docs.gitlab.com/ee/topics/autodevops/stages.html), that should take care of code deployment for you. Finally, I found some time to give it a try.

<!-- more -->

## What is GitLab Auto Deploy?

Originally released in [8.15](/releases/2016/12/22/gitlab-8-15-released/#auto-deploy) and heavily improved since then, auto deploy should deploy your application as part of a CI/CD pipeline within the GitLab user interface. It means you can set up an application to be deployed automatically every time a new commit lands into the `master` branch.

As per the documentation, the feature will package your application into a Docker image that then will be deployed to Kubernetes. GitLab has a container registry feature so the Docker image will be stored within GitLab too.

Setup of the GitLab auto deploy feature is a matter of clicking on the "Set up auto deploy" button and applying the "Kubernetes" template to your `.gitlab-ci.yml` file. However, before this, you need to configure your GitLab project with valid credentials so it can access your cluster. Which brings us to the point that you need your Kubernetes cluster first.

## Why Google Kubernetes Engine?

The documentation states, "Google Kubernetes Engine is a managed environment for deploying containerized applications." It runs Kubernetes and you can create your cluster with a few clicks in the web interface.

There are [a few other](https://kubernetes.io/docs/setup/pick-right-solution/) Kubernetes hosting solutions available on the market and you might prefer a different one, but as a newcomer I decided to go with Google for a few reasons:

* It's number one on the list of proposed solutions on Kubernetes doc.
* It gives a nice free tier (300$ at the time of this blog post) which is enough for experiments.
* Google originally started Kubernetes, so I expected some level of maturity from the service.  

## How to tie it all together

It took me some time to figure out the sequence of events and actions to make it work. This is the result:

1. Create GitLab.com project with Dockerfile
2. Create cluster
3. Copy credentials to GitLab.com project
4. Apply auto deploy template to `.gitlab-ci.yml`

As a result, I have a [Ruby application](https://gitlab.com/dzaporozhets/minimal-ruby-app) that is built and deployed to staging automatically once I push code to the master branch. Additionally, I can manually deploy any pipeline to production with a single click.  

For those who are new to Kubernetes but want to try GitLab auto deploy in action, I made a [quick start guide](https://docs.gitlab.com/ee/topics/autodevops/stages.html).

[Cover image](https://unsplash.com/@jbcreate_?photo=eUMEWE-7Ewg) by [Joseph Barrientos](https://unsplash.com/@jbcreate_) on Unsplash
{: .note}
