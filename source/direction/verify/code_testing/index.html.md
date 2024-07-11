---
layout: markdown_page
title: "Category Direction - Code Testing and Coverage"
description: "The GitLab Code Testing and Coverage direction page."
canonical_path: "/direction/verify/code_testing/"
---

- TOC
{:toc}


## Code Testing and Coverage

| | |
| --- | --- |
| Stage | [Verify](/direction/verify/) |
| Maturity | [Viable](/direction/maturity/) |
| Content Last Reviewed | `2023-04-13` |


### Introduction and how you can help

Thanks for visiting this category direction page on Code Testing and Coverage in GitLab. This page belongs to the [Pipeline Execution](/handbook/product/categories/#pipeline-execution-group) group of the Verify stage and is maintained by Jackie Porter ([E-Mail](mailto:<jporter@gitlab.com>), [Twitter](https://twitter.com/JRMeshell)).

This direction page is a work in progress, and everyone can contribute:

- Please comment and contribute in the linked [issues](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=updated_desc&state=opened&label_name%5B%5D=Category%3AReview%20Apps) and [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=Category:Review+Apps) on this page. Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.
- Please share feedback directly via email, Twitter, or on a video call. If you're a GitLab user and want to discuss how GitLab can improve Review Apps, we'd especially love to hear from you.

### Overview
We utilize [intelligence in testing](https://gitlab.com/groups/gitlab-org/-/epics/9638) to ensure that individual components built within a pipeline perform as expected and as efficiently as possible. We also aim to make testing accessible by making it easier to setup and start testing to drive quality early in the development process. 

Our long term vision is to optimizing pipelines to quickly deliver quality code with a high degree of confidence. We will do this by automate testing; reducing the amount of time between development and test cycles; broading test scope and coverage (e.g. unit, functional, end-to-end); and dashboards to provide an aggregate view of test quality and observable trends to monitor product health. 

### Strategy and Themes
Our offerings in the area of Testing are limited compared to our competitors; in particular, we do not offer test case management features. We are working with the Certify group to build an integrated test case management feature, providing traceability across product requirements and test cases/plans as part of [gitlab&9640](https://gitlab.com/groups/gitlab-org/-/epics/9640). Our long-term vision provides not only traceability, but also [group-level dashboards](https://gitlab.com/gitlab-org/gitlab/-/issues/388359) for various stakeholders to view both rolled up and individual project completion status. Quality remains an important driver for improving our users ability to confidently track deployments with GitLab and as noted above we are starting on that vision in the [Project Quality Summary epic](https://gitlab.com/groups/gitlab-org/-/epics/5430). 

Pipeline efficiency has become an increasingly important to developers, CI/CD leaders, and executives. As part of achieving our long-term goal of "smarter testing", we are evaluating opportunitites to use [ML/AI to optimize pipelines](https://gitlab.com/gitlab-org/gitlab/-/issues/388531) and [additional opportunities to expand](https://gitlab.com/groups/gitlab-org/-/epics/9643) our current offering for [Fail Fast Testing](https://docs.gitlab.com/ee/ci/testing/fail_fast_testing.html). We are also evaulating mechanisms enabling users to [select which tests they want to execute or quarantine](https://gitlab.com/groups/gitlab-org/-/epics/9651). 

In all features we build, we strive to continuously improve our user experience, including [ease of use](https://gitlab.com/gitlab-org/gitlab/-/issues/366347) and automation where possible. We also know users want more insights from their CI/CD pipelines and especially from their tests. We are evaluating [gitlab#210250](https://gitlab.com/gitlab-org/gitlab/-/issues/210250) as a way to provide those insights and further encourage users to upload test report artifacts within their CI/CD pipelines.

### 1 year plan
There are no new planned features in Code Testing and Coverage for 2024. Pipeline Execution will support high priority bug fixes in this category as they arise. 

<!--#### What is next for us -->
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->

<!--#### What we are currently working on -->
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

<!--#### What we recently completed -->
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

#### What is Not Planned Right Now
<!--  Often it's just as important to talk about what you're not doing as it is to
discuss what you are. This section should include items that people might hope or think
we are working on as part of the category, but aren't, and it should help them understand why that's the case.
Also, thinking through these items can often help you catch something that you should
in fact do. We should limit this to a few items that are at a high enough level so
someone with not a lot of detailed information about the product can understand -->
Although we do not have any plans to release new features in the coming year, we welcome [community contributions](https://about.gitlab.com/community/contribute/) that align with our intellgence testing vision.

### Best in Class Landscape
<!-- Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" -->

BIC (Best In Class) is an indicator of forecasted near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape.

#### Key Capabilities 
In the [2021 Continuous Software Delivery Forrester Tech Tide](https://www.forrester.com/report/The+Forrester+Tech+Tide+Continuous+Software+Delivery+Q1+2021/-/E-RES161669), Testing was cited as the number one key to unlock continuous delivery for organizations. Top areas for investment are a) API test automation, b) continuous functional test suites, c) shift-left performance testing. Industry leaders are seeking integrated suites over best in breed tools for testing and CD. Additionally, API testing is being marketed as a silver bullet that is cheaper, effective and efficient to modernize the toolchain for enterprises. Sample vendors include: API Fortress, Broadcom, Eggplant, and  others. We are exploring how we expand our market share in this area via [product#2516](https://gitlab.com/gitlab-com/Product/-/issues/2516) and adding a new category in this [merge request](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/80183). 

<!--#### Roadmap-->
<!-- Key deliverables we're focusing on to build a BIC solution. List the epics by title and link to the epic in GitLab. Minimize additional description here so that the epics can remain the SSOT. This may be duplicative to the 1 year section however for some categories the key deliverables required to become the BIC solution will extend beyond one year and we want to capture all of the gaps. Moreover, the 1 year section may contain work that is not directly related to closing gaps if we are already the BIC or if we are differentiating ourselves.-->

#### Top Competitive Solutions
Many other CI solutions can also consume standard JUnit test output or other formats to display insights natively like [CircleCI](https://circleci.com/docs/2.0/collect-test-data/) or through a plugin like [Jenkins](https://plugins.jenkins.io/junit). [Allure](https://demo.qameta.io/allure/) is a popular reporting tool for review of test executions and recently DataDog introduced [CI Visibility](https://docs.datadoghq.com/continuous_integration/) as part of their SaaS offering including [Flaky Test Management](https://docs.datadoghq.com/continuous_integration/guides/flaky_test_management/).

There are new entries in the code testing space utilizing ML/AI tech to optimize test execution like [Launchable](https://launchableinc.com/solution/) and even write test cases like [Diffblue](https://www.diffblue.com/).

In order to stay remain ahead of these competitors we will continue to push forward to make unit test data visible and actionable in the context of the Merge Request for developers with [unit test reports](https://docs.gitlab.com/ee/ci/unit_test_reports.html#viewing-unit-test-reports-on-gitlab) and historical insights to identify flaky tests with epics like [gitlab&3129](https://gitlab.com/groups/gitlab-org/-/epics/3129)

### Target Audience
Check out our [Ops Section Direction "Who's is it for?"](/direction/ops/#who-is-it-for) for an in-depth look at our target personas across Ops. For Code Testing and Coverage, our "What's Next & Why" are targeting the following personas, as ranked by priority for support: 
1. [Sasha - Software Developer](https://about.gitlab.com/handbook/product/personas/#sasha-software-developer)
1. [Simone - Software Engineer in Test](https://about.gitlab.com/handbook/product/personas/#simone-software-engineer-in-test)
1. [Devon - DevOps Engineer](https://about.gitlab.com/handbook/product/personas/#devon-devops-engineer)

<!--### Pricing and Packaging-->
<!-- 
-->

### Analyst Landscape
In 2020, Gartner has released the Artificial Intelligence Use Case Prism for Development and Testing on their [research website](https://www.gartner.com/en/documents/3994888/infographic-artificial-intelligence-use-case-prism-for-d). Directionally, several of the use cases are generation of unit tests from analyzing code patterns, using business logic to create API test scenarios, and using machine learning to fabricate test data as well as correlating testing results back to business metrics to convey meaningful connections like release success or quality. 

