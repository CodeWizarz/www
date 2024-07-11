---
layout: markdown_page
title: "Category Direction - Performance Testing"
description: "Ensure performance of your software using automated browser performance, accessibility, and load testing. Learn more here!"
canonical_path: "/direction/verify/performance_testing/"
---

- TOC
{:toc}

## Performance Testing

Performance testing is used to validate how an API, system or web page responds under normal and extreme loads. Historically this testing was performed after development was completed and as part of a formal testing process. This can delay a release if performance is found to be negatively impacted and be expensive to fix.

## Our Mission

The mission for the Performance Testing team is to provide actionable performance data as part of every Merge Request. As a part of the Ops Section [direction](/direction/ops/#smart-feedback-loop) "Smart Feedback Loop" we want to enable users to shift this testing to the left so developers have immediate feedback about how their changes impact performance and can fix issues as they are created.

## Overview

At Gitlab we are focused on browser performance testing and load performance testing as the primary methods of informing developers of the impact of their changes and team leads of the trends of performance. We will utilize open source tools such as sitespeed.io and k6 as the mechanisms to measure performance.

## Who are we focusing on? 

Check out our [Ops Section Direction "Who's is it for?"](/direction/ops/#who-is-it-for) for an in depth look at the our target personas across Ops. For Browser Performance Testing, our "What's Next & Why" are targeting the following personas, as ranked by priority for support: 

1. [Sasha - Software Developer](https://about.gitlab.com/handbook/product/personas/#sasha-software-developer)
1. [Simone - Software Engineer in Test](https://about.gitlab.com/handbook/product/personas/#simone-software-engineer-in-test)
1. [Delaney - Development Team Lead](https://about.gitlab.com/handbook/product/personas/#delaney-development-team-lead)

## What's Next & Why

There are no planned investments in Performance Testing during FY24 (2023). Please note: Browser Performance Testing and Load Performance Testing features are being deprecated and will be removed from GitLab 17.0. 

### Additional Resources

- [Maturity Plan](#maturity-plan)
- [Issue List](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=%27%22Category%3APerformance%20Testing%22)
- [Overall Vision](/direction/ops/#verify)

Interested in joining the conversation for this category? Please join us in our
[issues](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=%27%22Category%3APerformance%20Testing%22) where
we discuss this topic and can answer any questions you may have. Your contributions
are more than welcome.

This page is maintained by the Product Manager for Pipeline Security, Jocelyn Eillis ([E-mail](mailto:jeillis@gitlab.com)).

## Maturity Plan

This category is currently at the "Minimal" maturity level, and our next maturity target is "Viable" (see our [definitions of maturity levels](/direction/maturity/)). Key deliverables to achieve this are:

- [CI View for detailed site speed metrics](https://gitlab.com/gitlab-org/gitlab/issues/9878)
- [Add link to detailed sitespeed report from Merge Request](https://gitlab.com/gitlab-org/gitlab/issues/9879)
- [Add integrated load testing to AutoDevOps](https://gitlab.com/gitlab-org/gitlab-ee/issues/10681)
- [Archive and graph load test results](https://gitlab.com/gitlab-org/gitlab/-/issues/36914)

We may find in research that only some of these issues are needed to move the vision for this category forward. 

## Competitive Landscape

While, just as one could orchestrate any number of web browser testing tools with GitLab CI today, Jenkins, Travis or CircleCI could be used to orchestrate web browser testing tools in similar ways. None of these offer an out of the box browser performance option but there are integrations available for them for top tools such as Google's Lighthouse and sitespeed.io.

In order to remain ahead of the competition, we should continue to make GitLab a rich interface for browser performance testing data for all contributors and expand beyond the current focus on the developer needs in a merge request. The Vision Items for the category reflect this direction.

### Azure DevOps

Azure DevOps offers [in-product load testing](https://docs.microsoft.com/en-us/azure/devops/test/load-test/get-started-simple-cloud-load-test?view=azure-devops).  This consists of different types of tests including:

* HTTP Archive Based tests
* URL based tests
* Apache JMeter Tests

For URL type tests, the output contains information about the average response time, user load, requests per second, failed requests and errors (if any).

### Travis CI/CircleCI

While, just as one could orchestrate any number of performance testing tools with GitLab CI today, Travis or CircleCI could be used to orchestrate performance testing tools, it does not have any built-in capabilities around this.

## Top Customer Success/Sales Issue(s)

The Field teams are typically most interested in uptier features, like [Premium](https://gitlab.com/dashboard/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3AWeb%20Performance&label_name[]=GitLab%20Premium) and [Ultimate](https://gitlab.com/dashboard/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3AWeb%20Performance&label_name[]=GitLab%20Ultimate). The top requested issues in these tiers include [CI View for detailed site speed metrics](https://gitlab.com/gitlab-org/gitlab/-/issues/9878), [Provide Browser Performance Testing for high latency or low bandwidth network situations](https://gitlab.com/gitlab-org/gitlab/-/issues/9737), and [connecting sitespeed reports to the Merge Request](https://gitlab.com/gitlab-org/gitlab/-/issues/9879). 

The top issues for consideration in these categories are [Archive and graph load test results](https://gitlab.com/gitlab-org/gitlab/-/issues/36914) and [Add integrated load testing to AutoDevops](https://gitlab.com/gitlab-org/gitlab/-/issues/10681).

## Top Customer Issue(s)

The most popular issue to date is [gitlab#9878](https://gitlab.com/gitlab-org/gitlab/issues/9878) which provides a more detailed view of the resulting report in the GitLab interface. We are actively seeking additional input from customers on how they are using the browser performance data already available today before tackling this issue.

The most popular issue in this category is to [Improve the metrics reports frontend](https://gitlab.com/gitlab-org/gitlab/-/issues/11945). The current interface for Metrics Reports is especially hard to read when the number of metrics grows beyond 10 to 12 and we hope this solves that problem.

## Top Internal Customer Issue(s)

The Top Internal Customer issue is to have a [Project level report of Browser Performance Results](https://gitlab.com/gitlab-org/gitlab/-/issues/238049) so the quality team can use the existing feature and stop maintaining their own custom job to run browser performance testing against the nightly builds to create the [nightly report](https://gitlab.com/gitlab-org/quality/performance/-/wikis/Benchmarks/SiteSpeed/10k). A second Top Internal Customer Issue is to [integrate the Load Performance Testing template into AutoDevOps](https://gitlab.com/gitlab-org/gitlab/-/issues/10681). We are looking forward to getting additional feedback from internal customers as usage within the company expands. 

## Top Vision Item(s)

When we think out further about Performance Testing there are opportunities to solve problems for customers to increase their ability to build resilient services faster. To meet our long term vision we will need to solve problems that will expand our out-of-the-box performance testing like helping customers track [browser performance](https://gitlab.com/gitlab-org/gitlab/issues/36087) of a web app or [API performance](https://gitlab.com/gitlab-org/gitlab/-/issues/36914) of a microservice. 

These along with other signals from testing then need to be captured in an easy to view presentation that makes it easy to review the signals and quickly act on any problems. Our vision for what this could look like is shared in the Direction page for [Code Testing and Coverage](https://about.gitlab.com/direction/verify/code_testing/#top-vision-items).


