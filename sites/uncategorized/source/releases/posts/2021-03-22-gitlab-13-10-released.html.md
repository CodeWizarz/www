---
release_number: "13.10" # version number - required
title: "GitLab 13.10 released with Admin Enhancements and Vulnerability Management" # short title (no longer than 62 characters) - required
author: Christen Dybenko # author name and surname - required
author_gitlab: cdybenko # author's gitlab.com username - required
author_twitter: # author's twitter username - optional
image_title: '/images/13_10/13_10-cover-image.jpg' # cover image - required
description: "GitLab 13.10 released with Admin Enhancements, Programatic Vulnerability Management, and much more!" # short description - required
twitter_image: '/images/13_10/13_10-cover-image.jpg' # required - copy URL from image title section above
categories: releases # required
layout: release # required
featured: yes

# APPEARANCE
# header_layout_dark: true #uncomment if the cover image is dark
release_number_dark: true #uncomment if you want a dark release number

# COVER IMAGE LICENCE
cover_img:
  # image_url: "https://unsplash.com/photos/hLxqYJspAkE" # required
  image_url: "https://unsplash.com/photos/MVr6pgZzlbY"
  licence: CC0 # which licence the image is available with - required
  licence_url: "https://unsplash.com/license" # required

---

GitLab 13.10 is now available! This month, we’ve focused on scalability and manageability across the product so you can iterate and innovate faster, with greater security and fewer headaches. 13.10 offers administrative enhancements to help scale DevOps in your org, Geo package integrity verification to improve Disaster Recovery, vulnerability management automation to apply efficiency and consistency to security processes, and—as always—a ton of fantastic contributions from the wider community.  These are just a few of the **40+ new features and improvements** in this release.


## Scaling DevOps

Managing a growing DevOps org is challenging. GitLab 13.10 introduces several new features to automate routine tasks, boost your efficiency, and grow DevOps  within the organization without losing control. We’ve leveled up support for DORA metrics with a new API to [track lead time for changes (via merge requests)](#dora4-based-lead-time-for-changes) on the project level, as well as [Deployment Frequency metrics via API at the group level](#group-level-api-support-for-deployment-frequency), so you can track and identify blockers across a portfolio of projects.

When issues _do_ arise, we've added tools to help you [integrate and manage alerts from multiple monitoring solutions](#integrate-any-it-alerting-tool-with-gitlab). 13.10 also enhances disaster recovery (DR) for customers using GitLab Geo by [automatically verifying the data integrity of replicated Package Registries](#geo-verifies-replicated-package-files) and [replicating group wikis](#geo-supports-replicating-group-wikis). And finally, we're extremely excited to announce [General Availability of GitLab Runner Operator on Red Hat OpenShift](#gitlab-runner-for-red-hat-openshift-ga), bringing GitLab to even more platforms!

## Scaling Vulnerability Management
In 13.10, our security team has focused on reducing the overhead of managing and sharing vulnerabilities. [Bulk Status Updates](#vulnerability-bulk-status-updates) allow security teams to modify the status of multiple vulnerabilities simultaneously. To help you identify and triage relevant information quickly, we've introduced [clickable file and line number links](#clickable-file-and-line-number-links-on-vulnerability-report) in vulnerability reports that will deep-link you directly to relevant vulnerability details. We've also [enhanced the interactivity of the vulnerability trends chart to make it easier to find and share information.](#add-icons-to-the-vulnerability-trends-chart)

## Wider community contribution highlights

Every month we receive hundreds of contributions from the wider community, and in addition to [this month's MVP](#mvp), we'd like to show our appreciation to a few of our many outstanding contributors.

Ongoing thanks to [Yogi](https://gitlab.com/yo) for dozens of contributions to 13.10, as well as months of amazingly consistent contributions and throughput. You are an example of [iteration](https://about.gitlab.com/handbook/values/#iteration) in action, and you continue to tackle challenges with [boring solutions](https://about.gitlab.com/handbook/values/#boring-solutions) that deliver amazing results!

Thank you, [Daniel Schömer](https://gitlab.com/quatauta) for your iterations toward a [more consistent UX in project settings](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/56269#current-behavior-no-on-click-on-tap-expandcollapse)!

Thanks to [Felix Haase](https://gitlab.com/haasef) for his work on [cloning projects from within Visual Studio Code](#clone-project-inside-visual-studio-code)!

Thank you to [@KevSlashNull](https://gitlab.com/KevSlashNull) for his work enabling [one-click opening of projects in VS Code](#open-project-in-visual-studio-code)!

GitLab is a DevOps platform, and a huge reason for that is you. We're a community, and in 13.10 alone we enjoyed [over 250 merged wider community contributions](https://gitlab.biterg.io/goto/937475d38035f496df3501c9b30af5ef). Selecting one MVP wasn't easy; thank you all for your professionalism and hard work.

## And so much more!

Some of our favorite quality of life improvements in 13.10 include:
 - [Dozens of quality of life usability improvements](https://nicolasdular.gitlab.io/gitlab-polish-gallery/?milestone=13.10)
 - [Search for and autocomplete by full name in mentions in comments](#search-and-autocomplete-by-full-name-in-comment-mentions)
 - [Automatically retarget merge requests](#automatically-retarget-merge-requests)
 - [Horizontal navigation for Value Stream Analytics](#horizontal-navigation-for-value-stream-analytics)

Read on for more features, performance enhancements and changes! To preview what's coming in next month’s release, check out our [Upcoming Releases](/direction/kickoff/) page and our [13.11 release kickoff video](https://youtu.be/cVOkOTkQZ-A).
