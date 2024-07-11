---
release_number: "10.6"
title: "GitLab 10.6 released with CI/CD for GitHub and deeper Kubernetes integration"
author: Victor Wu
author_gitlab: victorwu
author_twitter: victorwuky
image_title: '/images/10_6/10_6-cover-image.jpg'
description: "GitLab 10.6 released with CI/CD for GitHub, deeper Kubernetes integration, group issue board in Core and Free, and lots more!"
twitter_image: '/images/tweets/gitlab-10-6-released.png'
categories: releases
layout: release
tags: features
---

Continuous integration, continuous delivery, and continuous deployment form the backbone of modern DevOps. GitLab features built-in CI/CD that has received a lot of positive attention from [developers](http://blog.thehumangeo.com/gitlab-autoscale-runners.html), [enterprises](/blog/2017/06/07/continuous-integration-ticketmaster/), and [analysts](/blog/2017/09/27/gitlab-leader-continuous-integration-forrester-wave/) alike.

But one thing that was missing was that you couldn't use GitLab CI/CD with GitHub.  Well today, we’ve fixed that.

<!-- more -->

## Introducing GitLab CI/CD for GitHub
{:.intro-header}

While GitLab works best when you use it [all end-to-end](/handbook/product/single-application/), we also seek to [play well with others](/direction/#plays-well-with-others). In this spirit, we’ve added [CI/CD integration with GitHub](/solutions/github/), and more generally the ability
to [integrate CI/CD with other external repos](#gitlab-cicd-for-external-repos) like Bitbucket as well. We see four primary audiences that this functionality is designed for. 

### Open source projects
{:.intro-header-h3}

If you have a public, open source project on GitHub you can now take advantage of free CI/CD on GitLab.com. As part of our commitment to open source, we offer all public projects our highest tier features (Gold) for free. While other CI/CD vendors limit you to running a handful of concurrent jobs, [GitLab.com](https://GitLab.com) gives open source projects hundreds of concurrent jobs with 50,000 free CI pipeline minutes per month.

### Large Enterprises
{:.intro-header-h3}

When we talk to our largest customers they tell us that they often have many teams using many different tools. They want to standardize on GitLab for CI/CD but code is stored in GitLab, GitHub, and other repos. This feature now allows enterprises to use common CI/CD pipelines across all of their different repos. This is a key audience and why we’ve made CI/CD for GitHub part of our self-managed Premium plan.

### Anyone using GitHub.com
{:.intro-header-h3}

While GitLab is designed to use SCM & CI/CD in the same application, we understand the appeal of using GitLab CI/CD with GitHub version control. So, for the next year we are making the GitLab CI/CD for GitHub feature a part of our [GitLab.com](https://GitLab.com) Free tier. That means anyone using GitHub from personal projects and startups to SMBs can use GitLab CI/CD for free. Starting at 2000 free CI pipeline minutes per month, folks can also [add their own Runners](https://docs.gitlab.com/ee/ci/runners/runners_scope.html#specific-runners) or upgrade plans to get more.

### Gemnasium customers
{:.intro-header-h3}

We recently [acquired Gemnasium](/press/releases/2018-01-30-gemnasium-acquisition.html). While we are super excited about having such a great team join our ranks, we also want to take care of folks that were using Gemnasium and provide them a migration path. We’ve already [shipped Gemnasium features](/releases/2018/02/22/gitlab-10-5-released/#gemnasium-dependency-checks) as part of our built-in security scanning. Now, GitLab CI/CD for GitHub allows Gemnasium customers that were using GitHub + Gemnasium to begin using GitLab CI/CD for their security needs without needing to migrate their code.

## Kubernetes on GitLab keeps getting better
{:.intro-header}

GitLab continues to invest in integrating with containerization. In 10.4 we release [Kubernetes Cluster Integration and GKE Integration to General Availability](/releases/2018/01/22/gitlab-10-4-released/#gitlab-clusters-now-generally-available). With this release, we make it even easier for users to use Kubernetes with GitLab. You can now [deploy a GitLab Runner to your connected Kubernetes cluster with a single click](#quick-deploy-of-gitlab-runner-to-kubernetes-cluster). You can also [monitor your connected Kubernetes cluster from within GitLab](#kubernetes-cluster-monitoring) itself. And you can now also [see the IP address of an Ingress controller connected to your Kubernetes cluster](#ingress-ip-address-on-kubernetes-cluster-page), again, right inside GitLab!

<style>
@media (min-width: 768px) {
  .intro-header-h3 {
    font-size: 28px !important;
  }
}
</style>
