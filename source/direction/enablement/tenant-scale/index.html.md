---
layout: markdown_page
title: "Group Direction - Tenant Scale"
description: "Scale the GitLab.com architecture for 10 million daily active users (DAU). Learn more!"
canonical_path: "/direction/enablement/tenant-scale/"
---

- TOC
{:toc}

## The Tenant Scale Group

**Last updated**: 2023-07-21

|  Category   |   Direction  |  Description | Maturity  |
|  ---   |   ---   |   ---   |  ---  |
| Cell | [Direction Page](https://about.gitlab.com/direction/enablement/tenant-scale/cell/) |   A Cell is a set of infrastructure components that contains multiple top-level groups that belong to different Organizations. |  [Not Applicable](https://about.gitlab.com/direction/maturity/) |
| Organization | [Direction Page](https://about.gitlab.com/direction/enablement/tenant-scale/organization/) | An Organization is the umbrella for one or multiple top-level groups. | [Planned](https://about.gitlab.com/direction/maturity/) |
| Groups & Projects | [Direction Page](https://about.gitlab.com/direction/enablement/tenant-scale/groups-&-projects/)| Groups represent collections of users or projects. | [Complete](https://about.gitlab.com/direction/maturity/)|
| User Profile |[Directon Page](https://about.gitlab.com/direction/enablement/tenant-scale/user-profile/)| Users represent individuals using GitLab.| [Not Applicable](https://about.gitlab.com/direction/maturity/) |

## Introduction and how you can help

The Tenant Scale direction page belongs to the [Data Stores](https://about.gitlab.com/handbook/product/categories/#data-stores-stage) stage within the [Enablement](https://about.gitlab.com/handbook/product/categories/#enablement-section) section, and is maintained by [Christina Lohr](https://gitlab.com/lohrc). The Tenant Scale Engineering team and stable counterparts can be found on the [Engineering team page](https://about.gitlab.com/handbook/engineering/development/enablement/data_stores/tenant-scale/).

This strategy is a work in progress, and everyone can contribute. Please comment and contribute in the linked [issues](https://gitlab.com/groups/gitlab-org/-/issues/?sort=updated_desc&state=opened&label_name%5B%5D=group%3A%3Atenant%20scale&first_page_size=100) and [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=group::tenant+scale). Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.

If you would like support from the Tenant Scale team, please see the team's page detailing how to [contact the Tenant Scale team](https://about.gitlab.com/handbook/engineering/development/enablement/data_stores/tenant-scale/#contact).

## Strategy and themes

GitLab.com, our SaaS offering, is growing rapidly. This growth requires that the underlying infrastructure components are able to scale to accommodate additional users. The [GitLab.com production architecture](https://about.gitlab.com/handbook/engineering/infrastructure/production/architecture/) highlights the different components and the [reference architectures](https://docs.gitlab.com/ee/administration/reference_architectures/) provide an overview for self-managed customers.

Scaling GitLab requires different strategies for the individual components. For example, web application nodes are stateless and can be scaled relatively easily by creating more individual servers. Stateful components are much harder to scale. As a single solution for the entire DevOps lifecycle, GitLab depends on a [single data-store](/handbook/engineering/development/enablement/data_stores/database/doc/strategy.html#single-data-store) which serves as a the single source of truth of data. For GitLab, this data store is mostly a single [PostgreSQL database](https://docs.gitlab.com/ee/development/architecture.html#postgresql). Over time, GitLab has added additional databases for specific features, such as [Gitaly Cluster](https://docs.gitlab.com/ee/administration/gitaly/praefect.html#postgresql), [Geo](https://docs.gitlab.com/ee/administration/geo/#geo-tracking-database) and the [Container Registry](https://docs.gitlab.com/ee/architecture/blueprints/container_registry_metadata_database/). Adding new data stores [requires approval from the CEO and all engineering fellows](https://about.gitlab.com/handbook/engineering/development/required-approvals.html) to avoid unnecessary proliferation of data stores.

GitLab's [database on GitLab.com](https://about.gitlab.com/handbook/engineering/infrastructure/production/architecture/#database-architecture) is provisioned as a single logical database with a primary server and several physical read-only replicas. Given the continuing growth of GitLab.com, this PostgreSQL database needs to handle more and more transactions per second. Reading data can be accelerated by provisioning additional replicas. Writing new data, however, can't be easily scaled in the same way. There can only be one primary server and all writes have to go through it. In order to address this problem there are several possible solutions:

1. Buy more capable hardware - Bigger servers can handle more transactions. This is generally referred to as vertical scaling.
1. Define a horizontal scaling strategy

GitLab.com is approaching a point where buying bigger servers is no longer easily possible. For this reason, the [Database Scalability Working Group](https://about.gitlab.com/company/team/structure/working-groups/database-scalability/) was founded to define and implement strategies to scale GitLab's database.

The Tenant Scale group is concerned with delivering application changes that allow GitLab and GitLab.com to scale to millions of users and implement the strategies defined in the [Database Scalability Working Group](https://about.gitlab.com/company/team/structure/working-groups/database-scalability/).

### Where we are headed

In the future we expect that GitLab.com:

- Can accommodate 10M daily-active users (DAU) on GitLab.com
- Does not allow a problem with any given data store to affect all users
- Minimize or eliminate complexity for our self-managed use case

These outcomes are also defined as [the exit criteria of the Database Scalability Working Group](https://about.gitlab.com/company/team/structure/working-groups/database-scalability/#exit-criteria).

#### [Decomposition: Support for self-managed customers](https://gitlab.com/groups/gitlab-org/-/epics/7509)

Following the successful rollout of a separate database for `ci` for GitLab.com, we are now working on bringing
the same solution to self-managed installations.

#### Moving towards Cells

Decomposition is only a first step to unlocking further scalability for GitLab. Decomposition is a vertical scaling strategy and it can only deliver a limited amount of scalability. In order to support further growth GitLab needs a long term horizontal scalability strategy. A Cells architecture allows for horizontal scalability and has other possible benefits, such as improved service availability. This architecture creates many mostly isolated GitLab instances, called Cells, that include all required services (database, web, Redis, Gitaly, Runners, Sidekiq etc.). The number of Cells can grow alongside the growth of the business.

Sharding provides an alternative but is really hard as a universal solution. We'll end up requiring a Cells approach either way. By transitioning from Decomposition to Cells, we don’t need to find a sharding solution and avoid a “worst of all worlds” scenario where we have Decomposition, Sharding and Cells.

### 1 year plan

In the 17.0 release, two databases will be the only supported configuration for all self-managed customers, meaning they will have transitioned to [running decomposed logical databases within a single database cluster](https://gitlab.com/groups/gitlab-org/-/epics/6159). All migrations will have completed with minimal interruption and all self-managed features, such as [backups and restore](https://gitlab.com/groups/gitlab-org/-/epics/6259), will work seamlessly when running multiple databases.

#### Transitioning to Organizations

We plan to roll out the [Organization MVC](https://docs.gitlab.com/ee/architecture/blueprints/organization/index.html) over the next year. 

#### First Cell in Staging

### What is next for us

### What we are currently working on

Our current focus areas and engineering investment are broken down by category below, percentages represent how much engineering time on average is allocated to each category in a milestone.

#### Cells - 40%

Or current focus is on building out the concepts of [Cells](https://docs.gitlab.com/ee/architecture/blueprints/cells/index.html).

We are also working on enabling [decomposition for all self-managed customers](https://gitlab.com/groups/gitlab-org/-/epics/7509). 

#### Organization - 40%

Or current focus is on building out the concepts of [Organizations](https://docs.gitlab.com/ee/architecture/blueprints/organization/index.html).

#### Groups & Projects - 10%

Our current focus is on consolidating groups and projects into one generic namespace container. The highest priority at the moment is to [migrate basic project functionality to namespaces](https://gitlab.com/groups/gitlab-org/-/epics/6585). This will enable us to make project functionality available at the group level. Building onto the migration efforts described above, we are looking to provide functionality at the group level that was previously only available at the project level. First iterations of this effort will be to make the [archiving](https://gitlab.com/gitlab-org/gitlab/-/issues/382051) and [starring](https://gitlab.com/groups/gitlab-org/-/epics/9298) functionality available at the group level, which are some of the most requested features from our customers. 

Another big pain point that our SaaS users have is the ability to control their users and groups, which exists in the admin panel for self-managed users. In order to overcome this and create feature parity, we will [migrate administrative capabilities](https://gitlab.com/groups/gitlab-org/-/epics/7314) to the organization, group and project level so that group/project owners have more control.

#### User Profile - 0-10%

To ensure we can make progress in the other categories, we are currently deprioritizing work on the User Profile. We are supporting but not actively working on improvements. 

### What we recently completed

#### [Deploying Decomposition](https://gitlab.com/groups/gitlab-org/-/epics/6160)

In order to benefit from Decomposition and realize the scalability improvements, we deployed [Decomposition to GitLab.com](https://gitlab.com/groups/gitlab-org/-/epics/6160#rolling-out-to-staging).

### What is not planned right now

We currently don't plan to implement any scalability solutions for GitLab.com that would negatively impact our self-managed customers. We want all customers to benefit from further scalability.

### What is out of scope

Federation and a SaaS-to-Self-Managed connector are out of scope. The Tenant Scale group is focused on solving the scalability challenge for the largest GitLab instances, rather than connecting disparate and potentially untrusted systems. If you'd like to follow these other feature requests, see:

* [GitLab Plus](https://gitlab.com/groups/gitlab-org/-/epics/308): a SaaS to self-managed connector
* [Federated GitLab](https://gitlab.com/gitlab-org/gitlab/-/issues/6468): Federation between standalone GitLab instances

We do plan to support a Cells architecture for self-managed deployments, which could address a narrow set of self-managed use cases which previously required independent instances, like data residency.

### Metrics

- [Tamland forecasting](https://gitlab-com.gitlab.io/gl-infra/tamland/patroni.html) - accessible internally only

### Competitive landscape

This is a list of scaling solutions that others have implemented:

- GitHub [decomposed their database](https://github.blog/2021-09-27-partitioning-githubs-relational-databases-scale/) before moving to Vitess to scale their platform
- Shopify uses a Pod architecture to scale their platform, reduce blast radius and offer regional capabilities.
  - [Presentation from 2016](https://www.usenix.org/sites/default/files/conference/protected-files/srecon16europe_slides_weingarten.pdf)
  - [Moving Pods to k8s and GCP from 2018](https://www.usenix.org/conference/srecon18asia/presentation/francis)
  - [Building a routing service](https://www.youtube.com/watch?v=Cw6Ci9AF23k)
  - [Zero-downtime rebalancing from 2019](https://youtu.be/-GqOVx9F5QM?t=558)
  - [Moving shops with zero-downtime at terabyte scale from Sep 2021](https://shopify.engineering/mysql-database-shard-balancing-terabyte-scale)
- [Zendesk uses Pods](https://support.zendesk.com/hc/en-us/articles/219614808)
- [Notion uses application-level sharding](https://www.notion.so/blog/sharding-postgres-at-notion)

### Top strategy item(s)

- [Decomposing GitLab's database](https://gitlab.com/groups/gitlab-org/-/epics/7509)
- [GitLab Cells](https://gitlab.com/groups/gitlab-org/-/epics/7582)
- [Organizations](https://gitlab.com/groups/gitlab-org/-/epics/9265)
