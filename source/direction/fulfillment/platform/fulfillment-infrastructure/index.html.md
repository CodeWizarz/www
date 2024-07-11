---
layout: markdown_page
title: "Category Direction - Fulfillment Infrastructure"
description: "The Fulfillment Infrastructure strategy page belongs to the Fulfillment Platform group of the Fulfillment section."
---
 
## On this page
{:.no_toc .hidden-md .hidden-lg}
 
- TOC
{:toc}

<link rel="stylesheet" type="text/css" href="/stylesheets/biztech.css" />

 **Last updated**: 2023-05-23

## Mission

> Within the Fulfillment Infrastructure category we want to enable other fulfillment groups and contributors to ship with confidence, speed and efficiency, while ensuring that GitLab's fulfillment systems remain robust, performant and resilient.

## Overview

As one of our key areas spans developer productivity we work on performance, scalability, and observability efforts with help from the [Infrastructure department](https://about.gitlab.com/handbook/engineering/infrastructure/).

In order to enable other groups, contributors, and stakeholders, we are focusing on 2 key areas of the Fulfillment infrastructure:

| Key area                      | Principle                                                                                                                 | How                | Performance Indicator |
|-------------------------------|---------------------------------------------------------------------------------------------------------------------------|--------------------| ----------------- |
| System reliability            | Provide fulfillment infrastructure with best in class reliability and availability. | [CustomersDot](https://gitlab.com/gitlab-org/customers-gitlab-com/) has a `99.95%` target [availability and must stay within allowed error budgets](https://dashboards.gitlab.net/d/stage-groups-detail-fulfillment_platform/stage-groups-fulfillment-platform-group-error-budget-detail?orgId=1). | [General availability](https://internal.gitlab.com/handbook/company/performance-indicators/product/fulfillment-section/#fulfillment-platform---general-availability-through-slis-and-error-budgets) and [Customer Journey Error Rate(s)](https://internal.gitlab.com/handbook/company/performance-indicators/product/fulfillment-section/#fulfillment-platform---customer-journey-error-rates) |
| Developer productivity        | Provide a great experience for every developer that contributes to fulfillment solutions.                   | Make code contribution easier by maintaining the underlying architecture, keeping it performant, observable and decrease complexity through abstractions at the platform level. | [Mean time to recovery](https://internal.gitlab.com/handbook/company/performance-indicators/product/fulfillment-section/#fulfillment-platform---mean-time-to-recovery-mttr) |

**Roadmap:**

For a full list of our upcoming and ongoing projects related to Fulfillment Infrastructure, check out our [Roadmap](https://gitlab.com/groups/gitlab-org/-/roadmap?state=opened&sort=end_date_asc&layout=QUARTERS&timeframe_range_type=THREE_YEARS&label_name[]=Fulfillment+Roadmap&label_name[]=group::fulfillment+platform&label_name[]=Category:Fulfillment+Infrastructure&progress=COUNT&show_progress=true&show_milestones=false&milestones_type=GROUP&show_labels=false).


## 1-year plan

Within the next 12 months we want to increase the [level maturity of CustomersDot](https://about.gitlab.com/handbook/engineering/infrastructure/service-maturity-model/#customersdot-detail) and continue improving our availability and observability through the following projects:

| What | Why | When |
|----- |----- |----- |
| [Decouple subscription update API into multiple end points](https://gitlab.com/groups/gitlab-org/-/epics/9731) | Reduce the determination complexity of the intended subscription update | Current focus |
| [Improve Zuora reliability on Customers Dot](https://gitlab.com/groups/gitlab-org/-/epics/8850) | Adds a better caching layer to have no downtime due to frequent Zuora outages | Next (3-6 milestones) |
| [Iteratively migrate CustomersDot to a HA environment](https://gitlab.com/groups/gitlab-org/-/epics/9278) | Move CustomersDot services/components to high availability in order to improve reliability | Later (6-12 milestones) |
| [Implement auto-rollback on error](https://gitlab.com/gitlab-org/customersdot-ansible/-/issues/156) | Minimize disruption if an outage occurs after a deployment | Later (6-12 milestones) |
| Alerting of failed jobs for critical [SaaS](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/808) and [SM](https://gitlab.com/groups/gitlab-com/gl-infra/-/epics/809) metrics | Move away from noisy Sentry alerts to critical alerts for accurate SaaS and SM billing | Later (6-12 milestones) |
| [Alerting over a threshold of payment failures](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/4145) | Encounter payment problems as they occur | Later (6-12 milestones)  |

## Future opportunities

As we progress with our current key projects to build foundational strength and enable internal teams to be more efficient, we will identify new areas of opportunity. The future opportunities will have a continued focus on system reliability, developer productivity and fulfilment process efficiency.


## Key Links
For more details into future oportunities of other categories within the Fulfillment Platform group, please refer to the sections in the dedicated category pages:

- [Fulfillment Admin Tooling](/direction/fulfillment/platform/fulfillment-admin-tooling/)
- [CustomersDot Application](/direction/fulfillment/platform/customers-dot-application/)

- [Performance indicators](https://internal.gitlab.com/handbook/company/performance-indicators/product/fulfillment-section/#fulfillment-platform---general-availability-through-slis-and-error-budgets)
- [Fulfillment Platform group roadmap](https://gitlab.com/groups/gitlab-org/-/roadmap?state=opened&sort=start_date_asc&layout=QUARTERS&timeframe_range_type=THREE_YEARS&label_name[]=Fulfillment+Roadmap&label_name[]=group::fulfillment+platform&progress=COUNT&show_progress=true&show_milestones=false&milestones_type=GROUP&show_labels=false)
