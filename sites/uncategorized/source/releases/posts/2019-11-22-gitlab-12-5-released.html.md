---
release_number: "12.5"
title: "GitLab 12.5 with EKS Cluster Creation & Environments Dashboard"
author: Patrick Deuley
author_gitlab: deuley
image_title: '/images/12_5/12_5-cover-image.jpg'
description: "GitLab 12.5 released with EKS Cluster Creation and Deployment, Crossplane support, Environments Dashboard, and much more!"
twitter_image: '/images/12_5/12_5-cover-image.jpg'
categories: releases
layout: release
featured: yes
header_layout_dark: true
---

To deliver high-quality software as efficiently as possible, enterprises need to support a wide range of infrastructure,
[across multiple clouds](https://medium.com/gitlab-magazine/multi-cloud-maturity-model-2de185c01dd7). This month’s GitLab 12.5 release makes it even easier to
configure, monitor, and manage projects across a variety of configurations.

## Create and deploy to an EKS cluster from GitLab
{: .intro-header}

Like 85% of enterprises, [GitLab believes in multicloud](https://about.gitlab.com/blog/2019/11/06/gitlab-ci-cd-is-for-multi-cloud/). It’s critical that you can deploy to the cloud of your choice as seamlessly as possible. With that in mind, we’re thrilled to announce that you can now [create Kubernetes clusters on Amazon’s EKS](#easily-create-and-deploy-to-an-eks-cluster) with a few clicks. The workflow is similar to how easy it is to create a cluster with [Google’s GKE](https://about.gitlab.com/partners/technology-partners/google-cloud-platform/). Simply select EKS, configure a few cluster options, and GitLab will automatically provision the cluster correctly and prepare it so you can easily deploy your applications to it. GitLab eliminates the need to manually perform the complex task of cluster creation.

This feature is behind a feature flag and enabled in GitLab.com.

### Provision multicloud managed services with Crossplane
{:.intro-header-h3}

Building on our commitment to operational efficiency, we’re thrilled to announce that [Crossplane is integrated and deployable as a GitLab Managed App](#crossplane-support-in-gitlab-managed-apps). Crossplane removes the friction and effort of provisioning and managing cloud service dependencies by allowing admins to declaratively provision and securely consume managed services from the cloud of your choice, including GCP, AWS, and Azure. Integration with Auto DevOps makes spinning up hosted resources on the cloud as simple as declaring a CI variable.


### View environment status at a glance
{:.intro-header-h3}

You're faced with frequent application changes, all making their way toward production. It’s hard to track changes as they flow through your various dev, staging and prod environments. GitLab's new [Environments Dashboard](#environments-dashboard) surfaces that information, providing a single point of access to the status of environments in all groups and projects. This means you can identify and triage problems (for example, “Is an environment not working because code is being deployed, or because it’s actually broken?”) quickly and visually.



### And much more!
{:.intro-header-h3}

12.5 is a big release, and there’s a lot more to see. Highlights include [Sourcegraph integration](#code-intelligence-powered-by-sourcegraph) and a host of new security improvements. Read on to get the details!

We’d love to meet you in person. If you're coming to AWS re:Invent December 2 - 6, visit us at booth #1620. Also, [registration](https://www.eventbrite.com/e/gitlab-commit-2020-san-francisco-tickets-73836706577) is now open for the next [GitLab Commit User Conference](https://www.eventbrite.com/e/gitlab-commit-2020-san-francisco-tickets-73836706577) in San Francisco, January 14.
