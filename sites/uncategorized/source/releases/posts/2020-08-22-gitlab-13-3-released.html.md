---
release_number: "13.3" # version number - required
title: "GitLab 13.3 released with coverage-guided fuzz testing and a build matrix for CI/CD" # short title (no longer than 62 characters) - required
author: Kevin Chu # author name and surname - required
author_gitlab: kbychu # author's gitlab.com username - required
author_twitter: # author's twitter username - optional
image_title: '/images/13_3/13-3-cover-image.jpg' # cover image - required
description: "GitLab 13.3 released with on-demand DAST, MR Analytics, Compliance dashboard, Pod health dashboard and much more!" # short description - required
twitter_image: '/images/opengraph/13-3-social-opengraph.png' # social sharing image -  required
categories: releases # required
layout: release # required
featured: yes

# APPEARANCE
# header_layout_dark: true #uncomment if the cover image is dark
release_number_dark: true #uncomment if you want a dark release number

# COVER IMAGE LICENCE
cover_img:
  image_url: "https://unsplash.com/photos/S7cyjr_3prc" # required
  licence: CC0 # which licence the image is available with - required
  licence_url: "https://unsplash.com/license" # required

---

DevSecOps helps teams detect and resolve faults and vulnerabilities early in the software development process. In GitLab 13.3, building secure software is easier with fuzz testing in your development workflow. With **coverage-guided fuzz testing** and **on-demand DAST (Dynamic Application Security Testing)**, discovering real-world software vulnerabilities is faster and more efficient. At the same time, releasing code more frequently is made simpler with the new **build matrix for CI/CD**. Finally, the **Pod health dashboard** increases Ops' efficiency by reducing their context switching: all Kubernetes pods health primitives are in the dashboard. We hope that you find these top features, and the **69 new features** packed in this release, useful.

## Faster remediation: Find and prevent defects and vulnerabilities earlier
{: .intro-header}

With [coverage-guided fuzz testing](#coverage-guided-fuzz-testing-for-go-and-cc-applications), it's now easier to efficiently surface and solve vulnerabilities in C, C++, and Go. In GitLab 13.3 all our SAST (Static Application Security Testing) analyzers are [available to everyone](#sast-security-analyzers-available-for-all) and it has never been easier [to set them up](#guided-sast-configuration-experience). Finally, [running DAST from the GUI](#on-demand-dast-scans) is now more convenient. More importantly, security staff can tackle vulnerabilities faster by leveraging the new [vulnerability evidence](#dast-vulnerability-evidence) included in the DAST output.

## Reduce cycle time, release more frequently
{: .intro-header}

Building powerful workflows is now easy with the new [build matrix](#create-a-matrix-of-jobs-using-a-simple-syntax): define keys and values once, release and deploy multiple times. Teams can increase velocity by measuring Merge Request throughput now available in the [MR Analytics Dashboard](#merge-request-analytics). Also, MR authors can now integrate code faster by acknowledging their code review requests have been answered [at a glance](#merge-request-approvals-show-who-participated-in-the-review). This acknowledgment of fulfilled duties by different roles in MRs are now traceable in the [Compliance Dashboard](#compliance-dashboard-shows-more-information). Maintainers can also suggest to their contributors a [Squash Commit policy](#squash-commits-options). Lastly, rollouts can be more targeted and controlled using the newly named [feature flags strategy called Percentage of Users](#rename-feature-flag-user-strategies).

## Enable your delivery teams to be more productive and efficient
{: .intro-header}

Software development is mostly about building and distributing packages. To make that easier and with usability in mind, we overhauled the whole [Package registry](#improved-presentation-of-package-metadata-and-activity) GUI and made it [available for everyone in Core](#package-registry-now-available-in-core). Plus, it has never been easier to publish [NuGet packages](#use-ci-job-token-to-publish-nuget-packages) in an automated way. Once deployed, your teams won't need to worry about the health of their systems. All relevant action can be now taken based on information from the [Pod health dashboard](#kubernetes-pod-health-dashboard).

<!--
Suggestion: describe each feature briefly in just a few words, using
anchors to link to their headings (use the relative path). The intro is supposed
to be eyes-catching, so "be happy" about it, describe them enthusiastically.
Focus on what are the advantages on having each of them. For some guidance,
look at the intros of past release posts.
-->

### It doesn’t stop here: there is more!
{: .intro-header}

GitLab is used by companies with thousands of users in teams working synchronously and asynchronously across continents. To do so, we are focused on improving its [fault tolerance](#concurrent-git-repository-backups) and [read/write operation synchronicity](#gitaly-cluster-reference-transactions) on every release. Overall, we are making [GitLab lightning fast](#geo-is-faster-and-easier-to-maintain) across the globe.


Here are several other cool features that you should check out:
* [**Change the sort order of designs**](#drag-and-drop-to-reorder-designs)
* [**JUnit reports are now much easier to read and understand**](#junit-report-improvements)
* [**Feature flag strategy will now show in your feature flag view**](#display-strategy-information-on-feature-flags-list-view)
* [**Manage IT Incidents**](#create-and-manage-it-incidents-in-gitlab)

If you'd like to preview what's coming in the *next* release, be sure to check out our 13.4 [kickoff video](https://www.youtube.com/watch?v=50fqa7qsI_I)!

<!--
Reminder: the final paragraph should include the total number of new features
being released, including bugs, performance improvements, and contributions from
non-DevOps stages like Enablement. All of these should be listed in the release
post, either as headers or bullet points.
-->
