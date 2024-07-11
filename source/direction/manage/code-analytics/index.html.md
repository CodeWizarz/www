---
layout: markdown_page
title: "Category Direction - Code Analytics"
description: "Value Stream Management makes up the framework of our analytics strategy, and Code Analytics is a deep-dive into the Create stage. Find more information here!"
canonical_path: "/direction/manage/code-analytics/"
---

- TOC
{:toc}

| Category | **Code Analytics** |
| --- | --- |
| Stage | [Manage](https://about.gitlab.com/handbook/product/categories/#manage-stage) |
| Group | [Optimize](https://about.gitlab.com/handbook/product/categories/#optimize-group) |
| Maturity | [Minimal](/direction/maturity/) |
| Content Last Reviewed | `2020-08-06` |

### Introduction and how you can help
Thanks for visiting the direction page for Code Analytics in GitLab. This page is being actively maintained by the Product Manager for the [Analytics group](https://about.gitlab.com/handbook/product/categories/#analytics-group). If you'd like to contribute or provide feedback on our category direction, you can:

1. Comment and ask questions regarding this category vision by commenting in the [public epic for this category](https://gitlab.com/groups/gitlab-org/-/epics/3722).
1. Find issues in this category that are labeled "Seeking community contributions".

### Overview
Value Stream Management makes up the framework of our analytics strategy, and Code Analytics is a deep-dive into the Create stage. This category seeks to help our users understand how to help developers write more efficient code, unblock merge requests, and find bottlenecks that emerge during the process of writing code.

### Where we are Headed
We see Code Analytics as a deep-dive into the code-writing stage of your value stream (or [cycle time](https://itsadeliverything.com/lead-time-versus-cycle-time-untangling-the-confusion)). It begins when a developer begins working on a new improvement, continues through code review, and typically ends when a merge request is successfully merged into a branch. We attempt to measure this activity in the [Code](https://docs.gitlab.com/ee/user/analytics/value_stream_analytics.html#how-the-data-is-measured) stage of Value Stream Analytics, but should evolve this definition further to ensure we're including full cycle time.

Code Analytics will break cycle time down by project, group, and aggregate coding activity across an instance. Since code review is an integral part of cycle time - and where delays can happen frequently - We've started with [Code Review](https://docs.gitlab.com/ee/user/analytics/code_review_analytics.html) as a focus. We intend to iterate on this feature and add more complexity and insight over time.

### What's Next & Why
We're currently focused on helping engineering managers and project maintainers understand development activity at the project-level. Since we've shipped the first iteration of Code Review Analytics, we have paused awaiting further [customer feedback](https://gitlab.com/gitlab-org/manage/general-discussion/-/issues/15367).

We've shifted over to prioritize [throughput](https://gitlab.com/groups/gitlab-org/-/epics/3925) as a first-class feature to help engineering teams understand merge request activity. We'll iterate and improve this feature with the help of our internal customers at GitLab.

Afterward, we anticipate moving back to Code Review Analytics and prioritizing ideas like a [MR reviewer dashboard](https://gitlab.com/gitlab-org/gitlab/-/issues/227217).

### Target Audience and Experience
We believe the target audience for Code Analytics is a [development team lead](https://about.gitlab.com/handbook/product/personas/#delaney-development-team-lead), who seeks to understand their codebase and to take data driven prioritization and management decisions.

### Maturity Plan
This category is currently **Minimal**. The next step in our maturity plan is achieving a **Viable** state of maturity.
* You can read more about GitLab's [maturity framework here](https://about.gitlab.com/direction/maturity/), including an approximate timeline for our next step.

