---
release_number: "12.3"
title: "GitLab 12.3 released with Web Application Firewall and Productivity Analytics"
author: Kai Armstrong
author_gitlab: phikai
image_title: '/images/12_3/12_3-cover-image.jpg'
description: "GitLab 12.3 released with Web Application Firewall, Productivity Analytics, Enhanced Compliance and much more!"
twitter_image: '/images/tweets/gitlab-12-3-released.png'
categories: releases
layout: release
featured: yes
header_layout_dark: true #uncomment if the cover image is dark
# release_number_dark: true #uncomment if you want a dark release number
---
This month's release of GitLab 12.3 is especially exciting following an eventful week in which we hosted our first GitLab Users Conference in Brooklyn New York and announced the completion of a [$268 million Series E round of fundraising](/blog/2019/09/17/gitlab-series-e-funding/); which will enable us to invest in making all of our DevOps platform offerings, including monitoring, security, and planning, best in class.    
## Web Application Firewall
{: .intro-header}

Modern web applications are exposed to new risk from many places, including potentially every client that connects and sends traffic. A Web Application Firewall (WAF) provides monitoring and rules to protect applications in production.  In GitLab 12.3 we are shipping our first iteration of a [Web Application Firewall](#web-application-firewall-for-kubernetes-ingress) built into the GitLab SDLC platform. Its focus is on monitoring and reporting of security concerns related to your Kubernetes clusters. Future releases will expand the WAF capabilities to block malicious traffic, create and manage firewall rules, and inform earlier stages of development to take action to further reduce risk.

### Productivity Analytics - First Release
{:.intro-header-h3}

Software delivery teams everywhere need the right information and insight in order to improve their productivity and efficiency. Too often, invisible bottlenecks and roadblocks force teams to wait and waste time rather than delivering new features. Beginning with 12.3, we’re starting to release new analytics features to help teams and leaders better understand their overall productivity and effectiveness for both Groups and Projects. [Productivity Analytics](#productivity-analytics) will help teams and their leaders discover best practices to improve productivity. Initially focusing on the time it takes to merge MRs, GitLab will make it possible to drill into the data and learn insight that can guide future improvements. In many organizations, leaders are responsible for multiple projects and [Group level analytics workspace](#analytics-workspace) is intended to provide productivity and performance insight and visibility across multiple projects. These two features are only the first in a series of updates that will specifically improve visibility and insight so that teams can become more efficient.

### Enhanced Compliance
{:.intro-header-h3}

Compliance with policies and procedures is a common challenge that software teams face. For many GitLab users, having development teams collaborate in a single application makes compliance easier. In this 12.3 release of GitLab, we're including several features that will continue to streamline efforts to reduce compliance risks. [MR approval rules](#leverage-merge-request-approvals-to-prevent-merging-prohibited-licenses-mvc) provides a way to prevent teams from merging in code that introduces unsupported licenses. [Require code owner approval per branch](#api-to-require-merge-request-approval-by-code-owners-per-branch) makes it possible to protect branches and require code owner approval of changes.

### And much more!
{:.intro-header-h3}

There are so many great features within GitLab 12.3 that we couldn’t possibly highlight them all (even though we really want to). Better resource visibility with [Global view for group-level cluster deployments/environments](#global-view-for-group-level-cluster-deploymentsenvironments), more efficient Git fetches with [Compress Git ref advertisements over HTTP](#compress-git-ref-advertisements-over-http), and more efficient reviews with [Keyboard Shortcut for Next and Previous Unresolved Discussion](#keyboard-shortcut-for-next-and-previous-unresolved-discussion)

Register now to join us at our first [European user conference in London on Oct 9!](/events/commit/)
{: .alert .alert-info .text-center}