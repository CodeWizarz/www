---
layout: markdown_page
title: "Product Direction - Service Management"
description: "Connect users and customers of your product to support"
canonical_path: "/direction/service_management/"
---

- TOC
{:toc}

# Service Management

#### Last Update

| | |
| --- | --- |
| Content Last Reviewed | `2023-07-31` |

## Stage Overview

Service Management, or Information Technology Service Management (ITSM) specifically, refers to the activities performed by an organization to design, build, deliver, operate, and control information technology (IT) services offered to customers. For more information on ITSM, you can refer to [this link](https://en.wikipedia.org/wiki/IT_service_management). DevOps is at the core of modern ITSM, covering design, build, deliver, and operate. However, it is not a comprehensive set of processes for operating and controlling IT services. GitLab Service Management ambitiously aims to be inclusive of operation and control capabilities that are not currently part of other GitLab stages.

Today, GitLab is a DevSecOps Platform that primarily improves productivity and collaboration within development organizations. However, GitLab Service Management intends to involve additional collaborators responsible for operations and control, such as support engineers, incident responders, and request approvers, to enhance an organization's ability to create and enable value more efficiently. By using GitLab as the AllOps Platform, more users from an organization can participate in value creation. For more details on GitLab's vision, visit [this link](/company/vision/).

### Groups

The Service Management stage currently consists of 1 group:

- [Respond](https://about.gitlab.com/handbook/engineering/development/ops/monitor/respond/)

## Strategy and Themes

Service desk plays a vital role in various team work scenarios, including IT Ops, recruitment, product support, and internal requests. GitLab, being a large organization, can benefit from a mature service desk capability by dogfooding Service Desk. Identifying service desk as a significant opportunity, GitLab takes a forward step into the world of service management by starting with a dedicated investment in GitLab Service Desk.

For more details, please consult the [service desk direction](service_desk/).

### 3 Year Stage Themes

#### Build on Plan

The planning and coordination of work activities, modeled as [work items](https://docs.gitlab.com/ee/architecture/blueprints/work_items/), [lists](https://docs.gitlab.com/ee/user/project/issues/sorting_issue_lists.html), and [boards](https://docs.gitlab.com/ee/user/project/issue_board.html) in GitLab, form foundational building blocks for both Service Desk and Incident Management. We have found that small organizations or multitasking teams, who are the logical near-term customers of Service Desk, prefer their planning tool and service desk to be a singular experience. Similarly, having incidents show up in the same spot as planning issues helps facilitate collaboration.

As such, we plan to build on the [plan](/direction/plan/#enterprise-planning-frameworks-support) 😁. This will facilitate building out the work items framework by bringing requirements early and building a singular experience for GitLab users.

#### Facilitate Common Workflows

Starting small in the giant field of service management, we recognize common patterns applicable across multiple service management workflows, including those classified as DevOps and Service Desk. Our aim is to build features that not only enhance Service Desk maturity but also benefit mature areas of GitLab. This will ideally benefit many existing GitLab users and customers while triggering faster feedback and improvement for Service Desk features.

#### Serve Non-Developer Personas

Service Management is a vast field encompassing many non-developer personas. Until now, GitLab has primarily been a platform for developers and roles closely related to developers. To become an AllOps platform and help organizations realize the efficiency gains of a single platform, we must also serve the needs of non-developer personas, such as support engineers, people serving as incident commanders, managers viewing reports, or project managers that cannot code against GitLab's APIs. 

### What We Are Not Doing

We are not currently prioritizing new feature development on any categories outside of Service Desk. This includes our recent investment in [Incident Management](incident_management/) and [On-Call Schedule Management](on-call_schedule_management). We will continue to maintain these categories for the time, and we do expect to invest additional resources in these categories in the future.

### Potential Categories in Service Management

- Service Desk
- Incident Management
- Approval/Request Management
- Knowledge Management
- Service Catalog
- Customer/Relationship Management



