---
layout: markdown_page
title: "Product Section Direction - Fulfillment"
description: "The Fulfillment section at GitLab focuses on supporting our customers to purchase, upgrade, downgrade, and renew paid subscriptions."
canonical_path: "/direction/fulfillment/"
---

## On this page
{:.no_toc}

- TOC
{:toc}

Last reviewed: 2023-09

## Fulfillment Section Overview

At GitLab, Fulfillment works to provide a seamless buying experience for our customers. We invest in the [order-to-cash](/company/quote-to-cash/) systems to make purchasing, activating, and managing GitLab subscriptions as easy as possible. This improves customer satisfaction and streamlines our go-to-market (GTM) processes, helping accelerate revenue growth for the company.

The Fulfillment section encompasses [five groups](#groups) and [ten categories](/handbook/product/categories/). Fulfillment collaborates closely with [Field Operations](/handbook/sales/field-operations/), [Enterprise Applications](/handbook/business-technology/enterprise-applications/), [Billing Ops](/handbook/finance/accounting/finance-ops/billing-ops/), [Support](https://handbook.gitlab.com/handbook/support/readiness/operations/), and [Data](/handbook/business-technology/data-team/).

We welcome feedback on our initiatives. If you have any thoughts or suggestions, please feel free to create a merge request to this page and assign it to `@ofernandez2` for review, or [open a Fulfillment Meta issue](https://gitlab.com/gitlab-org/fulfillment-meta/-/issues/new).

### Mission

> Provide customers with an excellent experience by making it easy for them to purchase GitLab paid subscriptions and add-ons, provision their purchase, and manage subscription changes such as increasing seat count or renewing.

GitLab paid plans offer rich feature sets that enable customers to build software faster and more securely. For the Fulfillment section, success is to make it as easy as we can for a customer to transact with GitLab and unlock the value of these rich feature sets in our paid offerings.

We strive to make our subscription purchase and management process simple and support our customers' preferred purchasing channels, as well as their preferred payment methods. Delivering this vision requires investments across all interfaces where customers conduct business with GitLab. Given the breadth of countries, organization sizes, and industries that benefit from the GitLab product, we strive to be excellent at both direct transactions via our web commerce portal or our sales team, as well as sales via [Channels and Alliances](/handbook/sales/#channels--alliances).

### Impact on GitLab's addressable market

Our vision is to improve operational efficiency by providing a seamless end-to-end subscription management experience. This enables our Sales teams to spend more of their time on accounts with [high LAM](/handbook/sales/field-operations/sales-systems/gtm-technical-documentation/#landed-addressable-market-lam). It also allows our Support and Finance teams to be more efficient.

## Challenges

We have faced significant headwinds as we made progress in our Fulfillment systems. We are working on a series of projects to improve things moving forward.

| Challenge | How to improve | Lessons Learned |
| --------- | ---------- | -------- |
| Any significant changes to Fulfillment systems has an impact on, and must be coordinated with, many cross-functional teams. | We are investing heavily in [reducing system complexity and aligning data architecture across systems](#complete-key-foundational-improvements-to-our-order-to-cash-systems-and-data-architecture) to reduce errors and cognitive load as teams move across systems. | Proactive quarterly planning and review by other stakeholders, stronger program management. |
| There are many important initiatives to support, and often our resources are spread too thinly. | We set clear [FY24 Prioritized Plans](https://gitlab.com/gitlab-com/Product/-/issues/5291) and ensure that priorities are clearly communicated across teams each quarter by using OKRs. | Proactive planning and communication of priorities each quarter. Consolidate prioritization to OKRs and eliminate confusion of what's the source of truth for priorities. |

In FY23, we took a deliberate approach to slow down new feature development in favor of improving the foundations of our systems and addressing pain points with existing functionality. This has continued in FY24 as we work to improve our system foundations.

## 1-year Plan

Over the next 12 months we are focusing on the following investment themes:

1. Enable pricing and packaging innovation at GitLab
2. Customers can easily buy from GitLab
3. Customers can easily understand and control their subscription value and costs
4. Customers can easily provision their subscription or trial
5. Customers can easily manage their account and subscriptions
6. Improve internal teams' effectiveness

### Enable pricing and packaging innovation at GitLab

GitLab has traditionally had limited offerings - 2 paid tier plans that apply to all seats in a provisioned instance/group, and 2 consumable add-ons. Moving forward, we'd like to enable other pricing and packaging options. Details of this work are [limited access](/handbook/communication/confidentiality-levels/#limited-access).

In addition, we support pricing changes such as the [GitLab Premium price change](/blog/2023/03/02/gitlab-premium-update/) announced on 2023-03-02.

### Customers can easily buy from GitLab

In FY24, we will focus on the following areas to make it easier for customers to purchase a GitLab subscription.

#### Enable channel partners and distributors to provide great selling motions

An increasing number of customers begin their GitLab journey via a partner. They may transact in a cloud provider's marketplace or purchase GitLab as part of a software bundle via a distributor. Our goal is to ensure those customers and partners get as high a quality of service as they would buying direct. This means extending our APIs to support indirect transactions and collaborating closely with our counterparts in Channel Ops, Finance, and Enterprise Apps to design solutions that extend our internal systems beyond their direct-sales use cases. We plan to create more visibility and flexibility for our customers and partners to manage GitLab subscriptions.

For more details on this work, reference the Commerce Integrations category direction page and roadmap in [Groups](#groups).

#### Improve our self-service purchase experience

Currently, we maintain separate pathways for a new SaaS subscription purchase, a new self-managed subscription purchase, purchasing a storage add-on, and more. We also maintain purchase pathways for personal namespace add-ons, where we no longer support paid plan purchases. In FY24, we seek to simplify the purchase experiences by investing in a consolidated, best-in-class purchase path for our various offerings.

Our investments in [using GitLab.com single sign-on as the login method for customers.gitlab.com](https://gitlab.com/groups/gitlab-org/-/epics/8905) open up the possibility for more streamlined purchase experiences across SaaS and SM without relying on building experiences within the GitLab product.

For more details on this work, reference the Purchase group's direction page and roadmap in [Groups](#groups).

#### Enable specific web-direct discounted pricing

For initiatives such as the [GitLab Premium Price update](/blog/2023/03/02/gitlab-premium-update/), GitLab would like the ability to offer a special discount to specific customers which they can redeem on customers.gitlab.com. We built discounting capabilities, which we used in FY24 for two discount types extended via the web store to qualifying customers. 

### Customers can easily understand and control their subscription value and costs

We want to take the complexity out of understanding GitLab's [pricing](/company/pricing/) so that a customer can easily understand and manage their subscription usage and how it relates to billing. A key problem area has been seat overages transparency, [seat usage visibility](https://gitlab.com/groups/gitlab-org/-/epics/5872), and customer understanding of our overages model. We are looking for ways to simplify our seat overages model and hope to finalize a proposal by the end of FY24, for FY25 development. 

As we roll out [namespace Storage limits on SaaS](/pricing/faq-efficient-free-tier/#storage-limits-on-gitlab-saas-free-tier), we are working to ensure that [namespace storage is easy to understand](https://gitlab.com/groups/gitlab-org/-/epics/8852) and manage for all SaaS users.

We released in FY24 [user caps for groups](https://docs.gitlab.com/ee/user/group/manage.html#user-cap-for-groups) to help SaaS customers better manage their paid subscription seats. We plan to address some of the [known gaps in User Caps for Groups](https://docs.gitlab.com/ee/user/group/manage.html#known-issues) as we finalize FY24. 

For more details on this work, reference the Utilization group's direction page and roadmap in [Groups](#groups).

###  Customers can easily provision their subscription or trial

In FY23, we made significant progress in migrating a large number of our GitLab self-managed subscriptions to use [Cloud Licensing](/pricing/licensing-faq/cloud-licensing/). In FY24, we will build on this foundation to continue to improve a customer's ability to provision their subscriptions.

Areas of investment in FY24 include:
1. Automated licensing provisioning via Cloud Licensing for [GitLab Dedicated](https://docs.gitlab.com/ee/subscriptions/gitlab_dedicated/).
1. Updated how GitLab validates whether a SM instance has unpaid seat overages ([related Epic](https://gitlab.com/groups/gitlab-org/-/epics/9599)).
1. Enabling SaaS Ultimate trials on namespaces with an active Premium plan.
1. Allowing customers to manage and use a single subscription across multiple SM instances and SaaS namespaces.

For more details on this work, reference the Provision group's direction page and roadmap in [Groups](#groups).

###  Customer can easily manage their account and subscriptions

Managing a GitLab subscription should be simple and largely automated. In order to make this a reality for all customers, we are investing in:
1. Made it easier to access the [Customers Portal](https://customers.gitlab.com/) via GitLab.com SSO, while increasing adoption of GitLab.com SSO as the only login method.
2. Automated seat overages reconciliation via [quarterly reconciliation](https://docs.gitlab.com/ee/subscriptions/quarterly_reconciliation.html) for more customers.
3. Supporting auto-renewal for more customers.
4. Improving the availability and robustness of customers.gitlab.com.
5. Making renewal emails more relevant, clear and actionable for the customers.

For more details on this work, reference the Subscription Management and the Fulfillment Platform groups' direction pages and roadmaps in [Groups](#groups).

### Improve effectiveness of internal teams

GitLab team members are passionate about delivering value to our customers. To contribute to this, Fulfillment will invest in several initiatives in FY24 to improve the effectiveness of our internal teams.

1. Building more robust tools for GitLab support team members ([related issue](https://gitlab.com/groups/gitlab-org/-/epics/6828)).
2. [Aligning customers.gitlab.com and Zuora billing account models](https://gitlab.com/groups/gitlab-org/-/epics/8331).
2. Making key internal system integrations more robust and resilient.
3. Improving [internal tooling usability](https://gitlab.com/groups/gitlab-org/-/epics/9454).
4. Investing in Fulfillment developer productivity via code refactors and new tooling deployment.

As we complete these investments we will reduce the complexity of our order-to-cash systems, making it easier to innovate and deliver improvements to GitLab customers and our internal stakeholders across sales, billing, and more.

For more details on this work, reference the Fulfillment Platform groups direction pages and roadmaps in [Groups](#groups).


## Roadmap

Due to the [not public](https://handbook.gitlab.com/handbook/communication/confidentiality-levels/#not-public) nature of most of our projects, our product roadmap is internal. 

We have [Fulfillment FY24 Plans and Prioritization](https://gitlab.com/gitlab-com/Product/-/issues/5291) (also Not Public), that GitLab team members can reference to track all planned initiatives by theme.

### Roadmap Prioritization

To learn more about our roadmap prioritization principles and process, please see [Fulfillment Roadmap Prioritization](/handbook/product/fulfillment-guide/#fulfillment-roadmap-prioritization)

## Groups


| Group | Description | Roadmap | Categories |
|------------|---------------|----------|-------|
| [Subscription Management](/direction/fulfillment/subscription-management/) | The Subscription Management group is responsible for providing customers with an easy, informed, and reliable experience to view and manage their subscriptions, billing account details and contacts. | [Roadmap](https://gitlab.com/groups/gitlab-org/-/roadmap?state=all&sort=end_date_asc&layout=QUARTERS&timeframe_range_type=THREE_YEARS&label_name%5B%5D=Fulfillment+Roadmap&label_name%5B%5D=group%3A%3Asubscription+management&progress=COUNT&show_progress=true&show_milestones=false&milestones_type=GROUP) | `Subscription Management` |
| [Fulfillment Platform](/direction/fulfillment/platform/) | Fulfillment Platform maintains and evolves our underlying order-to-cash infrastructure, including integrations with Zuora to help accelerate our goals as a section. This group also works with internal teams to build robust systems that enable our internal, customer-facing teams better support our customers. | [Roadmap](https://gitlab.com/groups/gitlab-org/-/roadmap?state=opened&sort=end_date_asc&layout=QUARTERS&timeframe_range_type=THREE_YEARS&label_name[]=Fulfillment+Roadmap&label_name[]=group::fulfillment+platform&progress=COUNT&show_progress=true&show_milestones=false&milestones_type=GROUP&show_labels=false) |  [CustomersDot Application](/direction/fulfillment/platform/customers-dot-application/), [Fulfillment Admin Tooling](/direction/fulfillment/platform/fulfillment-admin-tooling/), [Fulfillment Infrastructure](/direction/fulfillment/platform/fulfillment-infrastructure/) |
| [Provision](/direction/fulfillment/provision/) | The Provision group is responsible for provisioning and managing licenses across self-managed and SaaS (including Cloud License activation/sync and provisioning of legacy licenses). This group is also responsible for the buying experience for customers provisioning instances through third-party distributors and marketplaces, as well as the integration between GitLab Customers Portal and Salesforce.com. | [Roadmap](https://gitlab.com/groups/gitlab-org/-/roadmap?state=all&sort=end_date_asc&layout=QUARTERS&timeframe_range_type=THREE_YEARS&label_name%5B%5D=Fulfillment+Roadmap&label_name%5B%5D=group%3A%3Aprovision&progress=COUNT&show_progress=true&show_milestones=false&milestones_type=GROUP) | `SM Provisioning`, `SaaS Provisioning`, `Fulfillment Integrations & Visibility` |
| [Purchase](/direction/fulfillment/purchase/)  | The Purchase group is responsible for optimizing the web-direct purchase experience, with a focus on first orders. The team is also acting as the interim owners of seat cost management work: seat usage visibility, billable users calculation, and seat limits. | [Roadmap](https://gitlab.com/groups/gitlab-org/-/roadmap?state=all&sort=end_date_asc&layout=QUARTERS&timeframe_range_type=THREE_YEARS&label_name%5B%5D=Fulfillment+Roadmap&label_name%5B%5D=group%3A%3Apurchase&progress=COUNT&show_progress=true&show_milestones=false&milestones_type=GROUP) | `Purchase`, `Seat Cost Management` |
| [Utilization](/direction/fulfillment/utilization/) | The Utilization group endeavors to capture and deliver usage data (currently focused on consumables) to internal team members, prospects, and customers so that they can make the best decision for their business needs.  | [Roadmap](https://gitlab.com/groups/gitlab-org/-/roadmap?state=all&sort=end_date_asc&layout=QUARTERS&timeframe_range_type=THREE_YEARS&label_name%5B%5D=Fulfillment+Roadmap&label_name%5B%5D=group%3A%3Autilization&progress=COUNT&show_progress=true&show_milestones=false&milestones_type=GROUP) | `Consumables Cost Management` |

## OKRs

Team members can reference our [Fulfillment FY24 Q3 OKRs](https://gitlab.com/gitlab-com/gitlab-OKRs/-/work_items/3241). 

We follow the [OKR (Objective and Key Results)](/company/okrs/) framework to set and track goals quarterly. The Fulfillment section OKRs are set across the entire [Quad](/handbook/product/product-processes/#pm-em-ux-and-set-quad-dris).

## Performance Indicators

Fulfillment does not track Performance Indicators at this time. While we monitor performance metrics to ensure the availability, security, and robustness of our systems, and keep to our SLOs, our goals and product plans are all tracked in OKRs. 

## Recent Accomplishments and Learnings

See [Fulfillment Recap issues](https://gitlab.com/gitlab-com/Product/-/issues/?sort=updated_desc&state=closed&label_name%5B%5D=Fulfillment%20Recap&first_page_size=20) for recaps of recent milestones and the associated accomplishments and learnings (internal only when needed).

## Key Links

1. [Fulfillment Direction](/direction/fulfillment): Outlines the Fulfillment vision and what we are working on next.
2. [Fulfillment Guide](/handbook/product/fulfillment-guide/): documentation around CustomersDot Admin tools and process documentation that is not part of the [core product documentation](https://docs.gitlab.com/).
3. [Dev - Fulfillment Sub Department](/handbook/engineering/development/fulfillment/): R&D team, priorities, prioritization processes, and more.
4. [Internal Handbook - Fulfillment](https://internal.gitlab.com/handbook/product/fulfillment/): documentation that can't be in the public handbook. Minimize this to only [Not Public](/handbook/communication/confidentiality-levels/#not-public) information, such as revenue-based KPIs or sensitive project documentation.
