---
layout: markdown_page
title: "Product Section Direction - Infrastructure cost data"
description: "Part of the Scalability group, Infrastructure cost data is working to provide insights and awareness into the cost of GitLab's SaaS platforms"
---

{:.no_toc}

- TOC
{:toc}

Last reviewed: 2023-01-03

## Mission

Provide actionable insights to [multiple stakeholders](#personas) and broaden awareness of the cloud cost of GitLab's SaaS platforms, driving operational efficiencies and reliable cost projections.

## Overview

Adoption of GitLab's [SaaS services is growing](https://ir.gitlab.com/node/8016/html#ic28432d692fc49cba2df39695b0d1973_37), and with it, the cost to provide those services.

As a result, it is becoming more important that GitLab is able to:

* Timely observe cloud spend patterns to identify anomalies, and quickly understand their root causes
* Identify opportunities for improved efficiencies and effectively prioritize them
* Accurately project future cloud spend

We will accomplish this by:

* Completing instrumentation of cost telemetry and usage data
* Associating cloud spend to specific [categories](/handbook/product/categories/) (Gitaly, Container Registry)
* Associating cloud spend to specific [product tiers](/pricing/) (Premium, Ultimate, etc.)
* Creating a cost dashboard which allows filtering by product tier and product category
* Setting cost targets by product group, similar to error budgets

### Target personas

There are four primary personas whom we are trying to serve:

* Product groups: Easily understand the cloud costs of their existing and future features / categories, and alerts on any significant changes
* Finance: Providing accurate projections of cloud spend and allocation of spend to different product tiers / budgets (COGS, Marketing, R&D, etc.)
* Product Leadership: Cost efficiency / margin
* Infrastructure Leadership: Top-level cost efficiency and trends

### Association of spend to tiers and categories

In order to support our goals of splitting cloud spend by tier and category, we need to combine data from multiple sources. This is because no single location has all of the information we need:

Our cloud infrastructure is shared across product tiers, and in some cases product categories. For example our rails nodes serve as the compute for a wide range of features, along with our database nodes. Even when we have infrastructure specific to a feature, for example our gitaly or registry nodes, they are shared across all product tiers. This means the billing data from our cloud providers cannot by itself provide the insights we need.

To solve this, we have been instrumenting the product to be able to output product usage information at a granular level. We are now able to report on [storage usage by project and namespace](https://docs.gitlab.com/ee/user/usage_quotas.html), and we are working towards [transfer usage (internal only)](https://gitlab.com/groups/gitlab-org/-/epics/7421) as well. We can then take the storage or transfer usage for a particular category, and aggregate it to determine the breakdown of storage/transfer by product tier. From here, we can then apply these ratios to the overall cloud costs for this particular service, to determine the tier breakdown. CI is very similar, where the cloud runner costs are shared, but with the compute minutes usage data from the product, we can allocate the costs to the correct tier.

In some cases when we lack product usage data, we can supplement with other data, for example the logging information from our registry service can provide download statistics. In addition for shared services like the database or our rails nodes, we can utilize other usage data as a proxy to allocate these costs by tier.

## What's next and why

### Cost instrumentation and data engineering

In order to provide detailed cost information beyond what is provided in cloud provider reporting, we need to leverage instrumentation of our own. To achieve this we are primarily working to report more detailed usage information in the product, and then ship that data over to the data warehouse.

We are working to allocate costs in primarily two ways:

* By GitLab product category - to provide insights into root cause of changes and drive efficiencies at product group level
* By Product Tier - to accurately allocate costs across Free, Paid, or Internal Use, in support of Financial Statement classifications. (i.e. allocate to Marketing, COGS, or R&D)

* [Instrument and load GitLab SaaS cost data into Snowflake](https://gitlab.com/groups/gitlab-data/-/epics/440)
* [Feature category summary for infrastructure cost data](https://gitlab.com/gitlab-com/gl-infra/scalability/-/issues/1925)

### Creation of cost dashboards

While we work on refining the input data, we can continue to improve the cost dashboards we provide to our personas. We have an initial dashboard available today in [SiSense](https://app.periscopedata.com/app/gitlab/1088870/Allocating-Differences-(Networking)-Sheet---WIP).

We are working to improve this dashboard in a few key ways:

* Validating the allocation logic and updating it to include new [instrumentation](#cost-instrumentation-and-data-engineering) as it arrives, like improved labeling of cloud resources.
* Splitting the cost in two ways, by:
  * Product tier (Free, Paid, Internal)
  * Product Category

This work is being tracked here: https://gitlab.com/groups/gitlab-com/-/epics/1683

## Vision

Long term, we'd like to have a few key results:

* Accurate and easy forecasts of cloud spend for GitLab SaaS
* Per-category cost data available to product groups, along with real time alerts on significant changes
* Fully automated SSOT of cost data, with data pipeline and dashboard allocation logic transparent and version controlled
* Framework which product groups can utilize to easily comply with labeling and instrumentation requirements
* All of this work to be built within GitLab, as many companies operate SaaS services and need to understand this information
