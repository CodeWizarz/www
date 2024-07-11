---
title: "GitOps with GitLab: What you need to know about the Flux CD integration"
author: Viktor Nagy
author_gitlab: nagyv-gitlab
author_twitter: nagyviktor
image_title: '/images/blogimages/balance-speed-security-devops.jpg'
categories: engineering
featured: yes
tags: GitOps, Kubernetes, DevOps, news
description: Inside the decision to integrate Flux CD with the GitLab agent for Kubernetes and what it means to you.
twitter_text: In January, GitLab decided to integrate Flux CD with the GitLab agent for Kubernetes for GitOps. Find out why and what's next.
---

In January, [we decided to integrate Flux CD with the GitLab agent for Kubernetes](https://gitlab.com/gitlab-org/gitlab/-/issues/357947). [Flux CD](https://fluxcd.io/) is a mature GitOps solution and one of the market leaders in the area. We have since decided to make Flux CD our recommended approach to do [GitOps](https://about.gitlab.com/topics/gitops/) with GitLab – previously, the agent for Kubernetes alone was the recommended approach. Let's discuss what this change means for current users and what our plans are for the integration.

First of all, let's remove the most worrying thought from the agenda: We are not deprecating any agent for Kubernetes functionality at this point. The GitOps offering remains fully supported and transitions to maintenance mode. We plan to deprecate it with at least one year of removal time once we consider the Flux integration solid. As a result, the removal is unlikely before the GitLab 17.0 release, which is expected in 2024. We are looking into providing tooling to facilitate (or automate) the migration once the time comes. If you use the agent for Kubernetes for GitOps, you don't have to do anything at this time.

This change does not affect the agent's other non-GitOps functionality either. The [CI/CD pipeline integration](https://docs.gitlab.com/ee/user/clusters/agent/ci_cd_workflow.html) and [operational container scanning](https://docs.gitlab.com/ee/user/clusters/agent/vulnerabilities.html) remain intact, and we will continue investing in them.

## What to expect from this change

From now on, instead of building our solution for GitOps, we will focus on supporting Flux and improving its user experience when it is used together with GitLab. Flux CD will become the recommended tool to do GitOps with GitLab. Initially, we will provide documentation on the Flux setup we recommend for our users while we focus on building out various integrations.

In terms of the integrations, we are looking at providing a UI built into GitLab. You might also be able to use the UI with other tools, including the CI pipeline integration of the agent, but it will work best with deployments managed by Flux. Besides the UI integration, we want to streamline Flux's access management. Flux accesses GitLab through the regular GitLab front door. As a result, it needs to authenticate with a token, requests might be rate-limited, and, in general, it does not seem to be the most efficient way to do its job. We plan to simplify this for our users to avoid the necessity of managing dozens of deploy keys and to decrease the load on GitLab at the same time.

## Why Flux?

Why did we choose Flux CD instead of something else? We evaluated several options. There are other open-source GitOps tools. The biggest contender was [ArgoCD](https://argoproj.github.io/cd), another mature Cloud Native Computing Foundation project in the GitOps space. ArgoCD is a full-featured product for GitOps, while Flux is a GitOps toolkit. While we like and value ArgoCD a lot, we think it does not lend itself to integration with GitLab.

As we are already in the process of building out UI integrations with the cluster, we know how the GitLab UI will be able to reach the Kubernetes API. Flux relies on the standard Kubernetes API 100%, so we can easily integrate it into our UI access approach. Relying only on the Kubernetes API is a significant benefit over ArgoCD, which provides a custom API.

Besides going with another tool, we evaluated the work needed to build a competitive, in-house solution. We found in-house development is the strongest contender to Flux CD, and while it was very compelling, we decided to go with the integration instead. We believe this should give our customers more value faster than a custom solution. Moreover, it should enable existing Flux users to benefit from our integrations with minor modifications in their usage patterns as we roll out the integrations.

## What comes next?

First, we want to [document our recommendations for using FluxCD with GitLab](https://gitlab.com/gitlab-org/gitlab/-/issues/389382). At the same time, we will change our GitOps documentation to recommend Flux instead of the legacy GitOps solution. We consider these the most important steps to minimize uncertainty and set you up for a successful start.

Together with the above, the team is working hard on shipping the first version of an [integrated Kubernetes UI](https://gitlab.com/gitlab-org/gitlab/-/issues/375449). We are starting with an environment overview and build an [entire Kubernetes dashboard](https://gitlab.com/groups/gitlab-org/-/epics/2493) as part of GitLab. The cluster UI integration will enable GitLab users to learn more about their cluster state without leaving the GitLab UI and should allow a nearly real-time view of GitOps deployments using Flux CD.

We have clear ideas on how to do what I described above. We are still researching and learning about many other topics, including [how to simplify Flux best accessing GitLab](https://gitlab.com/gitlab-org/gitlab/-/issues/389393). If you have experience using Flux with GitLab and have any feedback, recommendations, or requests on what the integration should support, we would like to hear from you. Please, reach out to me using [my GitLab profile](https://gitlab.com/nagyv-gitlab).

## The Flux community

Before I close this article, I would like to say hi and thank you to the Flux community. We already got invited to the Flux development meeting, and the core team was very welcoming. As we always actively contributed to the core tools – first [`gitops-engine`](https://github.com/argoproj/gitops-engine/), later [`cli-utils`](https://github.com/kubernetes-sigs/cli-utils/) – supporting our GitOps offering, we are looking forward to contributing to Flux CD.

We are looking forward to working more closely with you. Thank you for building this great tool and community!

_Disclaimer: This blog contains information related to upcoming products, features, and functionality. It is important to note that the information in this blog post is for informational purposes only. Please do not rely on this information for purchasing or planning purposes. As with all projects, the items mentioned in this blog and linked pages are subject to change or delay. The development, release, and timing of any products, features, or functionality remain at the sole discretion of GitLab._

Read more:

- More about the [Flux CD integration decision](https://gitlab.com/gitlab-org/gitlab/-/issues/357947) 
- Docs for [agent for Kubernetes](https://docs.gitlab.com/ee/user/clusters/agent/ci_cd_workflow.html) 
- Issue on [our current focus](https://gitlab.com/gitlab-org/gitlab/-/issues/389382) 
- Preparation issues: [Flux to GitLab access management](https://gitlab.com/gitlab-org/gitlab/-/issues/389393) and [Visualizing Kubernetes resources within the Environments page](https://gitlab.com/gitlab-org/gitlab/-/issues/375449)

