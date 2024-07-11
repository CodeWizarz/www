---
release_number: "11.9"
title: "GitLab 11.9 released with secrets detection and multiple MR approval rules"
author: Kenny Johnston
author_gitlab: kencjohnston
author_twitter: kencjohnston
image_title: '/images/11_9/11_9-cover-image.jpg'
description: "GitLab 11.9 released with secrets detection, multiple MR approval rules, ChatOps in Core, and much more!"
twitter_image: '/images/tweets/gitlab-11-9-released.png'
categories: releases
layout: release
featured: yes
header_layout_dark: true
---

### Quickly learn if secrets have been leaked

Inadvertently committing credentials to a shared repository can have serious consequences, yet it is a simple
mistake to make. Once an attacker gets your password or API key, they can take over your account, lock you out, and fraudulently spend money.
This can even lead to a domino effect where access to one account grants access to others. With the stakes so high,
it’s of paramount importance to learn as quickly as possible if secrets have been leaked.

With this release, we’re introducing [secret detection](#detect-secrets-and-credentials-in-the-repository) as
part of our SAST functionality. Each commit is scanned by a CI/CD job to ensure it doesn’t contain secrets.
If the scan detects secrets, the developer is alerted in the merge request, allowing them to take action quickly
to invalidate the leaked credentials and generate new ones.

### Enforce proper change management

As an organization grows and becomes more complex, it becomes difficult to keep alignment across different
parts of the organization. At the same time, the consequences of merging improper or insecure code also
increase when an application has more users and generates more revenue. For many organizations, ensuring
proper review process is followed before code is merged is a hard requirement because the risks of not doing so are so great.

With GitLab 11.9, we’re providing greater controls and more structure with [Merge request approval rules](#merge-request-approval-rules).
Previously, you could specify either an individual or a group for required approval (where any single member of the group can provide approval). Now, multiple rules can be added to a merge request to require individual approvers specifically,
or even require a number of approvers from a particular group. Additionally, the Code Owners feature is an integrated part of approval rules, making it easy to track down who should approve.

This allows organizations to implement complex approval flows, all
while maintaining the simplicity of GitLab’s single application where issues, code, pipelines, and monitoring
data are visible and accessible to inform decisions and speed approval.


Approval Rules have temporarily been disabled on GitLab.com and are not enabled by default in GitLab 11.9 due to a
[regression](https://gitlab.com/gitlab-org/gitlab-ee/issues/10356).
{: .alert .alert-info}

### ChatOps is now open source

GitLab ChatOps is a powerful automation tool, allowing you to execute any CI/CD job and receive the status
of the job directly from chat apps like Slack and Mattermost. Originally [released in GitLab 10.6](/releases/2018/03/22/gitlab-10-6-released/#gitlab-chatops-alpha), ChatOps
was part of the GitLab Ultimate tier. As part of our [product strategy](/company/pricing/#the-likely-type-of-buyer-determines-what-features-go-in-what-tier) and [commitment to open source](/company/stewardship/),
we occasionally move features down in tier and never move them up.

With ChatOps, we felt this was functionality that everyone could benefit from and that the feature itself could benefit from community contributions.

In GitLab 11.9, we’ve [open sourced ChatOps](#move-chatops-to-core) so it is available to use in GitLab
self-managed Core and GitLab.com Free, and is open for community contributions.

### And much more!

So many great features are available in this release like [Auditing for feature flags](#auditing-for-feature-flags),
[Vulnerability remediation merge request](#vulnerability-remediation-merge-request),
and [CI/CD templates for security jobs](#cicd-templates-for-security-jobs) that you’ll want to read on to learn about them all!
