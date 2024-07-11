---
layout: markdown_page
title: "Category Direction - Error Tracking"
description: "Error Tracking is the process of proactively identifying application errors and fixing them as quickly as possible. Learn more!"
---

- TOC
{:toc}

## Overview
Error Tracking is the process of proactively identifying application errors and fixing them as quickly as possible. Errors are often plentiful, noisy, and challenging to dig through to find the important ones that are impacting users. The best tools provide sorting and filtering by a variety of error attributes, information regarding the commit that likely caused the error, a detailed stack trace, and a set of useful actions such as ignore or resolve that help users to clear out errors they no longer need to pay attention to.

At GitLab, this functionality is based on an integration with [Sentry](https://sentry.io/welcome/) which aggregates errors found by Sentry, surfaces them in the GitLab UI, and provides tools to triage and respond to the critical ones. GitLab leverages Sentry's intelligence to provide pertinent information such as the user impact or commit that caused the bug. Throughout the triage process, users have the option of creating GitLab issues on critical errors to track the work required to fix them, all without leaving GitLab.

At a 30,000 ft view, adding Error Tracking to GitLab drives the single app for the DevOps lifecycle vision and works to speed up the broader DevOps workflow. We can eliminate an additional interface from the multitude of tools Developers are required to use each day to do their jobs. Furthermore, GitLab has the opportunity to surface errors early and often in the development process. By surfacing errors caused by a particular commit, merge request, or release, we can easily prevent our user's customers from experiencing the bug at all. GitLab's ownership of the development workflow makes it simple to remove additional interfaces from the tool chain which will decrease time spent and increase throughput.

### Vision
Our vision is to surface important errors, reducing the time spent triaging, responding and remediating errors, all within GitLab.

## Target audience and experience
The primary persona for Error Tracking is Sasha the [Software Developer](https://about.gitlab.com/handbook/product/personas/#sasha-software-developer). Tracking and triaging errors is a part of any release process and the individual most qualified to solve the error is the developer who wrote the code. Secondarily, we've aimed our Error Tracking offering at Priyanka the [Platform Engineer](https://about.gitlab.com/handbook/product/personas/#priyanka-platform-engineer) who uses Error Tracking to investigate spikes in errors in production.

## Strategy
### Maturity Plan
This category is currently at the `minimal` maturity level, and our next maturity target is `viable` (see our [definitions of maturity levels](https://about.gitlab.com/direction/maturity/)).

### What's Next & Why
As of now (January 2021), we are not actively working on Error Tracking while we make other categories in GitLab equally as awesome (check out [Incident Management](https://about.gitlab.com/direction/service_management/incident_management/)). Once we determine what comes next for error tracking, we will add more detail to this section. If you wish to contribute to the next features and improvements we work on, please take a look at the [Error Tracking](https://gitlab.com/groups/gitlab-org/-/epics/691) and [Error Tracking, like Sentry backend but inside GitLab](https://gitlab.com/groups/gitlab-org/-/epics/7132) epics.

### User Success Metrics
We will know we are on the right trajectory for Error Tracking when we are able to observe the following:
* Broad adoption across internal engineering teams (i.e. we are [dogfooding](https://about.gitlab.com/handbook/values/#dogfooding)) of a [centralized sentry instance](https://sentry.gitlab.net/).
* Increase in instances/projects with [Sentry Error Tracking enabled](https://docs.gitlab.com/ee/operations/error_tracking.html#enabling-sentry)
* Increase in instances [generating issues from Sentry errors](https://gitlab.com/gitlab-org/gitlab/issues/33847)
* Increase in the number of [clusters with Sentry deployed](https://gitlab.com/gitlab-org/gitlab/issues/26513)

## Competitive Landscape

* [Raygun](https://raygun.com/)
* [Rollbar](https://www.google.com/aclk?sa=l&ai=DChcSEwjWtYX5qbjlAhUH22QKHVlqBoUYABAAGgJwag&sig=AOD64_0vLeLukSK6oYi8AuSM04Scz29t3Q&q=&ved=2ahUKEwijkP_4qbjlAhWJqp4KHVQeClQQ0Qx6BAgIEAE&adurl=)
* [Airbrake](https://airbrake.io/)
