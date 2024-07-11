---
release_number: "12.8" # version number - required
title: "GitLab 12.8 released with Log Explorer, NuGet, and Compliance" # short title (no longer than 62 characters) - required
author: Tim Rizzi # author name and surname - required
author_gitlab: trizzi # author's gitlab.com username - required
author_twitter: tim_rizzi # author's twitter username - optional
image_title: '/images/12_8/12_8-cover-image.jpg' # cover image - required
description: 'GitLab 12.8 is here celebrating "one place!" Get one place for your logs, one place for your NuGet packages, and one place for your compliance activity just like GitLab is one place for your entire DevOps lifecycle.' # short description - required
twitter_text: 'GitLab 12.8 is here celebrating "one place!" Get one place for your logs, one place for your @nuget packages, and one place for your compliance activity just like @GitLab is one place for your entire DevOps lifecycle.'
twitter_image: '/images/tweets/gitlab-12-8-released.png' # social sharing image - not required but recommended
categories: releases # required
layout: release # required
featured: yes

# APPEARANCE
header_layout_dark: true #uncomment if the cover image is dark
# release_number_dark: true #uncomment if you want a dark release number

# COVER IMAGE LICENCE
cover_img:
  image_url: "https://unsplash.com/photos/sFLVTqNzG2I" # required
  licence: Unsplash free license
  licence_url: 'https://unsplash.com/license'

---

GitLab 12.8 is here celebrating "one place!" Get one place for your logs, one place for your NuGet packages, and one place for your compliance activity just like GitLab is one place for your entire DevOps lifecycle.

## Triage faster with the new Log Explorer
{:.intro-header}

When triaging an incident or validating the status of your service you need to be able to explore Kubernetes Pod Logs from across your entire application. Previously, this was a painful process as you could only see limited logs, couldn't go back in time, and didn't have search. This was complex and time-consuming enough that it could make using Pod Logs impractical for meaningful analysis and instead limit it to simple troubleshooting use cases.

Now, a new [Log Explorer](#explore-aggregated-logs) lets you interact with all your logs aggregated into one place. Powerful features including filtering, time picker, and full-text search let you quickly get the information you need. This important milestone moves our [Logging category](/direction/monitor/observability/) from `minimal` to `viable`!  To get started, [install the Elastic stack](https://docs.gitlab.com/ee/user/clusters/applications.html#elastic-stack) on your Kubernetes cluster with just one click using the GitLab Managed app, and your logs will be automatically collected and aggregated.

## Efficiently store and share C# and .NET resources
{:.intro-header}

Windows has a large, active, and growing development community. While GitLab has already had built-in package management for [C/C++](https://docs.gitlab.com/ee/user/packages/conan_repository/index.html), [Java](https://docs.gitlab.com/ee/user/packages/maven_repository/index.html), and [Node.js](https://docs.gitlab.com/ee/user/packages/npm_registry/index.html), teams writing applications in C# and .NET still needed to use tools external to GitLab in order to store and manage their binaries. This meant they were missing out on the [benefits of using a single application](/topics/single-application/) across their DevOps lifecycle.

Now, GitLab 12.8 gives teams writing code in C# and .NET a built-in [NuGet repository](#build-publish-and-share-packages-to-the-gitlab-nuget-net-repository) so they have one place to manage and share project binaries both privately and publicly. Developers can now benefit from having their source code, CI/CD pipelines, and the resulting packages all in the same application so they can get work done faster with less effort.

## Manage risk with the Compliance Dashboard
{:.intro-header}

Merge requests (MRs) are an elegant and powerful change management tool for keeping a record of changes and approvals. Release teams use MRs to track deployments, and infrastructure teams use MRs to practice [GitOps](/topics/gitops/gitops-multicloud-deployments-gitlab/).

Additionally, tracking all MR activity can be critical for organizations that have specific company policies that govern their operations in order to adhere to compliance frameworks, such as SOC 2, ISO 27001, GDPR, SOX, HIPAA, or PCI-DSS, and have specific company policies that govern their operations.

Some examples of governing policies are:

* All MRs have a related issue with detailed information about the change(s)
* All MRs are reviewed and approved by someone who isn't the author
* All MRs pass QA and security testing
* Any exceptions to the requirements require separate approval.

Previously, GitLab users lacked the necessary tools to effectively manage their GitLab environment's change management and compliance. Project-level activity was confined to each project, and there was no easy way to view this information in aggregate at the group level. This lack of control and insight created increased potential for risk, reducing users' ability to manage compliance within GitLab.

We have a [vision for adding robust compliance management](https://about.gitlab.com/direction/govern/compliance) to Gitlab. As a first step towards this vision, we're starting with a [Compliance Dashboard](#compliance-dashboard) which provides a view of the most recent merge requests for each project in a Group. With the capabilities available today, you can manage auditing of your code changes for releases and GitOps from one place. Similarly, this makes it easier for compliance-focused organizations to quickly understand which projects might have greater risk and therefore warrant extra attention. Be on the lookout for [more capabilities and improvements](https://about.gitlab.com/direction/govern/compliance/compliance-management/#whats-next--why) in our coming releases.

## And much more!
{:.intro-header}

These are just a few highlights in 12.8. Check out the other great updates, such as [blocking issues](#blocking-issue-support), [Docker image expiration policies](#leverage-policies-to-remove-docker-images), and [Single-level Epics, now available in Premium](#single-level-epics-now-available-in-premium)!
