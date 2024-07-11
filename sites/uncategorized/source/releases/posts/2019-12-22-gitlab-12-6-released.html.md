---
release_number: "12.6"
title: "GitLab 12.6 released with Security Scorecard and Release Evidence"
author: Gabe Weaver
author_gitlab: gweaver
author_twitter: gabeweaver
image_title: '/images/12_6/12_6-cover-image.jpg'
description: "GitLab 12.6 released with Security Scorecard, Release Evidence, Conan C/C++ repository, and much more!"
twitter_image: '/images/tweets/gitlab-12-6-released.png'
categories: releases
layout: release
featured: yes
header_layout_dark: true
# release_number_dark: true #uncomment if you want a dark release number
---

A common challenge many development leaders face is having visibility into the overall [application security](/solutions/dev-sec-ops/) and [compliance](/solutions/compliance/) status of their projects. This month's GitLab release helps you more efficiently monitor the application security and release compliance of your projects. 

##  **Security Visibility with Project Security Status**
{:.intro-header}

With GitLab 12.6, a new [Project Security Status panel](#quickly-understand-your-at-risk-projects-with-project-security-grades) shows how projects are ranked according to their security profile. This makes it easier for development leaders to quickly understand which projects may have greater risk and therefore might warrant additional attention to address specific issues.

###  **Streamline Audits with Release Evidence**
{:.intro-header-h3}

Almost every enterprise development team is expected to document and demonstrate that each release complies with their organization’s policies, procedures, and controls. Often it means they have a manual processes to save the documentation so that future audits can review the compliance evidence. GitLab 12.6 makes audits and compliance much easier, with a [release evidence file](#automated-release-evidence-collection-to-support-audits) in the form of a JSON object that includes links to the milestones and issues that were included in the release, which can help to streamline future audits.

###  **Efficiently Manage and Share C/C++ Resources**
{:.intro-header-h3}

Many teams are actively developing new high performance applications in C and C++ and they need the ability to easily store and manage the compiled files and binaries from their projects.  GitLab 12.6 now helps teams writing code in C and C++ to manage and share both privately and publicly the binaries from their projects with the popular [Conan repository built into GitLab](#manage-cc-packages-via-conan-within-gitlabs-package-registry). They can now benefit from having source code, automated GitLab CI pipelines and the resulting packages in the same application which will help improve their overall efficiency and velocity.

### **And Much More**
{:.intro-header-h3}

These are just a few of the highlights in 12.6. Check out the other great updates, such as [dependency scanning for Java Gradle projects](#dependency-scanning-for-java-gradle-projects) and [support for squash-and-merge within Merge Trains](#maintain-a-consolidated-commit-history-with-squash-and-merge-in-merge-trains).

Also, [registration is open](https://www.eventbrite.com/e/gitlab-commit-2020-san-francisco-tickets-73836706577) for the next [GitLab Commit User Conference](https://www.eventbrite.com/e/gitlab-commit-2020-san-francisco-tickets-73836706577) in San Francisco, January 14.
