---
layout: markdown_page
title: Product Direction - Analytics Instrumentation
description: "Analytics Instrumentation manages a variety of technologies that are important for GitLab's understanding of how our users use our products. Learn more here!"
---

## On this page
{:.no_toc}

- TOC
{:toc}

## Vision

As part of our overall [3 year Strategy](https://about.gitlab.com/company/strategy/#three-year-strategy), GitLab is focused on [customer results](https://about.gitlab.com/company/strategy/#1-customer-results). In order to empower our customers to achieve their goals and to enable GitLab to ship a world class DevOps product, we must provide the necessary instrumentation interfaces so teams can identify opportunities, mitigate risks, and make the right decisions. This helps our users and us achieve our goals by enabling us to make data-driven decisions.

To accomplish this, we aim to leverage our deep expertise, tied with investments in a strong technical foundation, to enable our users and all teams within GitLab to instrument their applications so that they can then analyze and report on the data those applications create. Like many top SaaS software companies, we are moving to be a product-led and data-driven organization. Through a partnership with our Data Team and collaboration with Product and Engineering we are cultivating a strong data focused culture within GitLab and for our users.

In addition to using data to drive decisions within GitLab, ensuring customer results means we will provide the platform and tools for them to gather data about their own apps. This means they can also make data-driven decisions to improve their products and achieve their business goals.

## Guiding Principles

The key thesis of our group is that providing more visibility into how GitLab is used allows us to make better decisions which lead to better business outcomes for ourselves and our users. In order to build the best DevOps product we can and provide the most value for our customers, we need to collect and analyze usage data across the entire platform to investigate trends, patterns, and opportunities. Insights generated from our Analytics Instrumentation program enable GitLab to identify the best place to invest time and resources, which categories to push to maturity faster, where our UI experience can be improved, and how product changes effect the business.

We understand that usage tracking is a sensitive subject, and we respect and acknowledge our customers' concerns around what we track, how we track it, and what we use it for. We will always be transparent about what we track and how we track it. In line with our company's value of [transparency](https://about.gitlab.com/handbook/values/#transparency), and our [commitment to individual user privacy](https://about.gitlab.com/handbook/product/analytics-instrumentation-guide/service-usage-data-commitment/), our tracking source code and documentation will always be public.

As we build solutions for GitLab and our users to instrument their apps, two aspects we will focus on are:

* Ease-of-use: We will ensure that it is straightforward to add instrumentation to relevant parts of the app. If it is hard to add instrumentation, users will give up and not do it.
* Scalability: We will ensure the systems we build and provide are robust and suitable for production-grade loads. If users cannot trust the systems we provide to be usable and reliable, they will look for alternatives.
* Manageability: We will ensure that it is possible to easily understand what parts of the app are instrumented and what sort of data will be produced. If it is not clear what is already instrumented, people may not be aware of what their current data options are, re-implement the same event multiple times, or remove an event that someone else is using.

## Personas that we work with

A key aspect of aligning on our direction is understanding who we are building for. This allows us to best understand the problems they may have and the context that they will be approaching our offerings with.

### Product groups within GitLab
Product [groups](https://about.gitlab.com/handbook/product/categories/) within GitLab consist of a Product Manager, Engineering Manager, engineers, and other stable counterparts. These groups implement new features in GitLab and want to understand how users interact with those features.
These teams have understanding of how the GitLab code base works as it relates to their features, but not necessarily how the instrumentation APIs and architecture work. They are not necessarily aware of the end-to-end story about how information flows from when a user clicks a button to a result being shown in Sisense or a report.

These product groups are our primary customer that we are serving and developing solutions for.

#### Product Manager personas

Consider reading more about [Parker](https://about.gitlab.com/handbook/product/personas/#parker-product-manager), our Product Manager persona.

Product Managers within these groups will have an understanding of how their group's features work from a user perspective, the problem those features solve, and what sorts of actions result in a user "succeeding" at the [job to be done](https://about.gitlab.com/handbook/product/ux/jobs-to-be-done/), and have growth and usage goals for that feature. They will be able to describe a user journey and key points that should be instrumented along that journey to measure success or need for improvement. They will not necessarily understand what the underlying code for the feature looks like or how all the technology pieces fit together. They need to be able to easily understand which kinds of tracking are available and how they are differentiated to be able to understand the resulting data.
If they find it difficult to add the instrumentation they want, they will instead rely solely on qualitiative analysis, such as direct user conversations, rather than a blend of both qualititative and quantitative analysis. 

#### Engineer personas

Consider reading more about [Sasha](https://about.gitlab.com/handbook/product/personas/#sasha-software-developer), our Software Developer persona.

Engineers within these groups will have an understanding of how GitLab is built and run but likely are not familiar with the product instrumentation architecture nor APIs. They heavily rely on documentation, examples, and previous MRs to add instrumentation that their PM requests. When they are unable to self-serve, they will ask the Analytics Instrumentation group for help or give up.

This persona relies on what we provide to them, which means it is critical for us to keep examples up to date and have clear guidance around deprecated APIs so that engineers use our newer, preferred APIs instead of older ones.

### GitLab Data program

The GitLab [data program](https://about.gitlab.com/handbook/business-technology/data-team/#data-program-teams) is responsible for surfacing data and data-driven insights to the business. They have expertise in building data pipelines, models, and managing data once collected.
They are not necessarily familiar with the GitLab code base and rely on product groups to add instrumentation for new metrics or update existing ones.
They rely on Analytics Instrumentation to effectively collect and send data to Snowflake, which is their main interface with the data.

### Customer success

### External GitLab users

External GitLab users are a broad category of individuals with different needs and who have different skill sets. These users may be interested in reading about what data we collect and how to interact with it. In the future, external users will use the application instrumentation SDKs our group provides to be able to instrument their own apps.

External users rely on our handbook pages and sites like [metrics.gitlab.com](https://metrics.gitlab.com/) to understand what data is collected from their GitLab use, how to view it, and how to interact with it. If they are unable to get clear answers to their questions, they become frustrated. In that case, they may reach out to their account manager to help them, post on a forum, or stop using GitLab.

External users will use the application instrumentation SDKs we provide to instrument their apps. These teams will be similar to our own product groups within GitLab. That is, PMs will understand user journeys about their features, developers will understand how their own app is built, but neither will be familiar with our instrumentation SDKs. They will rely heavily on our documentation and examples or else they will give up and do something else. 



## Challenges we face in Analytics Instrumentation

- GitLab's [single application approach to DevOps](/handbook/product/single-application/) creates a product that is both wide and deep, encompassing a large collection of features used by many teams within an organization, which are composed of different types of users.

- That depth/breadth makes it exceedingly complex to properly map out and understand how our diverse customer set is using the product and gaining value.
- We currently are unable to provide GitLab the required data to identify opportunities and make the right decisions against them.
- GitLab's MVC approach to product development introduces frequent changes to the product stages and what data is available, making historical trend analysis difficult.

## Our Roadmap (As of 2023-10-11)

The roadmap for the group includes multiple initiatives that also tie-in to the stage [roadmap](https://about.gitlab.com/direction/analytics/#1-year-plan).

Over the next year, several key areas of our focus will be on:

### Provide users the interfaces they need to instrument their own applications with Product Analytics

[Product Analytics](https://about.gitlab.com/direction/analytics/product-analytics/) helps developers understand which parts of their apps are most heavily used and how users interact with those apps, enabling data-driven decision making directly. A critical step in this is instrumenting the app and collecting the data.

The Analytics Instrumentation group will focus on providing instrumentation SDKs for popular technologies that enable our users to instrument their own apps so that they can take advantage of Product Analytics. We currently have [five language SDKs](https://gitlab.com/groups/gitlab-org/-/epics/10535) ( Browser, Node.js, Ruby, Python and .Net) available and we will continue to dogfood and improve upon these. You will find more details on how we chose these five SDKs to start with in [this issue](https://gitlab.com/gitlab-org/gitlab/-/issues/413721). We will also continue to gather feedback on what other languages and technologies our users would find value in instrumenting and expand to those languages in the future.

### Provide a unified interface for how tracking inside the GitLab application is done
 
We have learned over time that GitLab team members find the existing Redis, RedisHLL, and Snowplow instrumentation approaches difficult to use and confusing on when to use which. Some interfaces are appropriate for only frontend events, others for only backend events, and each may differ on whether it counts raw event counts, unique humans, or something else. This means team members have to become experts at what our instrumentation approaches are, ask for help from someone else, or give up.

[Internal Event Tracking](https://docs.gitlab.com/ee/development/internal_analytics/) replaces the existing Snowplow/Redis(HLL) based approaches and provides a single unified way of instrumenting features while abstracting the underlying details from the user. Early feedback on internal events tracking shows that there is potential for improvement in terms of the breadth of event and metric types we cover and ease of instrumentation. In the coming quarters we will work on addressing pain points gathered from early feedback with an end goal of making internal event tracking the go-to method for instrumenting features with in GitLab and also making instrumentation as seamless as possible for our engineers and product managers.

Internal Event Tracking will eventually be able to leverage the instrumentation SDKs that are described above so that GitLab uses Product Analytics for its usage reporting, rather than external tools like Sisense or one-off spreadsheets. This plays into the [cross-stage vision](https://about.gitlab.com/direction/analytics/cross-stage-vision.html) for data. This unified interface will eventually become the single way that data is recorded about how the Gitlab application is used. It will be the single-source of truth for all data that is collected and that reporting is done on.

### Build data quality monitors upstream
Analytics Instrumentation collects events and metrics which are then passed on to downstream systems, that are handled by the data team, and eventually consumed by stakeholders through various reporting platforms to generate insights. Data quality issues that arise when instrumentation deviates from standard behaviour is often detected downstream. We will focus on adding [data quality monitors upstream](https://gitlab.com/groups/gitlab-org/-/epics/11223) so that we are able to detect and fix issues as early as possible and teams have more confidence in the data we are collecting. 

### Build a system for event collection and ingestion for Product Analytics

For the instrumentation SDKs or unified tracking API to work, there needs to be a system available to collect the events they generate and ensure that they are stored properly. Analytics Instrumentation will work on creating [this system](https://gitlab.com/groups/gitlab-org/-/epics/9865). This will be based on Snowplow and Kafka and store the events in a ClickHouse cluster that is used with Product Analytics.

This is a natural area for the group, since we have a lot of expertise in constructing and maintaining Snowplow-based pipelines, which is what the existing GitLab.com instrumentation is built on top of. GitLab.com has a very high volume of daily events, so we also have the experience to build and run a pipeline that can handle the production-grade workload that Product Analytics will have.

### Supporting the needs of the business

Different parts of the business have different needs related to data. Examples could include needing new sources of data
added to Service Ping, updating existing metrics, fixing bugs in existing systems, or other projects.  There are also ease-of-use improvements we can make for teams that want to instrument their own features.

We expect these types of requests to continue, so we will support requests from different stakeholders as they arise.

## How We Work

For more information on Analytics Instrumentation, you can checkout our [Analytics Instrumentation Guide](https://about.gitlab.com/handbook/product/analytics-instrumentation-guide/) which details a [high-level overview of how we make data usable](https://about.gitlab.com/handbook/product/analytics-instrumentation-guide/#analytics-instrumentation-overview), the [Collection Frameworks](https://about.gitlab.com/handbook/product/analytics-instrumentation-guide/#collection-framework) we leverage, our [Metrics Dictionary](https://about.gitlab.com/handbook/product/analytics-instrumentation-guide/#metrics-dictionary), and much more!


## Working Groups and Cross-Functional Initiatives

Analytics Instrumentation provides the necessary frameworks, tooling, and expertise to help us build a better GitLab. Naturally we sit in the middle of many projects, initiatives and OKRs at GitLab. In order to provide clarity and realistic expectations to our stakeholders and customers we practice relentless prioritization ([per Product Principle #6](https://about.gitlab.com/handbook/product/product-principles/)), identifying what is above the line, what is below, and what is unfunded and not possible for us to action on in a given timeline.

This table lists recurring activities that are part of [working groups and cross-functional initiatives](https://about.gitlab.com/company/team/structure/working-groups/).

| Activity                                                                                                                           | Cadence       | Type | Teams Involved                                                              |
|------------------------------------------------------------------------------------------------------------------------------------|---------------|------|-----------------------------------------------------------------------------|
| [GTM Product Usage Data Working Group](https://docs.google.com/document/d/1riUXq1GdavnSWJklrebBeZnzcAl6XATyLod9tR6-AlQ/edit)       | Weekly        | Sync | Fulfillment PMs, Analytics Instrumentation, Data, Customer Success, Sales        |
| [Data & Analytics Program for R&D Teams](https://docs.google.com/document/d/1CRIGdNATvRAuBsYnhpEfOJ6C64B7j8hPAI0g5C8EdlU/edit)     | Every 2 Weeks | Sync | Fulfillment PMs, Analytics Instrumentation, Growth, Data                         |
| [Product ARR Drivers Sync](https://docs.google.com/document/d/1TxcJqOPWo4pP1S48OSMBnb4rysky8dRrRWJFflQkmlM/edit)                   | Monthly       | Sync | Customer Success, Sales, Product Leadership   
| [ClickHouse Datastore](https://about.gitlab.com/company/team/structure/working-groups/clickhouse-datastore/) | Weekly | Sync | Multiple |

## Quick Links

| Resource                                                                                                                          | Description                                               |
|-----------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------|
| [Internal Analytics Docs](https://docs.gitlab.com/ee/development/internal_analytics/)                                              | An implementation guide for Usage Ping                    |
| [Metrics Dictionary](/handbook/product/analytics-instrumentation-guide#metrics-dictionary)                                        | A SSoT for all collected metrics from Usage Ping               |
| [Privacy Policy](/privacy/)                                                                                                       | Our privacy policy outlining what data we collect and how we handle it     |
| [Implementing Product Performance Indicators](/handbook/product/analytics-instrumentation-guide#implementing-product-performance-indicators)                                   | The workflow for putting product performance indicators in place   |
| [Analytics Instrumentation Development Process](/handbook/engineering/development/analytics/analytics-instrumentation/) | The development process for the Analytics Instrumentation groups         |
| [Project resposibilities](/handbook/engineering/development/analytics/analytics-instrumentation/#responsibilities) | List of several projects that our group is the DRI for |
| [Incident Reporting](/handbook/engineering/development/analytics/analytics-instrumentation/#incidents) | Analytics instrumentation specific incident reporting process  |
