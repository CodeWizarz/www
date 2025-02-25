---
layout: handbook-page-toc
title: "Marketing Dashboards"
description: "The MS&A creates and maintains dashboards using our marketing metrics"
---

## On this page
{:.no_toc .hidden-md .hidden-lg}

- TOC
{:toc .hidden-md .hidden-lg}

## Hierarchy of Marketing Dashboards

MS&A uses a hierarchical system when building dashboards to help guide the allowable complexity and frame the data for the intended user.

At the highest level, TD Marketing Key Dashboards are intended to provide insights into our top KPIs, while TD Marketing Functional Dashboards give the detailed insights functional marketing teams need. Ad hoc dashboards are meant to answer one-off questions, and are not meant to be used for ongoing KPI reporting. "TD" stands for Trusted Data, and it refers to models inside and from the common schema (see the [Data Team handbook page here](https://about.gitlab.com/handbook/business-technology/data-team/platform/#tdf) for more details)

| Level              | Intended User                   | Intended Use (examples)      |
|--------------------|---------------------------------|------------------------------|
| TD Marketing Key Dashboards           | Execs / All GitLab Team Members | Top KPIs and Targets         |
|                    | GTM Teams / All of Marketing    | Tracking Leading Indicators / Attributed Pipeline |
| TD Marketing Functional Dashboards | Functional Marketing Teams      | Campaign Performance / SDR Performance / Partner Sourced Opportunities   |
| Ad-Hoc             | Specific Team Members           | Insight into a one-off question |

## Marketing Dashboards Supported by MS&A

#### TD Marketing Key Dashboards

| **Dashboard** | **Platform** | **Access Type** | **Description** |
|:--------------|:-------------|:----------------|:----------------|
| [Marquee Marketing Metrics Dashboard](https://app.periscopedata.com/app/gitlab:safe-intermediate-dashboard/1070254/Marquee-Marketing-Metrics-Dashboard)  | Sisense      | SAFE            | Tracks high-level KPIs across Awareness, Consideration, Conversion, Expansion & Evangelism. |
| [Unified Marketing Funnel Dashboard](https://10az.online.tableau.com/#/site/gitlab/views/MarketingUnifiedFunnel_16934325416300/MarketingUnifiedFunnel?:iid=2)   | Tableau      | General         | Visualizes the user journey across marketing channels, website engagement, SaaS trials, to a paid conversion. This dashboard helps identify trends and assess the impact of strategic changes implemented by the Digital Marketing, Digital Experience, and Growth teams. |

#### TD Marketing Functional Dashboards

| **Function** | **Dashboard** | **Platform**  | **Access Type** | **Description** |
|:--------------|:---------------|:---------------|:-----------------|:-----------------|
| Integrated Marketing | [TD - Campaign Performance](https://app.periscopedata.com/app/gitlab:safe-intermediate-dashboard/1111393/TD---Campaign-Performance)                         | Sisense       | SAFE            | The source of truth dashboard for marketing campaign performance. It is a single pane of glass view for tracking campaign performance from an Inquiry to a closed won SAO. |
| Partner Marketing    | [TD: SDR Performance Dashboard](https://app.periscopedata.com/app/gitlab:safe-intermediate-dashboard/965068/TD:-SDR-Performance-Dashboard---v1.2)                     | Sisense       | SAFE            | A management-level view of overall SDR performance by a number of key metrics.                                                                                             |
| Partner Marketing    | [TD: Partner Sourced Opportunities](https://app.periscopedata.com/app/gitlab:safe-intermediate-dashboard/983640/TD:-Partner-Sourced-Opportunities)                 | Sisense       | SAFE            | A view of partner sources opportunities.                                                                                                                                   |
| Partner Marketing    | [Partner Marketing Trials Funnel - Self Managed](https://app.periscopedata.com/app/gitlab:safe-intermediate-dashboard/1060854/Partner-Marketing-Trials-Funnel---Self-Managed)    | Sisense       | SAFE            | A funnel view of self managed trials from partners.                                                                                                                        |
| Partner Marketing    | [Draft: New Partner Marketing Trials Funnel - SaaS](https://app.periscopedata.com/app/gitlab:safe-intermediate-dashboard/1114685/Draft:-New-Partner-Marketing-Trials-Funnel---SaaS) | Sisense       | SAFE            | A funnel view of SaaS trials from partners.                                                                                                                                |
| Digital Experience   | [GitLab - Digital Experience](https://lookerstudio.google.com/reporting/c47c1759-6d08-4f9b-aae3-3f6b4a3f8d0e/page/PUsnC)                       | Looker Studio | General         | Visualized metrics in regards to traffic, engagements, and top-of-funnel web conversions for about.gitlab.com from Google Analytics.                                       |
| Technical Writing    | [GitLab - Docs Website](https://lookerstudio.google.com/reporting/d6af7a2b-2aaa-4f30-8742-811e62777c93/page/p_ihbvblyl2c)                             | Looker Studio | General         | Visualized metrics in regards to traffic and engagements for docs.gitlab.com from Google Analytics.                                                                        |
| Brand Strategy       | [GitLab - Brand Awareness - Web Performance](https://lookerstudio.google.com/reporting/27b962b9-f6f8-443b-bc93-baf1c8a6a268/page/PUsnC)        | Looker Studio | General         | Visualized metrics in regards to traffic, engagements, and top-of-funnel web conversions for Brand Awareness campaigns from Google Analytics and Search Console.           |
| Product Marketing       | [GitLab - Product Marketing](https://lookerstudio.google.com/reporting/9b877a27-0b80-40cd-8e8b-1f68f80573dd/page/IeVBD)        | Looker Studio | General         | Visualized metrics in regards to traffic, engagements, and top-of-funnel web conversions for Blogs and Customer Stories from Google Analytics.           |

## Dashboard Development and Publishing Stages

MS&A uses the stages listed below to denote a dashboard's stage. 
Ad-Hoc dashboards do not have a stage.

- Work in Progress (WIP) - Active development is still ongoing. Metrics, design, and location may change at any time. During this stage, we work with stakeholders to create an end product that meets their needs.

- User Acceptance Testing (UAT) - Primary development has been completed, and we are gathering feedback from the intended users and fixing bugs.

- Production - For a dashboard to be considered production, it must be published in the Production area of Tableau and have gone through the [Tableau approval process](https://about.gitlab.com/handbook/business-technology/data-team/platform/tableau/#governance-model).

## Dashboard Building Guidelines

MS&A has agreed on high-level guidelines when presenting data in any visualization:

- Avoid showing fractional KPIs on key metrics that are not percentages (SAOs, MQLs, INQs). Instead, truncate the number. EG: 43 instead of 43.21
