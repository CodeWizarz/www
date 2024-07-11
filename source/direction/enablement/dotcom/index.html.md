---
layout: markdown_page
title: "Category Direction - GitLab.com"
description: "GitLab.com is GitLab Inc's multi-tenant, Software as a Service (SaaS) offering"
canonical_path: "/direction/enablement/dotcom/"
---

- TOC
{:toc}

## Overview

<!-- Provide a general overview of the section and what is covered within it. Include details on our current market share (if available), the total addressable market (TAMkt), our competitive position, and high level feedback from customers on current features. -->

This page contains the strategy for GitLab's multi-tenant SaaS offering, GitLab.com. While this page is maintained by the [Infrastructure Product Manager](/handbook/engineering/infrastructure/product-management/), [GitLab.com is not a specific role](/company/team/structure/#gitlabcom-isnt-a-role) and customer success on GitLab.com is a shared responsibility across GitLab team members.

GitLab.com runs the same codebase as self-managed GitLab without customers [needing to install, administer, and operate the service](/features/). GitLab.com is fully-managed by GitLab, Inc and is primarily hosted in [Google Cloud Platform in the United States](/handbook/engineering/infrastructure/production/architecture/). The service provides both free and paid options for individuals and teams as well as the added bonus of [free compute minutes in each tier](/pricing/).

