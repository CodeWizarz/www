---
release_number: "11.8" # version number - required
title: "GitLab 11.8 released with SAST for JavaScript, Pages for subgroups, and Error Tracking" # short title - required
author: Joshua Lambert # author name and surname - required
author_gitlab: joshlambert # author's gitlab.com username - required
author_twitter: gitlab # author's twitter username - optional
image_title: '/images/11_8/11_8-cover-image.jpg' # cover image - required
description: "GitLab 11.8 released with SAST for JavaScript, Pages for subgroups, and Error Tracking!" # short description - required
twitter_image: '/images/tweets/gitlab-11-8-released.png' # social sharing image - not required but recommended
categories: releases # required
layout: release # required
featured: yes
header_layout_dark: true #uncomment if the cover image is dark
# release_number_dark: true #uncomment if you want a dark release number
---

## JavaScript coverage in SAST
{: .intro-header}

GitLab Static Application Security Testing (SAST) scans source code and helps to detect potential security vulnerabilities early in the pipeline. In 11.8, we've added [SAST support for JavaScript](./#sast-support-for-javascript), building on top of our existing node.js support. Now any JavaScript file can be scanned, like static scripts and HTML. A vital practice in DevSecOps is to scan code changes with each commit, and with this change, we're covering one of the most popular web languages, helping you to find JavaScript risks as early as possible.

## GitLab Pages for subgroups and templates
{:.intro-header}

GitLab Pages got a whole lot better this release, with two key improvements. First, we have introduced [GitLab Pages support for projects in subgroups](./#pages-support-for-subgroups), enabling these projects to easily publish content to the web. GitLab 11.8 also bundles our most popular [templates for Pages](./#create-pages-sites-in-one-click-using-bundled-templates), so users can get started with just a single click.

## Error Tracking with Sentry
{: .intro-header}

Application errors provide important insight into the health of your application, and can help detect problems without waiting for users to report them. GitLab 11.8 can now [display the most recent errors](./#error-tracking-with-sentry) directly within the project, making them easier and quicker to find and take action on. 

## And many more great features!
{:.intro-header}

There are so many great features in this release, that we wanted to highlight a few more:

* [**Merge Request Approval Rules**](./#merge-request-approval-rules): Easily define rules for who needs to approve a change, whether it's a specific user, group, or role. Available on GitLab.com soon, and can be enabled in your own GitLab instance by an administrator.

* [**Feature Flags for Environments**](./#feature-flags-for-environments): Previously, feature flags were either on or off across all of your environments. No more! Feature flags can now be selectively enabled on a per-environment basis. Available on GitLab.com today, and can be enabled in your own GitLab instance by an administrator.

* [**Improved Squash Commit Messages**](#improved-squash-commit-messages): For those who enjoy crafting great commit messages, it can be sad to see them lost in a squashed commit to keep things tidy. On 11.8 squashed commits now automatically utilize the first multi-line commit message, and can also be overridden to make them even better.

