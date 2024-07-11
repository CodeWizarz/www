---
layout: sec_direction
title: "Category Direction - Dependency Management"
---

- TOC
{:toc}

| | |
| --- | --- |
| Stage | [Govern](/direction/govern/) |
| Maturity | [Viable](/direction/maturity/) |
| Features & Demos | [Our Youtube playlist](https://www.youtube.com/playlist?list=PL05JrBw4t0Kp8oA6OJ6_wm7uw0muud_mZ) |
| Content Last Reviewed | `2023-06-28` |
| Content Last Updated | `2023-06-28` |

### Introduction and how you can help
Thanks for visiting this category strategy page on Vulnerability Management in GitLab. This category belongs to the [Threat Insights](https://about.gitlab.com/handbook/product/categories/#threat-insights-group) group of the Govern stage and is maintained by [Alana Bellucci](https://about.gitlab.com/company/team/#abellucci) ([abellucci@gitlab.com](mailto:<abellucci@gitlab.com>)).

This direction page is a work in progress, and everyone can contribute:

 - Please comment and contribute in the linked [issues](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=UPDATED_AT_DESC&label_name[]=Category:Dependency+Management) and [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=UPDATED_AT_DESC&label_name[]=Category:Dependency+Management) on this page. Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.
 - If you'd like to reach out to us directly, please share feedback directly via [email](mailto:<abellucci@gitlab.com>), or on find time on [Alana's calendar](https://calendly.com/abellucci/30min) for a video call. If you're a GitLab user and have direct knowledge of your need for vulnerability management, we'd especially love to hear from you.

### Overview
Dependency Management aims to help developers and security professionals understand exactly what 3rd-party software organizations are using to create their own applications. In our research, we found that key capabilities for a dependency management tool include:

| Capability | Description |
| ------ | ------ |
| Insights | Visibility on dependencies, versioned component, vulnerability state, and adherence to compliance. The importance of insights is the ability to prioritize and triage dependencies from a project and organizational level. This allows organizations to assess risk and meet compliance to internal/external requirements. |
| Remediation | A combination of manual and automated methods can be used to update and resolve dependencies. By manual is informing the user of its version, vulnerable state, and upgradability. By automated are solutions involving a MR to update the package file with version and description of changes such as changelog, CVE, and merge confidence. |
| Policies | A policy can include remediation rules, authorized dependencies, CVE validation, vulnerable tolerance, compliance and more. This policy can then be flagged at the MR, continuously, or on-demand.  |
| Alerting | A combination of notifications to chat platforms (Slack, Teams, etc) or email alerts. Notifications include a report of a new vulnerable dependency or weekly report of dependency insights. These can be scheduled or policy-driven. |

We are starting with the existing [Dependency list](https://docs.gitlab.com/ee/user/application_security/dependency_list/) and the [portion of License compliance page](https://docs.gitlab.com/ee/user/compliance/license_compliance/) where you can view the dependency a given license was found in. 

### Strategy and Themes
<!-- Capture the main problems to be solved in market (themes). Describe how you intend to solve these with GitLab (strategy). Provide enough context that someone unfamiliar with the details of the category can understand what is being discussed. -->
The vision is to create complete, near-real time, organization-wide visibility into all 3rd-party dependencies—and any risks present. We will leverage existing features of the GitLab platform to accelerate feature development. We will also bring consistency across security capabilities as we look to mirror functionality in our sibling category of [Vulnerability Management](/direction/govern/threat_insights/vulnerability_management/).

### 1 year plan
<!--
1 year plan for what we will be working on linked to up-to-date epics. This section will be most similar to a "road-map". Items in this section should be linked to issues or epics that are up to date. Indicate relative priority of initiatives in this section so that the audience understands the sequence in which you intend to work on them. 
 -->
Over the next year (major milestone 16.0-16.11), we aim to enable the abilitiy for leadership to have visibility to dependencies in any project, sub-group, group or instance level view.  We also want to make sure teams can quickly triage their dependencies with filters, searching and grouping within the dependency list. 

#### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->
We are working on multiple iterations of the Group/Sub-Group Level Dependency List.  Once the [Group/Sub-Group Level Dependency List MVC](https://gitlab.com/groups/gitlab-org/-/epics/8090) (minimum viable change) is released we will work on iterations 1 - 3.
   - [Iteration 1](https://gitlab.com/groups/gitlab-org/-/epics/10904) will include filter functionality, project and license information
   - [Iteration 2](https://gitlab.com/groups/gitlab-org/-/epics/10905) will include vulnerability information
   - [Iteration 3](https://gitlab.com/groups/gitlab-org/-/epics/10906) will include the latest version information for each component.

#### What we are currently working on
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->
We are currently working on the MVC for the [Group/Sub-Group Level Dependency List](https://gitlab.com/groups/gitlab-org/-/epics/8090).  With this change, you can see all dependencies within all projects and sub-groups.

<!-- #### What we recently completed
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

<!-- #### What is Not Planned Right Now
<!--  Often it's just as important to talk about what you're not doing as it is to
discuss what you are. This section should include items that people might hope or think
we are working on as part of the category, but aren't, and it should help them understand why that's the case.
Also, thinking through these items can often help you catch something that you should
in fact do. We should limit this to a few items that are at a high enough level so
someone with not a lot of detailed information about the product can understand --> 

<!-- ### Best in Class Landscape -->
<!-- Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" -->

<!-- BIC (Best In Class) is an indicator of forecasted near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape. -->

<!-- #### Key Capabilities 
For this product area, these are the capabilities a best-in-class solution should provide -->

#### Roadmap
<!-- Key deliverables we're focusing on to build a BIC solution. List the epics by title and link to the epic in GitLab. Minimize additional description here so that the epics can remain the SSOT. This may be duplicative to the 1 year section however for some categories the key deliverables required to become the BIC solution will extend beyond one year and we want to capture all of the gaps. Moreover, the 1 year section may contain work that is not directly related to closing gaps if we are already the BIC or if we are differentiating ourselves.-->

Our current priority is to continue working with our Composition Analysis team in building [Continuous Vulnerability Scanning](https://gitlab.com/groups/gitlab-org/-/epics/7886). This will lay the groundwork for "scanless" dependency updates and vulnerability identification. The new database-backed models for dependencies and vulnerability advisory data are key enablers of planned Dependency Management features. One of the first such features is creating a [Dependency List at the Group level](https://gitlab.com/groups/gitlab-org/-/epics/8090). This will create broad, instance-wide views of all dependencies in your organization. We will also be able to build out features borrowed from Vulnerability Management like [Filtering and Searching](https://gitlab.com/groups/gitlab-org/-/epics/8089) and [Grouping](https://gitlab.com/groups/gitlab-org/-/epics/8091). Eventually, we will [Remove the License Compliance Page](https://gitlab.com/groups/gitlab-org/-/epics/8093) as the information is very similiar, just in a different presentation. This will create a single source of truth for both dependency and license information.


#### Top [1/2/3] Competitive Solutions
<!-- PMs can choose to highlight a primary BIC competitor--or more, if no single clear winner in the category exists; in this section we should indicate: 1. name of competitive product, 2. links to marketing website and documentation, 3. why we view them as the primary BIC competitor -->

| Feature            | GitLab | Black Duck | Sonatype | Snyk    | GitHub | Mend |
|---|:---:|:---:|:---:|:---:|:---:|:---:|
| Insights |🟨|🟩|🟩|  🟩     |  🟩    |  🟩   |
| Remediation |   🟨   |     🟩    |   🟩        |  🟩     |  🟩    |  🟩   |
| Policies    |   🟨   |     🟩    |   🟩        |  ⬜️     |  🟨   |  🟩   |
| Alerting    |   ⬜️   |     🟩    |   ⬜️        |  🟩     |  🟩    |  🟩   |

- ⬜️ lacking
- 🟨 needs improvement
- 🟩 excels


<!-- ### Target Audience -->
<!-- List the personas (https://about.gitlab.com/handbook/marketing/strategic-marketing/roles-personas#user-personas) involved in this category.
Look for differences in user's goals or uses that would affect their use of the product. Separate users and customers into different types based on those differences that make a difference.
-->

<!-- ### Pricing and Packaging -->

<!-- ### Analyst Landscape -->