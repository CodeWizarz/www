---
layout: markdown_page
title: "Product Direction - Delivery"
description: "GitLab's Delivery Group are responsible for delivering GitLab to our SaaS and Self-Managed Customers"
canonical_path: "/direction/saas-platforms/delivery/"
---

- TOC
{:toc}

## Overview

The [Delivery Group](/handbook/engineering/infrastructure/team/delivery/) enables GitLab Engineering to deliver features in a safe, scalable, and efficient fashion to both GitLab.com and self-managed customers. The Group deploys changes to GitLab.com [continuously](/handbook/engineering/deployments-and-releases/) throughout the day and also ensures that GitLab's monthly, security, and patch releases are made available to our SaaS Platforms and self-managed customers on a [predictable schedule](/handbook/engineering/releases/).

## 3-Year Strategy

<!-- Where will the product be in 3 years? How will the customer's life/workflow be different in 3 years as a result of our product? -->

Our 3-year Delivery strategy contributes to the company strategy primarily by [maturing the platform](https://about.gitlab.com/company/strategy/#2-mature-the-platform). In order to meet our [planned growth(internal)](https://internal.gitlab.com/handbook/product/investment/scaling-model/#expected-arr) GitLab is evolving its architecture toward [Cells](https://about.gitlab.com/direction/enablement/tenant-scale/#moving-towards-cells). To support this, Delivery must scale rollout strategies to provide safe and efficient rollouts to a fleet of potentially thousands of Cells in the future. With deep expertise in the application, its components, and how to deploy GitLab at a scale that serves millions, the [Delivery Group](https://about.gitlab.com/handbook/engineering/infrastructure/team/delivery) is uniquely positioned to become the orchestrator of the fleet, ensuring that we can roll out changes safely at scale.

To ensure that the evolution to Cells is successful, technical as well as cultural changes will be needed. For example, to enable gradual rollout changes across an entire fleet will require much stronger backward and forward compatibility than is currently required for GitLab.com. 

To facilitate this longer-term organizational change, Delivery has changed how it thinks about deployments and releases and now considers GitLab.com to be a “fleet of one”. This change allows us to focus on learning about how best to apply our tools and processes to effectively coordinate rollouts across a fleet of Cells.   

For deployments to be efficient across a fleet of Cells, our tools and processes must be fully automated (automatic rollout & rollback, deployment observability, self-healing, scalable). To achieve this goal in an iterative manner, we will continue to learn as much as we can about operating effective rollouts on a fleet of Cells at the same time as operating effective continuous delivery to GitLab.com. 

Over the course of the next 3 years, we expect to see strong strategic partnerships evolve across the [Platforms Section](https://about.gitlab.com/handbook/engineering/infrastructure/platforms/) to drive prioritization, swarm to solve the most important problem, and clear roadblocks for other groups in the section. [The Dedicated Group](https://about.gitlab.com/direction/saas-platforms/dedicated/) has solved a considerable amount of problems encountered with operating a single tenant of GitLab in an automated way. Additionally, the Scalability Group [supports our SaaS platforms](https://about.gitlab.com/direction/saas-platforms/scalability/#expand-our-domain-to-include-other-saas-platforms) and has expertise in the kind of monitoring and logging that will be required to run Cells. 

Finally, we will require assistance from other groups within the company where their domain expertise is invaluable as part of moving toward the next iteration of deployments. For example, the tests that we run may be prohibitively expensive to horizontally scale and health checks may be a better fit. As the DRI for our test coverage, the [Quality Department](https://about.gitlab.com/handbook/engineering/quality/) are positioned to help us navigate this. Another example is the [Database Group](https://about.gitlab.com/handbook/engineering/development/enablement/data_stores/database/) which can help us with the longer-term direction of post-deployment migrations to unblock rollbacks for all users. 

## Challenges
<!-- Optional section. What are our constraints? (team size, product maturity, lack of brand, GTM challenges, etc). What are our market/competitive challenges? -->

### Open Core, Staying Secure

Since GitLab is [public by default](https://handbook.gitlab.com/handbook/values/#public-by-default) and operates both SaaS platforms as well as a self-managed offering, there are some unique challenges as part of day to day operations. GitLab's [business model](/company/stewardship/#business-model) is based around an open core and we believe in maintaining transparency over the source code that is part of GitLab, even where this introduces additional challenges. 

However, as a typical part of business for a software company in 2023, we are required to implement security fixes and remediations on a regular basis. In order to keep both ourselves and our customers safe and secure, we must discuss and implement these security fixes whilst maintaining confidentiality until the fixed release is made available to all of our customers. As a result, we have two streams of code that flow into GitLab and divergence can add complexity. 

### Tight Logical Coupling

GitLab is made up of a series of components that have a tight logical coupling and strong forward/backward compatibility requirements. Our GitLab.com deployments and managed versioning release processes span many parts of the organization and are reflective of our organization structure, [see Conway’s Law](https://en.wikipedia.org/wiki/Conway%27s_law). This can make the process highly resistant to change, as there is a significant organizational burden to coordinate and align on the changes that need to be made across a process, where each department has their own metrics and responsibilities. Visibility across processes is low and it has prevented Delivery from truly evolving the process as opposed to iterating on sections over time.

### High Operational Load

Delivery models the [complex subsystem team pattern](https://teamtopologies.com/key-concepts) and is responsible for ensuring that GitLab is delivered to customers, without outages, multiple times a day. The team has deep expertise in the architecture, deployment patterns, and hands-on remediations involved in deploying and releasing GitLab. Onboarding, operating, and maintaining these systems have a high cognitive and operational load. As a consequence, project work that could evolve our deployment capabilities and unlock new business opportunities can be deprioritized over “keep the lights on work” which prevents/mitigates user impact. 

## 1-Year Plan
<!-- Describe key themes, projects, and/or features planned over the next year. Also highlight what we will not be doing in the next year -->

Over FY24 we've identified the following 4 key themes and aligned them with the Infrastructure & Quality department’s [direction](/handbook/engineering/infrastructure/platforms/#fy24-direction).

### Improving the efficiency of Release Management

Release management currently operates through a combination of manual and automated steps. As GitLab grows and our feature velocity increases, we need to evolve the current process to handle the increased demand for scale. Our current releases processes are unlikely to scale much further and we risk being a bottleneck to throughput if we do not invest in evolving and streamlining the release and deployment tools & processes. This should also contribute to the infrastructure goal of [Achieve 50% growth year-on-year in engagement surveys results compared to FY23](/handbook/engineering/infrastructure/platforms/#1-achieve-50-growth-year-on-year-in-engagement-surveys-results-compared-to-fy24).

Our specific goal is to reduce stress and cognitive load by [measuring and reducing Release Manager workload](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/744) and as a result increase the amount of time we can spending improving our tools and removing tech debt. We'll achieve that by:

- Simplifying deployment and release processes by removing manual steps for example by [automating security release steps](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/1025). 
- Improving documentation to make it easier to find and use process overviews, runbooks to guide day-to-day decisions, and training guides to support onboarding
- Identifying and removing frequent deployment and release failures
- [Moving to a predictable release schedule](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/1017)

### Move Toward Self Service as a Path to end-to-end Ownership for Stage Teams

Our release processes are complex, involve a lot of manual touch points and currently require deep domain expertise to execute. As a result the Delivery group can become a bottleneck or a gate for many teams wanting to make changes to their deployments, fix bugs and support older versions. Additionally, things like backports and [major dependency upgrades](https://gitlab.com/groups/gitlab-org/-/epics/7875) often represent sudden and unplanned work which have to be prioritized against the current needs. As a result, non-critical fixes and upgrades can be rejected and the benefit is therefore not realized by customers.

Moving toward self-service and the Delivery group as a maintainer of the tools, instead of an executor of the process, and allowing Stage teams to deploy independently will allow them to own their features across the entire feature development lifecycle, increasing their efficiency and removing bottlenecks. This also supports our department goal of [Preparing self-servicing for stage group teams to enable end-to-end development](/handbook/engineering/infrastructure/platforms/#2-prepare-self-servicing-for-stage-group-teams-to-enable-end-to-end-development). In order to get there, the first steps we have to take are:

- [Creating a self-serve backport request process](https://gitlab.com/gitlab-com/gl-infra/delivery/-/issues/2427) to allow other teams to prepare patch releases for older versions
- Enhancing package management and deployment strategies to allow release managers and Stage groups to control package contents for deployment and testing.
- [Enabling Independent Deployments for GitLab services](https://gitlab.com/gitlab-com/gl-infra/readiness/-/blob/master/library/independent-deployments/blueprint.md)
- Providing a way to allow stage group teams to self-serve common administrative tasks such as configuring security mirrors

### Increase the Efficacy of Delivery teams' metrics

Delivery's MTTP PI has tracked our work to make deployments to GitLab.com fast and reliable but it is limited to an overview of whether things are going well or not so well. It doesn't give us the level of insight we need to make adjustments to improve our processes and tools. In order for us to effectively and efficiently improve the way we do things, we need a more granular level of detail and instrumentation. This will help us to increase the efficiency of the deployment and release processes and every feature released will benefit from this.

In FY24 we'll review existing group metrics and create a set that represents all of Delivery group responsibilities to allow us to measure our impact. Additional metrics will include:

- [Measure Release Manager workload](https://gitlab.com/gitlab-com/gl-infra/delivery/-/issues/2752)
- Measure time to deliver patch releases to self-managed users

In addition we are [improving the deployment pipeline observability](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/757) to increase the insight we get into areas of improvement, reliability and deployment duration. We will:

- Measure and create SLOs for Packaging time
- Measure and create SLOs for QA testing
- Identify and reduce frequently-failing jobs

As we review and increase the number of metrics in use we'll need to focus on how and where we track these metrics to make sure we maintain a usable overview of the Delivery group.

### Increase GitLab.com resilience to planned and unplanned growth, while keeping the cost of running the platform in check

GitLab is growing consistently and the demands of the platform are constantly evolving. As part of the move toward becoming the best in class AI enabled DevSecOps platform, we have a renewed focus on [experimentation](/handbook/product/gitlab-the-product/#experiment-beta-ga). We get the best data and insights for our experiments by exposing them to real customer traffic and getting feedback in a production environment. However, this can introduce risk and friction in the deployment process and our approach to experimentation is more manual than we would like. In order to increase the number of concurrent experiments we can run and remove risk, we have to add more flexibility into our deployment options.

This approach will also allow us to trial major platform upgrades ([Ruby 2.x - 3.x](https://gitlab.com/groups/gitlab-org/-/epics/5149), [Rails 6.x - 7.x](https://gitlab.com/groups/gitlab-org/-/epics/7875), etc.) in a way that is safe and gives us confidence. This strategy could drastically reduce the coordination needed between teams as well as the time taken and risk to make this type of change. It's also an area where our competitors are able to [leverage the latest features](https://github.blog/2023-04-06-building-github-with-ruby-and-rails/) in a way that we can't yet. In order to [continue to win against GitHub](/company/yearlies/#fy24-yearlies), we must reduce the cost of change to our platform.

We’ll start by:
- Implementing flexible deployment strategies (e.g.: [Support for zero downtime deployments in Dedicated](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/1092)) to increase change confidence and minimize customer's impact.
- Supporting Stage Groups with widely impacting changes (e.g.: [Rails 7 rollout](https://gitlab.com/groups/gitlab-org/-/epics/7875)) leveraging release capabilities and safer rollout plans that will minimize impact on reliability.
- Scaling existing deployment and release processes to meet organization and user needs. Including:
    - Improve the backport request policy
    - [Scale the security release process](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/1017)

### What we're not doing

As part of being a [complicated subsystem team](https://teamtopologies.com/key-concepts) with a high operational load, we have to be deliberate about the work that we take on. There are a few things that we’re interested in, but can’t take on right now:

- Supporting Teams with non standard release processes in automating their deployments and implementing the [component requirements](https://gitlab.com/gitlab-org/release/docs/-/blob/master/components/index.md) 
- We made the decision to continue a pilot and [not extend the maintenance policy](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/828) as a part of re-prioritisation.

## What's Next

- [Adapt release process to address customer current needs](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/1017)
- [Supporting the release schedule change](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/1039)
- [Enabling flexible deployments](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/1092) to support gradual traffic shifting and blue/green rollouts
- [Documenting more of our processes](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/1007)
- [Establishing a release process for Gitlab.com](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/1024) to improve change visibility
- [Upgrading to Ruby 3.1](https://gitlab.com/groups/gitlab-org/-/epics/10034)


## Prioritization Framework

Because Delivery are responsible for deploying our multi-tenant SaaS offering (gitlab.com) as well as releasing GitLab packages for Dedicated and Self Managed, we prioritize "Keep the lights on" activities (e.g. deployment failures, incidents, release management) above all else to ensure we provide customers a high level of service that continually meets our reliability and performance SLAs. Aside from this our work assumes the normal [product prioritization process](/handbook/product/product-processes/#how-we-prioritize-work) and the top priority is just a reflection of our operational responsibilities. 
