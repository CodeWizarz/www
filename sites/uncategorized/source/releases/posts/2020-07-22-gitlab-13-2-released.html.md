---
release_number: "13.2" # version number - required
title: "GitLab 13.2 released with Planning Iterations and Load Performance Testing" # short title (no longer than 62 characters) - required
author: Justin Farris # author name and surname - required
author_gitlab: justinfarris # author's gitlab.com username - required
image_title: '/images/13_2/13-2-cover-image.jpg' # cover image - required
description: "GitLab 13.2 released with iterations for milestones, diff changes for wiki pages, PHP Composer package support, load performance testing, and much more!" # short description - required
twitter_image: '/images/tweets/gitlab-13-2-released.png' # social sharing image - not required but recommended
categories: releases # required
layout: release # required
featured: yes

# APPEARANCE
# header_layout_dark: true #uncomment if the cover image is dark
# release_number_dark: true #uncomment if you want a dark release number

# COVER IMAGE LICENCE
cover_img:
  image_url: "https://unsplash.com/photos/-YTxNqp2FKY" # required
  licence: CC0 # which licence the image is available with - required
  licence_url: "https://unsplash.com/license" # required

---

GitLab 13.2 now helps teams **streamline project planning** with milestone iterations, **collaborate better for faster feedback** with diff changes for wiki pages, and **improve overall performance/efficiency** with load performance testing.


## Streamline agile project planning and management
{:.intro-header-h3}

Managing workflows and planning tasks for different teams can add a significant amount of development disruption to your day. In releasing our [Minimal Viable Change (MVC)](https://about.gitlab.com/handbook/values/#minimal-viable-change-mvc) of [**iterations**](#assign-issues-to-iterations) to break down work into smaller, more manageable, chunks, we're lessening this disruption and making project planning easier -- with many enhancements to come. If your team leverages Jira for project management, it's now easier for you to [**view Jira issues in GitLab**](#view-jira-issue-list-in-gitlab) because we believe that GitLab should [play well with others](https://about.gitlab.com/handbook/product/gitlab-the-product/#plays-well-with-others) and balance integrations with native capabilities. If you're using epics to plan and manage large projects, then you can now protect sensitive content with [**confidential epics**](#organize-sensitive-work-into-confidential-epics). When you need to update several related epics, you can now [**bulk edit epics**](#bulk-edit-the-epic-for-multiple-issues-from-the-issues-list) to reduce your "tab overload" and the number of clicks it takes to update.


## Better collaboration for faster feedback
{: .intro-header}

Clear communication is key to effective collaboration because it enables development teams to get faster feedback on changes before pushing them to production.  The ability to [**diff changes for wiki pages**](#wiki-page-diffs) now makes edit history comparisons between page versions quicker and simpler, similar to viewing files in a repository.  [**Realtime feedback for** `.gitlab-ci.yml` **in the Web IDE**](#real-time-feedback-for-gitlab-ciyml-in-web-ide) makes updating your CI pipeline more efficient by enabling realtime linting and autocompletion. Now you don't have to remember all of the parameters when configuring your CI pipeline or switch contexts to get the information you need. 

Designers are incredibly important members of the team and 13.2 includes great improvements to design management. It's now [**easier to find designs in an issue**](#make-it-easier-to-find-designs-on-an-issue) so it takes less time, and the [**official GitLab Figma plugin**](#official-gitlab-figma-plugin) simplifies the process of uploading from Figma to issues on GitLab.com.

## Improved performance and efficiency
{: .intro-header}

13.2 delivers new updates to improve your team's efficiency and performance.  You can now take advantage of [**advanced global search on GitLab.com**](#advanced-global-search-now-available-on-gitlabcom), a capability that improves search relevancy, performance, and allows for group-wide searches across all projects directly in the UI. Application performance is a challenge every development team faces and now [**load performance testing**](#load-performance-testing) in GitLab makes it easy to run custom load tests as part of your CI/CD pipelines to better understand how your application will perform under stress. 

Nowadays, it seems like everyone is working from home and are "distributed" more than ever. GitLab Geo helps remote teams work more efficiently by using a local GitLab node, and now offers [**improved replication performance for projects**](#faster-geo-replication-performance-for-projects) to ensure local content is fresh. Last but not least, GitLab [**includes CI test results within Release Evidence**](#include-ci-test-results-in-release-evidence) for easy access in the event you need to provide compliance data or a more efficient way to show relevant changes to production during audit.

### And much much more!
{:.intro-header-h3}

There’s never enough space to highlight all the great features in our releases. An important development for package management that's worth noting: GitLab now supports the PHP dependency manager, Composer, so you can [**discover, share, and install PHP dependencies using GitLab's Composer Repository with ease**](#manage-php-dependencies-with-the-gitlab-composer-repository). 

Here are several other cool features that you should check out:
* [**Associate Feature Flags with related issues**](#associate-feature-flags-with-related-issues)
* [**Container Host Monitoring and Blocking**](#container-host-monitoring-and-blocking)
* [**IBM z/OS Mainframe support for GitLab Runner**](#gitlab-runner-support-for-linux-on-ibm-z).
* [**Code Quality Merge Request widget moved to Core**](#code-quality-merge-request-widget-moved-to-core)

If you'd like to preview what's coming in the *next* release, be sure to check out our 13.3 [kickoff video](https://youtu.be/wivB1X_N0QQ)!
