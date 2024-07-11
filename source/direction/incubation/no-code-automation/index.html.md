---
layout: markdown_page
title: "Category Direction - No-code Automation"
---

- TOC
{:toc}

## No-code Automation

| | |
| --- | --- |
| Stage | [No-Code](https://about.gitlab.com/handbook/product/categories/#low-codeno-code-stage) |
| Maturity | N/A |
| Content Last Reviewed | `2023-01-30` |

### Introduction and how you can help
<!-- Introduce yourself and the category. Use this as an opportunity to point users to the right places for contributing and collaborating with you as the PM -->

Thanks for visiting this category direction page on No-code Automation in GitLab. This page belongs to the [Low-code / No-code Single Engineer Group](/handbook/engineering/development/incubation/no-code/) within the [Incubation Engineering Department](/handbook/engineering/development/incubation/) and is maintained by @astao ([E-Mail](mailto:<tguo@gitlab.com>)).

This direction page is a work in progress, and everyone can contribute:

 - Please comment and contribute in the linked [issues](https://gitlab.com/gitlab-org/gitlab/-/issues/?label_name%5B%5D=Category%3ANo-code%20Automation) and [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=Category:No-code+Automation) on this page. Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.

### Overview

Work items such as issues and merge requests are the backbone of project planning and delivery in the GitLab application. Project managers are typically responsible for defining processes to drive work items from creation to completion through custom stages. As organizations grow, manually performing these repetitive tasks becomes increasingly counterproductive and error-prone.

No-code Automation offers an intuitive UI allowing project managers to visually build and manage their processes with triggers, conditions and actions to form the if-this-then-that-rules. Once the rules are defined, GitLab can perform the tasks behind the scene as soon as certain events occur, which keeps the work items up to date while helping project managers to focus on the more important duties.

#### Target Audience

* [Parker (Project/Product Manager)](https://about.gitlab.com/handbook/product/personas/#parker-product-manager)
* [Delaney (Development Team Lead)](https://about.gitlab.com/handbook/product/personas/#delaney-development-team-lead)
* [Rachel (Release Manager)](https://about.gitlab.com/handbook/product/personas/#rachel-release-manager)

#### Challenges to address
<!--
- What needs, goals, or jobs to be done do the users have?
- How do users address these challenges today? What products or work-arounds are utilized?

Provide links to UX Research issues, which validate these problems exist.
-->

The lack of automation rules for project management means inefficiency and inaccuracy in task triaging and status reporting. Beyond affecting the project managers, the strenuous manual tasks may also trickle down to other team members and impact their capacity. In other cases, not responding to feature requests or other backlog items on time could cost businesses opportunities.

A small number of customers are able to leverage [gitlab-triage](https://gitlab.com/gitlab-org/ruby/gems/gitlab-triage) to build automation rules. However, the high barrier to entry (requires coding and hosting) and inconsistent experience prohibits most project managers from adopting the solution to automating repetitive tasks.

### Where we are Headed
<!--
Describe the future state for your category.
- What problems are we intending to solve?
- How will GitLab uniquely address them?
- What is the resulting benefits and value to users and their organizations?

Use narrative techniques to paint a picture of how the lives of your users will benefit from using this
category once your strategy is at least minimally realized. In order to challenge your level of ambition
(with the goal to make it sufficiently high), link to the current market leaders long-term vision and address how
we plan to displace them. -->

Workflow automation is an excellent technique to improve efficiency, and most project managers do not have a programming background. The immediate problem to solve is to allow the automation rules to be defined without writing code.

How do we differentiate ourselves? Jira Automation is a UI-only product for automating project management. GitHub Actions is code-only and mainly used for addressing complex CI/CD use cases. Our vision for No-code Automation goes beyond project planning to cover all stages in the DevSecOps lifecycle. We envisage a hybrid model that allows Automation built by UI and code to interoperate, bringing the best of both worlds.

#### What's Next & Why
<!-- This is almost always sourced from the following sections, which describe top
priorities for a few stakeholders. This section must provide a link to an issue
or [epic](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) for the [MVC](https://about.gitlab.com/handbook/product/product-principles/#the-minimal-viable-change-mvc) or first/next iteration in the category.-->

To address the problem iteratively, we will start with an [MVC](/groups/gitlab-org/incubation-engineering/no-code-low-code/-/epics/1) to productize `gitlab-triage` by fronting it with a no-code workflow builder while keeping the underlying Domain Specific Language (DSL) as-is. This approach will accelerate the Time To Market (TTM) and allow us to start iterating on the UX based on customer feedback while extending the DSL to support taking actions in other DevOps stages.

#### Prototype

<iframe width="560" height="315" src="https://www.youtube.com/embed/w-dGDBlIr0Y" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

#### What is Not Planned Right Now
<!-- Often it's just as important to talk about what you're not doing as it is to
discuss what you are. This section should include items that people might hope or think
we are working on as part of the category, but aren't, and it should help them understand why that's the case.
Also, thinking through these items can often help you catch something that you should
in fact do. We should limit this to a few items that are at a high enough level so
someone with not a lot of detailed information about the product can understand
the reasoning-->

**Eventing:** Given the existing solutions and the limited capacity of this work stream, we are not building a new eventing architecture for triggering automation rules. However, a generic and more scalable pub/sub architecture, and an extensible eventing framework, are highly desirable to realize Automation's cross-stage vision.

We are very interested in participating in the [solution proposed by the Pipeline Execution Group](https://gitlab.com/gitlab-org/gitlab/-/issues/363384) to make sure it can support Automation's use case, and we can eventually migrate over. We're currently doing [discovery on the automation triggering capability](https://gitlab.com/gitlab-org/gitlab/-/issues/388508).

**Flow-chart builder:** After prototyping with both approaches, [we've decided to go ahead with the web-form-based UX](https://gitlab.com/gitlab-org/gitlab/-/issues/388520) over flow-chart for its compatibility with `gitlab-triage`, the minimal learning curve, and overall simplicity. We keep this decision as a two-way door and are prepared to change our minds based on customer feedback.

#### Maturity Plan
<!-- It's important your users know where you're headed next. The maturity plan
section captures this by showing what's required to achieve the next level. The
section should follow this format:

This category is currently at the XXXX maturity level, and our next maturity target is YYYY (see our [definitions of maturity levels](https://about.gitlab.com/direction/maturity/)).

- Link to maturity epic if you are using one, otherwise list issues with maturity::YYYY labels) -->

TBA

### User success metrics
<!--
- What specific user behaviors are indicate that users are trying these features, and solving their problems?
- How will users discover these features?
-->

**Adoption rate:** We will use [Action Monthly Active Users (AMAU) ](https://internal.gitlab.com/handbook/company/performance-indicators/product/#action-monthly-active-users-amau) to track automation rule creation and edit on monthly basis.

**System Usability Scale (SUS):** We will conduct feature specific [SUS surveys](https://about.gitlab.com/handbook/product/ux/performance-indicators/system-usability-scale/) to measure the overall usability of the feature.

### Competitive Landscape
<!-- The top two or three competitors, and what the next one or two items we should
work on to displace the competitor at customers, ideally discovered through
[customer meetings](https://about.gitlab.com/handbook/product/product-processes/#customer-meetings). We're not aiming for feature parity with competitors, and we're not just looking at the features competitors talk
about, but we're talking with customers about what they actually use, and
ultimately what they need.-->

* [Jira Automation](https://www.atlassian.com/software/jira/features/automation)
* [GitHub Project Automation](https://docs.github.com/en/issues/planning-and-tracking-with-projects/automating-your-project/using-the-built-in-automations)
* [Monday.com Automations](https://support.monday.com/hc/en-us/articles/360001222900-monday-com-Automations)
* [Zoho Projects Automation](https://www.zoho.com/projects/taskautomation.html)

### Analyst Landscape
<!-- What analysts and/or thought leaders in the space talking about, what are one or two issues
that will help us stay relevant from their perspective.-->

* [50+ Crucial Workflow Automation Statistics and Trends for 2023](https://kissflow.com/workflow/workflow-automation-statistics-trends/)
* [HBR: Thinking Through How Automation Will Affect Your Workforce](https://hbr.org/2017/04/thinking-through-how-automation-will-affect-your-workforce)

### Top user issue(s)
<!-- This is probably the top popular issue from the category (i.e. the one with the most
thumbs-up), but you may have a different item coming out of customer calls.-->

* [Configure label to be removed when issue is closed](https://gitlab.com/gitlab-org/gitlab/-/issues/17461)
* [Automatic Triage and Labelling](https://gitlab.com/gitlab-org/gitlab/-/issues/30748)
* [Apply labels automatically when taking action on Issues/MRs](https://gitlab.com/gitlab-org/gitlab/-/issues/34941)
* [Add the ability to define an issue/MR event and an action to take as a result of that event](https://gitlab.com/gitlab-org/gitlab/-/issues/242194)
