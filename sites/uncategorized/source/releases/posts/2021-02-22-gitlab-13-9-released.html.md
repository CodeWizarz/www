---
release_number: "13.9" # version number - required
title: "GitLab 13.9 released with a Security Alert Dashboard and Maintenance Mode" # short title (no longer than 62 characters) - required
author: Andrew Thomas # author name and surname - required
author_gitlab: awthomas # author's gitlab.com username - required
author_twitter: # author's twitter username - optional
image_title: '/images/13_9/13_9-cover-image-2.jpg' # cover image - required
description: "GitLab 13.9 released with a Security Alert Dashboard, Maintenance Mode, and so much more!" # short description - required
twitter_image: '/images/13_9/13_9-cover-image-2.jpg' # required - copy URL from image title section above
categories: releases # required
layout: release # required
featured: yes

# APPEARANCE
header_layout_dark: false
release_number_dark: true

# COVER IMAGE LICENCE
cover_img:
  image_url: "https://unsplash.com/photos/VWN4l3OBT6w" # required
  licence: CC0 # which licence the image is available with - required
  licence_url: "https://unsplash.com/license" # required

---

GitLab 13.9 is now available to strengthen DevSecOps at scale, with a Security Alert Dashboard to triage high priority alerts, Maintenance Mode for unfailing support of distributed teams, better visibility including additional support for DORA metrics, and advanced automation capabilities that will help you deliver “better products, faster.” These are just a few of the **60+ significant new features and improvements** in this release.

## DevSecOps at scale
{: .intro-header}

Keeping a production environment both secure and available are top priorities, but they can be difficult to balance. Our new [Security Alert Dashboard](#security-alert-dashboard-for-container-network-policy-alerts) will help you balance security and reliability, by discerning between suspicious network activity that needs to be blocked immediately or that only needs further attention, minimizing disruption to users. We're also excited to add [JavaScript and Python support for coverage-guided fuzz testing](#javascript-and-python-support-for-coverage-guided-fuzz-testing), making it easier to build secure and reliable software, with results piped into your Security Dashboard.

GitLab is built for distributed teams. Our new [Maintenance Mode](#maintenance-mode) enables read-only availability of your instance during more admin tasks, further reducing downtime. Scale and redundancy in data storage are improved with [variable Gitaly replication factors](#override-gitaly-cluster-replication-factor-for-specific-repositories), so you can tune your cluster to your own storage and budget constraints, while also enabling horizontal scaling.

Visibility is another core requirement in scaling DevOps, and [Release Analytics at the group level](#release-analytics-at-the-group-level) continues to grow our support of DORA metrics, now aggregated for projects in a group. The [new failed-test counter in Unit Test Reports](#easily-see-repeat-failed-tests-in-unit-test-reports) and a [new merge request metric, mean time to merge](#new-merge-request-metric-mean-time-to-merge) help you achieve and understand underlying efficiencies.

## Automate your way to better products, faster

If you’re new to DevOps or renewing stalled efforts, an edict to deliver “better products, faster” can sound a little like “doing more, with less;” it may feel counterintuitive. But DevOps is the answer and automation is the key to doing both well.

One sure way to build and test faster is to look for redundancies in configuration. A new function in 13.9 saves you time by enabling [reuse in your pipeline of a CI/CD configuration from any job](#select-cicd-configuration-from-any-job-and-reuse-it), even if it's in another file.

Automating at scale often requires mitigating complexity. When you’ve broken down your pipeline configuration into many files, you’ll like that you can now [view an expanded version of the configuration](#view-an-expanded-version-of-the-cicd-configuration). Deployment processes using parent-child or multi-project pipelines can also now use [resource groups to manage concurrency across stages, jobs, and even projects](#resource-group-for-multi-project-and-parent-child-pipelines).

## Wider community contribution highlights

We’re thrilled to introduce [GPU and smart scheduling support for GitLab Runner](#gpu-and-smart-scheduling-support-for-gitlab-runner), supporting specialized compute workloads like those in machine learning, and contributed by [this month's MVP, Andreas Gravgaard Andersen](#mvp)! Andreas showed awesome perseverance through reviews that spanned 10 months.

Thanks to another brilliant contribution, you can now [follow other GitLab users’ activity](#follow-user-activity)! You might start by following its contributor, [Roger Meier @bufferoverflow](https://gitlab.com/bufferoverflow) from [Siemens](https://gitlab.com/siemens), himself a [GitLab Hall of Famer](/community/mvp/) and sage of Open Source and InnerSource.

Thank you to [Marshall Cottrell @marshall007 from NASA](https://gitlab.com/marshall007) for [creating a 1-liner installer for the GitLab Agent for Kubernetes](https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent/-/merge_requests/281#note_507445139) and [simplifying its configuration](https://gitlab.com/gitlab-org/charts/gitlab/-/merge_requests/1807#note_505567583), enabling users to get started with the Agent much more easily. Marshall's feedback, ideas, and collaboration beyond merged contributions were also called "invaluable."

Thank you to [Kev @KevSlashNull](https://gitlab.com/KevSlashNull) of SiegeGG, who [added an Activity filter to Vulnerability Reports](#vulnerability-report-activity-filter), helping you drill into precisely the vulnerability list view you need. GitLab's own AppSec team are grateful as are many others, for this and Kev's many contributions.

GitLab isn't only a [DevOps platform](/solutions/devops-platform/), or a company, we're also a community, and in 13.9 alone we enjoyed an incredible [299 merged wider community contributions](https://gitlab.biterg.io/goto/937475d38035f496df3501c9b30af5ef). Selecting one MVP wasn't easy; thank you all for your professionalism and hard work.

## And so much more!

Some of our favorite quality of life improvements in 13.9 include:
 - [Create changelogs using the GitLab API](#create-changelogs-using-the-gitlab-api)
 - [Mark changes as viewed in merge requests](#mark-changes-as-viewed-in-merge-requests)
 - [Request a follow-up review from a Reviewer](#request-a-follow-up-review-from-a-reviewer)
 - [Create Jira issues from Vulnerabilities](#create-jira-issues-from-vulnerabilities)
 - [Assign incidents to milestones](#assign-incidents-to-milestones)
 - [Markdown links for Feature Flags](#markdown-links-for-feature-flags)
 - [Allow Deploy Keys to push to protected branches](#allow-deploy-keys-to-push-to-protected-branches)

Read on for more, and to preview what's coming in next month’s release, check out our [Upcoming Releases](/direction/kickoff/) page and our [13.10 release kickoff video](https://www.youtube.com/watch?v=8VolMk8VorM).
