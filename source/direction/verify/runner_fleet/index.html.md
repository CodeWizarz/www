---
layout: markdown_page
title: "Category Direction - Runner Fleet"
description: "This is the Product Direction Page for the Runner Fleet product category."
canonical_path: "/direction/verify/runner_fleet/"
---

## Navigation & Settings

|                       |                               |
| -                     | -                             |
| Stage                 | [Verify](/direction/verify/)  |
| Maturity              | Complete |
| Content Last Reviewed | `2023-09-11`                  |

### Introduction and how you can help
<!-- Introduce yourself and the category. Use this as an opportunity to point users to the right places for contributing anzd collaborating with you as the PM -->

Thanks for visiting this direction page on the Runner Fleet category at GitLab. This page belongs to the [Runner Group](/handbook/product/categories/#runner-group) within the Verify Stage and is maintained by [Darren Eastman](mailto:deastman@gitlab.com).

### Strategy and Themes

Organizations that adopt the GitLab one DevSecOps platform approach [realize](https://about.gitlab.com/resources/report-forrester-tei/) significant gains in development and delivery efficiency. And with GitLab's new [AI/ML](https://about.gitlab.com/blog/2023/04/24/ai-ml-in-devsecops-series/) feature sets, we expect an order of magnitude increase in developer efficiency and reduced time to market for software-enabled technology changes. Some GitLab customers plan and operate computing for CI/CD jobs (a Runner Fleet) that can scale to manage millions of CI/CD jobs monthly.

Our **vision** is that as customers more deeply integrate AI into their development processes, they can efficiently and cost-effectively configure and manage a GitLab Runner Fleet at scale on any public or private cloud platform.

In many customer interviews, a recurring set of questions as customers more fully adopt and expand the use of GitLab CI/CD in their organization are how to plan, manage and optimize the Runner Fleet to support the growth in CI/CD usage. Invariably customers ask for best practices for setting up and managing a Runner Fleet. So while the FY24 focus is on delivering best-in-class observability for managing CI/CD build environments, in FY25, we focus on the following themes: Fleet Planning, Fleet Cost Visibility, and Fleet Optimization.

<!-- Describe your category. Capture the main problems to be solved in market (themes). Describe how you intend to solve these with GitLab (strategy). Provide enough context that someone unfamiliar with the details of the category can understand what is being discussed. -->

### 1 year plan
<!--
1 year plan for what we will be working on linked to up-to-date epics. This section will be most similar to a "road-map". Items in this section should be linked to issues or epics that are up to date. Indicate relative priority of initiatives in this section so that the audience understands the sequence in which you intend to work on them.
 -->


The FY24 product themes for Runner Fleet aligned with GitLab's FY24 product investment themes are as follows.

**World-class DevSecOps experience**:

The [Runner Fleet Dashboard MVC](https://gitlab.com/gitlab-org/gitlab/-/issues/390921), a component of GitLab's observability, analytics, and feedback [FY24 product investment theme](https://about.gitlab.com/direction/#fy24-product-investment-themes), is the primary goal for FY24. The MVC will include metrics for fleet health, top active runners, and runner queue wait times for CI/CD jobs. While the initial MVC will ship in the Admin Area view, in subsequent releases, we intend to roll out the Fleet Dashboard to the group level - specifically the top-level group for an organization.

By surfacing these metrics in the UI  and then building automation that uses this data, we will significantly reduce developer wait time and time to result while optimizing infrastructure costs for the CI build environment.

This is a multi-step journey; we will learn new information and incorporate new customer insights as we move forward.  A critical guiding principle from observability to automation is that we will always focus on essential jobs to be done and the voice of the customer.  So while we envision a solution beyond static observability, customer feedback will clearly inform the future evolution, especially as we transition to automation.

#### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->

In the next three months (September to November)  we are focused on the following:

**Runner Fleet Dashboard**

- [Runner Fleet dashboard - Admin View: Starter Metrics](https://gitlab.com/groups/gitlab-org/-/epics/11169).
- [Runner  Fleet Dashboard: Cost Visibilty MVC](https://gitlab.com/gitlab-org/gitlab/-/issues/331640)

#### What we are currently working on
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

**Runner Fleet Dashboard**

- [API for percentiles of job wait times](https://gitlab.com/gitlab-org/gitlab/-/issues/421199)
- [Service to ingest data from ci_builds to Clickhouse](https://gitlab.com/gitlab-org/gitlab/-/issues/421200)

#### What we recently completed
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

In the past three months, we have shipped the following key features:  (June, July, August)

**Runner Fleet Dashboard**

- Adding the [top five instance runners](https://gitlab.com/gitlab-org/gitlab/-/issues/377324) to the Fleet Dashboard MVC.
- [Moving the runner queue wait time metric](https://gitlab.com/gitlab-org/gitlab/-/issues/417260) to the Runner Fleet Dashboard MVC.

#### What is Not Planned Right Now
<!--  Often it's just as important to talk about what you're not doing as it is to discuss what you are. This section should include items that people might hope or think
we are working on as part of the category, but aren't, and it should help them understand why that's the case.
Also, thinking through these items can often help you catch something that you should in fact do. We should limit this to a few items that are at a high enough level so someone with not a lot of detailed information about the product can understand -->

In the near term, (September to November ) we are not focused on design or development efforts to improve Runners usability in [CI/CD settings](https://docs.gitlab.com/ee/administration/#cicd-settings) at the [project level](https://gitlab.com/groups/gitlab-org/-/epics/6867). While improvements in this view could be valuable to the [software developer](/handbook/product/personas/#sasha-software-developer) persona, our primary target personas for Runner Fleet in FY24 are, the [Platform Engineer](/handbook/product/personas/#priyanka-platform-engineer) and the [Infrastructure Operator](/handbook/product/personas/#ingrid-infrastructure-operator) personas.

### Best in Class Landscape
<!-- Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" -->

BIC (Best In Class) is an indicator of forecasted near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape.

At GitLab, a critical challenge is simplifying the administration and management of a CI/CD build fleet at an enterprise scale. This effort is one foundational pillar to realizing the vision of AI-optimized DevOps. Competitors are also investing in this general category. Earlier this year GitHub announced a new management experience that provides a summary view of GitHub-hosted runners. This is a signal that there will be a focus on reducing maintenance and configuration overhead for managing a CI/CD build environment at scale across the industry.

We also now see additional features on the GitLab public roadmap signaling an increased investment in the category we coined here at GitLab, 'Runner Fleet.' These features suggest that GitHub aims to provide a first-class experience for managing GitHub Actions runners and include features in the UI to simplify runner queue management and resolve performance bottlenecks. With this level of planned investment, it is clear that there is recognition in the market that simplifying the administrative maintenance and overhead of the CI build fleet is critical for large customers and will help enable deeper product adoption.

Indirect competitor Actutated is the first solution that we have seen whose product includes a [dashboard for Runners and build queue](https://docs.actuated.dev/dashboard/#runners) visibility. This is another strong signal that providing solutions that reduce the CI/CD build infrastructure's management overhead is valuable for organizations with mature DevOps practices.

To ensure that our GitLab customers can fully realize the value of GitLab's product vision, we must provide solutions that eliminate the complexities, manual tasks, and operational overhead and reduce the costs of delivering a CI build environment at scale.

#### Key Capabilities
<!-- For this product area, these are the capabilities a best-in-class solution should provide -->

The key capabilities that we hear from customers describing fleet management pain points are as follows:
- Runner queue visibility (wait time)
- Runner Fleet management metrics
- Frictionless upgrades
- Security
- Cost visibility for runners hosted on public cloud infrastructure
- Fleet autoscaling
- Automatic fleet configuration optimization
- Managing runner sprawl
- Configuring and managing a heterogeneous runner fleet (container builds on Linux, container builds on Windows, shell builds on Windows, shell builds on macOS)
- Self-service runner creation for the developer persona
- Automating choosing the right cloud and compute to host a Runner based on CI/CD build performance

#### Roadmap
<!-- Key deliverables we're focusing on to build a BIC solution. List the epics by title and link to the epic in GitLab. Minimize additional description here so that the epics can remain the SSOT. -->

In FY 2024, the critical focus area for achieving best-in-class is delivering the new Fleet management experience for observability, including Runner queue  wait times and fleet health metrics.

#### Top [1/2/3] Competitive Solutions

Runner Fleet is still a nascent category; competitors like GitHub are beginning to invest in this area. On their future roadmap, GitHub plans to introduce [seamless management of GitHub-hosted and self-hosted runners](https://github.com/github/roadmap/issues/504). This feature aims to deliver a "single management plane to manage all runners for a team using GitHub." GitHub also plans to offer [Actions Performance Metrics](https://github.com/github/roadmap/issues/561) to provide organizations with deep insights into critical CI/CD performance metrics. One example of how the cloud infrastructure market can evolve is [Active Assist for Google Cloud](https://cloud.google.com/solutions/active-assist) - a solution to optimize cloud operations cost reduction. Therefore we can imagine a future where Microsoft and GitHub bring to market AI-based solutions that integrate GitHub Actions with infrastructure on Azure. Our GitLab competitive position is solid in that we will continue to invest in features and capabilities to ensure that customers can use GitLab Runners efficiently on any cloud provider.

### Maturity Plan

- The Runner Fleet [category maturity scorecard](https://gitlab.com/gitlab-org/gitlab-design/-/issues/1995) project ended on 2022-09-14. Runner Fleet scored 3.63, which puts the maturity level at ["Complete"](/direction/maturity/).
- Our next targeted [maturity level](/direction/maturity/) is Lovable, targeted for 2024-08-22, and depends on delvering the vision for the Runner Fleet category.

