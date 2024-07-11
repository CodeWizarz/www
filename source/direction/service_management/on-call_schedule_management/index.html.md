---
layout: markdown_page
title: "Category Direction - On-Call Schedule Management"
description: "Track on-call responsibilities within your team by creating rotating schedules for responders."
canonical_path: "/direction/service_management/on-call_schedule_management/"
---

- TOC
{:toc}

## Overview

Who's on call?

Getting the rotation streamlined can be the difference between a successful incident response or a prolonged outage and frustration for the responding team. 
Given that downtime is expensive, organizations need to treat on-call schedule management as the critical process that it actually is.

### Vision

GitLab on-call schedule helps teams ensure the right person is always available, day or night, to quickly respond to incidents and outages.

On-call schedule is part of GitLab [incident management](/direction/service_management/incident_management/) to enable teams to effectively and efficiently respond and resolve incidents.

## Target Persona
Our current Incident Management tools have been built for users who align with our [Allison (Application Ops)](https://about.gitlab.com/handbook/product/personas/#allison-application-ops) and [Ingrid (Infrastructure Operator)](https://about.gitlab.com/handbook/product/personas/#ingrid-infrastructure-operator) personas. The experience targets DevOps teams at smaller companies where it is common for the engineers to be on-call and responding to alerts for the software that they also write code for. As we mature this category, we will evolve the experience to appeal to and serve the enterprise customer. [Here](https://about.gitlab.com/handbook/engineering/development/ops/monitor/respond/jtbd/) is a list of all jobs to be done (JTBD) for incident management.

### Maturity Plan
- GitLab On-Call [viable maturity](https://gitlab.com/groups/gitlab-org/-/epics/7026)

### What is Next & Why?
`On-call incident responders never miss an alert.`
- We are working on [ensuring on-call schedule experience is accurate and flexible enough to fit incident response teams' needs](https://gitlab.com/gitlab-org/gitlab-design/-/issues/1903). Sometimes responders need to get their shifts covered; we'll be introducing [scheduled overrides](https://gitlab.com/groups/gitlab-org/-/epics/5311).  Additionally, being on-call during normal working/ business hours isn't the same as being on-call during a Friday evening or weekend; we're introducing the ability for [on-call schedules to allow for specific days](https://gitlab.com/gitlab-org/gitlab/-/issues/355807). 
- Responders need to be automatically notified when an alert is triggered and they want to define _how_ they are contacted/paged.  This will increase their responsiveness to an alert that needs to be triaged.  We will be introducing [paging options](https://gitlab.com/groups/gitlab-org/-/epics/1438) beyond email like a phone call or an SMS text message.  

**_How are we tracking success?_**
- Users subscribe to usage based pricing for on-call schedules (more than 5 pages a month)
- The number of on-call schedules monthly active users increases.


### Pricing

Features in the On-Call category have been placed in tiers based on GitLab's [Buyer Based Tiering](https://about.gitlab.com/company/pricing/#buyer-based-tiering-clarification) strategy. The following pricing plan represents existing and future features.

#### On-Call Schedules

| Functionality| Free | Premium | Ultimate |
| ------------ | ---- | ------- | -------- |
|[On-Call schedules](https://docs.gitlab.com/ee/operations/incident_management/manage_incidents.html#from-the-incidents-list)|✅ |✅ |✅|
|[Escalation policies](https://docs.gitlab.com/ee/operations/incident_management/escalation_policies.html)||✅ |✅ |
|[Slack notifications](https://docs.gitlab.com/ee/operations/incident_management/paging.html#slack-notifications)|✅ |✅ |✅ |
|[Email notifications for alerts](https://docs.gitlab.com/ee/operations/incident_management/paging.html#email-notifications-for-alerts)|✅ |✅ |✅ |
|[Paging](https://docs.gitlab.com/ee/operations/incident_management/paging.html#paging)| |✅ |✅ |
