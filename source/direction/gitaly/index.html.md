---
layout: markdown_page
title: "Category Direction - Gitaly"
description: "Gitaly is a Git RPC service for handling all the Git calls made by GitLab. Find more information here!"
canonical_path: "/direction/gitaly/"
---

- TOC
{:toc}

## Gitaly

| | |
| --- | --- |
| Section | [Enablement](/direction/enablement) |
| Maturity | Non-marketable |
| Content Last Reviewed | 2023-08-25 |

### Introduction and how you can help

The Gitaly direction page belongs to the [Systems Stage](https://about.gitlab.com/handbook/product/categories/#systems-stage) within the [Enablement](/handbook/product/categories/#enablement-section)
section, and is maintained by [Mark Wood](https://gitlab.com/mjwood). The Gitaly Engineering team and stable counterparts can be found on the [Engineering team page](https://about.gitlab.com/handbook/engineering/development/enablement/systems/gitaly/).

This strategy is a work in progress, and everyone can contribute.
Please comment and contribute in the linked issues and epics.
Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.

- [Issue List](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=group%3A%3Agitaly)
- [Epic list](https://gitlab.com/groups/gitlab-org/-/epics?label_name[]=group%3A%3Agitaly)

If you would like support from the Gitaly team, please see the team's page detailing [How to contact the Gitaly team](https://about.gitlab.com/handbook/engineering/development/enablement/systems/gitaly/#how-to-contact-the-team).

### Strategy and Themes

Gitaly is the service responsible for the storage and maintenance of all Git repositories in GitLab for both our GitLab.com customers, as well as self-managed customers.
Git repositories are essential to GitLab, for [Source Code Management](/direction/create/source_code_management/), [Wikis](/direction/plan/knowledge/wiki/), [Snippets](/direction/create/source_code_management/source_code_management/), Design Management, and [Web IDE](/direction/create/ide/web_ide/). Every stage of the DevOps lifecycle to the right of Create - Verify, Package, Release, Configure, Govern, Monitor and Secure - depends on the project repositories. Because the majority of GitLab capabilities depend on information stored in Git repositories, performance and availability are of primary importance.

GitLab is used to store Git repositories by small teams of a few people all the way up to large enterprises with many terabytes of data. For this reason, Gitaly has been built to scale from small single server GitLab instances, to large high availability architectures.

Gitaly provides multiple interfaces to read and write Git data:

- Git protocol over SSH, through the [GitLab Shell](https://gitlab.com/gitlab-org/gitlab-shell) component.
- Git protocol over HTTP, through the [GitLab Workhorse](https://gitlab.com/gitlab-org/gitlab/-/blob/master/doc/development/workhorse/index.md) component.
- gRPC internally to GitLab components. The public REST and GraphQL APIs to Git data are implemented using these RPCs.

<!-- blank line -->
<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/RNLWrvIkB9E" frameborder="0" allowfullscreen="true"></iframe>
</figure>
<!-- blank line -->

#### Gitaly within GitLab

While GitLab is the largest user of the Gitaly project, it is important to note that Gitaly is a standalone project that can be adopted separately from GitLab. As such, we strive to ensure that all business specific decisions are made within the GitLab application. Our belief is that Gitaly should provide the ability for management interfaces, but not make any specific management decisions.

For example, some users may want the ability to move repositories between different storage nodes for either cost savings or performance reasons. While Gitaly should provide an easy to use interface to efficiently move repositories, the calling application should be making the decisions around which repositories to move where.

Processes requiring no business data or inputs should be fully contained within Gitaly. These types of processes include repository maintenance and storage maintenance type tasks. We believe that these types of features provide substantial value for projects utilizing Gitaly and provide a compelling reason to chose Gitaly as a repository storage architecture.

#### Gitaly Cluster

In order to support highly available Git repository storage, [Gitaly Cluster](https://docs.gitlab.com/ee/administration/gitaly/) has been released. This provides redundant storage benefits such as voted writes, read distribution, and data redundancy. For full documentation, please see the details on [Configuring Gitaly Cluster](https://docs.gitlab.com/ee/administration/gitaly/praefect.html).

To fully appreciate the use-case for Gitaly Cluster, we must first clarify the role of highly available repository storage. From the Gitaly perspective, highly available (HA) storage means that a fault-tolerant interface for repository data exists, such that the loss of a single storage node will not compromise the ability to read / write Git data. Gitaly cluster fulfills this role by providing an interface to define multiple Gitaly storage nodes, and set a replication factor for stored repositories (how many nodes each repository should be stored on). In the event of a storage node loss, read and write operations continue as before, and when the cluster is returned to full capacity, the data is re-replicated to the returning node.

What HA repository storage does not provide is improved performance. Though in some cases write performance improves (through read distribution), the general concept is that you are trading storage cost and potential performance impacts for fault tolerance.

### 1 year plan
<!--
1 year plan for what we will be working on linked to up-to-date epics. This section will be most similar to a "road-map". Items in this section should be linked to issues or epics that are up to date. Indicate relative priority of initiatives in this section so that the audience understands the sequence in which you intend to work on them.
-->

#### Reliable and Scalable Cluster Replication

As our customers continue to grow their repositories (both in count and in size), it is critical that the underlying Gitaly services can scale appropriately to meet these demands. As a team, we have decided that the solution to several of the existing scalability issues surrounding Gitaly cluster is a paradigm shift in how we replicate Git data. As such, we have begun initial efforts in shifting to a [decentralized architecture for Gitaly Cluster](https://gitlab.com/groups/gitlab-org/-/epics/8903).

The highlights of this forward thinking approach are as follows:

- The elimination of the Gitaly PostgreSQL database (Praefect) including the removal of the existing replication queue. This means that there is no more need to work around the single point of failure of this database by using external PostgreSQL redundancy solutions.
- Strong consistency guarantees, including for object pools
- Easier management for data migrations and node management
- Elimination of the difference between Gitaly and Gitaly Cluster. The resultant implementation can simply have a single Gitaly node or multiple Gitaly nodes configured to replicate data.

#### Modern Data Management

Our customers all have different needs and Gitaly should properly handle all configurations, from the cost-conscious single node installation to the performance optimized multi-node high-availability installation. The following are all areas where we believe the Gitaly team can make meaningful impacts to our customers.

##### Monorepo assistance

We're seeing a large trend where customers have very large monorepositories. While this may not be the ideal way to configure Git repositories as it comes with a lot of performance penalties, it is often times unavoidable. Gitaly will do our best to assist these customers whether they are using a monorepo temporarily with the goals of migrating to smaller repositories, or business needs necessitate continuing with a monorepo.

For this reason, it is our goal to improve our documentation by providing a [guide for monorepos](https://gitlab.com/gitlab-org/gitaly/-/issues/5320), which will include best practices and other helpful information to make the monorepo experience as pleasant as possible.

Additionally, since much of the struggle around hosting large monorepositories has to do with the underlying limitations in Git, we will continue to work on upstream contributions to the Git project to improve the experience for all.

##### Backups and disaster recovery

While this is not an area we own as a team, we believe that it is crucial for us to support the teams working in these areas to ensure that Git backups and data management allows for rapid and accurate restoration of Git data. The team is heavily involved in leading the [GitLab disaster recovery working group](https://about.gitlab.com/company/team/structure/working-groups/disaster-recovery/). As leaders in this working group, we're collaborating with a broad cross-functional team to help ensure our service's success long-term. As part of this effort, we're architecting a solution for [implementing write-ahead logging](https://gitlab.com/groups/gitlab-org/-/epics/8911) on GitLab.com.

##### Improved service resilience

Everyone has a budget for computation and storage, and it is not efficient or desired to over architect a solution to ensure that there is never service contention. For this reason, the Gitaly team is actively engaged on work that will allow the definition of an [adaptive concurrency limit](https://gitlab.com/groups/gitlab-org/-/epics/10734) when they threaten system availability. The goals of this effort are to maintain system availability by rate limiting client commands (while ensuring data integrity) until the system is no longer overloaded. This will allow customers to "right size" their architecture without forcing over provisioning.


### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->

The next quarter of effort for Gitaly focuses around the following areas. This is not an exhaustive list, and based on other factors may be subject to change.

#### Improve Gitaly Scalability and Reliability

It is our goal to provide a stable and robust storage service for all Git traffic. As such, it is critical that we handle traffic efficiently, and fail gracefully when appropriate. The following epics outline work we wish to achieve in the short term with these goals in mind.

- [Gitaly adaptive concurrency limit](https://gitlab.com/groups/gitlab-org/-/epics/10734) - This epic focuses on implementing adaptive concurrency limiting in Gitaly as outlined by our [engineering blueprint](https://docs.gitlab.com/ee/architecture/blueprints/gitaly_adaptive_concurrency_limit/). Overall, this change will allow the concurrency limit to float based on `cgroup` resource utilization. As part of this effort, we also aim to add observability measurements for additional administrative visibility and an improved ability to validate functionality.

- [Improve object pool support](https://gitlab.com/groups/gitlab-org/-/epics/10361) - Object pools are a great way for the Gitaly server to efficient pack data. Currently they are not used to their full potential, especially within a forking workflow when we replicate repositories. Our aim is to improve repository replication by making it aware of object pools and allow the replication to take advantage of the existing object pools. This effort will not only improve reliability and performance, it will also reduce the server overhead required around object pools.

- [Implement write-ahead logging in Gitaly](https://gitlab.com/groups/gitlab-org/-/epics/8911) - As we move toward a decentralized architecture solution for Gitaly Cluster, the write-ahead log will be critical to ensure distribution of changes to all nodes. This is also a critical step in assisting with reduction in disaster recovery recovery point objectives (RPO).

### What we are currently working on
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

The Gitaly team is actively working on supporting the [Disaster Recovery Working Group](https://about.gitlab.com/company/team/structure/working-groups/disaster-recovery/). As such, we are actively working to integrate write-ahead logging for repository [creations](https://gitlab.com/gitlab-org/gitaly/-/issues/5050) and [deletions](https://gitlab.com/gitlab-org/gitaly/-/issues/5049).

We are also working on bringing repository backup ownership into Gitaly as we feel this is the overall best place for this functionality long term. To do this, we are focusing on allowing direct to object storage [backups](https://gitlab.com/gitlab-org/gitaly/-/issues/4940) and [restoration](https://gitlab.com/gitlab-org/gitaly/-/issues/4939).

#### Repository Backups Plan

The following is our current plan for repository backups. We have two goals
around repository backups.

**Full GitLab Instance Backup**

We've had the ability to take a full backup of an entire GitLab instance but the
repository backup piece would often cause the backup process to fail due to the
huge amount of data that is getting transferred from Gitaly back to Rails and
getting tarballed up into a giant tar file. Instead, we will send repositories
to object storage. This will help performance as it reduces the amount of data
we need to put into a tarball.

**Continuous repository level backups**

Provide the ability to take repository backups on a schedule. Sometimes, an
administrator might want to take more frequent backups of an important
repository and have the ability to restore that repository in case of repository
corruption. In these circumstances the admin might not need to restore the
entire GitLab instance, but just one or a handful of repositories that
experienced corruption.

Here is the timing for this work.

##### FY24Q2: GitLab instance backup and restore improved by sending repository backups to object storage

Update Gitaly to allow configuration of object storage destination, and logic
that sends repository bundles to object storage In Rails, we need to add a flag
in the backup rake task to send repositories to object storage

This [epic](https://gitlab.com/groups/gitlab-org/-/epics/10077) tracks this
work.

##### FY24Q3: Allow incremental backups to work with server side backups

In order to enable incremental backps to work with object storage, we need to
add the ability for backups to utilize a manifest file. Having a manifest file
will allow us to put metadata into the manifest file like the backup layout, and
how to link incremental backps with the full backup.

##### FY24Q4: Rails to call Gitaly to back up a list of repositories concurrently

Allow Gitaly to receive an RPC call from Rails with a list of repositories to
backup, and to kick off a background worker to back these up concurrently and
asynchronously. The business logic of when and how often to back up repositories
can live in Rails. This way the Rails application can configure schedules, and
also we can keep a record of backups in the Rails database to display to the
user.

##### FY25Q1: Rails to call Gitaly to back up a list of repositories concurrently

Provide the backend rails code to allow administrators to configure a schedule
in project settings for backups. A RepositoryBackups model needs to be added to
keep track of which backups have happened for a project. A worker also needs to
be added that will call Gitaly to back up a repository, wait for it to complete,
then update the database.

Also provide the backend rails code to restore a project based on a backup.

There also needs to be design work to determine what the user interface will
look like for configuring repository backup schedules, and restoring from backup
in the project setting page.

#### FY25Q2: Implement UI to configure repository backups

Do the front end work of implementing the user interface for scheduling
repository backups, as well as restoring from a list of recently taken backups.


<!-- ### What we recently completed -->
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

### What is Not Planned Right Now
<!--  Often it's just as important to talk about what you're not doing as it is to
discuss what you are. This section should include items that people might hope or think
we are working on as part of the category, but aren't, and it should help them understand why that's the case.
Also, thinking through these items can often help you catch something that you should
in fact do. We should limit this to a few items that are at a high enough level so
someone with not a lot of detailed information about the product can understand -->

In order to best represent our [Transparency Value](https://about.gitlab.com/handbook/values/#transparency), it is just as important to clarify what the Gitaly team cannot prioritize currently. This does not mean that we do not recognize the need for some of these features, simply that we have a finite team.

- Better Support for Administrative User Journeys

    We want to ensure that in the future, we support user journeys such as adding,
    removing, and replacing nodes cleanly, and provide a basic administrative dashboard to monitor node health.

- [VFS for Git](https://gitlab.com/groups/gitlab-org/-/epics/93)

    Partial Clone is built-in to Git and available in GitLab 13.0 or newer.
    [Scalar](https://devblogs.microsoft.com/devops/introducing-scalar/) is
    compatible with partial clone, and Microsoft is contributing to its
    improvement based on their learnings from the GVFS protocol.

- Divergent solution for CDN Offloading

    While we recognize that a lot of good work has gone into independent
    solutions, we are committed to work with the Git community on a CDN
    approach. We intend to support, implement, and contribute to this
    solution as it be comes available. This is currently being explored
    in our [Support Git CDN offloading](https://gitlab.com/groups/gitlab-org/-/epics/1692)
    epic.


### Best in Class Landscape
<!-- Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" -->

BIC (Best In Class) is an indicator of forecated near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape.

The version control systems market is expected to be valued at close to US$550mn in the year 2021 and is estimated to reach US$971.8md by 2027 according to [Future Market Insights](https://www.futuremarketinsights.com/reports/version-control-systems-market) which is broadly consistent with revenue estimates of GitHub ([$250mn ARR](https://www.owler.com/company/github)) and Perforce ([$130mn ARR](https://www.owler.com/company/perforce)). The opportunity for GitLab to grow with the market, and grow it's share of the version control market is significant.

Git is the market leading version control system, demonstrated by the [2018 Stack Overflow Developer Survey](https://insights.stackoverflow.com/survey/2018/#work-_-version-control) where over 88% of respondents use Git. Although there are alternatives to Git, Git remains dominant in open source software, usage by developers continues to grow, it installed by default on macOS and Linux, and the project itself continues to adapt to meet the needs of larger projects and enterprise customers who are adopting Git, like the Microsoft Windows project.

According to a [2016 Bitrise survey](https://blog.bitrise.io/state-of-app-development-2016#self-hosted) of mobile app developers, 62% of apps hosted by SaaS provider were hosted in GitHub, and 95% of apps are hosted in by a SaaS provider. These numbers provide an incomplete view of the industry, but broadly represent the large opportunity for growth in SaaS hosting on GitLab.com, and in self hosted where GitLab is already very successful.

#### Key Capabilities
<!-- For this product area, these are the capabilities a best-in-class solution should provide -->

**Support large repositories**

As applications mature, the existing code base continues to grow. As such, average repository sizes are on the rise and version control systems must be able to handle these large repositories in a performant manner. Additionally, many development tasks may require version control of large files, which again, should be handled seamlessly.

**Ensure data safety**

Application code has a very high value to organizations. It is unacceptable to have a solution which does not make it easy to ensure the integrity of your data, as well as provide easy means of backing up and restoring your data should something go wrong. Ideally, these solutions should use efficient and cost effective storage to optimize your business infrastructure.

<!-- #### Roadmap -->
<!-- Key deliverables we're focusing on to build a BIC solution. List the epics by title and link to the epic in GitLab. Minimize additional description here so that the epics can remain the SSOT. -->

#### Top 2 Competitive Solutions
<!-- PMs can choose to highlight a primary BIC competitor--or more, if no single clear winner in the category exists; in this section we should indicate: 1. name of competitive product, 2. links to marketing website and documentation, 3. why we view them as the primary BIC competitor -->

Important competitors are [GitHub.com](https://github.com) and [Perforce](https://perforce.com) which, in relation to Gitaly, compete with GitLab in terms of raw Git performance and support for enormous repositories respectively.

Customers and prospects evaluating GitLab (GitLab.com and self hosted) benchmark GitLab's performance against GitHub.com, including Git performance. The Git performance of GitLab.com for easily benchmarked operations like cloning, fetching and pushing, show that GitLab.com similar to GitHub.com.

Perforce competes with GitLab primarily on its ability to support enormous repositories, either from binary files or monolithic repositories with extremely large numbers of files and history. This competitive advantage comes naturally from its centralized design which means only the files immediately needed by the user are downloaded. Given sufficient support in Git for partial clone, and sufficient performance in GitLab for enormous repositories, existing customers are waiting to migrate to GitLab.

- [Git for enormous repositories](https://gitlab.com/groups/gitlab-org/-/epics/773)

## Analyst Landscape

<!--
What are analysts and/or thought leaders in the space talking about?
What are one or two issues that will help us stay relevant from their perspective?
-->

- [Native support for large files](https://gitlab.com/groups/gitlab-org/-/epics/773) is important to companies that need to version large binary assets, like game studios. These companies primarily use Perforce because Git LFS provides poor experience with complex commands and careful workflows needed to avoid large files entering the repository. GitLab has been supporting work to provide a more native large file workflow based on promiser packfiles which will be very significant to analysts and customers when the feature is ready.

### Sales Enablement

This section contains messaging, questions, and resources for our sales counterparts to successfully position and sell Gitaly Cluster. It is important to note that Gitaly Cluster is not perfect for every installation. Our goal is to provide options for our customers so they can choose the best repository storage mechanism for their particular business needs.

#### What is Gitaly?

Gitaly is a centralized service which handles all access to files to file storage for GitLab. Gitaly services Git requests from the GitLab web application, command line, and via the API. Gitaly is highly configurable and can utilize one or more storage locations to read / write repository data.

The Gitaly service is required for all GitLab installs, and is a separate product from Gitaly Cluster. While Gitaly handles accessing repository storage, Gitaly Cluster provides a highly available repository storage solution for our customers.

#### Why we built Gitaly Cluster

Gitaly Cluster was built to address the industry-wide difficulty around expanding Git repository storage in addition to the lack of high availability (HA) Git storage for critical applications. A prominent theme in industry is the idea of an ever expanding NFS storage location for repository storage. While this can work, over time performance degrades, and management becomes increasingly complex. Additionally, while the NFS file system is ideal for many types of files, it's well documented that the types of file accesses created by Git repository access can cause performance issues.

Our goal with Gitaly cluster is to build a Git repository storage system capable of scaling with our users needs, and providing a configurable level of redundancy to keep businesses operating, iterating, and growing.

#### How is Gitaly Cluster differentiator for GitLab

Gitaly Cluster is a unique open-core project aimed at providing a scalable and high availability platform for Git repository storage. Gitaly Cluster enable horizontal scalability, allowing our customers to grow their storage in a simple, and well defined manner. We also capitalize on the redundant copies of data needed for HA by increasing read performance through read-distribution.

#### When should customers use Gitaly Cluster

Customers should utilize Gitaly Cluster in a few key situations:

- **There is a need for high availability** - Customers who wish to ensure that losing a single node does not induce downtime are ideally suited to a Gitaly Cluster installation.
- **There is a need for expandable storage** - Customers whose repository storage size continues to grow and want to be able to horizontally scale their storage infrastructure.
- **There is a large read demand on Git data** - Environments where there is a large read demand on data can benefit greatly from the distributed read functionality provided by Gitaly Cluster.

#### When should customers not use Gitaly Cluster

Customers may not desire to utilize Gitaly Cluster for the following reasons:

- **Cost** - Having data stored in a highly available / redundant manner requires more infrastructure and therefore incurs higher storage / hosting costs.
- **Very low RPO / RTO needs** - Recognize that restoration of an entire cluster & Praefect database will naturally take longer than a single node. However, this is mostly mitigated by the fact that loss of a single node should not require restoration, and therefore should be an unlikely scenario.
- **Require snapshot backups** - It is very difficult to backup the Gitaly Cluster nodes & Praefect database at the exact same time, which will result in a non-congruent backup. Therefore, Gitaly Cluster does not support snapshot backups. However, we are making progress on releasing an [incremental backup solution](https://gitlab.com/groups/gitlab-org/-/epics/2094) that will be fully compatible with Gitaly Cluster.

#### Resources
**Documentation Resources**
- [Gitaly Cluster Recommendations](https://docs.gitlab.com/ee/administration/configure.html#gitaly-capabilities)
- [Gitaly Cluster documentation](https://docs.gitlab.com/ee/administration/gitaly/)
- [FAQ](https://docs.gitlab.com/ee/administration/gitaly/faq.html)

**Enablement Presentation** (Internal GitLab Only)
- [Video: Gitaly Cluster Enablement Presentation](https://youtu.be/zI1t0IyHayM)
- [Deck: Self-hosted options for GitLab](https://docs.google.com/presentation/d/1RV-dOah-EO4D4VZvSwEVxaXEXbVSlc6FzjZjQIYSre8/edit#slide=id.g29a70c6c35_0_68)

<!--
    TODO:
- Pitch Deck - TBD
-->

### Deprecations and Changes

As Gitaly and Gitaly Cluster evolve, it is sometimes necessary to deprecate features. When this occurs, we will follow the documented [Deprecations, removals and breaking changes](https://about.gitlab.com/handbook/marketing/blog/release-posts/#deprecations-removals-and-breaking-changes) procedure. This ensures that all stable counterparts within GitLab are informed, and that the [GitLab Documentation](https://docs.gitlab.com/ee/update/deprecations) is also updated to keep our customers informed.

In addition, we will track all deprecations throughout the 16.x milestones, and breaking changes occurring in the 17.0 milestone on the following epic:

- [Gitaly 16.x through 17.0 Deprecations and Removals](https://gitlab.com/groups/gitlab-org/-/epics/11037)

### Maturity Plan

<!--
It's important your users know where you're headed next.
The maturity plan section captures this by showing what's required to achieve the next level.
-->

Gitaly is a **non-marketable** category, and is therefore not assigned a maturity level.

### Target Audience

<!--
An overview of the personas involved in this category.
An overview of the evolving user journeys as the category progresses through minimal, viable, complete and lovable maturity levels.
-->

**Systems Administrators** directly interact with Gitaly when installing, configuring, and managing a GitLab server, particularly when high availability is a requirement. In the past, systems administrators needed to create and manage an NFS cluster to configure a high availability GitLab instance, and manually manage the failover to new Gitaly nodes mounted on the same NFS cluster. In order to scale such a solution individual storage nodes needed to be re-sized, or a sharded Gitaly approach was required. Now that Gitaly Cluster is available, is possible to eliminate the NFS cluster from architecture and rely on Gitaly for replication. Gitaly Cluster brings with it automatic failover, horizontal scaling, and read access across replicas will deliver 99.999% uptime (five 9's) and improved performance without regular intervention. Systems administrators will have fewer applications to manage, as the last projects are migrated to GitLab and other version control systems are retired.

**Developers** will benefit from increasing performance of repositories of all shapes and sizes, on the command line and in the GitLab application, as performance improvements continue. Once support for monolithic repositories reaches minimal and continues maturing, developers will no longer be split between Git and legacy version control systems, as projects consolidate increasingly on Git. Developers that heavily use binary assets, like **Game Developers**, will at long last be able to switch to Git and eliminate Git LFS by adopting native large file support in Git.
