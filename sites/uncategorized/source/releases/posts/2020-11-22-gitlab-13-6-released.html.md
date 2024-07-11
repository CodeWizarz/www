---
release_number: "13.6" # version number - required
title: "GitLab 13.6 released with Auto Deploy to EC2 and Usage Trends Dashboard " # short title (no longer than 62 characters) - required
author: James Heimbuck # author name and surname - required
author_gitlab: jheimbuck_gl # author's gitlab.com username - required
#author_twitter: # author's twitter username - optional
image_title: '/images/13_6/13_6-cover-image.jpg' # cover image - required
description: "GitLab 13.6 released with Auto Deploy to EC2, Usage Trends Dashboard, Full Code Quality Report and much more!" # short description - required
twitter_image: '/images/opengraph/release-posts/gitlab-13-6-released.png' # social sharing image - not required but recommended
categories: releases # required
layout: release # required
featured: yes

# APPEARANCE
# header_layout_dark: true #uncomment if the cover image is dark
# release_number_dark: true #uncomment if you want a dark release number

# COVER IMAGE LICENCE
cover_img:
  image_url: "https://unsplash.com/photos/Oadvsf3xH9E" # required
  licence: CC0 # which licence the image is available with - required
  licence_url: "https://unsplash.com/license" # required

---

At GitLab, we are focused on improving developer productivity and satisfaction. And GitLab 13.6 has all the right ingredients to help you achieve all that and more! We hope that you find these top features, and the **60+ new features and improvements** packed in this release, useful.

## Improved ease of use and automation for efficiency

To make it easy for you to get started with GitLab CI/CD with Amazon Web Services (AWS), Auto DevOps has now been extended to support AWS, so you can now [Auto-Deploy to Amazon EC2](#auto-deploy-to-ec2) using Auto DevOps without using Kubernetes (as previously required by Auto DevOps). 

Docker Hub has enforced rate limits on `docker pull` requests. We have [mitigated the impact](/blog/2020/10/30/mitigating-the-impact-of-docker-hub-pull-requests-limits/) for our SaaS and self-managed users and have shared ways to [monitor the limits with Prometheus](/blog/2020/11/18/docker-hub-rate-limit-monitoring/) in your environments. We want all our users to stay safe with their CI/CD pipelines and Kubernetes clusters. We are moving the [Dependency Proxy](#the-dependency-proxy-is-now-open-source) to Core available for everyone.

Listening to the community’s feedback to have a more descriptive default branch, Group owners now have more flexibility in configuring a custom [default initial branch name for new repositories](#customize-the-initial-branch-name-for-new-projects-within-a-group) as opposed to the `master` branch. Speaking of defaults, the Static Site Editor can use a [default merge request template](#merge-request-templates-for-static-site-editor-changes) across a project, reducing the need to navigate to the merge request after submission to update the description.


## Improved visibility for faster decision making

You cannot fix what you cannot find. With 13.6, we’ve made improvements to several dashboards and reports to aid you with faster decision making.

With the [code quality severity](#display-code-quality-severity-ratings) included within the merge request and the [Full Code Quality Report](#generate-html-reports-for-code-quality), you can now quickly determine which code quality violations are critical to resolve before merging. Thanks for the community contribution with Code Quality Report, [Vicken Simonian](https://gitlab.com/vicken.papaya)!

We’ve made updates to the [Project Security Dashboard](https://docs.gitlab.com/ee/user/application_security/security_dashboard/#project-security-dashboard) to include the [results of the latest run pipeline security scan](#pipeline-status-in-project-security-dashboard) and also a [dynamic vulnerability trend chart](#new-vulnerability-trends-chart) to help you stay on top of the real time and historical vulnerability trends. We've also added the [fuzz testing results in the merge request](#coverage-guided-fuzz-testing-artifacts-available-in-merge-request-widget) along with the other security results and improved the readability of this report by adding the source file name and line number to help you quickly find the exact crash location and fix it.

GitLab Self Managed Administrators can [now see their organization's usage trends](#visualize-users-projects-groups-issues-mrs-and-pipeline-activity) for popular features such as users, projects, groups, issues, and pipelines over the last 12 months.

## Improved extensibility for a seamless workflow

We aim to [play well with other popular tools](/handbook/product/gitlab-the-product/#plays-well-with-others) you may be using in your environment so that you have a seamless experience, even when you use only a few parts of GitLab. With 13.6, to enable easy access and collaboration from within VS Code, we’ve improved our [extension with VS Code](https://docs.gitlab.com/ee/user/project/#gitlab-workflow---vs-code-extension) to [insert Snippets](#insert-gitlab-snippets-directly-in-vs-code), view and comment on merge requests and issues directly from VS Code rather than switching to the GitLab interface.

GitLab [integrations](#group-level-management-of-project-integrations) can now be configured at a group level in addition to instance and project level - helping group owners manage integrations with ease. 

## And more

To enable you to grow beyond the [10GB per project storage limit](/pricing/), we recently introduced an add-on to [purchase additional storage](https://customers.gitlab.com/) for your group or personal name space. In addition to [Dependency Proxy](#the-dependency-proxy-is-now-open-source), we've also moved [Tracing](#tracing-has-been-moved-to-core) to Core as part of this release.

These are just a few highlights from the many new features and performance improvements described below. If you'd like to preview what's coming in next month’s release, check out our [Upcoming Releases](/upcoming-releases/) page as well as our [13.7 release kick off](https://www.youtube.com/playlist?list=PL05JrBw4t0KoDQr8x2MaumyU7d8_6icNH) video series where the Product Managers highlight key features coming in the next release.
