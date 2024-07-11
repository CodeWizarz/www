---
layout: markdown_page
title: "Category Direction - Cell"
description: ""
canonical_path: "/direction/enablement/tenant-scale/cell/"
---

- TOC
{:toc}

## Cell

| | |
| --- | --- |
| Stage | [Data Stores](/direction/enablement/) |
| Maturity | [Not Applicable](/direction/maturity/) |
| Content Last Reviewed | `2023-07-21` |

## Introduction and how you can help

Thanks for visiting this category direction page on Cells at GitLab. The Cell category is part of the [Tenant Scale group](https://about.gitlab.com/handbook/product/categories/#tenant-scale-group) within the [Enablement](https://about.gitlab.com/direction/enablement/) section and is maintained by [Christina Lohr](https://about.gitlab.com/company/team/#lohrc). 

This vision and direction is constantly evolving and everyone can contribute:
* Please comment in the linked [issues](https://gitlab.com/groups/gitlab-org/-/issues/?sort=updated_desc&state=opened&label_name%5B%5D=group%3A%3Atenant%20scale&label_name%5B%5D=Category%3ACell&first_page_size=100) and [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=group::tenant+scale&label_name[]=Category:Cell). Sharing your feedback directly on GitLab.com or submitting a merge request to this page are the best ways to contribute to our strategy.
* Please share feedback directly via [email](https://gitlab.com/lohrc), or [schedule a video call](https://calendly.com/christinalohr/30min).
* Please open an issue using the ~"Category:Cell" label, or reach out to us internally in the #g_tenant-scale Slack channel.

## Overview

The Cell category focuses on delivering a long-term horizontal scalability solution for GitLab. A [Cells](https://docs.gitlab.com/ee/architecture/blueprints/cells/index.html) architecture creates many mostly isolated GitLab instances, called Cells, that include all required services (database, web, Redis, Gitaly, Runners, Sidekiq etc.). The number of Cells can grow alongside the growth of the business.

### Goals

By introducing Cells we aim to address the following problems:

1. Scalability: GitLab.com is currently largely monolithic and will face architectural limitations even when database partitioning and decomposition are taken into account. A new shared-infrastructure architecture will provide additional scalability for our SaaS Platform.
1. Increased availability: Cells provide isolation at the Cell level. A group of Organizations is fully isolated from other Organizations located on a different Cell. This minimizes noisy neighbor effects while still benefiting from the cost efficiency of a shared infrastructure.
1. Regions: GitLab.com is only hosted within the United States of America. Organizations located in other regions have voiced demand for local SaaS offerings. Cells provide a path towards [GitLab Regions](https://gitlab.com/groups/gitlab-org/-/epics/6037) because Cells may be deployed within different geographies.
1. Market segment: Cells provide a solution for organizations in the small to medium business (up to 100 users) and the mid-market segment (up to 2000 users). (See [segmentation definitions](https://about.gitlab.com/handbook/sales/field-operations/gtm-resources/#segmentation).) Larger organizations may benefit substantially from [GitLab Dedicated](https://docs.gitlab.com/ee/subscriptions/gitlab_dedicated/index.html).

### Challenges

At this moment, GitLab.com has “social-network”-like capabilities that may not fit well into a more isolated Organization model. Removing those features, however, creates some challenges:

- [How can `gitlab-org` contributors continue to contribute to the namespace?](https://gitlab.com/gitlab-org/gitlab/-/issues/418228))
- [How will open source projects remain discoverable?](https://gitlab.com/gitlab-org/gitlab/-/issues/418228))
- [How do we move existing top-level groups into the new model?](https://gitlab.com/gitlab-org/gitlab/-/issues/418225))
- [How are User Profiles impacted?](https://gitlab.com/gitlab-org/gitlab/-/issues/411931)

## Strategy and Themes

## 1 year plan

Over the coming year, the Tenant Scale group will focus on delivering some key work streams that are required by the project.

### What is next for us

- [Cells Iteration 3](https://gitlab.com/groups/gitlab-org/-/epics/10997)
  - User can create project
  - User can push to Git repository
  - Extend GitLab Dedicated to support GCP
- [Cells Iteration 4](https://gitlab.com/groups/gitlab-org/-/epics/10998)
  - User can run CI pipeline
  - User can create issue, merge request, and merge it after it is green
  - Evaluate the efficiency of database-level access vs. API-oriented access layer
  - Cluster-unique identifiers

### What we are currently working on

- [Cells Iteration 1](https://gitlab.com/groups/gitlab-org/-/epics/9667)
  - Initial Admin Area settings are shared across cluster
  - Allow to share cluster-wide data with database-level data access layer
- [Cells Iteration 2](https://gitlab.com/groups/gitlab-org/-/epics/9813)
  - User accounts are shared across cluster
  - User can create a group

### What we recently completed

### What is Not Planned Right Now

We currently don't plan to implement any scalability solutions for GitLab.com that would negatively impact our self-managed customers. We want all customers to benefit from further scalability.

We do plan to support a Cells architecture for self-managed deployments, which could address a narrow set of self-managed use cases which previously required independent instances, like data residency.

## Target Audience

## Maturity Plan

Cell is a non-marketable category, and is therefore not assigned a maturity level.