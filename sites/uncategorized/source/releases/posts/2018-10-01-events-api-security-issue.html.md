---
title: "Exposure of Confidential Issues on Public Projects through the Events API
"
categories: releases
author: Kathy Wang
author_gitlab: kathyw
description: "A bug in the GitLab Events API code that resulted in exposure of confidential issues within all public projects was recently identified."
tags: security
ee_cta: false
---

## Summary

On September 20, 2018, we were notified by HackerOne hacker [ngalog](https://hackerone.com/ngalog/) of a bug in GitLab Events API code that resulted in exposure of confidential issues within all public projects.

Upon further validation and investigation, we discovered that this exposure dates back to June 22, 2017, with the 9.3 release. GitLab’s Events API was returning private events related to projects that were marked as public during that time frame. These events included information that was marked as private, such as confidential issues and private merge requests, among others. The issue was present in all versions of GitLab between 9.3 and 11.3, and across all deployments, including GitLab.com.

The exposure of these private events was present only through the API, whereas the UI behaved as-intended and filtered these events.

All projects that were marked as public are affected by this exposure. This issue has already been mitigated for all GitLab.com customers. Projects marked as private were not impacted by this issue.

We investigated four months of retained GitLab.com logs, and found no evidence that unauthorized parties accessed any of your private events.

## Background

The Events API was introduced with the release of GitLab 9.3, and it enabled users to programmatically access the activity log of projects and users. The adoption of this API has not been very wide, topping an average of 180 requests per hour.

Unfortunately, a bug was introduced at release time and the API would not honor the private flag of events related to numerous target types that belonged to public projects. As a result, events for said target types were exposed to potentially unauthenticated and unauthorized parties.

As documented in our [Events API documentation](https://docs.gitlab.com/ee/api/events.html#target-types), existing target types for the Events API are:

- Issue
- Milestone
- Merge_request
- Note
- Snippet
- Project
- User

For projects that were marked as public, events belonging to private versions of all these target types were mistakenly returned by the  /api/v4/users/:id/events and /api/v4/projects/:id/events API endpoints. What this means is that the following parts of a public project were exposed:

- Confidential issues
- Private milestones
- Private merge requests
- Private notes
- Private snippets

## Response and mitigation

On September 20, 2018, we learned of the issue from HackerOne security researcher [ngalog](https://hackerone.com/ngalog/), who is part of our bounty program, and with whom we have a track record of great engagements. Upon assessing the issue, the GitLab Security Team started working with the Create team to mitigate the issue. Besides working on the fix, the Create team also produced a hotfix, which the Production team deployed for GitLab.com on September 21, 2018. By September 24, 2018, the Production team confirmed that the hotfix was successfully deployed across all affected GitLab.com infrastructure.

The discovery of this issue aligned with the release of our planned Security Release on October 1, 2018. In order to avoid any mishaps with its implementation, we decided proceed with the release as originally planned.

## Who was impacted?

Given the wide time window during which the issue was present (more than a year), we are unable to determine with accuracy the extent of the impact. While we don’t have any indication that the issue was ever misused, we are also unable to say with any certainty that it hasn’t been.

We investigated four months of retained GitLab.com logs, and found no evidence that unauthorized parties accessed any of your private events.

## Improvements

Since the discovery of the issue, a cross-functional effort has been executed at GitLab in order to identify and improve on safeguards that could have helped us identify this issue sooner, respond more quickly, and ensure the reliability of our patched systems. As such, we are working on numerous improvements to our internal processes and practices. This includes the following highlights:

- Our QA process will improve its focus on [tests related to confidential data](https://gitlab.com/gitlab-com/www-gitlab-com/merge_requests/14935/).
- Our Engineering team will [create a canary system to alarm on unexpected responses and regressions](https://gitlab.com/gitlab-com/security/issues/211) to security issues within GitLab APIs, and our Security team will monitor this canary system in order to triage and mitigate any discovered security issues.
- Our Production and Release teams will [define guardrails around deployments time windows](https://gitlab.com/gitlab-com/gl-infra/infrastructure/issues/5116), taking in consideration several factors that might impact our ability to respond promptly to issues that arise during deployments.
- Our Production and Release teams will [improve](https://gitlab.com/gitlab-com/gl-infra/gitlab-patcher/issues/13) [our](https://gitlab.com/gitlab-com/gl-infra/gitlab-patcher/issues/14) [existing](https://gitlab.com/gitlab-com/gl-infra/gitlab-patcher/issues/15) [tooling](https://gitlab.com/gitlab-com/gl-infra/gitlab-patcher/issues/16) to address issues that were identified while mitigating this event.
- Several additional improvements that we cannot publicly disclose at this time in order to retain advantage over possible adversaries.

We apologize for the impact this issue has caused our users. GitLab takes your information and your data extremely seriously and have more than quadrupled the size our internal security team in the last six months, with further plans to grow. We will learn from this incident and use it to improve upon our security posture even further.

In keeping with our company value of transparency we also believe in communicating about such incidents clearly and promptly. If you have any questions, please contact us via [support.gitlab.com](https://support.gitlab.com/).

Sincerely,
GitLab Security Team

*Updated: 2018-10-11*: While generating the list of project owners and
maintainers, further analysis showed limited impact to private projects. For
private projects, the impact is limited to those with `Guest` users. Users
with only `Guest` permissions would have potentially been able to view
details for the confidential and private items as described. The owners and
maintainers of affected projects were notified, but this note was not
included in the email or the original version of this blog post.
