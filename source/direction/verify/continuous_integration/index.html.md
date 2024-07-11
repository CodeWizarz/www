---
layout: markdown_page
title: "Category Direction - Continuous Integration"
description: "Continuous Integration is an important part of any software development pipeline. It must be easy to use, reliable, and accurate. Learn more here!"
canonical_path: "/direction/verify/continuous_integration/"
---

- TOC
{:toc}

## Continuous Integration

| | |


### Introduction and how you can help

Thanks for visiting this category direction page on Continuous Integration (CI) in GitLab. This page belongs to the [Verify Stage](/handbook/product/categories/#verify-stage) and is maintained by Jackie Porter ([E-Mail](mailto:<jporter@gitlab.com>), [Twitter](https://twitter.com/JRMeshell)).

This direction page is a work in progress, and everyone can contribute:

- Please comment and contribute in the linked [issues](https://gitlab.com/groups/gitlab-org/-/issues/?scope=all&utf8=%E2%9C%93&state=opened&label_name%5B%5D=Category%3AContinuous%20Integration) and [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=Category:Continuous+Integration) on this page. Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.
- Please share feedback directly via email, Twitter, or on a video call. If you're a GitLab user and want to discuss how GitLab can improve Review Apps, we'd especially love to hear from you.

### Overview

Continuous Integration is an important part of any software development cycle. As declared in our Ops Section [direction](/direction/ops/#pipelines-as-code), we recognize a key advantage of GitLab CI is that we can define pipelines as code, while making CI easy to use, reliable, and accurate in terms of its results. We are very proud that we are recognized as [the leading CI/CD tool on the market](/blog/2017/09/27/gitlab-leader-continuous-integration-forrester-wave/), as well as a leader in the 2019 Q3 [Cloud Native CI Wave](/analysts/forrester-cloudci19/), and it's important for us that we continue to innovate in this area and provide not just a "good enough" solution, but a [speedy and reliable one](/direction/ops/#speedy-reliable-pipelines).

Making it easy to run a pipeline is our first focus and this applies to both running a pipeline manually as well as triggering one automatically when submitting a code commit or a merge request. In addition, we want to provide data for examining your pipeline's performance, so that you can optimize CI configurations to make your pipelines run more efficiently.

For specific information and features related to authoring and pipelines, check out [Pipeline Authoring](/direction/verify/pipeline_authoring/). For work related to Pipeline Abuse Prevention, see the [Category page](https://about.gitlab.com/direction/govern/anti-abuse/instance_resiliency/). 

You may also be looking for one of the following related product direction pages: [Overall Vision of the Verify stage](/direction/ops/#verify), [GitLab Runner](/direction/verify/runner_core/), [Continuous Delivery](/direction/release/continuous_delivery/), [Release stage](/direction/ops/#release), or [Jenkins Importer](/direction/verify/jenkins_importer/). 


### Strategy and Themes

Our strategy to regain a category maturity of "Lovable" is two-fold - first, a renewed focus on strengthening the core features of CI that support running a pipeline; and second, deliver features that provides more users with the ability to run pipelines in a project. 

### 1 year plan
In CY23, our plan is to empower CI users to do more with GitLab pipelines. This includes: 

1. Deliver on [usability fixes](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=milestone_due_desc&state=opened&label_name%5B%5D=group%3A%3Apipeline%20execution&label_name%5B%5D=Category%3AContinuous%20Integration&label_name%5B%5D=SUS%3A%3AImpacting&first_page_size=20) to improve overall experience with GitLab pipelines 
1. Build an eventing system to handle automation across the DevSecOps platform via [GitLab Events](https://gitlab.com/groups/gitlab-org/-/epics/8349)
1. Improve scalability by executing CI partioning of the largest tables in our database via [CI/CD Time Decay](https://gitlab.com/groups/gitlab-org/-/epics/7522)

#### What is next for us

<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->

#### What we are currently working on

We are currently focusing on delivering data tracking to support decision making via [gitlab#409377](https://gitlab.com/gitlab-org/gitlab/-/issues/409377)) and CI partitioning of the builds table in [gitlab&5417](https://gitlab.com/groups/gitlab-org/-/epics/5417). 

#### What we recently completed

The Pipeline Execution Group is an efficient team releasing almost 30 MRs a milestone. Some of the top deliverables over the last quarter are: 
1. [Beautifying the UI of CI/CD Pipelines](https://about.gitlab.com/releases/2023/06/22/gitlab-16-1-released/#beautify-the-ui-of-cicd-pipelines-and-jobs)
1. Change to rate limits for [`projects/:id/jobs`](https://about.gitlab.com/releases/2023/05/22/gitlab-16-0-released/#rate-limit-for-the-projectsidjobs-api-endpoint-reduced) end-point
1. Closed 10 bugs in [16.0](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=milestone_due_desc&state=closed&label_name%5B%5D=Category%3AContinuous%20Integration&label_name%5B%5D=type%3A%3Abug&milestone_title=16.0&first_page_size=20)

#### What is Not Planned Right Now

- [Improve the experience around debugging jobs and analyzing pipelines](https://gitlab.com/groups/gitlab-org/-/epics/5022)
- CI related [notifications](https://gitlab.com/groups/gitlab-org/-/issues?label_name%5B%5D=notifications&label_name[]=group%3A%3Apipeline%20execution) (by email or via integration with other tools)
- CI related [API endpoints](https://gitlab.com/gitlab-org/gitlab/-/issues?label_name%5B%5D=api&label_name%5B%5D=group%3A%3Apipeline+execution&state=opened) (unless related to features on the roadmap)
- CI related [permissions](https://gitlab.com/gitlab-org/gitlab/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=CI%20permissions&label_name[]=group%3A%3Apipeline%20execution&not[label_name][]=bug) (non-bug issues)
- [Configure CI/CD Quotas by project](https://gitlab.com/gitlab-org/gitlab/-/issues/357760) going forward we will work with the community to review and merge contributions but are not planning active development on new features.




#### Top Vision Item(s)

Looking to the future, we have plans to help you better monitor and understand your pipeline [epic#4794](https://gitlab.com/groups/gitlab-org/-/epics/4794). Having details about pipeline activities (such as job duration) will allow you to see and react to what's happening while your pipeline is running. Beyond using data simply for reactive purposes, we have plans for a customizable UI for historical pipeline analytics so you can see the trends that will guide your planning and decision-making. 

We'd love to create a holistic approach to automatically merging when pipelines succeed via [gitlab#8128](https://gitlab.com/gitlab-org/gitlab/-/issues/8128), which offers great collaboration between [Code Review](/direction/create/code_review/) and Continuous Integration. 

Even further into the future, we are looking to expand insights and predications of CI use to help you reduce waste via [gitlab&4915](https://gitlab.com/groups/gitlab-org/-/epics/4915).


### Best in Class Landscape

BIC (Best In Class) is an indicator of forecasted near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape.

#### Key Capabilities 

* [Pipelines as code](https://about.gitlab.com/features/continuous-integration/)
* [Scheduled triggering of pipelines](https://docs.gitlab.com/ee/ci/pipelines/schedules.html)
* [Trigger pipeline on any event in code repository](https://docs.gitlab.com/ee/ci/triggers/)
* [CI/CD Horizontal Autoscaling](https://docs.gitlab.com/runner/configuration/autoscale.html#overview)
* [Live streaming of logs from running pipeline](https://docs.gitlab.com/ee/ci/jobs/#expand-and-collapse-job-log-sections)
* [CI/CD for external repo](https://docs.gitlab.com/ee/ci/ci_cd_for_external_repos/)

#### Top Competitive Solutions

The majority of CI market conversation is between us, Jenkins, and GitHub Actions at this point. An example of this placement is from [Jet Brain's 5th annual Developer Ecosystem Survey](https://www.jetbrains.com/lp/devecosystem-2021/) which has placed GitLab as #2 CI solution for enterprises. Atlassian has built BitBucket Pipelines, a more modernized version of Bamboo, which is still in the early stages. Microsoft is maintaining (at least for now) Azure DevOps at the same time as GitHub Actions but for personal usage GitHub Actions is gaining traction among developers. CodeFresh and CircleCI have both released [container-based plugin model](https://steps.codefresh.io/), similar to GitHub Actions. CircleCI in particular is known for very fast startup times and we're looking to ensure we [keep up or get even faster](https://gitlab.com/groups/gitlab-org/-/epics/7290). Jenkins is largely seen as a legacy tool, and most people we speak with are interested in moving off to something more modern. We are addressing this with our [Jenkins Importer](/direction/verify/jenkins_importer) category which is designed to make this as easy as possible.

From [GitHub's 2023 Roadmap](https://github.com/orgs/github/projects/4247), we are seeing GitLab-reminiscent features which include [Pull Request Merge Queue](https://github.com/github/roadmap/issues/370), akin to [Merge Trains](https://docs.gitlab.com/ee/ci/pipelines/merge_trains.html) with a fit-finish that we aim to make easier in [gitlab#294169](https://gitlab.com/gitlab-org/gitlab/-/issues/294169). Also to note is an emphasis on governance and controls with [Audit Log streaming](https://github.com/github/roadmap/issues/344), bringing parity to the capabilities GitLab has created with the [Compliance group's Audit Event streaming](https://docs.gitlab.com/ee/administration/audit_event_streaming.html). 


### Target Audience

For Continuous Integration, our "What's Next & Why" are targeting the following personas, as ranked by priority for support: 

1. [Sasha - Software Developer](https://about.gitlab.com/handbook/product/personas/#sasha-software-developer)
1. [Priyanka - Platform Engineer](https://about.gitlab.com/handbook/product/personas/#priyanka-platform-engineer)
1. [Delaney - Development Team Lead](https://about.gitlab.com/handbook/product/personas/#delaney-development-team-lead)

### Maturity Plan

Our current maturity is at "Complete" and the next maturity target is "Lovable"  (see our [definitions of maturity levels](/direction/maturity/)). In order to maintain our lead while staying ahead of the changing DevSecOps landscape needs for stability, performance and quality we need to reestablish a strong foundation of the core elements for CI. As such, we are prioritizing bugs and user experience improvements, while continuing to design and validate features for future implementation that move our vision forward. The following investments will be key to moving our maturity forward in the next two quarters: 

1. SUS-Impacting Issues 
1. CI Data Partioning 

### Pricing and Packaging
<!-- 
-->

### Analyst Landscape

There are a few key findings from the Forrester Research analysts on our CI solution. GitLab is seen as capable as the solutions provided by the hyperclouds themselves, and well ahead of other neutral solutions. This can give our users flexibility when it comes to which cloud provider(s) they want to use. We are also seen as the best end to end leader, with other products  not keeping up and not providing as comprehensive solutions. What this tells us is that it is important for us to continue to innovate and make it hard or even impossible for competitors to maintain pace. As such, our path to improving our analyst performance matches our solutions above in terms of staying ahead of our competitors.
