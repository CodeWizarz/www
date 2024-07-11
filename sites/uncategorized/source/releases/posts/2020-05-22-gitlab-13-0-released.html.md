---
release_number: "13.0" # version number - required
title: "GitLab 13.0 released with Gitaly Clusters, Epic Hierarchy on Roadmaps, and Auto Deploy to ECS" # short title (no longer than 62 characters) - required
author: Farnoosh Seifoddini # author name and surname - required
author_gitlab: fseifoddini # author's gitlab.com username - required
author_twitter: # author's twitter username - optional
image_title: '/images/13_0/13-0-cover-image.jpg' # cover image - required
description: "GitLab 13.0 released with Epic Hierarchy on Roadmaps, Auto Deploy to ECS, and much more to help you iterate quickly on a High Availability platform" # short description - required
twitter_image: '/images/13_0/13-0-cover-image.jpg' # social sharing image - not required but recommended
categories: releases # required
layout: release # required
featured: yes

# APPEARANCE
# header_layout_dark: true #uncomment if the cover image is dark
# release_number_dark: true #uncomment if you want a dark release number

# COVER IMAGE LICENCE
cover_img:
  image_url: "https://unsplash.com/photos/OIK7ce6mOW0" # required
  licence: Unsplash free license # which licence the image is available with - required
  licence_url: "#https://unsplash.com/license" # required

---

<!--
This is the release blog post file. Add here the introduction only.
All remaining content goes into data/release-posts/.

**Use the merge request template "Release-Post", and please set the calendar due
date for each stage (general contributions, review).**

Read through the Release Posts Handbook for more information:
https://about.gitlab.com/handbook/marketing/blog/release-posts/#introduction
-->


## Progress since GitLab 12.0

