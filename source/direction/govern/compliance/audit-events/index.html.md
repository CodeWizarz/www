---
layout: markdown_page
title: "Category Direction - Audit Events"
description: "In order to manage, or prove, compliance you must have visibility into all of the activity within your GitLab environment. Learn more here!"
canonical_path: "/direction/govern/compliance/audit-events/"
---

- TOC
{:toc}

## Audit Events

| **Stage** | **Maturity** | **Content Last Reviewed** |
| --- | --- | --- |
| [Govern](/direction/security/#govern) | [Viable](/direction/maturity/) | `2022-03-04` |

### Overview

Legal, regulatory, and business requirements call for reliable, secure, and performant audit logging capabilities. Users interact with shared resources like projects, comments, and groups inside GitLab.
Administrators need the ability to see and review activities to understand what happened in GitLab and who performed those actions.
Audit events are individual records of what happened, when it happened, and who did it for various actions inside GitLab.

A comprehensive set of audit events for the most critical and sensitive types of actions inside GitLab allows for a detailed record of what happened, when it happened, and who did it.
This empowers administrators to quickly understand what changes happened. It also empowers compliance managers, like [Cameron (Compliance Manager)](https://about.gitlab.com/handbook/product/personas/#cameron-compliance-manager),
to confirm that compliance policies have not been violated or to maintain records for if exceptions have occurred.

The **Audit Events** category is focused on capturing the most important user-driven events within GitLab, making that data easily available (via APIs, webhooks, and exportable reports),
and providing a reasonable duration of storage for the data that follows compliance requirements (7 years).

#### Target Audience

* [Cameron (Compliance Manager)](https://about.gitlab.com/handbook/product/personas/#cameron-compliance-manager)
* [Amy (Application Security Engineer)](https://about.gitlab.com/handbook/product/personas/#amy-application-security-engineer)
* [Isaac (Infrastructure Security Engineer)](https://about.gitlab.com/handbook/product/personas/#isaac-infrastructure-security-engineer)

### User pain points to address

#### Thorough coverage of the actions that matter
As users use more of GitLab's capabilities, there will be more potentially sensitive changes to monitor for. We will focus on ensuring that key areas of GitLab generate audit events to support
administrators and compliance managers. GitLab moves quickly, releasing new features every month, so a challenge we will need to focus on is to add and capture new actions associated with these new capabilities.
This aspect is key, because we can export audit events for users to post-process themselves, but if we never logged the event in the first place, there is not a good way forward.

* What success looks like: GitLab captures audit events for sensitive actions and has a framework to ensure new features ship with auditable events captured where appropriate.

#### Traceability
It's important that we’re presenting information in a way that makes answering questions simple. Users goal is to uncover quickly insights from a set of logs, not to comb through all the logs.
Separation of duties questions like “who opened and merged this MR?” aren’t readily available in a logging system that logs individual events.
GitLab should promote **traceability**; when a change is logged, we should enable an administrator to see the full context around the change.

* What success looks like: an administrator should be able to explore a logged event and see related changes and users. Clicking on the recorded event for a comment in a merge request,
for instance, should show more contextual data around the merge request itself (when it was opened, merged, and who interacted with it). This should also be possible to do via the API.

#### Flexibility in how to consume events 

Organizations, especially enterprises, have complex services and tooling built to integrate with their existing data analytics processes. This means that GitLab needs to ensure data parity between the audit events table within the UI and the audit events API. It also means incorporating different types of data ingestion for organizations, such as webhooks for various components within GitLab that are critical for an organization's custom tooling and analytics.

* What success looks like: GitLab has feature parity between the application's audit events tables and the audit events API and a [comprehensive webhook system](https://gitlab.com/groups/gitlab-org/-/epics/5925). We are using [this Epic](https://gitlab.com/groups/gitlab-org/-/epics/4994) for tracking feature parity issues.

Excellence in this category means that we’re solving for all of these needs: **transparency**, **traceability**, **configuration**, and **monitoring**.

#### Actionability of results

Audit events are a necessary aspect of compliance, but more important is leveraging audit events to inform proactive decisions and actions. Every customer differs in their policies and procedures, but also in their security and compliance culture and mindset.
It will be critical to provide customers with smart, proactive alerts about anomalous activity in a way that's easy to setup and take action on.
Flexibility is key because some customers will want to take programmatic action (e.g. automatically block a user's account) and some will want to take a "lighter touch" approach (e.g. notify an administrator, but take no further action).

* What success looks like: you should be able to define anomalous user behavior and GitLab's audit events should automatically flag activity matching that criteria.
These definitions should be highly configurable and range from the simple to the complex. We are exploring this in [an epic](https://gitlab.com/groups/gitlab-org/-/epics/259).

**Audit Events** are a core component of any compliance program. An organization needs to know what activity is occurring on their systems in order to proactively manage those systems.
Traditionally, audit logs have been technical, verbose, and difficult to manage.
The **Audit Events** category wants to ensure that anyone can easily find the data they're looking for, in as little time as possible, and at the granularity that they need.

The three key themes for this category are: granularity, simplicity, and time savings.

##### Granularity

An audit events system is incomplete if it cannot answer any questions about who did what, when, and on what system.
GitLab has the breadth and depth of insight to be able to shed light on the complexities of the devops workflows your organization employs.
Not only should GitLab provide logs for the most important user-driven events, but those events should be traceable to other entities or events in the system.
We want to provide you with an experience that answers your auditing questions, but also delights you while you're answering them.

The capture of all necessary audit events leads to a more reliable auditing process for your team and organization. This will enhance your ability to identify and deal with any incident or anomaly.

##### Simplicity

We want to make it simple to work with GitLab audit events. When users look at the logs to find out what happened in their instance,
we will make it easy to find out what happened and to identify any anomalies or policy violations. Our goal is to enable this
with straightforward workflows that do not require coding or using complicated interfaces.

By making the **Audit Events** experience super simple, we hope to alleviate the time commitment and headache our users typically experience when searching for data in this context. 

##### Time savings

Audits and compliance efforts can be a major time commitment.
Time spent building custom tooling and reporting to searching through the data in these, or other systems, for specific answers is time that could be used on other activities.
The person doing the analysis frequently does not specialize in compliance. This introduces friction because these people may not understand what events are important, how to get relevant artifacts,
or exactly what the person requesting compliance artifacts needs.

By making GitLab audit events simple and friendly, we will enable [everyone to contribute](https://about.gitlab.com/company/mission/#everyone-can-contribute) to compliance efforts and get the visibility needed to do so.

#### What’s Next & Why

Our top priority is to evolve our storage database architecture so we may improve performance and scalability. This will be achieved through [migration to Clickhouse](https://gitlab.com/groups/gitlab-org/-/epics/10241). Improvements in this area provides a number of advantages:

* High volume data storage: The database must be able to accommodate a large volume of audit events data without compromising performance.
* Support for billions of records: The database must be capable of handling billions of records, as the number of audit events is expected to increase over time.
* Capability to run complex queries for reports and analysis: The database should enable the execution of complex queries to generate insightful reports and analyses.
* Full-text search support: While not a critical requirement for audit events, the database should ideally offer full-text search capabilities for easier data retrieval and improved user experience.
* Immutability of audit events: Since audit events are immutable records that are never updated, the database should be optimized for this use case. ClickHouse is well-suited for this purpose, as noted in GitLab's documentation (https://docs.gitlab.com/ee/development/database/clickhouse/#how-it-differs-from-postgresql).

We'll then be working to expand support for filtering and adding capabilities across group and instance levels, while also extending support into [3rd-party storage systems](https://gitlab.com/groups/gitlab-org/-/epics/7792). Third-party audit event storage solutions will make it a lot easier for users to get started with streaming audit events and use the tools they already have, rather than require them to build logic to ingest and process HTTP events.

| Destination         | Feature                   | Group | Instance |
|---------------------|---------------------------|-------|----------|
| **HTTP Destination** |                           |       |          |
|                     | Sending audit events      | ✅    | ✅       |
|                     | Filter by event type      | ✅    | ✅       |
|                     | Filter by subgroup/project| 🔄 (https://gitlab.com/groups/gitlab-org/-/epics/11384) | 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/11440) |
| **GCP Logging**     |                           |       |          |
|                     | Sending audit events      | ✅    | 🔄 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/11061) |
|                     | Filter by event type      | 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/11299) | 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/11299) |
|                     | Filter by subgroup/project| 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/11441) | 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/11441) |
| **AWS S3**          |                           |       |          |
|                     | Sending audit events      | 🔄 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/6188) | 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/6188) |
|                     | Filter by event type      | 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/6188) | 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/6188) |
|                     | Filter by subgroup/project| 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/6188) | 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/6188) |
| **Azure Blob storage** |                         |       |          |
|                     | Sending audit events      | 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/11055) | 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/11055) |
|                     | Filter by event type      | 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/11055) | 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/11055) |
|                     | Filter by subgroup/project| 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/11055) | 📆 [Epic](https://gitlab.com/groups/gitlab-org/-/epics/11055) |

Contributors outside of the Compliance group can add support for new audit event collection into GitLab by following our [guide to contributing new audit events](https://docs.gitlab.com/ee/development/audit_event_guide/).  An example of this is how the DAST group was able to [contribute support for auditing their events](https://gitlab.com/gitlab-org/gitlab/-/issues/217872).

Additionally we work to add in support for new audit events on a regular basis to expand our [comprehensive audit log](https://gitlab.com/groups/gitlab-org/-/epics/736).

##### How we will prioritize adding new audit events

As we add new audit events in the future, we will thoughtfully consider which to add first and
which to add later. To help decide which events to add before others, we consider these priorities,
in stack rank order, when deciding which events to focus on next:

1. Events which cause irreversible, possibly damaging if inappropriate, changes or deletion of data
  - Actions which can permanently affect the state of an instance, group, project or data are key events that we want to maintain a log of, since they generally cannot be undone.
1. Events which alter configuration of settings or the permissions of users
  - The potential impact of high level changes can be detrimental, so an instance level change takes priority over a project 
  - Anything related to escalating roles, for example users may inappropriately elevate their permissions to access other parts of the product
  - Users may try to temporarily subvert restrictive settings to avoid a compliance control or policy, which may could pose a problem in an audit. 
1. Use of sensitive keys and tokens
  - Tokens such as Personal Access Tokens can give anyone who holds them the permissions the token has. Steps done with these tokens will be logged in case a token falls into inappropriate hands and the changes made with it need to be undone.
1. Changes that cause data to be copied or exported to other sources
  - Because the data in an instance is very sensitive, we will record logs of actions that are used to copy, mirror, or export that data.
1. Workflow changes or cosmetic changes to a GitLab instance, group, or project
  - If a change is made to something like a template or project label, it could potentially be disruptive to the workflow of the teams using it, so we will log those actions.

Please note that the list above is not exhaustive, but shows a stack rank of some of the most important types of
events to record and our perspective as we work on prioritizing them. The individual events we are working on are captured in [this epic](https://gitlab.com/groups/gitlab-org/-/epics/736) and we would love your feedback.

Note that when an action is taken very often, the audit events will likely generate more data than we can store. In those cases, we will deliver audit events for those actions as 
[streaming-only audit events](https://docs.gitlab.com/ee/administration/audit_event_streaming.html). This provides a good balance between
recording the actions that users care about while not overwheliming GitLab servers with needing to store large amounts of data.

#### Feature authors should add their own audit events for features that are built

As part of the Audit Event category, the Compliance group is responsible for delivering a standardized and robust
auditing system as part of the GitLab product. Our group will occasionally add events
ourselves using the priority list above, but it is not scalable for one group to add them for all features
in GitLab since all groups ship so much so often.

Individual groups are responsible for adding audit events for their own features as they develop them.
We maintain a self-service [development guide](https://docs.gitlab.com/ee/development/audit_event_guide/) in the
documentation for how people can add a new audit event. If there are questions about the guide or about how to
add an audit event for a specific feature, the Compliance group is happy to help.

#### What is Not Planned Right Now

Audit Events is a very deep domain and can mean different things to different people. Above we highlight areas we will focus on
but it is also important to highlight areas that we intentionally will not focus on.

At this time, we do not intend to build
a [full SIEM](https://en.wikipedia.org/wiki/Security_information_and_event_management) experience around Audit Events.
A SIEM can do many different tasks and can consume many different data streams simultaneously, correlate them, and handle high data
volumes. We envision audit events as being able to be consumed by an external SIEM, but we will not build a SIEM into GitLab itself.

We do not intend Audit Events to be used in such a way that they could be used for product analytics or measuring
feature adoption. There are purpose-built tools, such as [GitLab Value Stream Management](https://about.gitlab.com/solutions/value-stream-management/) that can be used to understand how end-users use a product
and measure adoption over time.

We do not intend to log every single user-driven action inside GitLab. Because GitLab is such a large application, it is not feasible to process
and store the amount of data that would be generated if every single action was recorded. Additionally, not every single event inside of GitLab will be as sensitive as others or
relevant during audits. Instead, our plan is to identify the most critical and sensitive actions and focus on those.

#### Maturity

Currently, GitLab’s maturity in Audit Events is **viable**. Here’s why: GitLab currently offers an audit log system, but it does not capture all of the required user-driven events.
While we’re iterating and capturing more events over time, our users demand a comprehensive view of activity in application logs.
However, the events being captured are useful at answering valuable questions on GitLab instances, and are [used to solve real problems](https://about.gitlab.com/direction/maturity/).

* You can read more about GitLab's [maturity framework here](https://about.gitlab.com/direction/maturity/), including an approximate timeline for this category's evolution.

Advancing this category to a [**complete** state](https://gitlab.com/groups/gitlab-org/-/epics/1217) means having a robust, complete set of logs that captures the vast majority of user activity. These logs are structured and easily parsed; while GitLab may not actively guard against threats, an administrator can easily track down the history behind nearly any change. Additionally, these audit logs should be usable; an administrator should be able to ingest them into their Security Information and Event Management (SIEM) tool of choice or search for events easily in the GitLab UI and via our API.

**Lovable** consists of compliance adding active monitoring for Audit Events to be truly trusted by users. The application is able to demonstrate security and compliance on an ongoing basis, in a single view, and actively monitors for (and defends against) suspicious behavior. An administrator or auditor can check a dashboard to be brought up to speed - or simply get some peace of mind.

### User Success Metrics

We'll know we're on the right track with **Audit Events** based on the following metrics:

* More audit event searches via the [application UI](https://docs.gitlab.com/ee/administration/audit_events.html) and [audit events API](https://docs.gitlab.com/ee/api/audit_events.html)
* More [audit events CSV exports](https://docs.gitlab.com/ee/administration/audit_events.html#export-to-csv)
* Fewer GitLab issues created to add audit events

### Competitive landscape

GitLab has several competitors in this area with mature product offerings.
To compete with these experiences, we need to first understand the value they offer to users. This will enable us to find opportunities to
differentiate GitLab as we build out our own capabilities.

##### GitHub Audit Logs

GitHub provides a comprehensive and versatile [audit log experience](https://help.github.com/en/github/setting-up-and-managing-organizations-and-teams/reviewing-the-audit-log-for-your-organization). Their search capability empowers users to find any data they need and categorizes audit events into different types. The delineation between `operation`, `repository`, `user`, `action performed`, and various other categories, provides convenience and easy searchability for their users. They provide a [detailed breakdown](https://docs.github.com/en/free-pro-team@latest/github/setting-up-and-managing-organizations-and-teams/reviewing-the-audit-log-for-your-organization#search-based-on-the-action-performed) of each event category, reducing the friction of learning about the various events and lowers the barrier of instrumenting custom tooling around these logs.

Another convenience feature they provide is the ability to [configure the retention period](https://docs.github.com/en/free-pro-team@latest/actions/reference/usage-limits-billing-and-administration#artifact-and-log-retention-policy) of audit logs. Public repositories can be configured to retain logs for 1 - 90 days. Private, internal, and enterprise repositories can be configured to retain logs for 1 - 400 days. 

##### Azure DevOps Audit

This audit log experience is currently in [public preview](https://docs.microsoft.com/en-us/azure/devops/organizations/settings/azure-devops-auditing?view=azure-devops&tabs=preview-page) but shows a methodical approach to audit events. The primary segmentation is between `Categories` (event type) and `Areas` (areas of the application). This allows both Microsoft and users to navigate the various event types more easily and ingest that data into SIEM tools for longer retention periods. This audit log experience only provides 90-day retention and instructs the user to leverage the API to backup the data elsewhere for longer storage.

Filtering and exporting audit events is supported, which makes it easier for users to parse and analyze the data outside of Azure. They also provide a useful `ID` and `CorrelationID` relationship so an event can be linked to other events. This is important for traceability and makes it much easier to analyze the series of events that lead to an incident or undesirable action.

Azure DevOps Audit also supports audit [event streaming](https://docs.microsoft.com/en-us/azure/devops/organizations/audit/auditing-streaming?view=azure-devops), which is a request we receive regularly from our customers to work with their existing tooling to ingest data into SIEM or other systems. They seem to have built-in some native integrations with tools like Splunk to provide this streaming experience.

Another offering is the ability to [export a list of users and their access levels](https://docs.microsoft.com/en-us/azure/devops/organizations/security/export-users-audit-log?view=azure-devops&tabs=browser), further emphasizing the fact that organizations need to pull specific reports that can be automated and standardized.

##### Bitbucket Auditing

This [audit log experience](https://confluence.atlassian.com/bitbucketserver/auditing-in-bitbucket-776640417.html) from Atlassian provides flexibility to define the level of detail users wish to capture in their audit logs. They segment the logs by "coverage area" and offer an additional setting for "coverage". They provide 26 categories and their coverage options break down into: [Off, Base, Advanced, and Full](https://confluence.atlassian.com/bitbucketserver/audit-log-events-in-bitbucket-776640423.html). 

Users can create a custom-tailored logging solution, in-app, that meets their needs which may require `Full` coverage of the `Repositories` category but `Base` coverage of the `Users and groups` category. This allows organizations to focus on the areas that are most important to them, which reduces the volume of logged activity and therefore makes it easier to search through the logs. 

Bitbucket allows users to retain data up to 99 years, which is well beyond even the more conservative logging policies and compliance requirements.

##### Key Takeaways

Each competitor seems to follow a similar theme of breaking out their event types into categories or coverage areas. This creates a hierarchical structure for building out audit logs which has benefits for both the service provider and the customer organization. They also provide a sensible amount of granularity in the audit log configuration, such as defining the level of detail to log (Bitbucket) or delineating between specific event types like GitHub. This categorization makes it easier to work with the audit event system through consistency and human-readable syntax.

All of these competitors seem to be focused on making audit events complete in their coverage as well as the usability: searching, filtering, and integrating event streaming. 

When it comes to data retention, there's significant variance, but each company provides the flexibility to customize the retention period to some maximum value and offers parity with an API to ensure an organization can capture this data outside of the respective audit log systems for longer retention periods and other analysis or workflows.

To summarize:

* We should build a logical hierarchy for our audit events
* Enabling customers to get audit event data out of GitLab and into a SIEM or other tool is necessary
* We need to provide a consistent, default retention policy for customers and allow them to customize it as needed

### Analyst landscape

The primary feedback we've received from analysts about this category has centered around programmatic alerting. Providing smart audit logs that can notify appropriately personnel of anomalous activity or specific, defined events can really elevate the value of **Audit Events** for our customers.

### Top Customer Success/Sales issue(s)

* [Comprehensive audit log](https://gitlab.com/groups/gitlab-org/-/epics/736). CS, sales, and users all want a set of logs that captures the vast majority of events in GitLab. Since you don't know what you need until you need it, customers expect us to log everything.

### Top Vision issue(s)

* [Behavioral monitoring MVC](https://gitlab.com/groups/gitlab-org/-/epics/259). With the volume of events in GitLab, effective monitoring won't be possible without automated alerting.

## How you can help

Thanks for visiting this direction page for Audit Events in GitLab. If you'd like to provide feedback or contribute to our vision, please open a merge request for this page or comment in the [corresponding epic](https://gitlab.com/groups/gitlab-org/-/epics/1985).
