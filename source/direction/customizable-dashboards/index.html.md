---
layout: handbook-page-toc
title: "Product Direction - Customizable Dashboards"
description: "GitLab wants to improve the customizable dashboard. Learn more here!"
canonical_path: "/direction/customizable-dashboards/"
---

- TOC
{:toc}

## Overview

Users of GitLab generate a lot of data throughout their work as do the processes they start, software they build and the users of that software. While GitLab has strived to create useful default dashboards for individuals, teams, and organizational stakeholders of GitLab, sometimes those data views miss the mark and data needs to be grouped and filtered differently to tell the story they need to deliver.

## Vision

Our vision for custom dashboards is that they will give users the tools they need to tell the right story to the right audience all within the GitLab platform. To do this we will build ways for users to bring different data sources together, from inside and outside of GitLab into visualizations and dashboards. We will build features to let users customize views of their data across projects and groups that give teams the a top-down and bottom-up views of their software. We will build features that let groups share and have conversations about the data within the GitLab platform because screenshots in slide decks are out-of-date at soon as they are created. A competitive advantage of GitLab's dashboards is that they enable users to compare and understand what has changed between different versions of a dashboard since they are built on top of a version control system.


## When to use a customizable Dashboard

GitLab provides default dashboards for many pieces of information from [issues](https://docs.gitlab.com/ee/user/group/issues_analytics/) and [merge requests](https://docs.gitlab.com/ee/user/analytics/merge_request_analytics.html), [vulnerabilities](https://docs.gitlab.com/ee/user/application_security/security_dashboard/), [value stream analytics](https://docs.gitlab.com/ee/user/group/value_stream_analytics/), [errors](https://docs.gitlab.com/ee/operations/error_tracking.html) and [event data](https://docs.gitlab.com/ee/user/product_analytics/) from applications deployed to the field.
These can be a great place to start, but when you need to address specific questions or provide answers to stakeholders, it may be time for a custom dashboard.

Some use cases that may warrant a custom dashboard we have heard but may not yet be supported are:

* I want to track usage data and error rates for a new feature/product until it is fully released
* I want to aggregate merge request data from accross several projects for a specific time frame
* My team wants a top down view of active users, error rates and deployments for out app but that is it
* My organization has specific metrics that define success and I want to center my experience around those metrics.

## When not to use a customizable Dashboard

When the user is new to Gitlab or analytics practices, and wants to learn what is important, why it is important, and how to use it, the default dashboards are a good starting point.

These built-in dashboards provide immediate access to important information without the time and effort required to set up a customizable dashboard.

Within an organization, the GitLab built-in dashboards can promote consistency across teams and departments. When everyone starts with the same dashboard, it reduces inconsistencies in data presentation and interpretation.

## Top Vision Items

* [Adding Copilot analytics - AI actionable insights](https://gitlab.com/groups/gitlab-org/-/epics/10329)
* [Adding AI Descriptive Analytics](https://gitlab.com/gitlab-org/gitlab/-/issues/389233)
* [Embed other external data into product analytics dashboards](https://gitlab.com/gitlab-org/gitlab/-/issues/410066) - So all the relevant data is in a single view/system with the same filters and date ranges applied.
* [Add Tokenized filters to Dashboard View for easier data exploration](https://gitlab.com/gitlab-org/gitlab/-/issues/422402) - So all the data is viewed within the same timeframe for the best dicsussion within the audience.
