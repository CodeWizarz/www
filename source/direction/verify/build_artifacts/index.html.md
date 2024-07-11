---
layout: markdown_page
title: "Category Direction - Build Artifacts"
description: "Usage and administration of Build Artifacts"
canonical_path: "/direction/verify/build_artifacts/"
---

- TOC
{:toc}


## Build Artifacts

| | |
| --- | --- |
| Stage | [Verify](/direction/verify/) |
| Maturity | [Minimal](/direction/maturity/) |
| Content Last Reviewed | `2023-09-15` |

### Introduction and how you can help
Thanks for visiting this category direction page on Build Artifacts in GitLab. This page belongs to the [Pipeline Security](/handbook/product/categories/#pipeline-security-group) group of the Verify stage and is maintained by Jocelyn Eillis ([E-Mail](mailto:jeillis@gitlab.com)). 

This category covers the experiences related to the display of artifact data. For more information, check out the [features page](https://about.gitlab.com/features/?stage=verify#build_artifacts). 

For specific information and features related to display of artifact data, check out the [GitLab Features](/features/) and for information about administration of artifacts please reference the Job Artifact [documentation](https://docs.gitlab.com/ee/administration/job_artifacts.html). You may also be looking for one of the related direction pages from the [Verify Stage](/direction/ops/#verify-stage-categories).

This direction page is a work in progress, and everyone can contribute:

 - Please comment and contribute in the linked [issues](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=updated_desc&state=opened&label_name%5B%5D=Category%3ABuild%20Artifacts) and [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=Category:Build+Artifacts) on this page. Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.
 - Please share feedback directly via email or on a video call. If you're a GitLab user and have direct knowledge of your need for Build Artifacts, we'd especially love to hear from you!

### Overview
<!-- Describe your category so that someone who is not familar with the market space can understand what the product does. -->
[Artifacts](https://docs.gitlab.com/ee/ci/yaml/#artifacts) are files created as part of a build process that often contain metadata about that build's jobs like test results, security scans, etc. These can be used for reports that are displayed directly in GitLab or can be published to [GitLab Pages](/stages-devops-lifecycle/pages/) or in some other way for users to review. These artifacts can provide a wealth of knowledge to development teams and the users they support.

[Job Artifacts](https://docs.gitlab.com/ee/ci/pipelines/job_artifacts.html) and [Pipeline Artifacts](https://docs.gitlab.com/ee/ci/pipelines/pipeline_artifacts.html) are both included in the scope of Build Artifacts to empower GitLab CI users to more effectively manage testing capabilities across their software lifecycle in both the gitlab-ci.yml or as the latest output of a job.

For information about storing containers or packages or information about release evidence see the [Package Stage direction page](https://about.gitlab.com/handbook/product/categories/#package-stage).

### Strategy and Themes
<!-- Capture the main problems to be solved in market (themes). Describe how you intend to solve these with GitLab (strategy). Provide enough context that someone unfamiliar with the details of the category can understand what is being discussed. -->

### 1 year plan
<!--
1 year plan for what we will be working on linked to up-to-date epics. This section will be most similar to a "road-map". Items in this section should be linked to issues or epics that are up to date. Indicate relative priority of initiatives in this section so that the audience understands the sequence in which you intend to work on them. 
 -->
Pipeline Security has committed and released UI functionality [allowing the bulk delete of build artifacts](https://gitlab.com/gitlab-org/gitlab/-/issues/33348) through the Artifacts page. 

There are no additional planned features for Build Artifacts in FY24 (2023-02 to 2024-01); however, Pipeline Security will continue to support high priority bug fixes for this category. Our team will also support [community contributions](https://about.gitlab.com/community/contribute/) to help advance this category at this time.

#### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->
Our team's 3 month focus is to:
* Resolve bugs with "Keep Latest Artifact" setting which are causing artifacts to [persist longer than desired](https://gitlab.com/groups/gitlab-org/-/epics/9579)

#### What we are currently working on
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->
Our team plans to continue work on the following for 16.4:
* Continuing progress to resolve [job artifacts in blocked pipelines are always marked as latest](https://gitlab.com/gitlab-org/gitlab/-/issues/387087)

#### What we recently completed
In 16.2 and 16.3 we have made incremental progress on the following: 
* Performance improvements by copying files directly to their final location. The [initial work is complete](https://gitlab.com/gitlab-org/gitlab/-/issues/285597) and we are addressing feedback. 
* Implementation of our [proposal to improve unlocking pipelines and associated artifacts](https://gitlab.com/gitlab-org/gitlab/-/issues/406255). This will enable us to safely unlock artifacts which were affected by incorrect locking behavior by the "Keep Latest Artfact" setting. 

In 16.1, we completed our MVC [UI solution to manage build artifacts](https://gitlab.com/groups/gitlab-org/-/epics/8311) with the completion of [Frontend: Artifacts bulk delete: make "select all" checkbox in table header work](https://gitlab.com/gitlab-org/gitlab/-/issues/396792). We also delivered a high priority [performance improvement](https://gitlab.com/gitlab-org/gitlab/-/issues/285597), to [avoid copying objects from one bucket to another for CI artifacts](https://gitlab.com/gitlab-org/gitlab/-/issues/285597).

#### What is Not Planned Right Now
<!--  Often it's just as important to talk about what you're not doing as it is to
discuss what you are. This section should include items that people might hope or think
we are working on as part of the category, but aren't, and it should help them understand why that's the case.
Also, thinking through these items can often help you catch something that you should
in fact do. We should limit this to a few items that are at a high enough level so
someone with not a lot of detailed information about the product can understand -->
* **Bulk deletion of build artfacts via API.** We understand this need, though that is not in our immediate plans as we have chosen to prioritize the release of this functionality via UI ([released in GitLab 16.1](https://about.gitlab.com/releases/2023/06/22/gitlab-16-1-released/#manage-job-artifacts-through-the-artifacts-page)). 
* **Improvements to the Artifacts page.** We thank our users who provided feedback to our team. Due to resource constraints and our current priorities, we are unable to action on these suggestions immediate. [Suggestions have been documented](https://gitlab.com/groups/gitlab-org/-/epics/11453) and we will resume development in this area once feasible to do so. 

#### How to Contribute
Although we do not plan on adding new features in FY24, we welcome and will support [community contributions](https://about.gitlab.com/community/contribute/) that align with our category vision. We are in the process of identifying potential issue candidates and providing information to ensure contributor success. If you have an issue you feel passionate about and want to contribute, please tag `@jocelynjane` with your interest. 

### Best in Class Landscape
<!-- Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" -->

BIC (Best In Class) is an indicator of forecasted near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape.

#### Key Capabilities 
<!-- For this product area, these are the capabilities a best-in-class solution should provide -->
To meet our long term vision that enables users to more easily use and manage their Build Artifacts we will need to improve the [usability of artifacts in the UI](https://gitlab.com/groups/gitlab-org/-/epics/8311). In addition to UI improvements, we need to provide more APIs, broading our [user-friendly solutions for build artifacts management](https://gitlab.com/groups/gitlab-org/-/epics/8715). One example is the ability to use [an API to upload artifacts](https://gitlab.com/gitlab-org/gitlab/-/issues/18794) directly to GitLab without them being generated by a pipeline. 

#### Top Customer Success/Sales Issue(s)

The Gitlab Sales teams are looking for more complex ways for customers to make use of Ultimate and Premium features like SAST and DAST with monorepos by letting customers [namespace parts of reports](https://gitlab.com/gitlab-org/gitlab/-/issues/299490) to more granular analysis or combining Matrix Builds and [Metrics Reports](https://gitlab.com/gitlab-org/gitlab/-/issues/10788).

#### Top Customer Issue(s)

The most popular customer request is for the ability to support the [generation of multiple artifacts per job](https://gitlab.com/gitlab-org/gitlab/-/issues/18744) to reduce the need for pipeline logic to make select files available to later jobs.

Another popular customer request is the ability to [reference child pipelines from the parent pipeline](https://gitlab.com/gitlab-org/gitlab/-/issues/285100). Visibility/Traceability and [seamless artifact handling for parent/child pipelines](https://gitlab.com/groups/gitlab-org/-/epics/4019) is a recurring usability theme we have heard from our customers.  

One of our most complicated request, is to handle the [`expire_at`](https://gitlab.com/groups/gitlab-org/-/epics/7097) experience in self-managed customers better. Today, our implementation deletes data for both GitLab.com and self-managed users - rather than allowing more control for our self-managed customers. 

Although we have made improvements to expiration of artifacts, we continue to see customer struggles with reliability for removal of these expired artfacts and ensuring [cleanup methods are removing all items](https://gitlab.com/groups/gitlab-org/-/epics/9343).  

#### Top Internal Customer Issue(s)

The Gitlab quality team has requested the ability to upload artifacts from a job when it [fails due to a timeout](https://gitlab.com/gitlab-org/gitlab/-/issues/19818) to assist in debugging those pipeline failures.

The team is also investigating performance issues related to the build artifact feature set as part of our focus on [Availability and Performance](/direction/enablement/dotcom/#availability-and-performance).

<!-- #### Roadmap
<!-- Key deliverables we're focusing on to build a BIC solution. List the epics by title and link to the epic in GitLab. Minimize additional description here so that the epics can remain the SSOT. This may be duplicative to the 1 year section however for some categories the key deliverables required to become the BIC solution will extend beyond one year and we want to capture all of the gaps. Moreover, the 1 year section may contain work that is not directly related to closing gaps if we are already the BIC or if we are differentiating ourselves.-->


<!-- #### Top [1/2/3] Competitive Solutions

PMs can choose to highlight a primary BIC competitor--or more, if no single clear winner in the category exists; in this section we should indicate: 1. name of competitive product, 2. links to marketing website and documentation, 3. why we view them as the primary BIC competitor -->


<!-- ### Target Audience
List the personas (https://about.gitlab.com/handbook/marketing/strategic-marketing/roles-personas#user-personas) involved in this category.

Look for differences in user's goals or uses that would affect their use of the product. Separate users and customers into different types based on those differences that make a difference.
-->


<!-- ### Pricing and Packaging
-->

<!-- ### Analyst Landscape -->


