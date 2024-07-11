---
release_number: "13.1" # version number - required
title: "GitLab 13.1 released with Alert Management and Code Quality Enhancements" 
author: Farnoosh Seifoddini # author name and surname - required
author_gitlab: fseifoddini # author's gitlab.com username - required
author_twitter: # author's twitter username - optional
image_title: '/images/13_1/13-1-cover-image-alt.jpg' # cover image - required
description: "GitLab 13.1 released with Alert Management, Code Quality, Security & Compliance Improvements"
twitter_image: '/images/tweets/gitlab-13-1-released.png' # social sharing image - not required but recommended
categories: releases # required
layout: release # required
header_layout_dark: true
featured: yes

# APPEARANCE
# header_layout_dark: true #uncomment if the cover image is dark
# release_number_dark: true #uncomment if you want a dark release number

# COVER IMAGE LICENCE
cover_img:
  image_url: "https://unsplash.com/photos/qjnAnF0jIGk" # required
  licence: CC0 # which licence the image is available with - required
  licence_url: "https://unsplash.com/license" # required

---

<!--
This is the release blog post file. Add here the introduction only.
All remaining content goes into data/release-posts/.

**Use the merge request template "Release-Post", and please set the calendar due
date for each stage (general contributions, review).**

Read through the Release Posts Handbook for more information:
https://about.gitlab.com/handbook/marketing/blog/release-posts/#introduction
-->

GitLab 13.1 is now available, bringing you **expanded alert management**, new tools to help you **track and improve code quality**, and more ways to **keep your code secure and compliant**.

## Automate and expand Alert Management

Alerts are essential to application maintenance, but understanding and triaging the range of alerts thrown can dramatically reduce productivity and response time. GitLab’s [Alert Management](#manage-it-alerts-in-gitlab) aggregates and ranks IT alerts from all of your services to simplify assessment and remediation, increasing productivity and helping you research and address critical issues right away. Key features in 13.1 include [alert assignments](#assign-gitlab-alerts-to-team-members), [Slack integration](#collaborate-on-gitlab-alerts-in-slack), and [creating GitLab To-Dos when assigning alerts](#create-gitlab-to-dos-when-assigning-alerts).

## Improve code quality

Deployment velocity only matters if you’re deploying high quality code. By [prioritizing tests on recently modified code](#run-tests-for-modified-files-first), developers can address errors immediately, without running an entire test suite. [Code coverage tracking over time](#graph-code-coverage-changes-over-time-for-a-project) surfaces quality trends to developers and managers alike, and native [code intelligence](#code-intelligence) boosts the speed and accuracy of code reviews by integrating reference material directly into GitLab.

## Enhance and extend security and compliance

Security matters to everyone, and we're committed to lowering the barriers to a fully secure, compliant SDLC. That's why we're happy to announce that we've migrated [Brakeman SAST scanning to Core](#rails-sast-analyzer-available-for-all), allowing every Rails developer—at every product tier—to scan their source code for known vulnerabilities. For compliance-focused organizations, we've released a [policy management UI](#policy-management-for-container-network-policies) for network container policies,  and we've enabled [group-level vulnerability exports](#export-vulnerabilities-list-from-group-security-dashboards) to a CSV file for audits or further internal review. In addition, we've made helpful UX improvements to the Security Dashboard, adding [persistent filters](#filters-persist-on-security-dashboards) and [issue status icons](#dynamic-issue-status-icons-on-security-dashboards) to help maintain context as you work within the tool.

## And much more!

These are just a few of the highlights in 13.1. For this release, we also achieved a new milestone in terms of community contribution. For the first time, 
[more than 300 MRs from the wider community](https://gitlab.com/groups/gitlab-org/-/insights/#/communityContributions) were merged during the release period, and we 
appreciate everyone's contributions! Read on to learn more about other fantastic productivity improvements, such as [Accessibility Testing MR Widgets](#accessibility-testing-merge-request-widget), 
[Design Thread Resolutions](#mark-any-design-thread-as-resolved), [Pipeline Success Notifications](#pipeline-success-after-failure-notification), and more!

If you'd like to preview what's coming in the *next* release, be sure to check out our [13.2 kickoff video](https://www.youtube.com/watch?v=AYR3sl8c-co)!
