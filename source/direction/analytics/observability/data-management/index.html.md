---
layout: markdown_page
title: "Data Management Direction"
description: "GitLab Observability Data Management Direction Page"
---

- TOC
{:toc}

We would appreciate your feedback on this direction page. Please create an issue to collaborate with us or propose a MR to this page!

## Overview

Data is everywhere. From observability telemetry (metrics, traces, and logs), to application events, to DevOps metrics, to product analytics data, organizations need a way to process, store, and manage this explosion of data. Furthermore, organizations need the data to be available, without expensive or time-consuming ELT processes, for analysis. Historically, organizations either hired observability vendors or built and deployed their own monitoring/observability solutions. Both options are expensive and create data silos that are separate from the users' DevOps process. We view having the capability to process, store, manage, and access data as a critical part of the DevOps platform.

## Mission & Vision

### Mission

Process, store, manage, and access the data from your entire software development life-cycle in the complete DevOps platform.

### Vision

The GitLab Observability backend is an open-source, flexible data management solution for your entire software development life-cycle. We enable you to easily integrate with data emitters, process data, store your data for analysis and cost-effective long-term storage, control what you keep, and responsively serve up data when you need it. It is an integral part of the GitLab DevOps platform, so you save time and money not having to integrate additional 3rd-party or open-source data solutions. For the end-users, data is made intuitively available in the appropriate workflow. It also integrates tightly with the [GitLab Observability UI](/handbook/engineering/development/ops/monitor/observability/) for a seamless experience for users.
