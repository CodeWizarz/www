---
release_number: "13.7" # version number - required
title: "GitLab 13.7 released with merge request reviewers and automatic rollback upon failure" # short title (no longer than 62 characters) - required
author: Michael Karampalas
author_gitlab: mkarampalas
author_twitter: # author's twitter username - optional
image_title: '/images/13_7/13_7-cover-image.jpg' # cover image - required
description: "GitLab 13.7 released with merge request reviewers, automatic rollback in case of failure, quick action to clone issues, GitLab Runner container on OpenShift, and much more!" 
twitter_image: '/images/13_7/13_7-cover-image.jpg' # social sharing image - not required but recommended
categories: releases # required
layout: release # required
featured: yes

# APPEARANCE
header_layout_dark: true #uncomment if the cover image is dark
# release_number_dark: true #uncomment if you want a dark release number

# COVER IMAGE LICENCE
cover_img:
  image_url: "https://unsplash.com/photos/WUdA1_7Lqlw" # required
  licence: CC0 # which licence the image is available with - required
  licence_url: "https://unsplash.com/license" # required

---

What a year 2020 has been! We're excited to share what's new in 13.7 with over **45** features and improvements shipping just in time for the holidays!

On behalf of everyone at GitLab, I want to take a second to thank everyone in our community for your contributions and the positive impact you've made. Without you, GitLab would not be what it is today. 

Here's to you and all of our team members that helped make 2020 an incredible year despite the adversity and unprecedented times. Please continue staying safe, happy, and healthy this holiday season. 

Here's what you can look forward to in 13.7:

## Enhanced project management for cross-collaboration

Merge Requests (MRs) are crucial to foster cross-collaboration and can be directly linked to relevant issues, providing a central location to communicate via comments, suggest code changes, perform code reviews, and much more. In this release, we've added [merge request reviewers](#reviewers-for-merge-requests), a capability to improve the code review process by making reviews easier and more organized. Now you'll be able to quickly find out who's involved in the merge request or request a formal review that will send them a notification.

Context switching and manual tasks in your workflow hinder your ability to efficiently collaborate across groups and projects. It means you spend less time developing valuable features and more time managing your projects, which is why the ability to [clone issues with quick actions](#clone-an-issue-with-a-quick-action) is so valuable for you to streamline agile planning and project management.

[Collaborating](https://about.gitlab.com/handbook/values/#collaboration) on projects and [iterating](https://about.gitlab.com/handbook/values/#iteration) rapidly to develop your applications means you need to be able to quickly determine the order of importance of your issues, identify any blockers, and use that information to prioritize what you'll work on next. Now, you can [sort issues by blockers](#sort-issues-by-the-number-of-issues-they-are-blocking) to quickly find out which of your issues are blocking progress for other issues, as well as easily sort by the number of blockers in your issue list.

## Improved release automation and deployment flexibility

You need flexibility to control how you orchestrate, automate, and deploy your applications on a regular basis. Deploying your applications reliably and frequently gets value into the hands of your customers sooner. 

To improve how GitLab automates releases, we've added [automatic rollback in case of failure](#auto-rollback-in-case-of-failure). This feature automatically reverts an unsuccessful deployment back to the last successful deployment and sends an automatic notification to alert you of the status. You won't have to manually make any changes and can be confident that potential problems won't cause downtime or intensify while you work towards a fix.

An improvement that goes well with automatic rollback in the event of a failure is the ability to [see the deployment status in the Environment page](#show-deployment-status-on-the-environments-page). Now you can easily find deployment statuses and identify what actions you need to take, such as stopping or rolling back a deployment.

We've also shipped the first officially supported beta of [GitLab Runner container on Red Hat OpenShift and our Certified Runner Operator](#gitlab-runner-for-red-hat-openshift) to give you more flexibility over how you release with GitLab. We're working to make this generally available soon, so stay tuned for more information in future releases.

## More reliable and efficient package and dependency management

Your workflow depends on a wide variety of programming languages, binaries, integrations, and artifacts that are all important inputs or outputs as a result of your development process. The more efficiently you can manage your packages and dependencies, the less development time goes to waste, and with efficiency in mind, we've added the option to [quickly find and view generic packages](#quickly-find-and-view-generic-packages).

We've also made improvements to GitLab's Dependency Proxy, which, by the way, was made [available in Core](https://about.gitlab.com/blog/2020/10/30/minor-breaking-change-dependency-proxy/) in GitLab 13.6. 

You can now [avoid Docker rate-limits and speed up your pipelines with the Dependency Proxy](#avoid-docker-rate-limits-and-speed-up-your-pipelines) to assure confidence in reliability and improve efficiency when caching your container images hosted on DockerHub. 

Another improvement that many of you in the community were anticipating, the [Dependency Proxy now works with private projects](#use-the-dependency-proxy-with-private-projects) and addresses the limitations that prevented those of you with private projects from taking advantage of this feature. 

Last but not least, you'll be able to [use pre-defined variables with the Dependency Proxy](#use-pre-defined-variables-with-the-dependency-proxy) instead of relying on your own defined variables or hard-coding values in your `gitlab.ci-yml` file. This provides a more scalable and efficient way to get started proxying and caching images. 

## And more

Check out a few other awesome features shipping in 13.7 below:

- [Import requirements from a CSV file](#import-requirements-from-external-tools)
- [SAML user provisioning](#saml-user-provisioning-for-gitlabcom)
- [Set deployment traffic weight via UI](#set-deployment-traffic-weight-via-the-ui)
- [API support for Deployment Frequency](#api-support-for-deployment-frequency)

These are just a few highlights out of many new features and performance improvements. If you'd like to preview what's coming in next month’s release, check out our [Upcoming Releases](https://about.gitlab.com/direction/kickoff/) page as well as our [13.8 release kick off video](https://youtu.be/bWKdW-s9o9E).



