---
layout: markdown_page
title: "Category Direction - Fulfillment Admin Tooling"
description: "The Fulfillment Admin Tooling strategy page belongs to the Fulfillment Platform group of the Fulfillment stage"
---

## On this page
{:.no_toc .hidden-md .hidden-lg}
 
- TOC
{:toc}

<link rel="stylesheet" type="text/css" href="/stylesheets/biztech.css" />

 **Last updated**: 2023-05-23

## Mission

> Provide GitLab's internal teams with the tools they need to serve customers efficiently and in a way that minimises repeat issues.

## Overview

The Admin Tooling category is designed to provide internal teams with the tools and automation they need to support our customers. Within this category we aim to develop tools that are intuitive, easy to use and streamline internal team workflows.

The key responsibilities span over:
- Focus on building admin tools for the support team.
- Focus on providing internal solutions that free up support team capacity.
- Provide internal teams with visibility into customer subscriptions, billing and licensing.

When our teams do not have the right tools to solve customer problems, it leads to massive inefficiencies and, in some scenarios, problems such as customers temporarily losing access to critical paid plan functionality.

Inefficiencies can occur in the following ways:

- Finding customer and account information is difficult because: our internal platform lacks functionality and is not intuitive, the information is scattered across multiple systems, and the information is inconsistent across systems, leading to low confidence in the accuracy of the information for some systems.
- Manual intervention leads to data integrity issues, which perpetuates more manual intervention and leads to errors and unexpected states for customer accounts and subscriptions.
- Customer accounts and subscriptions in unexpected states create complexity that is harder to diagnose and troubleshoot, resulting in more time and more people involved in resolving the issue.
- When a bug remains unresolved or a feature is missing, it creates the need for a workaround to serve the customer. Workarounds create new workflows for the team to support, adding to the volume of tickets.
- Some tasks require a lengthy workflow that includes: verifying the requester and the request, finding and validating information, getting and confirming approvals from the right people, performing the task, communicating and confirming task completion, and reviewing changes. 

### Target Audience and Experience

