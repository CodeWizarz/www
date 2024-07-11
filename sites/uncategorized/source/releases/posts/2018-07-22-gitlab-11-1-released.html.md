---
release_number: "11.1"
title: "GitLab 11.1 released with Security Dashboards and enhanced code search"
author: Andreas Kämmerle
author_gitlab: akaemmerle
author_twitter: andreasmarc
image_title: '/images/11_1/gitlab-11-1-released-cover.jpg'
description: "GitLab 11.1 released with Security Dashboards, security reports at the pipeline level, advanced code search syntax, merge request redesign, and much more!"
twitter_image: '/images/tweets/gitlab-11-1-released.png'
categories: releases
layout: release
---

In GitLab 11.1 we are shipping increased security visibility with dashboards and views to give you contextual information in the right place at the right time along with better code search, a heap of UX improvements, and a lot more!

## Increased visibility for your security team

GitLab is designed for collaboration. Our mission is for everyone to contribute, and specifically we've designed a tool so that Product Management, Engineering, Quality Assurance, Operations, and Security can all collaborate together. It’s why we've built the entire software development and operations lifecycle into a single application. And it’s why we’ve built the Merge Request to be a powerful tool for collaboration.

But sometimes, the Merge Request isn’t the right view for your needs.

MRs are great when you want to see how a discrete change is affecting your app. But what if you want a higher-level view? Sometimes you want visibility into how all current security issues are affecting a branch in aggregate. The new [Security Dashboard](#security-dashboard-for-projects) now gives you this visibility. This lets you make decisions about priority so you can focus remediation efforts on the most important vulnerabilities. Instead of having to collate reports across Merge Requests, now it’s all in one place. We see this as being especially helpful for security operations and engineering. They now have a specific view in GitLab to help them get their job done. Working right from the dashboard, security teams can adjust the criticality weight of vulnerabilities, creating issues to remediate critical items while dismissing others so they don’t repeatedly show up in reports.

## Find what you’re looking for faster

Robust code searching capabilities are fundamental to developer productivity. Whether you are a new developer on a project or simply trying to navigate a large code base before adding a new feature, search is the way you become familiar with the key areas you need to understand. While code search has been available for a long time in GitLab, today, we've made it even better. With enhancements to the [advanced search syntax](#file-name-and-path-filters-for-advanced-code-search), you can now filter by filename, path, and extension, enabling you to find the right files more quickly.

## Even more!

In addition to great new security functionality, we’ve also shipped an improved UX with a [redesigned Merge Request widget](#merge-request-widget-info-and-pipeline-sections-redesign), a [Merge Request panel in the Web IDE](#view-merge-request-description-in-the-web-ide), [redesigned contribution analytics](#contribution-analytics-redesign), and more!

Read on to see all features now available in GitLab 11.1.
