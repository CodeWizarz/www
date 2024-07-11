---
layout: markdown_page
title: "Product Direction - Fulfillment: Provision"
description: "The Provision team at GitLab focuses on providing a seamless activation experience for customers."
canonical_path: "/direction/fulfillment/provision/"
---
 
## On this page
{:.no_toc .hidden-md .hidden-lg}
 
- TOC
{:toc}

<link rel="stylesheet" type="text/css" href="/stylesheets/biztech.css" />
 
## Mission
Our mission is to provide seamless provisioning for GitLab products, while also enabling our internal teams to succeed through integrations between systems and visibility into relevant data that can facilitate data-driven decision-making. We are also committed to driving success for our customers and partners by establishing seamless integrations through channel marketplaces. 

## Overview
The Provision group owns the process of providing all customers with access to GitLab products, including every step from completing their purchase to using their GitLab subscription successfully. This is also inclusive of customers who purchase GitLab subscriptions via third party providers, such as software resellers and channel marketplaces. In addition, we manage key internal and external integrations, .

For GitLab customers, we provide tools for subscription activation, de-activation, and reporting license usage. For self-managed customers, this includes Cloud License sync and offline usage data reporting. For SaaS customers, this includes namespace association and usage data syncs. 
 
For GitLab team members working in support and operational roles, our group strives to reduce the need for their involvement in provisioning and subscription usage management. This is achieved through automating processes, clearer documentation, and customer empowerment.

## Categories
The Provision Group owns three Categories of work. Each category represents a separate focus area and direction to achieve the broader Provision mission.

