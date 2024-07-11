---
layout: markdown_page
title: "Product Direction - Analytics:Observability"
description: "A unified observability platform for your DevOps needs"
canonical_path: "/direction/analytics/observability/"
---

## On this page

{:.no_toc}

- TOC
{:toc}

## Overview

[Observability](https://en.wikipedia.org/wiki/Observability) is a measure of how well internal states of a system can be inferred from knowledge of its external outputs. In the (recent) past, simply monitoring your application and related systems may have been sufficient, e.g. watching for specific metrics to track whether performance and health are within expectations. Today, with the rapid adoption of cloud-native technologies and distributed systems, it is no longer sufficient to only look for known indicators. An observable system is one that enables operators to efficiently drill in and understand what went wrong even for previously unencountered problems.

## Mission & Vision

### Mission

Make data manageable, understandable, and feedback-ready for every stage of the DevOps process.  

### Vision

GitLab will empower users with continuous insight into the state and behavior of their software systems and software delivering system by leveraging ubiquitous telemetry data in a unique fashion--not just in production, but across every stage of the DevOps process.

## Strategy

On Dec 14, 2021, GitLab [acquired Opstrace](https://about.gitlab.com/press/releases/2021-12-14-gitlab-acquires-opstrace-to-expand-its-devops-platform-with-open-source-observability-solution.html) to jumpstart the plan to offer an observability solution in the One DevOps platform.

Opstrace added two foundational capabilities to the GitLab platform: the GitLab Observability Backend for [data management](./data-management) and the GitLab Observability UI for [data visualization](./data-visualization). We plan to continue to invest in and mature these two areas. They enable the table stakes in any observability solution by enabling users to manage data all in one place and to access and visualize data through a single interface.

Beyond building on the foundation, we plan to lean into well-used areas of GitLab to bring users into GitLab Observability. These capabilities are our key differentiators and the key to our [Go-To-Market](#go-to-market) strategy.

### The SMT Lockup

The table below is inspired by the [Strategy/Metric/Tactic Lockup](https://gibsonbiddle.medium.com/3-the-strategy-metric-tactic-lock-up-b7539ec69a7e)

| **Strategy**                               | **Metric**                                         | **Tactic / Project**                 |
|--------------------------------------------|----------------------------------------------------|--------------------------------------|
| Data all in one place                      | Percent of customers with two different data types | Integration of Observability Backend |
| Data is accessible from a single interface | Percent of customers who creates a dashboard       | Integration of Observability UI      |
| Deep GitLab integration                    | MAU of features enabled by Observability           | [GTM JTBD](#jobs-to-be-done)         |

### Principles

We plan to work toward our vision with the following principles:

#### On by Default

We want developers to have immediate access to an available observability solution. That means we will ensure it is on by default, starts with convention over configuration, and is easy to use.  

#### Unified Data Store

Data is most valuable when it is easy to glean insights across data types. As a result, we're working to store all types of data in a [unified datastore - ClickHouse](/handbook/engineering/development/ops/monitor/observability/#clickhouse-datastore) from metrics, logs, traces, and errors, to analytics data and other data types across the entire DevOps process.  

#### Integrated UI

We plan to create an [integrated UI](/handbook/engineering/development/ops/monitor/observability/#gitlab-observability-ui-previously-known-as-opstrace-ui) that enables visualization and collaboration of data directly within GitLab.

#### Play well with the community

There is a vibrant open-source community working on observability and related toolings. The GitLab observability solution is built on top of the shoulder of the giants in this space. We intend to continue to leverage, augment, and work with what people already use and love. For example, we intend to adopt [OpenTelemetry](https://opentelemetry.io/) as the primary way to instrument, generate, collect, and export telemetry data. We also rely on Prometheus APIs and metric labeling as conventions.  

#### Reduce operational complexity

We plan to follow our FY23 investment theme of [GitLab Hosted First](https://about.gitlab.com/direction/#gitlab-hosted-first) in bringing our observability solution first as a SaaS solution. We plan to offer the same solution, specifically designed to ease the toil of operation, to our self-managed customers. As we mature the product, maintainability and operability will continue to be built into the product based on our learnings operating GitLab SaaS.

### How we are different

Organizations have the choice of using an observability vendor or building their own observability platform. With the former, teams outsource the problems of operating a system that needs to be scaled and consistently updated but are locked into proprietary software and APIs. With the latter, teams not only have to manage the complexity of operating an observability platform at scale, but they have to also figure out how to make the components work together, and keep them up to date. We want that choice to be easy to make by offering a completely open, yet managed platform.

With each GitLab release you can confidently upgrade and maintain your open-source observability tooling.  Furthermore, this observability solution is integrated with the rest of GitLab so you have a single tool to build, test, collaborate, deploy, and monitor your applications.

The decisions we made in architecting GitLab observability also enable a level of flexibility that other solutions don't have. GitLab customers can decide how they want to operate to maintain data ownership and governance. We plan to enable the following capabilities in the future:

1. Use GitLab Observability SaaS while using long-term storage in own cloud account
1. Use GitLab Observability as a managed service
1. Use GitLab Observability as a self-managed service
1. Use GitLab Self-Managed but connect to GitLab Observability SaaS

### Go to Market

We have an ambitious [vision](#vision), but we're not going to get there overnight. As outlined in our [strategy](#strategy), we intend to leverage GitLab's strength as a comprehensive DevOps platform that our users already trust and use to create, build, test, and deploy software, to bring users into our observability solution. The identified jobs to be done are outlined below:

#### Jobs to be Done

##### Current Focus

###### When managing defects in my code, I want to prioritize and address the most impactful bug, so that I can release the highest quality software

GitLab previously relied on the wrong tool (relational database) to store errors. The spiky nature of errors caused unfortunate outages to our service. We are working to move errors to the GitLab Observability Platform, and create dedicated visualization in the GitLab Observability UI. We plan to use GitLab error tracking internally and make it available to our users and customers.

##### Next Focus

###### When addressing performance problems of GitLab CI/CD, I want to understand what is happening in a pipeline, so that I can help developers be more productive

One of the [issues](https://gitlab.com/groups/gitlab-org/-/epics/5071) today with the GitLab CI/CD is there is no out-of-the-box solution to visualize where bottlenecks are in the pipeline. Inspired by the [OpenTelemetry Jenkins plugin](https://plugins.jenkins.io/opentelemetry/) we should enable runners to instrument pipeline jobs using OpenTelemetry, provide traces to the GitLab Observability Platform, and help users understand what is happening in the GitLab Observability UI. Given that GitLab CI/CD is one of the most used features, we believe we can drive observability usage by providing a solution for this job.  

Focusing on this job, we will also architect for the generic tracing use case. We want to make it easy for our users and customers to port over existing tracing jobs. We also want to make it easier for all GitLab users to start gaining the benefits of tracing.

###### When deploying to a Kubernetes cluster, I want insights into on the deployment, so that I can intervene and troubleshoot as needed

Kubernetes is the operating platform or the future platform for many organizations. As such, we want to [lower the cost to operate in Kubernetes via GitLab](https://about.gitlab.com/direction/delivery/kubernetes_management/#vision). We can create a solution for the job by creating a [Kubernetes Dashboard](https://gitlab.com/groups/gitlab-org/-/epics/2493). By building the Kubernetes Dashboard on top of GitLab observability, we can help the Configure and Release team to have less code to maintain, and build generic plumbing for generic data that changes frequently that should be displayed in dashboards.  

##### Future Focus

###### When managing my self-managed GitLab instance, I want to monitor the key metrics, so I can ensure the health and performance of GitLab for my teams

Details TBD

## Status

### What's available today?

Currently, Error Tracking and tracing is available in [Beta](https://about.gitlab.com/handbook/product/gitlab-the-product/#open-beta).  

For Error Tracking, we've replaced the PostgreSQL-based error backend with the GitLab Observability Backend to enable [integrated error tracking](https://docs.gitlab.com/ee/operations/error_tracking.html#integrated-error-tracking) in GitLab. With the capability, users can send errors to us via the Sentry SDK and users can use the legacy Error UI in GitLab Rails to interact with Errors stored in the GitLab Observability Backend. Because it is in Beta, error tracking is not ready to use for business-critical applications in production yet.

For tracing, users can send traces to GitLab using OpenTelemetry or Jaeger. However, there is no way to interface with the data directly within GitLab yet.


### What's next and why?

We plan to complete an end-to-end flow, with error tracking as the first completed use case.

To start, we plan to [complete the integration of the GitLab Observability UI into GitLab](https://gitlab.com/groups/gitlab-org/opstrace/-/epics/44). We will also enable users to add any Sentry instance as a data source. This way, users will have access to the visualization tool within GitLab, be able to connect to external data sources, and can have a way to interact with both errors and traces directly within GitLab.

Simultaneously, we need to migrate the [GitLab Observability infrastructure to AWS](https://gitlab.com/groups/gitlab-org/opstrace/-/epics/46). More details are in the epic.

Next, we will [build out an end-to-end experience for error tracking using both the GitLab Observability Backend and GitLab Observability UI](https://gitlab.com/groups/gitlab-org/opstrace/-/epics/45). This will establish GOUI as the single UI for users to interface with observability UI, and we will subsequently remove the legacy errors UI in GitLab rails.

## Roadmap  

### FY23 Q4

1. [Integrate GitLab Observability UI into GitLab](https://gitlab.com/groups/gitlab-org/opstrace/-/epics/44). This is important because GitLab is a single DevOps platform, and observability is part of it. We want GitLab users to find immediate value in having GitLab Observability UI in GitLab by allowing them to connect to data sources outside of the still-maturing GitLab Observability backend. Once data sources are set up, users can create data dashboards and charts, and attach useful contextual frames in GitLab issues and work items.
1. We need to migrate [GitLab Observability Backend to AWS](https://gitlab.com/groups/gitlab-org/opstrace/-/epics/46). Clickhouse, a relatively new and still-maturing database, does not have the same level of support on GCP. Furthermore, Clickhouse recently indicated it will not invest in GCP, as it had originally intended to do. Thus, in order to ensure GOB is scalable, it needs to run on AWS.

### FY24 Q1

1. [Establish an end-to-end workflow](https://gitlab.com/groups/gitlab-org/opstrace/-/epics/45), starting with errors. Analytics:Observability has introduced several new capabilities to the platform. It is important to establish a pattern of how each capability and component augment each other and delivers customer value. We plan to complete the loop on errors first, while all of the capabilities introduced will also be relevant for other telemetry types. Lastly, this work will establish the new UI for errors. As a result, we can deprecate and remove the legacy errors UI in GitLab Rails.
1. Under consideration: [Tracing insights for GitLab pipelines](https://gitlab.com/groups/gitlab-org/opstrace/-/epics/41). This is one of our [main hypothesis to get existing GitLab users introduced to GitLab observability](#when-addressing-performance-problems-of-gitlab-cicd-i-want-to-understand-what-is-happening-in-a-pipeline-so-that-i-can-help-developers-be-more-productive)

### FY24 Q2

1. Under consideration: [Kubernetes Insights](https://gitlab.com/groups/gitlab-org/opstrace/-/epics/39). Providing useful information to Kubernetes users is critical to GitLab. This also establishes an important development pattern within GitLab on how to use the Observability stack

### FY24 Q3

1. Under consideration: [Ship self-managed GitLab Observability Distribution](https://gitlab.com/groups/gitlab-org/opstrace/-/epics/26). Being able to self-manage a complete, scalable observability solution is a massive competitive advantage. This is something we currently aspire to deliver for GitLab's self-managed users.

## Planning

Planning happens in the [planning board](https://gitlab.com/groups/gitlab-org/opstrace/-/boards/3657448) where issues are arranged by release. Over time this will become more populated with a further look into the upcoming releases.

There are located in this [project](https://gitlab.com/gitlab-org/opstrace/general).

## Demo Video

<!-- blank line -->
<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/c1a_KJtYesU" frameborder="0" allowfullscreen="true"> </iframe>
</figure>
<!-- blank line -->

[Staging Demo](https://www.youtube.com/watch?v=c1a_KJtYesU)

[June 2022 Ops Engineering Showcase (AMER/EMEA)](https://www.youtube.com/embed/WLTHvv6z1B8)

## Video FAQ

1. **Is this the way to deploy the Observability Component?** _No this video is a demo of the local development environment. A new video will be posted soon using our terraform installer to GCP._
1. **API credentials are now linked to personal GitLab account, are the plans using the GitLab Agent permissions?** _That is something we can discuss with the GitLab Agent team of course._
1. **The users now need Kubectl, are there plans to only need the GitLab interface by leveraging the GitLab Agent?** _The users don't need kubectl, this is only because the above demo is for a development environment. The fact that we use Kubernetes to run the observability and Clickhouse is transparent to the end user._
1. **Why does the user have to press an enable button? What is preventing us from automatically enabling it?** _This will be automatic in the future and just the current state of the development code._
1. **What is the plan to have the Grafana interface iframed in GitLab instead of completely separate?** _This will be worked on here: [Integrating GitLab Observability UI (provided by Opstrace) into GitLab UI as an Iframe
](https://gitlab.com/gitlab-org/opstrace/opstrace/-/issues/1743)_
1. **Can we add to API key to Graphana automatically?** _Yes this will be automatic (just like the GitLab pages one)._
1. **Is it possible to replace the docker compose step with something part of the initial helm chart? Or is this for the example app that generates data?** _It's an example app. docker compose is only for deploying a local test app for testing this during dev and demos. The actual system is deployed with terraform and can be wrapped in helm in the future._
1. **Are datasources going to be added automatically?** _Yes of course. As a general rule we don't want to leave anything to the user that could be done for them._

## FAQ

1. **Does Opstrace only work with kubernetes?** _While it’s true that we built a lot of kubernetes features, all that is needed is compatibility with APIs such as prometheus, not running kubernetes oneself. We do use kubernetes to deploy opstrace itself but that is not something the user has to manage and it’s separate from their infrastructure.
1. **How is this going to be deployed?** _As mentioned above, all we require is a cloud account. We deploy and configure everything with our terraform installer. Kubernetes is used to run the system, but that is transparent to the user, operators are deployed on the kubernetes cluster to maintain the rest of the stack. Terraform will be used to rollout new upgrades. For omnibus users, since this kind of stack is bigger than what a single machine/VM can provide, this will also be available through the same manner. They would deploy it into one of their cloud accounts.
1. **We say we will have an integrated UI - do we believe there will also be a separate UI? Will you be able to view dashboards and charts in a distinct non-GitLab UI as well as have them embedded in the GitLab UI or will it all be framed as the GitLab UI?** _At first, there will be a separate UI. This is because we are using Grafana as a base and we need to use its technologies (react...) to build our UI. To bring data into the GitLab UI we will use iframes. The simplest thing to start with first would be to Iframe our entire UI (this keeps the feeling for the user of not leaving GitLab) and later allow framing and more directly embedding single dashboards & more.
1. **We say "unified data store" but there still is a separate relational database (another instance of Postgres) what are we storing there? Will we remove/migrate away from it?** _There are two types of datastores. Clickhouse for storing the observability data. Postgres is used for our settings and users. This will disappear over time as we could use the existing GitLab one. No timelines yet as we first focus on other parts.
1. **What is going to happen with Cortex/Metrics?** _We are going to move away from supporting Cortex. We will be finding another Prometheus API and we are going to use Clickhouse as our metrics storage backend.
1. **With integrated Auth - where does permissioning occur? Are we creating a separate permissioning levels for observability or mapping GitLab ones?** _We are mapping to the GitLab ones.
1. **What is going to happen with the "Opstrace" name?** _We are going to archive the name "Opstrace" as a standalone product, and instead focus on Observability features on the GitLab DevOps platform. Timeline and work that needs to be done are tracked in [this issue](https://gitlab.com/gitlab-org/opstrace/opstrace/-/issues/1761).
