---
layout: markdown_page
title: "Category Strategy - Cloud Native Installation"
---

- TOC
{:toc}

## Cloud Native Installation

| --- | --- |
| Stage | [Enablement](/direction/enablement/) |
| Maturity | [Complete](/direction/maturity/) |
| Content Last Reviewed | `2022-02-02` |

### Introduction and how you can help
Thanks for visiting this category strategy page for the Cloud Native Installation. This page belongs to the [Distribution](/handbook/product/categories/#distribution-group) group of the Enablement stage and is maintained by Dilan Orrino ([E-Mail](mailto:<dorrino@gitlab.com>)).

Your ideas and feedback are important to us and play a major part in shaping the product direction. The best way to provide feedback on scheduled improvements is by commenting on issues in the [deliverable issues board](https://gitlab.com/groups/gitlab-org/-/boards/1282058?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Deliverable&label_name[]=group%3A%3Adistribution). To create a new feature request, create an issue in the [Charts project](https://gitlab.com/gitlab-org/charts/gitlab). 

We are always looking for opportunities to interview GitLab users and learn more about your experiences using the cloud-native install to deploy a self-managed instance of GitLab. If you would like to share your experience and provide feedback through a video call, please [email Dilan](mailto:<dorrino@gitlab.com>).


### Overview

The cloud-native installation is used for deploying GitLab as a Kubernetes application. In this deployment method, GitLab is broken down into a cloud-native application structure comprised of GitLab services and resources that are distributed across a set of containers. 

The GitLab Helm charts are used to deploy and manage the containers in Kubernetes. Additionally, [the GitLab Operator](https://docs.gitlab.com/operator/) has been developed to further improve the experience of managing the cloud-native deployment of GitLab. The Operator provides greater control over upgrades and makes it possible to perform rolling upgrades. 

Cloud-native applications offer a number of benefits over the more traditional monolithic applications. Perhaps the greatest benefit is the ability to automatically scale individual services within the application to meet usage demand. We have seen significant growth in organizations adopting Kubernetes and increased interest in deploying GitLab in Kubernetes. 

GitLab is committed to staying ahead of the curve in new developments for deploying applications and managing the underlying infrastructure that they run on. We already have a strong cloud-native offering, but we know we can make it even better. Our goal is to offer a full-featured, cloud-native version of GitLab that can be reliably used at any scale, even beyond our 50,000-user reference architecture.

#### Target Audience
Similar to [the Omnibus category](https://about.gitlab.com/direction/distribution/omnibus/), the Cloud Native Installation is for organizations or teams that prefer to run their own instance of GitLab rather than use the hosted gitlab.com offering. This install method is specifically for teams wanting to run GitLab in Kubernetes. 

It is also for GitLab's own admin team that is responsible for managing gitlab.com. We are transitioning from using Omnibus to manage gitlab.com, to using the GitLab Helm charts and running parts of gitlab.com in Kubernetes. This allows us to more easily scale what is the world's largest instance of GitLab. 

The user personas most likely to be working with the Cloud Native Installation are:

*  System Administrators and DevOps Engineers 
   
   System Administrators and DevOps Engineers are responsible for providing development teams with a fast and reliable development environment that responds well to spikes in usage. They may also be encouraged or mandated by their organization to move critical applications to cloud-native deployments as part of a modernization strategy. The level of Kubernetes experience tends to vary. We find that some teams have a lot of experience and are interested in advanced features that allow them to optimize their instance. Other teams are relatively new to Kubernetes and need the deployment experience to be easy and clear, with step-by-step guidance to get up and running.

*  Software Developer
   
   On small development teams, it might be the role of the software developer to spin up their own instances of GitLab in Kubernetes. They want to be able to manage the instance with minimal effort so they can focus on their primary job of developing software. They use GitLab for their daily work and need it to respond well to spikes in usage with minimal impact on speed.

   On large development teams that are running a large-scale deployment of GitLab, the developer needs clarity on what changed in the instance because there are more people involved in the management of the instance and they need to understand changes to the configuration. They may want more control over how GitLab is deployed so that it can meet their custom needs. 

#### Challenges to address

*  Some organizations want more control over the environment in which GitLab is deployed, and the way that it is configured and managed. To achieve this, they choose to deploy their own instance of GitLab rather than using gitlab.com. While this does provide more control, it also increases the burden in the following ways:

   *  They take on the expense of providing and maintaining the hardware required to deploy GitLab, or pay somebody else to do that by running GitLab in a public cloud, for example. In large-scale, highly available deployments, this can require a large number of servers as outlined in [the GitLab reference architectures](https://docs.gitlab.com/ee/administration/reference_architectures/index.html).

   *  They take on the responsibility of ensuring that the end users of GitLab are able to accomplish their tasks quickly, without disruptions caused by latency or downtime.

   *  They become responsible for updating GitLab regularly so that end users have access to the latest features and improvements.
  

*  As organizations realize the benefits of deploying applications on Kubernetes there has been a surge in demand for being able to run applications in Kubernetes. In addition, some large organizations are mandating that applications be moved to Kubernetes as part of their corporate cloud strategy. In the 2019 Continuous Intelligence Report, Sumo Logic reported that 20% of AWS customers are using Kubernetes to orchestrate the deployment of their applications in AWS. This is from a survey of 2,000 companies and shows a 6% increase compared to 2018. 

*  Kubernetes is still relatively new. Even though many companies are making the move to Kubernetes, there is still a shortage of knowledge and experience with deploying on Kubernetes, and teams are learning as they go. To add to this problem, GitLab is a large and complex application and deploying it on Kubernetes requires some amount of prior experience with Kubernetes. 

*  Organizations want more flexibility about where they deploy. They don't want to be locked in to a single cloud provider because the underlying technology requires it. 

*  Depending on the organization, some instances of GitLab may experience spikes in usage. The instance needs to scale quickly to handle these loads. 


### Where we are Headed 

GitLab is a large and complex application. If you are new to Kubernetes, GitLab may not be a good first application to start with. However, we are continuing to focus on ways of simplifying GitLab cloud-native deployments so that users with minimal Kubernetes experience can easily use this deployment method.

Our goal is for cloud-native deployments to be similar in simplicity and configuration as our Omnibus package, and surpass our Omnibus package in day 2 automation. In 2023, we hope to be able to recommend our cloud-native installation on par with our Omnibus package for simple deployments and where it is cost effective, or recommend a hybrid architecture over a pure Omnibus installation due to the benefits cloud-native can offer. In 2023 we would also like to change to the Operator as the preferred installation method for Cloud Native GitLab. The Operator offers significant benefits to cloud-native installations and we would like to only need to maintain one method of cloud-native deployment. This will not change the general support of cloud-native distributions, and only amplify.

GitLab has developed [reference architectures](https://docs.gitlab.com/ee/administration/reference_architectures/index.html) for different scales of deployments. These reference architectures provide recommendations for architectures supporting anywhere from 2,000 to 50,000 users. These were originally created for Omnibus-based deployments. We will be going through the same testing and validation to make specific recommendations for Helm-based deployments so that we can provide more guidance to our Helm users. [Full cloud-native reference architectures](https://gitlab.com/groups/gitlab-org/-/epics/7130) summarizes well areas where we still need to work on, so that GitLab is fully production ready in Kubernetes at any reference architecture, without requiring a hybrid deployment for even the most complex configurations. This also highlights our intention to support the needs of the GitLab Environment Toolkit (GET) and collaborate to [increase GET product features](https://gitlab.com/groups/gitlab-org/-/epics/7100), such as bringing production ready environments to another cloud provider, GCP. It is important for us to support GET because GET will be the best and easiest way to deploy multi-node production instances of GitLab, and operate them with very high service levels. GET will include everything needed for deployment and operation of major cloud providers, and all required and optional dependencies, provisioned with Terraform and configured with Ansible. Check out the [GET documentation](https://gitlab.com/gitlab-org/gitlab-environment-toolkit) to learn more.

The cloud-native documentation today is comprehensive, but could be improved by making it even clearer and more thorough by restructuring the information architecture to ensure it's easy find what you need. Improvements to the documentation will also provide more advanced users with needed resources to customize and optimize their cloud-native deployments. [Epic](https://gitlab.com/groups/gitlab-org/charts/-/epics/9)

As we continue to mature the GitLab Operator, the operator will become the main method of deploying GitLab as a Kubernetes application versus the current method of utilizing the Helm chart. The [Operator will move away from its dependency on Helm](https://gitlab.com/gitlab-org/distribution/team-tasks/-/issues/990) in the future and become the source of truth for Cloud-native deployments, with an option to deploy with with a lightweight Helm chart. This is how many operators work.

#### What's Next & Why

The cloud-native installation will be benefitting from overall efficiency work the team is planning to work on in the next 3 milestones (15.9-15.11). We have identified these [contributor experience issues](https://gitlab.com/groups/gitlab-org/-/epics/9711) and [build efficiency issues](https://gitlab.com/groups/gitlab-org/-/epics/9712).

Improving our contributor experience is very impactful for the Distribution team because we typically work on a large number of reviews and are asked to contribute to and complete a wide range of work items from customers and internal teams at GitLab. By improving our contributor experience we can reduce the amount of time we spend on reviews. Contributor experience might also mean another team at GitLab is completely enabled to do work, where in the past they may have been required to request assistance from Distribution team members.

In our efficiency work we hope to reduce the amount of maintence we need to do regularly, as well as, reduce the time it takes to build tests and implement features. Our efficiency work is focused on reducing the effort to maintain two distinct code bases, for Omnibus and Cloud-native GitLab. This will ideally reduce the time it takes to implement any issue, maintenance work or feature work.

#### Maturity Plan

This category is currently at the Complete maturity level. Our next maturity target is Lovable (see our [definitions of maturity levels](https://about.gitlab.com/direction/maturity/)). We are aiming to reach the Lovable level by Q4 of 2022. 

- [What would make the cloud native installation lovable?](https://gitlab.com/gitlab-org/charts/gitlab/-/issues/1658)

<!-- ### User success metrics
- What specific user behaviors are indicate that users are trying these features, and solving their problems?
- How will users discover these features?
-->

<!-- ### Why is this important?
- Why is GitLab building this feature? 
- What impact will it have on the broader devops workflow?
- How confident are we? What is the effort?
-->

### Competitive Landscape

*  GitHub began moving their application to Kubernetes in 2016 to be able to scale more easily as traffic increased. It doesn't appear that the self-managed version of Github, GitHub Enterprise, has a version that can be deployed on Kubernetes. 
*  Atlassian does have a Docker image for BitBucket Server but there doesn't seem to be an officially supported Helm chart to manage deploying on Kubernetes.


<!-- ### Analyst Landscape
What analysts and/or thought leaders in the space talking about, what are one or two issues
that will help us stay relevant from their perspective.-->

<!-- ### Top Customer Success/Sales issue(s)
These can be sourced from the CS/Sales top issue labels when available, internal
surveys, or from your conversations with them.-->

<!-- ### Top user issue(s)
This is probably the top popular issue from the category (i.e. the one with the most
thumbs-up), but you may have a different item coming out of customer calls.-->

<!-- ### Top internal customer issue(s)
These are sourced from internal customers wanting to [dogfood](https://about.gitlab.com/handbook/product/product-processes/#dogfood-everything)
the product.-->

<!-- ### Top Strategy Item(s)
What's the most important thing to move your strategy forward?-->

