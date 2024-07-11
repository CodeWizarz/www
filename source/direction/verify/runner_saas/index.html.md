---
layout: markdown_page
title: "Category Direction - Runner SaaS"
description: "This is the Product Direction Page for the Runner SaaS product category."
canonical_path: "/direction/verify/runner_saas/"
---

## Runner SaaS

| -                     | -                              |
| Stage                 | [Verify](/direction/verify/)   |
| Maturity              | [Viable](/direction/maturity/) |
| Content Last Reviewed | `2023-09-28`                   |

### Introduction

Thanks for visiting this direction page on the Runner SaaS category at GitLab. This page belongs to the [Runner SaaS Group](https://about.gitlab.com/handbook/product/categories/#runner-saas-group) within the Verify Stage and is maintained by [Gabriel Engel](mailto:gengel@gitlab.com). Feel free to follow our [YouTube playlist](https://www.youtube.com/playlist?list=PL05JrBw4t0KqcTxGhFdJtcUpvjdf05MHY) where we will upload walkthroughs of direction page updates and iteration kickoffs.

### Strategy and Themes

With the adoption of a DevSecOps approach and the resulting gains in developer and delivery efficiency, organizations are seeing an increased demand for computing power to run CI/CD pipelines.

Our **vision** is to provide a fully managed, best-in-class hosted CI/CD build infrastructure that is fast and secure by default. We want to eliminate the overhead of hosting and maintaining your build infrastructure, ultimately enabling you to deliver software faster. Our platform approach will allow you to run cross-platform (Docker containers on Linux, Windows, macOS) builds in one CI/CD pipeline. With GitLab SaaS Runners, we aim to help you realize increased cost savings and efficiency by providing a reliable service for running all CI/CD builds that do not need to run on your infrastructure.

Today, the [SaaS runners](https://docs.gitlab.com/ee/ci/runners/) product offerings are:

- [SaaS runners on Linux - GA](https://docs.gitlab.com/ee/ci/runners/saas/linux_saas_runner.html)
- [GPU-enabled SaaS runners - GA](https://docs.gitlab.com/ee/ci/runners/saas/gpu_saas_runner.html)
- [SaaS runners on macOS - BETA](https://docs.gitlab.com/ee/ci/runners/saas/macos_saas_runner.html)
- [SaaS runners on Windows - BETA](https://docs.gitlab.com/ee/ci/runners/saas/windows_saas_runner.html)

### 1 year plan

The primary FY2024 runner themes focus on closing critical competitive gaps with other hosted solutions and also enable Ultimate adoption for GitLab SaaS, with the clear focus on achieving [best-in-class ci build speed](https://about.gitlab.com/company/team/structure/working-groups/ci-build-speed/).

- [GPU-enabled runners](https://gitlab.com/groups/gitlab-org/-/epics/8648) for ModelOps workloads (completed)
- [Add more powerful compute types](https://gitlab.com/groups/gitlab-org/-/epics/8714) for [SaaS runners on Linux](https://docs.gitlab.com/ee/ci/runners/saas/linux_saas_runner.html) (completed)
- [SaaS runners on macOS](https://gitlab.com/groups/gitlab-org/-/epics/8267) transition to General Availability
- [CI Steps POC](https://gitlab.com/gitlab-org/gitlab/-/issues/357669) to support both [CI Components Catalog](https://about.gitlab.com/direction/verify/component_catalog) and CI Events
- [Establish GitLab Runner Infrastructure Toolkit (GRIT) for AWS](https://gitlab.com/groups/gitlab-org/ci-cd/runner-tools/-/epics/1) to support GitLab hosted runners for [GitLab Dedicated](https://docs.gitlab.com/ee/subscriptions/gitlab_dedicated/)

#### What we recently completed
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

- [Image support for macOS 13 (Ventura)](https://docs.gitlab.com/ee/ci/runners/saas/macos_saas_runner.html#supported-macos-images)
- Adding `xlarge` and `2xlarge` runners on Linux to [offer more powerful compute](https://gitlab.com/groups/gitlab-org/-/epics/8714)
- [Medium SaaS runner on Linux available to all tiers](https://about.gitlab.com/blog/2023/08/01/medium-gitlab-saas-runners-on-linux-now-available-to-all-tiers)
- [Increased the storage](https://about.gitlab.com/releases/2023/06/22/gitlab-16-1-released/#increased-storage-for-gitlab-saas-runners-on-linux) of SaaS runners on Linux to support larger applications

#### What we are currently working on
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

- We are focused to bring our [Apple silicon (M1) runners on macOS](https://docs.gitlab.com/ee/ci/runners/saas/macos_saas_runner.html) to [General Availability](https://gitlab.com/groups/gitlab-org/-/epics/8267)
- We are also working on [GitLab Steps POC](https://gitlab.com/gitlab-org/gitlab/-/issues/357669) to allow GitLab Steps to run from within GitLab Runner, for the [CI Components Catalog](https://about.gitlab.com/direction/verify/component_catalog)

#### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->

In the next three months we plan to complete the following projects:

- [Establish GitLab Runner Infrastructure Toolkit (GRIT) for AWS](https://gitlab.com/groups/gitlab-org/ci-cd/runner-tools/-/epics/1) to support GitLab hosted runners for [GitLab Dedicated](https://docs.gitlab.com/ee/subscriptions/gitlab_dedicated/)
- [Transition GitLab SaaS Runners on Linux to new Autoscaler](https://gitlab.com/groups/gitlab-org/ci-cd/shared-runners/-/epics/17)

#### What is Not Planned Right Now

We are not actively working on the following:

- [GitLab SaaS runners on Windows - GA](https://gitlab.com/gitlab-org/gitlab/-/issues/300476)
- [GitLab Arm-based SaaS runners on Linux](https://gitlab.com/gitlab-org/gitlab/-/issues/388320)

### Best in Class Landscape
<!-- Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" -->

BIC (Best In Class) is an indicator of forecated near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape.

#### Key Capabilities

Cloud-native CI/CD solutions, such as GitLab.com, Harness.io, CircleCI, and GitHub, allow to run CI/CD pipelines on a fully managed runner fleet with no setup required.

In addition to eliminating CI build server maintenance costs, there are other critical considerations for organizations that can migrate 100% of their CI/CD processes to a cloud-native solution. These include security, reliability, performance, compute types, and on-demand scale.

CI build speed or time-to-result, and the related CI build infrastructure cost efficiency are critical competitive vectors. [CircleCI](https://circleci.com/circleci-versus-github-actions/) and [Harness.io](https://www.harness.io/blog/announcing-speed-enhancements-and-hosted-builds-for-harness-ci) are promoting CI-build performance in their go-to-market strategy.
Both [GitHub](https://github.blog/2022-12-08-experiment-the-hidden-costs-of-waiting-on-slow-build-times/) and [Harness.io](https://www.harness.io/blog/fastest-ci-tool) explored the cost impact of CI build performance measured by build times on hosted solutions.

#### Top Competitive Solutions

**Hosted Linux Compute**

| Size     | Machine Specs       | GitLab        | GitHub    | CircleCI      |
| -------- | ------------------- | ------------- | --------- | ------------- |
| small    | 2 vCPUs, 8GB RAM    | Available     | Available | Available     |
| medium   | 4 vCPUs, 16GB RAM   | Available     | Beta      | Available     |
| large    | 8 vCPUs, 32GB RAM   | Available     | Beta      | Available     |
| x-large  | 16 vCPUs, 64GB RAM  | Available     | Beta      | Available     |
| 2x-large | 32 vCPUs, 128GB RAM | Available     | Beta      | Not available |
| 3x-large | 48 vCPUs, 192GB RAM | Not available | Beta      | Not available |
| 4x-large | 64 vCPUs, 256GB RAM | Not available | Beta      | Not available |

**Hosted GPU Compute**

| Size       | Machine Specs       | GitLab        | GitHub        | CircleCI      |
| ---------- | ------------------- | ------------- | ------------- | ------------- |
| lite       | Nvidia Tesla P4     | Not available | Not available | Available     |
| standard   | Nvidia Tesla T4     | Available     | Planned Q4    | Available     |
| premium    | Nvidia Tesla V100   | Planned Q4    | Not available | Available     |

**macOS - Offer Positioning and Hosted Build Machines**

| | GitLab | GitHub | Xcode Cloud | CircleCI | Bitrise.io |
|-|--------|--------|------------------------|----------|------------|
| Positioning statement | SaaS runners on macOS provide an on-demand macOS build environment fully integrated with GitLab CI/CD. | A GitHub-hosted runner is VM hosted by GitHub with the GitHub actions runner application installed. | A CI/CD service built into Xcode, designed expressly for Apple developers. | Industry-leading speed. No other CI/CD platform takes performance as seriously as we do. | Build better mobile applications, faster. |
| Value proposition | You can take advantage of all the capabilities of the GitLab single DevOps platform and not have to manage or operate a build environment. | When you use a GitHub-hosted runner, machine maintenance and upgrades are taken care of.|Build your apps in the cloud and eliminate dedicated build infrastructure.| The macOS execution environment allows you to test, build, and deploy macOS and iOS apps on CircleCI. | CI for mobile - save time spent on testing, onboarding, and maintenance with automated workflows and triggers |
| Available machines | Apple silicon (M1): medium | x86-64: small, x-large | n/a | Apple silicon (M1): medium, large; x86-64: medium, x-large | Apple silicon (M1): medium, large; x86-64: medium, large, x-large |
