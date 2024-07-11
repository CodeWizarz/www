---
release_number: "13.12" # version number - required
title: "GitLab 13.12 released with On-Demand DAST and Deployment Frequency Chart" # short title (no longer than 62 characters) - required
author: Mark Wood # author name and surname - required
author_gitlab: mjwood # author's gitlab.com username - required
author_twitter: # author's twitter username - optional
image_title: '/images/13_12/13_12-cover-image.jpg' # cover image - required
description: "GitLab 13.12 released with On-Demand DAST, Deployment Frequency Chart, Visualization of Pipeline Job Dependencies and much more!" # short description - required
twitter_image: '/images/13_12/13_12-cover-image.jpg' # required - copy URL from image title section above
categories: releases # required
layout: release # required
featured: yes

# APPEARANCE
# header_layout_dark: true #uncomment if the cover image is dark
# release_number_dark: true #uncomment if you want a dark release number

# COVER IMAGE LICENCE
cover_img:
  image_url: "https://unsplash.com/photos/cH2iaFLi9vw" # required
  licence: CC0 # which licence the image is available with - required
  licence_url: "https://unsplash.com/license" # required

---

This month, we are excited to introduce usability and pipeline management improvements that strive to make your teams more productive, updates to make your deployments more secure, and insights to make your DevOps adoption more mature. These are just a few highlights from the **44 improvements** in this release.

## Helping you manage security before it manages you

To ensure your production environment is always secure, [On-demand DAST scanning](#on-demand-dast-ga-launch) is now generally available for all GitLab Ultimate customers. These on-demand scans will allow you to scan an already deployed application or API in any of your configured environments outside of a CI/CD pipeline i.e., without requiring any code changes or merge requests to start a scan. 

The [Semgrep SAST analyzer](#semgrep-sast-analyzer-for-javascript-typescript-and-python) for JavaScript, TypeScript, and Python is also generally available. Semgrep's flexible rule syntax is ideal for streamlining the [GitLab Custom Rulesets](https://docs.gitlab.com/ee/user/application_security/sast/#customize-rulesets) feature for extending and modifying detection rules, a popular request from GitLab SAST customers. It also allows GitLab customers access to Semgrep's community rules. Thanks to the community contribution from [@proletarius101](<https://gitlab.com/proletarius101>), we are also extending the [Mobile Application Security Testing](#mobile-application-binary-scanning-support) to support `.ipa` (iOS) and `.apk` (Android) binary files, in addition to Xcode projects and Android manifest files that are already supported.

Many customers integrate their existing scanners into GitLab to benefit from a unified view. The Project Vulnerability Report now gives you the ability to [filter by scanner and vendor](https://gitlab.com/gitlab-org/gitlab/-/issues/229661), allowing you to filter scan results for only third-party scanners or for all scanners including those from GitLab.

Application Security is a key focus area for GitLab for this year and your feedback is important to us. As the preference of web application development shifts rapidly towards building JavaScript-heavy and single-page applications, we have identified a need for a purpose built tool that provides more application testing coverage than a traditional proxy based crawler. We are inviting GitLab Ultimate customers to a public beta for a [new browser-based crawler for DAST](#new-browser-based-crawler-for-dast-in-open-beta) which is expected to provide significantly better security testing coverage for these modern applications compared to our current proxy-based crawler.

## Easier pipeline management for enhanced usability

Pipelines are at the heart of our customers' CI/CD success, and we want to make it easier to use for new and experienced users of GitLab. The pipeline editor will now come with a collapsible [panel of guided instructions](#useful-gitlab-cicd-information-in-the-pipeline-editor) that will help new CI/CD users create their first pipeline in a breeze.

For experienced CI/CD users that require more flexibility in creating their pipelines, we are now supporting [wildcards in the `include:` keyword](#support-wildcards-when-including-yaml-cicd-configuration-files) that will help you break your `.gitlab-ci.yml` file into multiple smaller files to improve reusability and readability. We also introduced the ability to [define variables within rules](#support-variables-in-cicd-pipeline-workflowrules), giving you the flexibility to set pipeline variables when certain conditions are met. Defining complex pipelines means there could be dependencies between jobs. The pipeline graph now [shows dependencies between jobs](#show-job-dependencies-in-the-pipeline-graph), which is helpful to visually track and understand the expected order in which the jobs will be run. 

## Insights to improve your DevOps maturity

You cannot fix what you cannot measure. In that spirit, we are continuing to natively support DORA4 metrics. We are happy to announce the introduction of a [group-level deployment frequency chart](#group-level-deployment-frequency-cicd-chart), which will help you understand the efficiency of your deployments over time, find bottlenecks, and focus on improvement areas that span across your projects and teams.

Value stream analytics help you identify inefficiencies and identify the root cause of those inefficiencies in your workflow. In 13.12, we have introduced [pagination and sorting of workflow items](#view-and-sort-stage-items-in-a-value-stream), which allows you to easily visualize and sort items in a specific stage to pinpoint bottlenecks. The [Days to Completion chart](https://docs.gitlab.com/ee/user/group/value_stream_analytics/#days-to-completion-chart) has been updated to show the [average time to completion](#view-average-time-to-complete-workflow-items), which helps identify meaningful trends over time.

In this release, thanks to the community contribution from [@leetickett](<https://gitlab.com/leetickett>), we introduced the ability to view a [time tracking report](#time-tracking-reports-for-issues-and-merge-requests) within an individual issue or merge request to provide visibility into how much time each contributor spent.

For many of our customers, merge requests are the central space for collaboration. We have introduced the ability to see [code quality violations](#code-quality-violation-notices-in-mr-diffs) and [screenshots of failed tests](#failed-test-screenshots-in-test-report) within the merge request to give you necessary context as a part of your normal workflow within GitLab.

## And so much more!

We continue to invest in improving the product usability in every release. Some of our favorite quality of life improvements in 13.12 include:

-   [Users' group counts now displayed in Admin Area](#users-group-counts-now-displayed-in-admin-area)
-   [Bring your own Elastic Stack](#elastic-stack-cluster-integration)
-   [Create incidents via API](#create-incidents-via-api)
-   [Warn administrator when removing an on-call user](#warn-administrator-when-removing-an-on-call-user)
-   [Deleting deploy keys will inform the user if in use](#deleting-deploy-keys-will-inform-the-user-if-in-use)

Read on for more features, performance enhancements and changes! To preview what's coming in next month’s release, check out our [Upcoming Releases](https://about.gitlab.com/direction/kickoff/) page and our [14.0 release kickoff video](https://youtube.com/playlist?list=PL05JrBw4t0Krdajp3voZbcFVXk3O8JpPO).
