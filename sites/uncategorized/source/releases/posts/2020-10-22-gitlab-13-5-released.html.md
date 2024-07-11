---
release_number: "13.5" # version number - required
title: "GitLab 13.5 released with Mobile App Sec, Group Wikis, and more!" # short title (no longer than 62 characters) - required
author: Thao Yeager # author name and surname - required
author_gitlab: thaoyeager # author's gitlab.com username - required
author_twitter: # author's twitter username - optional
image_title: '/images/13_5/13_5-cover-image.jpg' # cover image - required
description: "GitLab 13.5 released with with Mobile App Sec scanning, Group Wikis, Generic Package Registry, and much more!" # short description - required
twitter_image: '/images/opengraph/release-posts/gitlab-13-5-released.png' # social sharing image - not required but recommended
categories: releases # required
layout: release # required

# APPEARANCE
header_layout_dark: true #uncomment if the cover image is dark
# release_number_dark: true #uncomment if you want a dark release number

# COVER IMAGE LICENCE
cover_img:
  image_url: "https://unsplash.com/photos/sz3AWACktLc" # required
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

One of GitLab’s core values is [collaboration](https://about.gitlab.com/handbook/values/#collaboration) and it's a key part of DevOps. This month we have several features aimed at collaboration among your team, across your tools, and with your peers as part of the **60 improvements** packed into this release.

## Mobile application security scanning

Community contributions are one of the best kinds of collaboration! One of our customers embraced our security scanning capabilities to [shift left](https://about.gitlab.com/solutions/dev-sec-ops/) and empower developers to find and fix security flaws, yet they also wanted the same abilities for iOS and Android mobile applications. Using our [integration guidance](https://docs.gitlab.com/ee/development/integrations/secure.html), they brought MobSF into the merge request pipeline and the [security dashboards](https://docs.gitlab.com/ee/user/application_security/security_dashboard/) alongside SAST and all the other [GitLab security scan](https://docs.gitlab.com/ee/user/application_security/) results.

For their contribution, Brian Williams and the H-E-B Digital team are this month’s [MVP](#mvp). This new Mobile SAST language coverage, combined with our existing [fuzz testing](https://docs.gitlab.com/ee/user/application_security/coverage_fuzzing/) for Swift and Java projects, now offers a valuable security testing solution for mobile apps.

Giving works both ways. Therefore, we have officially finished [moving Feature flags to core](#feature-flags-made-available-in-all-tiers), open-sourcing it for greater community engagement. This completes one more step of our [plan to move 18 features to Core](https://about.gitlab.com/blog/2020/03/30/new-features-to-core/).

## Group wikis and more!

Groups collaborate in many ways and we now offer a few more ways to do so. A feature long sought after is [Group Wikis](#group-wikis), with the most upvotes ever! Now you can have a central point of collaboration for your team at the group level. Accompanying this, you’ll find [deep-level wiki navigation](#deep-level-wiki-navigation) in the side bar for easier navigation.

Thanks to another community contribution, you can now easily launch your [Gitpod Workspace](#launch-gitpod-workspaces-directly-from-gitlab) directly from the GitLab interface.

A picture is worth a thousand words! During an incident, it can be hard to understand the sequence of events from threaded discussions. With the new [Timeline view for discussions in incidents](#timeline-view-for-discussions-on-incidents), you can toggle a timeline view of the discussion.

## Snippets and templates aid sharing

Snippets facilitate code sharing among group members. [Snippets with multiple files](#snippets-with-multiple-files) is now supported inside a single Snippet, so you can create and share complex Snippets composed of multiple parts. The sky’s the limit!

Templates promote best practices and consistency across teams. This month you'll find more templates such as a [template for deploying to AWS EC2](#template-for-deploying-to-aws-ec2), a new GitLab CI/CD [template for Terraform](#get-started-quickly-with-gitlab-and-terraform), and the new [SAST configuration UI](#sast-configuration-ui-improvements) that enables the GitLab CI/CD SAST template for users without CI/CD experience.

## Collaborating across tools

At GitLab, we want to [play well with others](https://about.gitlab.com/handbook/product/gitlab-the-product/#plays-well-with-others). Whether it’s pulling in [third-party security scanner results](https://docs.gitlab.com/ee/development/integrations/secure.html), or integrating with other DevOps tools, we want to meet you where you need us. Now with [Generic Package Registry](#generic-package-registry), you can store other binary types in GitLab that are not yet supported via raw package feeds and [attach binary assets to releases](#attach-binary-assets-to-releases), enabling release and build teams to effectively work in GitLab no matter what type of binary they are building in CI/CD.

### Of course there's more!

These are just a few highlights from the many new features and performance improvements described below.

If you'd like to preview what's coming in next month’s release, be sure to check out the [13.6 release kick off video series](https://www.youtube.com/results?search_query=13.6+release+kick+off) where the Product Managers highlight key features coming soon. Our [Upcoming Releases](https://about.gitlab.com/upcoming-releases/) page is where you can find all of the juicy details of our roadmap. Here, you can comment and upvote existing issues and contribute new ideas!

<!--
Reminder: the final paragraph should include the total number of new features
being released, including bugs, performance improvements, and contributions from
non-DevOps stages like Enablement. All of these should be listed in the release
post, either as headers or bullet points.
-->

