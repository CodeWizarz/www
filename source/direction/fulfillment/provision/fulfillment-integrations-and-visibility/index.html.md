---
layout: markdown_page
title: "Product Direction - Provision: Fulfillment Integrations & Visibility"
description: "Category direction page for Fulfillment Integrations & Visibility within group Provision."
---
 
## On this page
{:.no_toc .hidden-md .hidden-lg}
 
- TOC
{:toc}

<link rel="stylesheet" type="text/css" href="/stylesheets/biztech.css" />

## Mission
Provide an excellent experience for customers purchasing GitLab products through resellers and third party marketplaces. In doing so, ensure all customer metadata is accurately populated through all relevant internal systems.

## Overview
We work to provide access for customers and partners to purchase GitLab paid plan licenses via third party providers, such as software resellers and channel marketplaces. This includes ensuring customer and order meta data is distributed appropriately to Gitlab's internal systems in the same way a direct sales-assisted or self-service purchase would be. In addition, we also oversee several system integrations internally, with a focus on data flow to Salesforce.

## 1 Year Plan
To achieve our mission of an excellent experience for reseller customers, our 1-year plan focuses on addressing current pain points for internal team members as well as on feature work that will establish net new purchase pathways for these customers.

Over the next 12 months, we intend to:

1. Provide sales & channel teams with visibility into real-time license data
1. Establish a channel partner self-service marketplace
1. Automate purchases of GitLab products through alliance cloud marketplaces
2. Improve systems visibility and error budget reporting

### Provide sales & channel teams with visibility into real-time license data

Today, visibility into data native to our customer and licensing applications is limited for team members and partners who don't use this systems regularly. This year, we want to work to improve cross-team visibility into this data, by providing it to those who need it, in a format that is easily consumable in their current process. This includes work such as adding [real-time license usage data into Salesforce for sales team insight](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/4351) and [sending voucher emails to partners for awareness of customer license delivery](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/3372).


### Establish a new channel partner self-service marketplace

To continue to drive our Channel business, we are focusing this year on supporting sales via third party marketplaces. We are planning to build out API services that will allow channel partners to place orders on behalf of their customers, query the status of orders they are facilitating, and retrieve provisioned licenses automatically. We hope to [build out a standardized solution](https://gitlab.com/groups/gitlab-org/-/epics/8848) for this effort that will allow marketplace vendors to come to us, rather than customizing a solution for their specifications. This year, we have a goal of standing up our first working marketplace integration.

### Automate purchases of GitLab products through alliance cloud marketplaces

In addition to channel partner marketplaces, we are planning to improve our current marketplace integrations by establishing API integrations with the marketplaces of our alliance partners that will fully automate the booking and provisioning process. Today, these marketplace integrations are a pain point for both customers and internal teams. We currently have established offerings for only very limited seat counts that require manual booking by Channel Operations and manual provisioning by the Support team. Establishing an API connection will allow customers to self-service GitLab products for any seat count from within their preferred marketplace platform without any manual work needed by our internal teams. In 2023, we are planning to work on integrations with [AWS](https://gitlab.com/groups/gitlab-org/-/epics/9388) and [GCP](https://gitlab.com/groups/gitlab-org/-/epics/9389) marketplaces. 

### Improve systems visibility and error budget reporting

As a newly formed category, we are inheriting a number of existing systems and integrations from other teams. In the coming year, we will work to gain a thorough understanding of these systems and how they could function better in the future. This understanding will allow us to make data-driven plans for improvements with the existing process that are prioritized appropriately.