---
layout: markdown_page
title: "Product Section Direction - SaaS Platforms"
description: "GitLab's Platforms section is responsible for building the tools, services and frameworks to empower product development groups across the organization to deploy, monitor and operate their code reliably across all of our SaaS platforms Learn more here!"
canonical_path: "/direction/saas-platforms/"
---

{:.no_toc}

- TOC
{:toc}

Last reviewed: 2022-05-12

> __Empower product development groups to deploy, monitor and operate their code reliably across our SaaS platforms.__

## Mission

SaaS Platforms mission is to build the tools, services and frameworks to empower product development groups across the organization to deploy, monitor and operate their code reliably across all of our SaaS platforms, with the ultimate goal of increased efficiency and productivity. Product development should focus on delivering customer value at any scale and have a great experience using capabilities built within SaaS Platforms. The lessons learned in this process then become a part of the One DevSecOps Platform.

## SaaS Platforms section overview

### Why use SaaS?

GitLab is available in three deployment methods: Self-managed, multi-tenant SaaS (commonly referred to as GitLab.com), and our single-tenant SaaS solution GitLab Dedicated.

Our multi-tenant SaaS platform, GitLab.com, provides the easiest and quickest way to adopt GitLab and the lowest overall total cost of ownership. GitLab.com is targeted at early adopting Mid Market, SMB and ICs.

GitLab Dedicated, our single-tenant SaaS platform, provides strong tenant isolation, private networking, and is available in specific regions. GitLab Dedicated is targeted at large enterprises in regulated industries with strict compliance needs.