At this milestone release of 13.0, we’d like to take a moment to reflect. We’ve accomplished so much since our 12.0 release! We've put together a [blog to recap GitLab 12.0 to 12.10](https://about.gitlab.com/blog/2020/05/21/version-12-year-in-review/). Three favorites from version 12 releases include: [Requirements Management](https://about.gitlab.com/releases/2020/04/22/gitlab-12-10-released/#create-and-view-requirements-in-gitlab), [Container Network Security](https://about.gitlab.com/direction/govern/), and [Parent-child pipelines](https://about.gitlab.com/releases/2020/01/22/gitlab-12-7-released/#parent-child-pipelines). In addition to product enhancements, we've embraced [partnerships/integrations](https://about.gitlab.com/press/releases/2020-04-21-gitLab-ramps-up-channel-and-partner-investment-with-launch-of-a-new-global-partner-program.html), adding [integration guidelines](https://docs.gitlab.com/ee/development/integrations/secure.html) for third-party security scanners, and have grown our [professional services](https://about.gitlab.com/services/catalog/) to help you with things like Jira and Jenkins migrations. Our new channel, [Learn@GitLab](https://www.youtube.com/playlist?list=PLFGfElNsQthYDx0A_FaNNfUm9NHsK6zED) makes it easy to find many new how-to videos such as [Getting started with CI](https://www.youtube.com/watch?v=e0iQD1qgxZg&list=PLFGfElNsQthYDx0A_FaNNfUm9NHsK6zED&index=10&t=0s).

## Iteration is the key to resilience

GitLab is enabling IT and business teams to adapt, respond, and thrive. [Iteration](https://about.gitlab.com/blog/2020/02/04/power-of-iteration/) is the key. To do so you must collaborate rapidly, optimize for efficiency, and automate processes to handle security and compliance while you focus on delivering business value. GitLab 13.0 can help you iterate quickly and with greater insight. At the same time, access to Git repositories is critical, and we have enhanced our [Gitaly cluster for high availability Git storage](#gitaly-cluster-for-high-availability-git-storage) to ensure there are always multiple warm replicas ready to take over if an outage occurs.  

### Rapidly collaborate and respond across the entire team

GitLab builds upon capabilities that help with [collaborative development](https://www.youtube.com/watch?v=OFNUjvgm2_4), reporting, organizing, and managing work. Version control is foundational to collaboration and, with 13.0, we have added [version control for snippets](#versioned-snippets). To manage more complex projects, 13.0 allows you to [view the epic hierarchy on your roadmap](#view-epic-hierarchy-on-a-roadmap), [view how your epics line up with your various milestones](#view-milestones-on-the-roadmap), and [add a single or multiple milestones to your releases](#update-releases-milestone-in-web-ui) while [alerts upon closing an issue with open blockers](#raise-warning-when-closing-an-issue-with-open-blockers) help you focus on critical path items.  

Designers are an important part of the development team. While working on one of the most popular new features, the [dark themed web IDE](#dark-theme-in-the-web-ide), we [learned how](https://about.gitlab.com/blog/2020/05/20/creating-a-dark-ui-for-gitlabs-web-ide/index.html) to pull designers in to collaborate more closely. At the same time, we moved [Design Management to core](#design-management-moved-to-core) recognizing users who are designing products as individual contributors. 

### Optimize for efficiency

As many businesses strive to be more responsive and efficient, GitLab helps streamline existing software development processes. New features aimed at efficiency include things like [simplified deployment to Amazon ECS](#auto-deploy-to-ecs) and a new consolidated [list of alerts](#aggregate-it-alerts-from-external-tools-in-gitlab) that provides a single interface aggregating IT alerts originating from multiple sources. In addition, Terraform users will rejoice. GitLab 13.0 lets you [review the summary of `terraform plan` in Merge Requests](#review-summary-of-terraform-plan-in-merge-requests) and [use GitLab as an HTTP Terraform state backend](#gitlab-http-terraform-state-backend).


### Trust your processes and don’t sacrifice security or compliance

GitLab helps businesses embrace security and compliance controls end-to-end in the software development lifecycle, reducing risk and freeing up resources to focus on business critical needs. Our Application Security Testing capabilities help you [find and fix security vulnerabilities earlier](https://www.youtube.com/watch?v=UgCHtr-6uG8&list=PLFGfElNsQthYDx0A_FaNNfUm9NHsK6zED&index=2&t=0s) and for these, GitLab was just named as a [Niche Player](https://page.gitlab.com/resources-report-gartner-magic-quadrant-ast.html) in the 2020 Gartner Magic Quadrant for Application Security Testing. Since Gartner's evaluation of 12.4, we have added many new features. In 13.0 alone we've added the ability to [scan REST APIs via DAST](#rest-api-support-for-dast-scans) and a [full commit history scan for secrets](#secret-detection-for-the-full-history-of-a-repository) for even greater detection. More importantly, we have rearchitected the way we handle [vulnerability objects](#standalone-vulnerability-objects). This enabled the ability to [export vulnerabilities from the security dashboard](#export-vulnerabilities-list-from-project-security-dashboard) and will unlock many more robust [Vulnerability Management](https://about.gitlab.com/direction/govern/threat_insights/vulnerability_management/) capabilities in the future.  

In addition to security scanning, GitLab automates policies and, with 13.0, provides more granular control with new features such as setting a [deployment freeze with the Freeze Period API](#implement-a-deployment-freeze-with-the-freeze-period-api) to easily prevent an unintended production release during a specified period of time. To simplify audits, you can now [filter search for instance-level audit events](#filtered-search-for-instance-level-audit-events) as part of a the [larger epic](https://gitlab.com/groups/gitlab-org/-/epics/3179).


## Looking ahead 

We are excited about our [upcoming releases](https://about.gitlab.com/upcoming-releases/), particularly features that will help you:   
*  Establish a [compliance framework](https://about.gitlab.com/direction/dev/#enterprise-compliance) and automatically adopt associated controls and reporting  
*  Iterate with better insight with [A/B testing](https://gitlab.com/groups/gitlab-org/-/epics/2966) and control via several Feature Flag enhancements ([filter feature flags by status](https://gitlab.com/gitlab-org/gitlab/-/issues/35558), [A/B testing based on feature flags](https://gitlab.com/gitlab-org/gitlab/-/issues/34813), and the [ability to create feature flag from merge request](https://gitlab.com/gitlab-org/gitlab/-/issues/33394))
*  Identify bottlenecks and waste by visually depicting [Value Stream Analytics stages as a flow](https://gitlab.com/gitlab-org/gitlab/-/issues/210315) 
*  [Manage policies](https://gitlab.com/gitlab-org/gitlab/-/issues/214729) and let GitLab automate their use, including things like an [out-of-the-box Container Network Policy set](https://gitlab.com/gitlab-org/gitlab/-/issues/216074)
*  Work within an ecosystem to [fuzz test](https://gitlab.com/gitlab-org/gitlab/-/issues/33906) application APIs, and [read Vault CI variables](https://gitlab.com/gitlab-org/gitlab/-/issues/28321)

Want to see the complete list of what’s coming out NEXT month? Our [roadmap](https://about.gitlab.com/upcoming-releases/) is transparent and always available for you to contribute!  

Now, without further ado, check out more fabulous updates in 13.0 below!


