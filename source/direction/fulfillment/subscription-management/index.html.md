---
layout: markdown_page
title: "Product Direction - Fulfillment: Subscription Management"
description: "The Subscription Management team at GitLab is focused on providing self-service functionality for managing subscriptions and billing accounts for existing customers."
canonical_path: "/direction/fulfillment/subscription-management/"
---
 
## On this page
{:.no_toc .hidden-md .hidden-lg}
 
- TOC
{:toc}

 **Last updated**: 2023-07-10

## Mission

Provide customers with an easy, informed and reliable experience to view and manage their subscriptions, billing details, and contacts.

## Overview

Once customer purchases a GitLab subscription - whether they worked with a sales rep or purchased directly from our website with a credit card - they should be able to view that subscription, modify it, and manage all of their billing information in one place (**[Customers Portal](https://customers.gitlab.com/)**). Customers that purchase via an authorized GitLab Channel Partner should be able to view and provision access to the purchased subscriptions, but will need to contact their reseller to make subscription changes.

Some subscription changes are automated: Quarterly Subscription Reconciliation (QSR) automatically bills for overages; and Auto-Renewal automatically renews eligible subscriptions. Both are geared towards creating a hands-off subscription management experience for our customers and internal teams.

<!--
### How you can help

### Useful resources
-->

## Target audience and experience

- Self-service customers
- Sales assisted customers
- Channel Partner customers
- Internal teams (Sales, Customer Success, Billing, Compliance)

## Feature overview and maturity

| Feature | Maturity | Description | To reach the next Maturity level |
|---------|:--------:|-------------|----------------------------------|
| View subscriptions | 😊 `Viable` | SaaS and SM subscriptions can be viewed in Customers Portal. | |
| Renew subscription | 😊 `Viable` | SaaS and SM subscriptions can be renewed with a credit card. | |
| Auto-Renew subscription | 🙂 `Minimal` | SaaS subscriptions can be auto-renewed. | Auto-renew SM subscriptions. |
| Add seats to a subscription | 😊 `Viable` | SaaS and SM subscriptions can have seats added with a credit card. | |
| Remove seats from a subscription | ✖️  | Not Planned  | |
| Upgrade a subscription | 😊 `Viable` | SaaS and SM Premium subscriptions can be upgraded to Ultimate with a credit card. | |
| Downgrade a subscription | ✖️ | Not planned | |
| View invoices | 😊 `Viable` | All customers that purchased directly from GitLab can view their invoices. | |
| Pay for the invoice | ✖️ | Not planned, but evaluating the need. | |
| Manage payment methods | 😊 `Viable` | All customers that purchased directly from GitLab can view and manage their credit cards. | |
| Quarterly Subscription Reconciliation (QSR) process | 🙂 `Minimal` | QSR will process for some use cases of SaaS and SM subscriptions (Self-Service and Sales Assisted) that are opted into QSR.  | |
| Special UX for Channel Partner customers  | 😊 `Viable` | Channel customers will be able to login, view their subscriptions, and directed to the GitLab Partner to make changes manage that subscription)  | [Epic](https://gitlab.com/groups/gitlab-org/-/epics/8941) |
| Emails/In-app notifications related to subscription management | 🙂 `Minimal` | | |

**Legend:**

- ✖️ **Not Planned**: Not planned right now.
- 🌱 **Planned**: Not yet implemented, but on our roadmap.
- 🙂 **Minimal**: Available and works for a small number of use cases. Some transparency for internal teams.
- 😊 **Viable**: Available and works for majority of use cases. Some transparency for internal teams.
- 😁 **Complete**: Fully functional for all eligible use cases. Full transparency for internal teams.
- 😍 **Lovable**: Glowing review from external and internal users.
   
## Roadmap and Planning

### What we recently completed

1. Improved transparency into the overages and related billing for SaaS customers ([at the time of adding users](https://gitlab.com/groups/gitlab-org/-/epics/7230)).
1. Enabled [subscription auto-renewal](https://about.gitlab.com/handbook/product/fulfillment-guide/#subscription-renewal-and-auto-renewal) for all major use cases.
1. [Completed research](https://gitlab.com/gitlab-org/ux-research/-/issues/1782) on the Renewal experience and existing processes (both internal teams and GitLab customers) to understand and improve the Renewal process for all.
1. [New subscription display in Customers Portal for ramp subscriptions](https://gitlab.com/groups/gitlab-org/-/epics/8748).
1. Renewal discounting functionality in preparation for the [GitLab Premium Price update](https://about.gitlab.com/blog/2023/03/02/gitlab-premium-update/).

### What we're currently working on

1. **[Allowing customers that puchased via Reseller to access Customers Portal](https://gitlab.com/groups/gitlab-org/-/epics/8941).** Reseller customers are unable to self-serve their access to what they purchased, having to contact Support for help.
1. **[Allowing Customers to invite multiple Billing Account Managers for the BillingAccount](https://gitlab.com/groups/gitlab-org/-/epics/8951).** New navigation for Customers Portal, and ability to have multiple contacts that have permissions to manage subsccriptions and payment information for the Billing Account.

### What's next and why

1. **[Updating subscription display in Customers Portal to be more user friendly and aligned to Zuora data structure](https://gitlab.com/groups/gitlab-org/-/epics/9746).** Our current subscription display is not consistent with how data is structured in Zuora. Due to this, it has been increasingly difficult to adapt it to the new Order to Cash features and use cases that we've been developing.
1. **[Moving subscription Renewal emails out of Zuora and into CustomersDot](https://gitlab.com/groups/gitlab-org/-/epics/9303).** Renewal emails sent from Zuora are very generic and cause confusion for the customers. We will be making renewal emails more relevant, clear and actionable.

<!--
### 1 Year Plan

Fulfillment section is focused on [6 main investment themes](../index.html.md#1-year-plan). Out of those themes, we have :
-->
### What we're not working on

1. **We will not be moving subscription management to gitlab.com**. There are no plans to move SM subscription purchase to gitlab.com; therefore, we will keep the experience for both SaaS and SM in Customers Portal, so that it is consistent for all customers. Many of our customers purchase both SaaS and SM subscriptions. Fulfillment's investment in [using GitLab.com single sign-on as the login method for Customers Portal](https://gitlab.com/groups/gitlab-org/-/epics/8905) opens up the possibility for more streamlined purchase experiences across SaaS and SM without relying on building experiences within the GitLab product.

### Reference to Epics, Issues and Boards

Some content is confidential and therefore won't be visible.

* [Fulfillment Roadmap > Subscription Management](https://gitlab.com/groups/gitlab-org/-/roadmap?state=all&sort=end_date_asc&layout=QUARTERS&timeframe_range_type=THREE_YEARS&label_name%5B%5D=Fulfillment+Roadmap&label_name%5B%5D=group%3A%3Asubscription+management&progress=COUNT&show_progress=true&show_milestones=false&milestones_type=GROUP)
* All Subscription Management epics
   * [List of epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=group::subscription+management)
   * [Organized epics board](https://gitlab.com/groups/gitlab-org/-/epic_boards/31408?label_name[]=group%3A%3Asubscription%20management)
* All Subscription Management issues
   * [List of issues](https://gitlab.com/groups/gitlab-org/-/issues/?sort=updated_desc&state=opened&label_name%5B%5D=group%3A%3Asubscription%20management&first_page_size=20)
   * [Organized issues board](https://gitlab.com/groups/gitlab-org/-/boards/4282426?label_name[]=group%3A%3Asubscription%20management)