The worldwide DevOps software tools market is expected to grow rapidly (15.6% 2021-2026 CAGR) [according to IDC](https://www.idc.com/getdoc.jsp?containerId=US48599322). IDC states that SaaS-based delivery of DevOps tools (19% 2021-2026 CAGR) has overtaken on-premise/other software (11.3% 2021-2026 CAGR).<sup>1</sup>(#footnotes) This represents a large opportunity for GitLab, and our SaaS services.

When evaluating GitLab.com, enterprises tell us they need more sophisticated controls to better manage their users, groups, and projects on GitLab.com, increased availability and performance of the overall service, and security enhancements like industry standard certifications and customer audit logs.

## Market Opportunity

[According to IDC](https://www.idc.com/getdoc.jsp?containerId=US48599322), the worldwide DevOps software tools market will grow from $15.8B in 2021 to $32.8B in 2026. IDC predicts stronger than previously expected adoption of SaaS-delivered solutions over this time period as part of a growing preference among enterprises for cloud-based architectures, which provide greater operational flexibility. Adoption of DevOps tools that enable better collaboration among development teams is also expected to accelerate over this time period according to IDC, as more work is done remotely due to the global pandemic.  IDC predicts that the market for SaaS-based DevOps tools (52% of the market in 2021) will continue to accelerate and account for **$20.0B in revenue** (or 61% of DevOps software tools market) by 2026.<sup>1</sup>(#footnotes) As a result, over this time period we expect to see an increase in existing self-managed users migrating to GitLab.com as well as the majority of prospective customers preferring SaaS over self-managed deployment.

## Competitive Landscape
<!-- The top two or three competitors, and what the next one or two items we should
work on to displace the competitor at customers, ideally discovered through
[customer meetings](https://about.GitLab.com/handbook/product/product-processes/#customer-meetings). We’re not aiming for feature parity with competitors, and we’re not just looking at the features competitors talk
about, but we’re talking with customers about what they actually use, and
ultimately what they need.-->

The expected shift in deployment preference to SaaS based cloud services in the upcoming years presents a large and growing opportunity for hosted git repository providers of whom the major vendors are GitHub (56% usage share), BitBucket (30%), and GitLab.com (9%) [according to Bitrise repository counts](https://blog.bitrise.io/state-of-app-development-in-2019).

As the largest host of source-code in the world with over 100 million repositories, GitHub has high brand recognition and boasts a thriving developer community. GitHub can tap into the strengths of its parent company, Microsoft, by offering discounts to customers who commit to Azure, cross-selling GitHub to existing Azure customers, and deep integration with Azure services to make it easier to adopt GitHub. While GitHub offers strong Source Code Management capabilities, its CI/CD offering, Actions (launched in 2018) is less mature than competitors. GitHub is missing critical [planning features](/competition/github/) like milestones, issue weights, and due dates, all of which are available in GitLab. Finally, GitHub does not come with a [built-in deployment platform](/competition/github/) (unlike GitLab which provides out-of-the-box integration with Kubernetes) requiring customers to leverage third-party solutions to fill the gap.

Bitbucket saw a 3% decline in market share YoY according to Bitrise, but offers the advantages of tight integration with the rest of the Atlassian product suite including collaboration tools like Jira and Confluence.

Compared to competitors, GitLab.com offers a broader feature set providing customers with a complete, end-to-end DevOps platform delivered as a single application. Improved integration between Atlassian tools and GitLab will make it easier for customers to use solutions across the two ecosystems (e.g. support for Jira in GitLab) and provide a strong alternative to customers who don’t want to be locked into the Microsoft ecosystem.

IDC predicts continued M&A activity in the DevOps market through 2024 as larger vendors look to strengthen their portfolios to meet the needs of customers who want a single solution for their entire DevOps lifecycle. While this may consolidate competitive pressure, it may also drive adoption of GitLab as DevOps customers look to [standardize their toolchains](https://devops.com/challenges-devops-standardization/) around established players.

## Challenges
<!-- Optional section. What are our constraints? (team size, product maturity, lack of brand, GTM challenges, etc). What are our market/competitive challenges? -->
We see the following challenges to growing paid-user adoption of GitLab.com in FY22:
1. Budget constraints of DevOps Customers due to economic uncertainty over the next year
1. Challenges unique to the SaaS offering
   1. Controlling hosting-costs and maintaining sustainable margins across each pricing tier
   1. Feature parity with Self-Managed: ensuring newly-released features are immediately made available at the group level for SaaS users
   1. Infrastructure team balancing priority of KTLO ("keep the lights on") projects vs. delivering features needed by enterprises
   1. Stage teams balancing priority of .com customer needs vs. needs of self-managed customers
   1. Stage teams designing for multi-tenancy and [considering cost, operational, user experience, and performance impact of their feature set](/handbook/product/product-manager-role/#cost-profile-and-user-experience) throughout the product lifecycle with support from the Infrastructure Department.
1. Increased competitive pressure from Microsoft
   1. Synergies/price discounts with Azure

## Target Customer
We [segment customers](/handbook/sales/field-operations/gtm-resources/#segmentation) based on organization size (number of employees):  large, mid-market, and SMB (small business). Thus far, we’ve had success attracting the SMB and mid-market segments by offering significant free tier value (including private repos and build minutes). We are working on a variety of optimizations to reduce costs of supporting free users as well as changes and experiments to improve the conversion rate of free customers to into paid tiers, all of which we will continue into next year.

Compared to the SMB and mid-market segments, we’ve seen less adoption of GitLab.com among large enterprises. As large enterprises look to increase usage of SaaS delivered DevOps solutions and tools to enable collaboration among remote development teams through 2024, we believe this segment offers a substantial revenue opportunity. As a result, we will target large enterprise customers in FY22. While we will continue efforts towards making free users a cost effective customer acquisition source and meeting margin targets across each tier, we will now also focus on growing adoption of paid tiers by increasing our win rate of deals involving large enterprise customers.

## Top Customer Success/Sales issues
<!-- These can be sourced from the CS/Sales top issue labels when available, internal
surveys, or from your conversations with them.-->
To track key adoption blockers among enterprise customers, we use the label ~"GitLab.com Enterprise Readiness". The top issues needed to achieve enterprise readiness for GitLab.com are tracked on the following two boards:
- [Within GitLab-org project](https://gitlab.com/groups/gitlab-org/-/boards/2037713?&label_name[]=GitLab.com%20Enterprise%20Readiness)
- [Within GitLab-com project](https://gitlab.com/groups/gitlab-com/-/boards/2037722?&label_name[]=GitLab.com%20Enterprise%20Readiness)

## Top user issues
<!-- This is probably the top popular issue from the category (i.e. the one with the most
thumbs-up), but you may have a different item coming out of customer calls.-->

Customer needs generally fall into three categories:
1. improved usability for administrators to better manage users across their organization on gitlab.com,
1. increased performance and availability, and
1. security enhancements.

Across these areas, customers want the same capabilities in self-managed [to be made available on GitLab.com](/features/). Key examples include [access to audit logs](https://gitlab.com/groups/gitlab-org/-/epics/1217), and a [credentials inventory](https://docs.gitlab.com/ee/administration/credentials_inventory.html#credentials-inventory).

## Top Strategy Items
<!-- What's the most important thing to move your strategy forward?-->
A critical component of SaaS growth relies on focusing on the needs of the enterprise customers. To improve our market position and increase our .com win rate, we must address [key adoption blockers and feature gaps](/direction/enablement/dotcom/#top-customer-successsales-issues) for this market segment. To accomplish this, we will focus on enterprise-readiness for GitLab.com.

## 1-Year Plan
<!-- Describe key themes, projects, and/or features planned over the next year. Also highlight what we will not be doing in the next year -->
The 12 month customer-facing roadmap for GitLab.com to achieve enterprise-readiness is presented below. Where applicable, we also highlight any supporting initiatives that need to be completed to deliver each roadmap item.

### Improved Usability for Admins
1. Better tools for admins to manage their users
   1. e.g. [Creating group specific profiles using personas to enforce name and email address formats](https://gitlab.com/groups/gitlab-org/-/epics/4335)
   1. e.g. [Group level Credential Inventory](https://gitlab.com/groups/gitlab-org/-/epics/4123)
1. [More control over how workspaces are isolated](https://gitlab.com/groups/gitlab-org/-/epics/3191)
1. [Feature parity across instance/group levels](https://gitlab.com/groups/gitlab-org/-/epics/4257). Additionally, for net-new functionality moving forward, we will strive to [avoid building instance-level features when possible](https://about.gitlab.com/handbook/product/product-principles/#avoid-instance-level-features)

We will achieve this by helping the [Manage Stage](/handbook/product/categories/#manage-stage) better capture the opportunity and customer demand for each of these features. To learn more about how the Manage stage is planning to close feature gaps needed to achieve enterprise readiness, see [this section in the Manage direction page](https://about.gitlab.com/direction/manage/#gitlabcom).

### Availability and Performance
1. [Consistently achieving a weighted SLA of 99.95%](https://gitlab.com/gitlab-com/www-gitlab-com/-/issues/8024)
1. Improved overall [performance](https://gitlab.com/groups/gitlab-com/-/epics/734)
   1. We will achieve this by partnering with stage teams to prioritize performance improvements across the GitLab application.
1. [Improved feature release communication](https://gitlab.com/gitlab-org/gitlab/-/issues/215227)
   1. We will achieve this via partnership with the GitLab marketing team.
1. [Disaster recovery and multi-region failover](https://gitlab.com/gitlab-com/gl-infra/infrastructure/-/issues/9232)
1. Increased redundancy of repository storage via [Gitaly Cluster](https://docs.gitlab.com/ee/administration/gitaly/praefect.html)
   1. Supporting Infrastructure initiative: [Drive Gitaly Cost Optimizations](https://gitlab.com/gitlab-com/gl-infra/infrastructure/-/issues/8422)
1. Enabling additional regional instances of GitLab.com (locations to be determined based on customer demand)
   1. Supporting Infrastructure initiative: [Kubernetes Migration](/handbook/engineering/infrastructure/production/kubernetes/gitlab-com/)

### Enterprise-Grade Security and Compliance
1. [Customer Audit Logs](https://gitlab.com/groups/gitlab-org/-/epics/1217)
1. Industry-standard security certifications
1. [Granular User Permissions](https://gitlab.com/groups/gitlab-org/-/epics/4035)
1. Improved Visibility and control on user access

We will achieve this by [partnering with the Security Department](https://gitlab.com/gitlab-com/gl-infra/infrastructure/-/issues/10982) to drive delivery of these features across the appropriate stage groups.

### Dogfooding
In FY22 we will continue to prioritize [Dogfooding efforts](/handbook/engineering/infrastructure/#dogfooding) to
1. help Stage teams [improve the maturity of their features](/direction/maturity/) for enterprise customers and
1. if possible, promote feature re-use to avoid having to re-build capabilities from scratch.

As part of our Dogfooding efforts in FY22, one of the major questions we'd like to answer is: can we leverage [Geo](https://gitlab.com/groups/gitlab-org/-/epics/575) to help meet our Disaster Recovery targets for GitLab.com?

### Foundational Work
Besides closing feature gaps for enterprise customers, in FY22 we will also invest in foundational projects within the Infrastructure department to improve overall [efficiency of operating GitLab.com](/handbook/engineering/infrastructure/performance-indicators/). This bucket of work includes projects like:
1. Improving our environments such as staging
1. Tackling technical debt (e.g. Moving to a newer version of chef-server, Migrating old instances)
1. [Automated rollbacks](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/281) and blue-green deployments

### What we're not doing
The following items are currently not in scope for FY22:
1. [Federation ](https://gitlab.com/gitlab-org/gitlab/-/issues/6468) between GitLab.com and self-managed instances.

## Success Metrics
To ensure we are increasing our market share and gaining user adoption while maintaining a financially healthy and sustainable business we will track the following success metrics.
1. Primary Performance Indicator:
   1. Paid GMAU (Paid Monthly active users for gitlab.com)
1. Secondary Performance Indicators:
   1. .com win rate, that is the number of won opportunities as the percentage of total opportunities in which customers prefer SaaS.
   1. Gross Margin % by tier where profit is defined as (subscription revenue + consumption revenue) - (gitlab.com hosting + infra team + cust support cost)
   1. [Customer Retention](https://app.periscopedata.com/app/gitlab/412223/GitLab.com-Customer-Retention)
   1. [Free to paid user conversion rate](https://app.periscopedata.com/app/gitlab/710777/[WIP]-Infra-PM-Dashboard?widget=9417909&udv=0)
1. Supporting Performance Indicators:
   1. [Availability](/handbook/engineering/infrastructure/performance-indicators/#gitlab-com-availability)
   1. [Performance](/handbook/engineering/infrastructure/performance-indicators/#gitlab-com-performance)
   1. [Disaster Recovery Time-to-recover](/handbook/engineering/infrastructure/performance-indicators/#disaster-recovery-dr-time-to-recover)
#### Footnotes

1. IDC, Worldwide DevOps Software Tools Forecast, 2022–2026, Doc # US48599322, July 2022