| Category | Definition | Maturity | Direction Page | Roadmap |
| ---------|------------|----------|----------------|-------|
| `SaaS Provisioning` | Related to the provisioning of SaaS products, including GitLab.com paid and trial subscriptions, CI Minutes and Storage. | `Viable` | [Direction](https://about.gitlab.com/direction/fulfillment/provision/saas-provisioning/) | [Epic Roadmap](https://gitlab.com/groups/gitlab-org/-/roadmap?state=all&sort=end_date_asc&layout=QUARTERS&timeframe_range_type=THREE_YEARS&label_name[]=Fulfillment+Roadmap&label_name[]=group::provision&label_name[]=Category:SaaS+Provisioning&progress=COUNT&show_progress=true&show_milestones=false&milestones_type=GROUP&show_labels=false) |
| `SM Provisioning` | Related to the provisioning of Self Managed subscriptions and the management of `seat link` data collected from these subscriptions. | `Viable` | [Direction](https://about.gitlab.com/direction/fulfillment/provision/sm-provisioning/) | [Epic Roadmap](https://gitlab.com/groups/gitlab-org/-/roadmap?state=all&sort=end_date_asc&layout=QUARTERS&timeframe_range_type=THREE_YEARS&label_name[]=Fulfillment+Roadmap&label_name[]=group::provision&label_name[]=Category:SM+Provisioning&progress=COUNT&show_progress=true&show_milestones=false&milestones_type=GROUP&show_labels=false) |
| `Fulfillment Integrations & Visibility` | Related to the integrations between quote-to-cash systems internally, and external marketplaces for allowing customer purchases of GitLab products through resellers. | `Minimal` | [Direction](https://about.gitlab.com/direction/fulfillment/provision/fulfillment-integrations-and-visibility/) | Epic Roadmap |


## Team Focus Areas
### 1 Year Plan
Over the next 12 months, the Provision team has three primary objectives:

1. Remove Blockers to Customers Accessing their Paid Subscriptions
1. Automate Manual Provisioning Processes
1. Improve the Cloud Licensing Experience

#### Remove Blockers to Customers Accessing their Paid Subscriptions
Provision's primary focus this year will be on correcting license-related bugs and reviewing existing validations that prevent customers from being able to access their subscriptions. Many of these validations were implemented prior to the improved subscription management capabilities GitLab has since established, and are no longer the best method for ensuring payment from customers. We see this work as a number one priority given both the frequency of these occurrences and the significant negative impact they can have on a customer's experience with GitLab. We hope to take the time this year to [remove blockers to customers accessing their paid subscriptions](https://gitlab.com/groups/gitlab-org/-/epics/9599) by [generating full-term licenses](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/4816) for multi-year deals and [removing unneccessary activation validations](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/5483).

For a [list of issues related to this effort](https://gitlab.com/groups/gitlab-org/-/issues/?sort=created_asc&state=all&label_name%5B%5D=License%20Activation&first_page_size=20), you can filter by the `License Activation` label. 

#### Automate Manual Provisioning Processes
Over the past year our team has made major strides in simplifying some aspects of provisioning, especially with the introduction of [Cloud Licensing](https://about.gitlab.com/pricing/licensing-faq/cloud-licensing/) for Self Managed customers. This year, we are focusing on automating some aspects of provisioning that still require manual generation of licenses. Some work related to this effort we have planned is:
1. [Automated provisioning of Ramp deals](https://gitlab.com/groups/gitlab-org/-/epics/7192) - today, Ramp deals require multiple unique subscriptions, causing activation problems for customers and putting a burden on internal teams needing to create manual license files.
2. Automating provisioning of [GitLab Dedicated](https://gitlab.com/groups/gitlab-org/-/epics/8799) - a newly introduced product, we plan to add support for standard automated provisioning of GitLab Dedicated.
3. Reviewing existing contracts to move to automated licensing - some specific deal types are not supported by our provisioning processes, so we're reviewing these to identify areas for automation ([internal only example](https://gitlab.com/gitlab-org/fulfillment-meta/-/issues/1001)). 

#### Improve the Cloud Licensing Experience
In August 2021, we introduced [Cloud Licensing](https://about.gitlab.com/pricing/licensing-faq/cloud-licensing/), and in July 2022 we moved to [Cloud Licensing as the default activation method](https://gitlab.com/groups/gitlab-org/-/epics/7550) for Self Managed customers. Over the past year, we've focused on major initiatives targeting increasing Cloud Licensing adoption. We've since seen high adoption results, and have removed increasing adoption as a specific team focus area. Instead, we are working on continuing to iterate on the Cloud Licensing experience for customers and internal team members. We are planning to add new functionality, such as the [ability to activate with a cloud license during installation](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/4646) and the [ability to cancel a cloud license](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/5486). We're also working on addressing bugs related to Cloud Licensing, including those documented on our [Common Provisioning Bugs](https://about.gitlab.com/direction/fulfillment/provision/common-provisioning-bugs/) page.

For a [list of issues related to this effort](https://gitlab.com/groups/gitlab-org/-/issues/?sort=closed_at_desc&state=opened&label_name%5B%5D=group%3A%3Aprovision&label_name%5B%5D=Cloud%20Licensing&first_page_size=100), you can filter by the `Cloud Licensing` label. 

### Other Attention Areas
Besides the top initiatives outlined in our 1 year plan, we have some additional areas of attention outlined below. For a comprehensive list of our upcoming and ongoing projects, check out our [GitLab Epic Roadmap](https://gitlab.com/groups/gitlab-org/-/roadmap?state=all&sort=start_date_asc&layout=QUARTERS&timeframe_range_type=THREE_YEARS&label_name%5B%5D=Fulfillment+Roadmap&label_name%5B%5D=group%3A%3Aprovision&progress=COUNT&show_progress=true&show_milestones=false&milestones_type=GROUP).

#### Provision Status Tracking
In September 2022, we launched an MVC version of the [Provision Tracking System](https://gitlab.com/groups/gitlab-org/-/epics/8300), which implemented the ability to track Zuora callouts to know the status of all provisioning events. Since then, we have continued to iterate on this work, adding [more advanced failure tracking](https://gitlab.com/groups/gitlab-org/-/epics/8904) and Slack alerts. We are continuing to build on this functionality, and processes around it, to gain a robust understanding of the real-time status of all provisioning events.

For a [list of issues related to this effort](https://gitlab.com/groups/gitlab-org/-/issues/?sort=created_asc&state=all&label_name%5B%5D=Provision%20Tracking%20System&first_page_size=20), you can filter by the `Provision Tracking System` label.

#### Trial Experience
We've recently begun [evaluating the trial experience](https://gitlab.com/gitlab-org/fulfillment-meta/-/issues/973) and how it can be improved for customers. This quarter, we'd like to add the ability for [Premium customers to apply an Ultimate trial to a group with an existing subscription](https://gitlab.com/gitlab-org/gitlab/-/issues/12186). We're also reviewing [bugs and other feature requests related to trials](https://gitlab.com/groups/gitlab-org/-/issues/?sort=milestone_due_desc&state=opened&label_name%5B%5D=group%3A%3Aprovision&label_name%5B%5D=trials&first_page_size=20), to ensure a consistent experience for all customers.

For a [list of issues related to this effort](https://gitlab.com/groups/gitlab-org/-/issues/?sort=created_asc&state=all&label_name%5B%5D=group%3A%3Aprovision&label_name%5B%5D=trials&first_page_size=20), you can filter by the `trials` label.
 
#### Customer Mailers
Today, our provisioning emails are generic and not always helpful to customers. We plan to [improve our provisioning emails](https://gitlab.com/gitlab-org/fulfillment-meta/-/issues/1023) by making them context specific, with relevant links and information for the customer based on the details of their purchase. We also are planning an [email rebrand effort](https://gitlab.com/groups/gitlab-org/-/epics/9439) to ensure alignment to GitLab's latest brand standards.

For a [list of issues related to this effort](https://gitlab.com/groups/gitlab-org/-/issues/?sort=created_date&state=opened&label_name%5B%5D=group%3A%3Aprovision&label_name%5B%5D=emails&first_page_size=20), you can filter by the `emails` label.

#### Straight-forward Provisioning Processes

Following our [knowledge-sharing sessions](https://gitlab.com/groups/gitlab-org/-/epics/8129), we have identified opportunities for simplification in our existing provisioning processes. Our goal with this simplification is to create an intuitive, easy-to-understand provisioning system for all stakeholder. Issues created as a result of these sessions will help to reduce complex or confusing logic. Also as part of this effort, we're working to increase transparency into these processes by creating clear documentation, including the creation of a [GitLab Unfiltered YouTube playlist](https://www.youtube.com/playlist?list=PL05JrBw4t0KpSfDLY2T-VDLYfrIaTDKp0) (internal only) providing overviews of relevant topics. 

For a [list of issues related to this effort](https://gitlab.com/groups/gitlab-org/-/issues/?sort=created_date&state=opened&label_name%5B%5D=group%3A%3Aprovision&label_name%5B%5D=knowledge-sharing&first_page_size=20), you can filter by the `knowledge-sharing` label.

###  Future Focus Areas
As we are able to complete some of the planned improvements of focus this year, the team is planning to shift focus towards some other known asks listed below in the future.

1. [Multi-instance license management for enterprises](https://gitlab.com/groups/gitlab-org/-/epics/6467)
1. [Simplification of the SaaS sales-assisted new subscription provisioning process](https://gitlab.com/groups/gitlab-org/-/epics/5012)

## [Provision failures](https://gitlab.slack.com/archives/C049W1SNRV1) monitoring

The purpose of this schedule is for the Engineering team to review the provisioning errors and address any systemic failures that occurred when fulfilling licenses.

Friends & Family Days and weekend days are covered on the next following workday.

Prior to every milestone, engineers are asked to fill their availability in a week-by-week format like the one in [this internal issue](https://gitlab.com/gitlab-org/fulfillment-meta/-/issues/882#data-gathering-for-monitoring-schedule-of-the-provision_failures-channel). A schedule is put together based on the availability and added to the [planning issue](https://gitlab.com/gitlab-org/fulfillment-meta/-/blob/059d88f3183b8310a074cfffab71824c02760ab0/.gitlab/issue_templates/provision_planning.md#provision-tracking-system-triage) for engineers to adjust and comment on.

Current monitoring schedule: https://gitlab.com/gitlab-org/fulfillment-meta/-/issues/1014#provision-failures-monitoring.