Our audience are GitLab internal team members, with a focus on team members that help support our commercial operations. In particular: 
- [GitLab L&R Support team](https://about.gitlab.com/handbook/support/)
- [GitLab Sales team](https://about.gitlab.com/handbook/sales/)
- [GitLab Billing](https://about.gitlab.com/handbook/finance/accounting/finance-ops/billing-ops/) and Accounts Receivable team

We work in collaboration with the Support Operations and Field Operations teams to achieve internal team efficiency goals.

## Challenges to address

### Visibility and data integrity

Our internal teams don't always have the visibility they need to serve a customer quickly. The longer it takes to find information, troubleshoot and then resolve an issue, the more likely it is that the customer will be dissatisfied. Our internal systems should give our teams access to all the relevant information they need (preferably in one place) to resolve issues or complete a request. 

Where there are long-standing bugs or missing customer-facing features, the support team has created the Mechanizer tool as a temporary workaround to provide the functionality needed to troubleshoot and resolve customer issues and tasks. As Mechanizer is not built or maintained by a GitLab engineering team and leads to data integrity issues, it is important that this tool is deprecated in favour of intuitive tools and automation that can provide the required functionality.

**Projects to tackle this challenge:**

- [Migrate Mechanizer features so it can be deprecated](https://gitlab.com/groups/gitlab-org/-/epics/6828)
- [Build controls for namespaces on a trial in CustomersDot](https://gitlab.com/groups/gitlab-org/-/epics/9451)
- [Build controls for namespaces with a subscription in CustomersDot](https://gitlab.com/groups/gitlab-org/-/epics/9453)
- [Build tools for license generation that enable the Sales team to unblock customer during renewals process](https://gitlab.com/groups/gitlab-org/-/epics/9732)
- [Implement minutes and storage change ability in CustomersDot](https://gitlab.com/groups/gitlab-org/-/epics/9031)
- [CustomersDot Admin maintenance](https://gitlab.com/groups/gitlab-org/-/epics/9488)
- [CustomersDot Admin usability](https://gitlab.com/groups/gitlab-org/-/epics/9454)
- [Auditing and activity logging](https://gitlab.com/groups/gitlab-org/-/epics/9348)

### Efficiency

For the L&R Support team, we want to increase efficiency by focusing on:

- Easily finding the information needed to resolve a problem.
- Minimising the need to involve other teams to resolve a problem or complete a task.
- Being able to access information quickly and ideally from a single source.

For the Sales team, we want to increase efficiency by focusing on:

- The ability to easily and quickly provide customers with access to the GitLab product as needed to support the sales process.
- Approval processes are intuitive and do not hinder the sales process.
- Sales has visibility to relevant customer information to support the sales process or to proactively or reactively resolve customer issues.

**How we will tackle this:**

- Review inefficient workflows and identify opportunities for tooling and automation to reduce the time spent searching for relevant information, completing tasks and requesting approvals.
- Identify workflows that involve multiple teams to complete a task and explore solutions to place ownership and supporting tools with the appropriate team.

## 1 Year Plan

Over the next 12 months, the Admin Tooling team has the following primary objectives:

1. Provide additional tooling for the Sales team that allows the field to temporarily extend licenses at renewal to mitigate any customer issues during renewal. This initative is tracked in the following epic:
     - [Temporary extensions: Allow the field to temporarily extend licenses at renewal](https://gitlab.com/groups/gitlab-org/-/epics/10173)
1. Deprecate the use of Mechanizer and build the needed functionality into our platform (customers.gitlab.com), this initiative is tracked in the following epics:
     - [Namespace controls for trials in customersdot](https://gitlab.com/groups/gitlab-org/-/epics/9451)
     - [Namespace controls for subscriptions in customersdot](https://gitlab.com/groups/gitlab-org/-/epics/9453)
1. Review use cases for Mechanizer functionality and seek to eliminate the need for the functionality that mechanizer was providing by solving for the underlying problems via: self-serve features in the product, enabling internal teams with features specific to their workflows (example: temporary license generation for the sales org), and automation. Efforts towards this goal are tracked in each review epic:
     - [Review `Update GitLab Plan` mechanizer function](https://gitlab.com/groups/gitlab-org/-/epics/8423)
     - [Review `Force reassociation` mechanizer function](https://gitlab.com/groups/gitlab-org/-/epics/8425)
     - [Review `Clear subscription` mechanizer function](https://gitlab.com/groups/gitlab-org/-/epics/8424)

For a list of upcoming and ongoing projects for the Fulfillment Admin Tooling category, see our [GitLab epic roadmap](https://gitlab.com/groups/gitlab-org/-/roadmap?state=opened&sort=start_date_asc&layout=QUARTERS&timeframe_range_type=THREE_YEARS&label_name[]=Fulfillment+Roadmap&label_name[]=Category:Fulfillment+Admin+Tooling&progress=COUNT&show_progress=true&show_milestones=false&milestones_type=GROUP&show_labels=false).

## Prioritisation and data insights

Our [performance indicator dashboard](https://app.periscopedata.com/app/gitlab/1106588/Fulfillment:-Admin-Tooling-PIs) gives us visibility into data relating to tickets.

Further, we utilize the Support Priority [Epic](https://gitlab.com/groups/gitlab-org/-/epic_boards/39981?label_name%5B%5D=devops::fulfillment&label_name[]=Support%20Priority) and [Issue board](https://gitlab.com/groups/gitlab-org/-/boards/2543339?label_name%5B%5D=section::fulfillment) to gather priotization input from our Support stakeholders.

## Key Links

For more details into future oportunities of other categories within the Fulfillment Platform group, please refer to the sections in the dedicated category pages:
- [Fulfillment Infrastructure](/direction/fulfillment/platform/fulfillment-infrastructure/)
- [CustomersDot Application](/direction/fulfillment/platform/customers-dot-application/)

- [Performance indicators](https://internal.gitlab.com/handbook/company/performance-indicators/product/fulfillment-section/#fulfillment-platform---lr-internal-request-volume)
- [Fulfillment Platform group roadmap](https://gitlab.com/groups/gitlab-org/-/roadmap?state=opened&sort=start_date_asc&layout=QUARTERS&timeframe_range_type=THREE_YEARS&label_name[]=Fulfillment+Roadmap&label_name[]=group::fulfillment+platform&progress=COUNT&show_progress=true&show_milestones=false&milestones_type=GROUP&show_labels=false)
