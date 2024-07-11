---
release_number: "12.10" # version number - required
title: "GitLab 12.10 released with Requirements Management and   Autoscaling CI on AWS Fargate" # short title (no longer than 62 characters) - required
author: Farnoosh Seifoddini # author name and surname - required
author_gitlab: fseifoddini # author's gitlab.com username - required
author_twitter: # author's twitter username - optional
image_title: '/images/12_10/cover-image-12-10.jpg' # cover image - required
description: "GitLab 12.10 released with Requirements Management,  Autoscaling CI on AWS Fargate, Issue and Epic health status, and much more!" # short description - required
twitter_text: 'GitLab 12.10 just released to help teams streamline compliance, accelerate delivery, and efficiently manage projects with Requirements Management, Autoscaling CI on AWS Fargate, Vault CI Integration, and much more.'
twitter_image: '/images/tweets/gitlab-12-10-released.png' # social sharing image - not required but recommended
categories: releases # required
layout: release # required
featured: yes

# APPEARANCE
# header_layout_dark: true #uncomment if the cover image is dark
# release_number_dark: true #uncomment if you want a dark release number

# COVER IMAGE LICENCE
cover_img:
  image_url: "https://unsplash.com/photos/rdkms4Lkhmw" # required
  licence: Unsplash free license # which licence the image is available with - required
  licence_url: "https://unsplash.com/license" # required

---

GitLab 12.10 now helps teams **streamline and improve compliance** with requirements management, **reduce cycle time and accelerate software delivery** with CI with auto-scaling on AWS Fargate, and **more efficiently manage a portfolio** of projects with issue and epic health status.

## Compliance is easier
{:.intro-header-h3}

Compliance is a common challenge in most large organizations, where teams and projects need to demonstrate they followed the organization’s processes and procedures, and delivered what was actually "required". *Did the project actually address the business requirements* is a common question, and with 12.10, we’re starting to deliver [**requirements management**](#create-and-view-requirements-in-gitlab) as a distinct category in GitLab to help teams define, track, and manage business requirements. Also, demonstrating project and release compliance just got a little easier in GitLab 12.10, as there's no longer a need to use scripts to compare [**release evidence over time**](#compare-release-evidence-over-time), helping teams document and prove that the project is in "compliance".
The new project [**compliance framework label**](#compliance-framework-labels-for-projects) makes it easy for organizations to indicate that a specific project is required to comply with specific compliance frameworks.
Speaking of compliance frameworks, to help projects that are subject to HIPAA audits and compliance, the new [**HIPAA audit protocol project template**](#new-hipaa-audit-protocol-project-template) gives them a head start.
It's also easier to protect your secrets with improved [**HashiCorp Vault Integration**](#retrieve-cicd-secrets-from-hashicorp-vault), which helps keep your projects compliant with your security policies.



## Reduce Cycle Time and Accelerate Delivery on AWS
{: .intro-header}

The last thing you need is another bottleneck that potentially slows down delivery and that’s why we’ve supported autoscaling GitLab CI runners for a very, very long time. In GitLab 12.10, we’re extending our autoscaling ability on AWS Fargate to [**auto-scale runners**](#autoscaling-gitlab-ci-jobs-on-aws-fargate) so pipelines can efficiently scale to meet demand. Speaking of AWS, it's now faster and easier to configure your application to deploy to AWS with [**predefined AWS deployment variables**](#easy-to-configure-aws-deployment-variables), where GitLab has added AWS deployment variables and also helps with format validation.


## Efficiently manage projects
{: .intro-header}

Managing multiple projects and associated issues can be hard to juggle. With all the information there is to track, it's hard to know where there might be problems. Now in GitLab 12.10, it’s easy for teams to track and share the [**health status**](#epic-and-issue-health-tracking) of issues so that it’s simple to visualize the overall health of the epic. Additionally, we’re making it easier to [**import issues from Jira**](#import-issues-from-jira-to-gitlab) into GitLab so that teams can spend less time switching between tools and more time focused on building great software.

### And much much more!
{:.intro-header-h3}

There’s never enough space to highlight all the great features in our releases. Here’s a few other cool features that you should check out: [Python PyPI repository](#build-publish-and-share-python-packages-to-the-gitlab-pypi-repository) and [View Issue and MR activity- newest first](#view-issue-and-mr-feed-by-newest-activity-first).


<!--
Reminder: the final paragraph should include the total number of new features
being released, including bugs, performance improvements, and contributions from
non-DevOps stages like Enablement. All of these should be listed in the release
post, either as headers or bullet points.


These are just a few highlights from the `A` new and improved features, and `B`
performance improvements described below, and a small selection from the `C`
merge requests made in X.Y. Check out more great updates below, such as...
-->