Our SaaS offerings make up an [increasing percentage of revenue](https://ir.gitlab.com/node/7861/html) and we see further growth opportunities because of the benefits of SaaS for our customers. For this reason, we continue to advance our [GitLab-hosted first](https://about.gitlab.com/direction/#gitlab-hosted-first) theme.

### DevSecOps using a single Platform

For our product development community, including the wider GitLab community, developing the single DevSecOps Platform poses specific challenges depending on the deployment platform. For SaaS platforms, it is critical that code can run reliably and at different types of scale. This is also becoming more important for self-managed deployments as our [reference architectures can support tens of thousands of users](https://docs.gitlab.com/ee/administration/reference_architectures/). 

Software developers, however, cannot easily reproduce the same scale in their developer environments, nor is it feasible for them to anticipate all workload variations found in production environments. Other personas may also struggle. For example, Software Engineers in Test may not be able to identify the root causes of problems because of a lack of visibility and monitoring. This can lead to slower iterations, and unexpected behaviors. Ultimately, this has a negative impact on our customers because we can't provide value to them fast enough.

GitLab the product, is the leading DevSecOps Platform, but GitLab as a company still uses a number of DIY solutions for DevSecOps in combination with our own product. The SaaS Platforms section aims to create tools, services, and frameworks that make building and deploying GitLab a delightful experience on any hardware at any scale. Once added, these tools will push GitLab as a company from [Phase 3 to Phase 4](https://about.gitlab.com/topics/devops/) of DevSecOps. This creates a virtuous cycle where the capabilities developed in the SaaS Platforms section will ultimately benefit all of our customers - also known as [dogfooding](/handbook/values/#dogfooding).

![Virtuous development cycle](/direction/saas-platforms/Saas-platform-virtous-cycle.png "Virtuous development cycle")

Developers should be empowered to roll out their changes themselves frequently, with a minimal lead time for change, short time to recover and a low change failure rate. Without great frameworks and services, developers have no way to operate their code and take ownership of the entire DevSecOps lifecycle. This in turn also creates a number of process inefficiencies, such as increased need for handoffs with other stakeholders (e.g. Infrastructure, Security, etc.).

One side-effect of a growing number of handoffs is that this requires that the Infrastructure, and Security teams grows in lockstep with the organizational growth. While that investment needs to continue, this should support an increase in efficiency and productivity over the long term.

At GitLab, we know the solution already because we build it: DevSecOps using a single Platform approach.


### Target personas

We target product development tools with the most important personas being:

- Site Reliability engineers (tools, services, frameworks)
- Software developers (tools, services, frameworks)
- Engineering Managers, Product Managers, Executive Leadership (metrics and roll ups)

### Why a SaaS Platforms section?

GitLab has a number of delivery channels. Apart from customer-managed setups, GitLab manages a multi-tenant (GitLab.com) and single-tenant ([GitLab Dedicated](https://docs.gitlab.com/ee/subscriptions/gitlab_dedicated/)) customer facing platforms.

This means that customers can be operators, administrators, or simply consumers of GitLab's feature set. This creates different expectations, and Product Development at GitLab needs to develop code that can run successfully on any platform.

For GitLab-managed offerings, there are two dimensions of scale with slightly different expectations:

1. For GitLab.com, a single GitLab instance needs to receive rapid changes, features that scale with a large number of requests, and serve significantly varied workflows. This requires a more hands on approach because issues need to be mitigated as they happen, and rolled forward or back as required.
1. For GitLab Dedicated, a large number of independent GitLab instances need to receive changes in a more predictably paced environment, with focus on stability and predictability to match the type of workloads expected with a single tenant offering.

These requirements for GitLab.com and GitLab Dedicated make it critical that teams can take full ownership of features and utilize DevSecOps best practices. This in turn requires fully utilizing GitLab as the One DevSecOps Platform  - and improving it where it falls short.

The SaaS Platforms section is needed to empower our own development groups and drive a virtuous improvement cycle for GitLab. SaaS platforms puts a great product development experience front and center and aims to reduce costly hand-offs to the infrastructure department.

Creating a minimal viable platform is also cost-efficient. By moving towards DevSecOps, we should be able to better drive efficiencies in how we develop and deliver changes to SaaS over the long term. Platform teams should scale sub-linearly to the rest of GitLab product development.

### SaaS Platforms and Enablement

SaaS Platforms and Enablement share many commonalities and both sections contain a number of platform teams.

The Enablement section is focused on developing frameworks to empower Product groups to efficiently author scalable, performant, and durable features within the DevSecOps Platform.

SaaS Platforms builds frameworks for Product Groups to deploy, monitor and operate their code on our SaaS Platforms.

Enablement is closer to the Dev stage of the DevSecOps lifecycle - SaaS platforms is closer to the Ops stage. Both of them have a need to work across stages regularly to fulfill their goals.

### How does Product Management support this direction?

We strongly believe that the SaaS Platforms stage is a product stage. [Platforms teams are product teams](https://www.linkedin.com/pulse/platform-teams-product-niels-talens), with their own product development cycles. When building out developer tools/services e.g. error budgets we should treat this first and foremost as product development. The users are GitLab's product development groups first. When these services become part of GitLab they will service all of our customers.

By adopting a product-focused mindset, we avoid building out solutions that don't address our users' needs and can utilize our [established product development framework](/handbook/product-development-flow/). One notable difference is that given how our SaaS platforms operate, the SaaS platform section does not operate on a monthly milestone basis. Milestones are useful for our self-managed releases but not agile enough for SaaS Platforms needs. Groups within SaaS platform largely adopt a continuous delivery model, loosely based on Kanban, and track against DORA metrics.

### Metrics

As SaaS Platforms mission is to help GitLab's product development groups to deploy, monitor and operate code at scale, the well known DORA 4 metrics are what measures success:

[DORA 4 metrics](https://cloud.google.com/blog/products/devops-sre/using-the-four-keys-to-measure-your-devops-performance):

1. Deployment Frequency - how often can we deploy to production
1. Lead time for changes - time from commit to production
1. Change Failure rate - Percentage of failed deployments
1. Time to Restore Service - How long it takes to recover from failure

GitLab already [implements DORA metrics](https://docs.gitlab.com/ee/user/analytics/#devops-research-and-assessment-dora-key-metrics)

We also track other metrics, including [Error budgets](/handbook/engineering/error-budgets/), capacity projections for SaaS platforms and [Service Level Availability](/handbook/engineering/monitoring/#gitlabcom-service-level-availability).

### Competitive space and position

SaaS platforms are expected to roll out valuable changes to customers at a rapid pace without introducing instability. By allowing product groups to take full ownership of their code and improving our DORA metrics, we ensure that GitLab does not fall behind other competitors in the space. Aligning all parts of GitLab's Development teams with DevSecOps best practices will ensure our competitiveness.

## 3-year strategy

In three years, we want to move GitLab's Product Development groups to utilize GitLab as the single DevSecOps Platform to deploy, monitor and operate any changes on our SaaS platforms. This means, for example, that functionalities provided by runbooks should become part of the one DevSecOps Platform.

## Themes

### Move towards self-service frameworks

Without product development groups able to self-service, they can get blocked and require other teams to support them. To avoid this, SaaS Platforms focuses on creating better frameworks.

Moving towards self-service delivery. Backporting changes to prior GitLab self-managed releases should not require input from the Delivery group. Instead, developers should be able to manage the entire backporting lifecycle for their changes, and Delivery group would ensure that this process is executed smoothly.

Moving towards utilizing pre-built frameworks. Developers should utilize existing building blocks that ensure their code is production ready, like uniformly using a pre-made logging framework, or importing the existing code necessary for their feature to interact with uploads storage layer.

### Easily assess the impact of changes

Deploying changes at scale means that many things can go wrong that were not easy to test locally. By providing automatic reports, error budgets and other tools it should be simple for developers to understand the impact changes have on productions.

Defining SLIs and SLOs is also critical to ensure that incentives are aligned and developers understand how much failure is acceptable.

### Scalable architectures for single-tenant and multi-tenant platforms

GitLab's SaaS platforms are growing rapidly. By evolving our SaaS architectures we ensure that we can keep up with [GitLab's expected growth (internal)](https://internal.gitlab.com/handbook/product/investment/scaling-model/).

### Drive cost efficiency

Deploying features can be very costly on production. We aim to make it simpler for product teams to evaluate and measure the cost impact of their features. This ensure that we remain [efficient](/handbook/values/#efficiency) at scale.

## Challenges

- Building a second "IT department" by creating additional processes. We have [an IT department already](https://about.gitlab.com/handbook/business-technology/it/) and we don't need another one.  If product development groups have a bad experience, it means that they can't provide value to our customers. **Mitigation:** To avoid this, SaaS Platforms groups are supported by a dedicated Product Manager and utilize parts of our established product development frameworks. Instead of focusing on monthly milestones, SaaS Platforms groups deliver continuously.
- Building bespoke GitLab.com and Dedicated solutions. **Mitigation:** [Dogfooding](/handbook/values/#dogfooding), contribute to GitLab rather than internal tools/scripts outside of the product itself.
- Building a thick platform: Build out many services and tools that increase complexity. **Mitigation:** [Iteration](/handbook/values/#iteration) and [focusing on MVC](/handbook/product/product-principles/#the-minimal-viable-change-mvc) Focus on building a minimal viable platform. Focus on building frameworks, services that others can use. Only provide what is needed, not more.

## What we're not doing

- Building micro-services outside of GitLab
- Creating more processes and hand-off points.

## Categories

- [Delivery](/direction/saas-platforms/delivery/)
- [Scalability](/direction/saas-platforms/scalability/)
- [GitLab Dedicated](/direction/saas-platforms/dedicated/)
- [Switchboard](/direction/saas-platforms/switchboard/)

## What's Next

[See the Platforms section page lists for currently active initiatives](/handbook/engineering/infrastructure/platforms/).
