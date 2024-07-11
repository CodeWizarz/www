---
layout: markdown_page
title: "Category Direction - Environment Management"
---

- TOC
{:toc}

## Environment Management

| | |
| --- | --- |
| Stage | [Deploy](/direction/delivery/) |
| Maturity | [Viable](/direction/maturity/) |
| Content Last Reviewed | `2023-04-06` |

### Introduction and how you can help
<!-- Introduce yourself and the category. Use this as an opportunity to point users to the right places for contributing and collaborating with you as the PM -->

Welcome to the direction page of the Environment Management product category of GitLab. This page is part of the bigger [Delivery direction](/direction/delivery). It is owned by the Environments group and is maintained by Viktor Nagy ([Email](mailto:vnagy@gitlab.com)).

Your feedback helps us building a world-class environment management offering in GitLab. We welcome your feedback in [issues](https://gitlab.com/groups/gitlab-org/-/issues/?sort=updated_desc&state=opened&label_name%5B%5D=Category%3AEnvironment%20Management&first_page_size=20), 
[epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=Category:Environment+Management) and are always open to user interviews to learn more about your use cases or share more details about our roadmap. 
You can register a call with us through your GitLab account manager or through customer support.

### Overview
<!-- Describe your category so that someone who is not familar with the market space can understand what the product does. 
-->

Environments are at the heart of DevSecOps. From the application developers' perspective, environments are where the application gets deployed. Environments can differ in terms of lifespan, related change management processes, and policies. 
Some environments are short-lived, ephemeral, while others are long lived. Production environments are the place where your applications meet your users. 

Environments are the culmination of the work of several teams and are the place where the application will finally serve its users. As a result, they should present their current state and related artifacts to support critical decisions in security, rollout and troubleshooting.

The key aspects of environments are:

- Ops users and organizations can easily see and take action on deployments
- Deep integration with target infrastructure e.g. Kubernetes
- Compatible with all types of application architectures (e.g. monorepo, microservices, etc)
- Answers key questions such as:
  - What is deployed to production?
  - Who deployed to production?
  - What deployments to production happened in the past 30 days?
  - What is deployed to other environments?
  - What is the health and status of my deployment environments?
- Easily execute key actions such as:
  - Rollbacks / Rollouts
  - Deployment / Feature Flag toggling
  - Promote from lower environments to higher environments such as production
- Benefits
  - Tool consolidation
  - Connect to other capabilities in GitLab. Note: Deployment relies on nearly all upstream activities in GitLab so this is an important place for these types of connections.


### Strategy and Themes
<!-- Capture the main problems to be solved in market (themes). Describe how you intend to solve these with GitLab (strategy). Provide enough context that someone unfamiliar with the details of the category can understand what is being discussed. -->

Environments are as central to a DevSecOps organization as Merge requests are to a Dev organization. We envision GitLab environments to serve as the single entry point to every 
information and action related to a given environment from status data to security reports and actions related to new release rollouts and troubleshooting.

As GitLab offers solutions for the whole DevSecOps lifecycle, we want to visualise data to environments on the environment pages. The environment page should show 

- the deployment status
- the application metrics 

related to the running deployment(s) together with information about 

- the artifacts behind these deployments
- related security scans.

Release managers should be able to rely on environment pages to gather all the information they need to block or move a release forward. Moreover, they should be able to do it from within the environment pages. The rollout might involve running a dedicated CI/CD job in a pipeline or changing a feature flag. Either should be supported.
The GitLab [Continuous delivery direction](../continuous_delivery/) provides more details on our plans to support release managers, and the [Feature flags direction](../feature_flags/) descibes our strategy and plans related to feature flags.

As Environments typically include deployments, this direction is best read together with the [Deployment management direction](../deployment_management).

While Environments can be best interacted with through the GitLab UI, we see that highly efficient teams prefer chat-based, integrated solutions for at least some of the functionality. While ChatOps is not a priority now, it partially falls under the environment management category.

### 1 year plan
<!--
1 year plan for what we will be working on linked to up-to-date epics. This section will be most similar to a "road-map". Items in this section should be linked to issues or epics that are up to date. Indicate relative priority of initiatives in this section so that the audience understands the sequence in which you intend to work on them. 
 -->

 We are in the process of [building up our roadmap](https://gitlab.com/groups/gitlab-org/ci-cd/deploy-stage/environments-group/-/epics/1) to work towards the vision described above. Some items we already know to be on this roadmap are
 
- Add support for [group-level environments](https://gitlab.com/groups/gitlab-org/-/epics/7558).
- Provide a [Kubernetes dashboard](https://gitlab.com/groups/gitlab-org/-/epics/2493) in GitLab
- [Deployment detail page MVC](https://gitlab.com/gitlab-org/gitlab/-/issues/374538)
- [Connect Releases with Environments and Deployments](https://gitlab.com/gitlab-org/gitlab/-/issues/332103)
- [Log auto stop environment actions](https://gitlab.com/gitlab-org/gitlab/-/issues/36047)

#### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->

- We want to [run a design sprint](https://gitlab.com/groups/gitlab-org/ci-cd/deploy-stage/environments-group/-/epics/1) to drive our roadmap forward.
- We are [adding Environments support to the GitLab Agent](https://gitlab.com/groups/gitlab-org/-/epics/9859).

#### What we are currently working on
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

- We are [adding Environments support to the GitLab Agent](https://gitlab.com/groups/gitlab-org/-/epics/9859).
- We are working on modernizing the environment page frontend by [moving from HAML to Vue](https://gitlab.com/groups/gitlab-org/-/epics/9489).

#### What we recently completed
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

- We switched the approval rules settings UI from universal approval rules to [multiple approval rules](https://docs.gitlab.com/ee/ci/environments/deployment_approvals.html#multiple-approval-rules). We found multiple approval rules to better serve our users and we are in the process of deprecating universal approval rules.

#### What is Not Planned Right Now
<!--  Often it's just as important to talk about what you're not doing as it is to
discuss what you are. This section should include items that people might hope or think
we are working on as part of the category, but aren't, and it should help them understand why that's the case.
Also, thinking through these items can often help you catch something that you should
in fact do. We should limit this to a few items that are at a high enough level so
someone with not a lot of detailed information about the product can understand -->

We don't plan to 

- extend our chatops support

### Best in Class Landscape
<!-- Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" -->

BIC (Best In Class) is an indicator of forecasted near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape.

#### Key Capabilities 
<!-- For this product area, these are the capabilities a best-in-class solution should provide -->

The key capabilities of environment management applications are

- provide up-to-date information about environment status, including
   - which deployments are currently running
   - related infromation to deployments, like attestations, scan results, milestones
- support troubleshooting with entry points to
   - logs
   - metrics
   - traces
- create and tear-down ephemeral environments, including the related infrastructure
- visualize the deployment and roll-out related processes in a pipeline
- allow to describe the delivery process and environments as declarative code (aka YAML)
- provide interfaces to release managers for continuous delivery practices

#### Roadmap
<!-- Key deliverables we're focusing on to build a BIC solution. List the epics by title and link to the epic in GitLab. Minimize additional description here so that the epics can remain the SSOT. This may be duplicative to the 1 year section however for some categories the key deliverables required to become the BIC solution will extend beyond one year and we want to capture all of the gaps. Moreover, the 1 year section may contain work that is not directly related to closing gaps if we are already the BIC or if we are differentiating ourselves.-->

__This section is work in progress.__

#### Top [1/2/3] Competitive Solutions
<!-- PMs can choose to highlight a primary BIC competitor--or more, if no single clear winner in the category exists; in this section we should indicate: 1. name of competitive product, 2. links to marketing website and documentation, 3. why we view them as the primary BIC competitor -->

- [Harness.io](https://www.harness.io/)
- [Kubevela](https://kubevela.io/) built on the [Open Application Model](https://oam.dev/)
- [Release](https://release.com/)

### Target Audience
<!--
List the personas (https://about.gitlab.com/handbook/marketing/strategic-marketing/roles-personas#user-personas) involved in this category.

Look for differences in user's goals or uses that would affect their use of the product. Separate users and customers into different types based on those differences that make a difference.
-->

Primary persona:

- [Allison, application operator](https://about.gitlab.com/handbook/product/personas/#allison-application-ops)

Secondary personas:

- [Rachel, release manager](https://about.gitlab.com/handbook/product/personas/#rachel-release-manager)

### Pricing and Packaging
<!-- 
-->

__This section is work in progress.__

### Analyst Landscape

__This section is work in progress.__
