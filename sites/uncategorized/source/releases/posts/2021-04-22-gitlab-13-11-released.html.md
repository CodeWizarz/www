---
release_number: "13.11" # version number - required
title: "GitLab 13.11 released with Kubernetes Agent and Pipeline Compliance" # short title (no longer than 62 characters) - required
author: Sarah Waldner # author name and surname - required
author_gitlab: sarahwaldner # author's gitlab.com username - required
image_title: '/images/13_11/13_11-cover-image.jpg' # cover image - required
description: "GitLab 13.11 released with Kubernetes Agent, Compliant Pipelines, and features for speedier pipelines - and much more!" # short description - required
twitter_image: '/images/13_11/13_11-cover-image.jpg' # required - copy URL from image title section above
categories: releases # required
layout: release # required
featured: yes

# APPEARANCE
# header_layout_dark: true #uncomment if the cover image is dark
release_number_dark: true #uncomment if you want a dark release number

# COVER IMAGE LICENCE
cover_img:
  image_url: "https://unsplash.com/photos/ruQHpukrN7c" # required
  licence: CC0 # which licence the image is available with - required
  licence_url: "https://unsplash.com/license" # required

---

On this Earth Day we are thinking about growth. Our customers are scaling their DevOps practices and with growth comes the need for even greater efficiencies and automated controls. The [GitLab Agent for Kubernetes](#gitlab-agent-for-kubernetes-available-on-gitlabcom) is now available on GitLab.com to help you benefit from fast, pull-based deployments to your cluster, while GitLab.com manages the necessary server-side components of the Agent. [Compliant Pipeline Configurations](#compliance-pipeline-configurations) let you define enforceable pipelines that will run for any project assigned a corresponding compliance framework, even [custom ones](#create-custom-compliance-framework-labels). We also have a host of features to improve pipeline efficiency and measurement, to provide [On-call Scheduling](#on-call-schedule-management), and even more security enhancements. These are just a few of the 50+ significant new features and improvements in this release.

## Controls to help you grow safely and efficiently

Controls can keep your automation on track as you grow and scale while simplifying compliance efforts. The [GitLab Agent for Kubernetes](https://docs.gitlab.com/ee/user/clusters/agent/) is core to GitLab's Kubernetes integrations and is [now available on GitLab.com](#gitlab-kubernetes-agent-available-on-gitlabcom). The Agent-based integration supports pull-based deployments which are preferred by security and quickly becoming a popular method for Kubernetes deployment practices. The agent also supports Network Security policy integration and alerts which enables fine-tuned RBAC controls within your clusters. [Compliant Pipeline Configurations](#compliance-pipeline-configurations) let you enforce a higher degree of separation of duties and reduce your business risks by defining enforceable pipelines that will run for any project assigned a corresponding compliance framework. At the same time, [Custom Compliance Framework Labels](#create-custom-compliance-framework-labels) allow you to use your own requirements beyond the usual ones like PCI, HIPPA and such. The new [Admin Mode](#re-authenticate-for-gitlab-administration-with-admin-mode) increases security and control of your GitLab instance by requiring admin users to reverify their credentials before running administrative commands. Audit reports are easier now too with a new [export](#export-a-user-access-report) feature in your self-managed GitLab instance to see, all in one place, what groups, subgroups, and projects users have access to. 
 
## Speedier pipelines

“Speedy, reliable pipelines” is one of our [core product themes](https://about.gitlab.com/direction/ops/#speedy-reliable-pipelines), and we’ve delivered on that promise this month with a host of pipeline improvements.
 
The [Pipeline Editor](https://docs.gitlab.com/ee/ci/pipeline_editor/) helps you get to work even faster and stay more productive once you begin. The new [Empty State](#create-initial-configuration-file-from-the-pipeline-editor) enhancement will allow new users to begin working with the pipeline editor on a new, blank pipeline file without having to create a config file first. The ability to configure [multiple cache keys in a single job](#use-multiple-caches-in-the-same-job) will help you increase your pipeline performance and you can measure these improvements from the CI/CD dashboard, where a [new DORA 4 graph](#track-dora-4-lead-time-for-changes-metric) will show lead time for changes via time for code to be committed and deployed to production. As a related note, metrics on [DevOps Adoption](#devops-adoption-metrics-available-at-the-group-level) are now available at the group level allowing users to understand how GitLab's DevOps capabilities are being adopted. 


## Securing your software supply chain

 Security pros will be happy to see the addition of the [Semgrep flexible rule syntax](#gitlab--semgrep-upgrading-sast-for-the-future) to extend and modify custom detection rules, a popular request from GitLab SAST customers. We've also added support for [custom certificates](#support-for-custom-ca-certs-when-using-the-release-cli) and [email alerts for key expirations](#ssh-key-expiration-email-notification). You can now improve your security posture by [enforcing SAML for Git activity](#saml-enforcement-for-git-activity). The new [On-call Schedule Management](#on-call-schedule-management) routes alerts received in GitLab to the on-call engineer in the schedule for that project. This will be particularly helpful as we mature our [security alerts in the future](https://about.gitlab.com/direction/govern/), providing a valuable incident management capability with end-to-end visibility across the entire DevOps process. 


Read on for more features, performance enhancements and changes! To preview what's coming in next month’s release, check out our [Upcoming Releases](https://about.gitlab.com/direction/kickoff/) page and our [13.12 release kickoff](https://www.youtube.com/watch?v=5mTdhCuh9-I) video.


 
