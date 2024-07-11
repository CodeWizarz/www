---
layout: markdown_page
title: "Category Direction - Switchboard"
---

- TOC
{:toc}

## Switchboard

<!--
| | |
| --- | --- |
| Stage | [<STAGE-NAME>](/direction/<STAGE-NAME>/) |
| Maturity | [<MATURITY-LEVEL>](/direction/maturity/) |
| Content Last Reviewed | `yyyy-mm-dd` |
-->

### Introduction and how you can help

This page outlines the Direction for the GitLab Switchboard category which belongs to the [GitLab Dedicated](https://about.gitlab.com/handbook/product/categories/#gitlab-dedicated-group) group. To provide feedback or ask questions about this product category, reach out to the [Product Manager](mailto:lbortins@gitlab.com).

You can contribute to this category by:

- Commenting on a relevant epic or issue in [our project](https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team) (GitLab internal), or opening a new issue in the [GitLab Dedicated issue tracker](https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/issues/new?issue%5Bmilestone_id%5D=).
- Joining the discussion in the [#f_gitlab_dedicated](https://gitlab.slack.com/archives/C01S0QNSYJ2) Slack channel

To learn more about concepts and terminology discussed in this direction page, please refer to the [Switchboard Glossary](./glossary).

## Overview

### Solution

Switchboard is a new portal being developed alongside the [GitLab Dedicated](https://about.gitlab.com/direction/saas-platforms/dedicated/) single-tenant SaaS offering. Switchboard will be used both by Dedicated customers as well as internal GitLab teams who support and maintain Dedicated instances. 

While GitLab Dedicated customers will be able to rely on GitLab to maintain the stability and security of their environment, tenant operators (e.g. a system administrator) still need to be empowered to quickly make changes to their Dedicated tenant's configurations in the course of their daily work. Switchboard will also serve as the "front door" to GitLab Dedicated by providing tenant operators with a welcoming and efficient onboarding experience to GitLab Dedicated.

Our north star for Switchboard is to reduce time to value (TTV) for new Dedicated customers and create internal efficiencies by minimizing the assistance tenant operators need from GitLab to onboard and manage their instances.

### Why is this important

Maturing Switchboard is key to the success of GitLab Dedicated at scale and deliver the unique value of a single-tenant SaaS environment that is able to meet their needs for security and compliance without the operational burden of a self-managed environment. 

From an internal perspective, Switchboard serves as the primary connection between internal operators and Dedicated tenants - internal operators will not have direct access to customer tenant environments ([read more about that here](https://docs.gitlab.com/ee/subscriptions/gitlab_dedicated/#access-controls)), and Switchboard must enable them to operate at scale.

### Background

During the [Beta and LA phases](https://about.gitlab.com/direction/saas-platforms/dedicated/#limited-availability-roadmap) of GitLab Dedicated, all management of tenant instances has been performed by the same internal teams who are responsible for developing the architecture and automation needed to fully scale Dedicated as a product offering. While some operations will need to continue to be handled by these teams, there are many configurations and actions that we can empower tenant operators to complete on their own. These could include tasks like reviewing their organization's SAML configurations or configuring their VPC to enable other business-critical integrations to work properly with GitLab - both common use cases for Switchboard that have come up for our Beta customers.

### Target Audience

Switchboard shares its target audience with [GitLab Dedicated](https://about.gitlab.com/direction/saas-platforms/dedicated/#target-customer). The primary user persona for Switchboard is [Sidney (systems administrator)](https://about.gitlab.com/handbook/product/personas/#sidney-systems-administrator).

Within GitLab, Switchboard will be used by the tenant operators, support, and professional services teams.

### Success Criteria

We are still finalizing our success criteria for Switchboard. At a high level, we know that we will want to measure our impact on both customer satisfaction (e.g. decrease in Time to Value with self-serve onboarding) as well as internal efficiency (e.g. decrease time per operator spent on tenant maintenance tasks).

### Current state

The Switchboard MVP UI is available internally however it's not yet being widely used by GitLab operators supporting existing Dedicated tenants. Most of what they need to do (maintenance windows, incident response/remediation) is currently being completed via the Switchboard mock jobs or using monitoring tools within the tenant instances themselves. This work was completed as part of [Switchboard App MVP](https://gitlab.com/groups/gitlab-com/gl-infra/gitlab-dedicated/-/epics/54) (internal only).

The UI currently provides the ability to set up new tenants as well as to make changes to existing tenants by editing the tenant model JSON directly. New tenants can also be set up by entering or uploading a completed tenant model. 

User management and audit logs for Amp jobs are the only tasks that can currently be completed solely using the UI - that is, they do not require JSON entry to complete.

One of our LA customers has recently been given access to test out the Switchboard MVC in their Beta environment.

## Where are we headed

When Switchboard has matured past the MVP stage, GitLab internal operators will have significantly fewer interactions with individual instances and will instead focus on monitoring and maintenance across all Dedicated tenants with visibility provided by Switchboard. 

Switchboard will also enable tenant operators to monitor the health of their instances and provide them with critical insights should they need to reach out to GitLab support.

### What is next for us

The next step for Switchboard is for us to uplevel the existing UI from its MVC form and begin adopting Pajamas components as we begin to build our core tenant operator workflows like onboarding.

As the onboarding flow is being built, we will begin to evaluate which parts of the tenant model should be made editable via the UI either by tenant operators or GitLab internal operators without needing to rely on JSON.

As we do this, we will need to balance how they contribute to the north star of self-service and efficiency with the potential to cause an incident that will be time-consuming for GitLab support and/or operators to remediate.

Features that allow GitLab operators to scale up their capacity for supporting tenant environments will take first priority (hence beginning with the onboarding flow)

Remaining work to support GA is also captured in [Switchboard App MVP](https://gitlab.com/groups/gitlab-com/gl-infra/gitlab-dedicated/-/epics/54). Work in progress and in the backlog is being tracked on the [Switchboard Build Board](https://gitlab.com/groups/gitlab-com/gl-infra/gitlab-dedicated/-/boards/4498935?label_name%5B%5D=component%3A%3ASwitchboard) (both internal only)

### What we are currently working on

Our current focus is deploying the Switchboard MVC app to production. See [GitLab Dedicated - Limited Availability](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/484) (internal only) for latest updates.

### What we recently completed

The Switchboard MVC app was recently made available to internal operators via [Phase 5: self-service through Switchboard for internal operators](https://gitlab.com/groups/gitlab-com/gl-infra/gitlab-dedicated/-/epics/86) (internal only)

A demo of Switchboard at the end of Phase 5 is available [here](https://www.youtube.com/watch?v=B6H23xTMFBw). (internal only)

### What is Not Planned Right Now

* Switchboard will not directly interact with customer tenant environments. Read more about that in the [GitLab Dedicated documentation](https://docs.gitlab.com/ee/subscriptions/gitlab_dedicated/#access-controls).

* Switchboard is solely focused on supporting GitLab Dedicated instances. We do not currently plan to expand it to support GitLab.com or Self-Managed instances.

### Roadmap

In a future iteration, we will look to integrate with CustomersDot to minimize or even eliminate the manual work needed post-sales for customers to create their Dedicated environment as part of the onboarding process.

The remainder of our roadmap will be largely shaped by feedback from both tenant operators and GitLab operators as we move into GA. 

We have started gathering feature requests via this [feedback issue](https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/issues/2078) (internal).

### Comparative Analysis

Similar portals have been built for other products used by Switchboard's target audience including ElasticSearch, MongoDB cloud, AWS and IBM cloud. We will look to common patterns shared by these portals as we continue to build out the capabilities of Switchboard.
