---
title: "Summary of limited GitLab credentials exposed in an internal logging system"
author: Kathy Wang
author_gitlab: kwang
author_twitter: gitlab
categories: releases
description: "Some GitLab.com personal access tokens and third-party credentials were inadvertently exposed publicly. This has since been resolved and all affected users notified. Read on for more details."
ee_cta: false
tags: security
---

## Summary

From February 19, 2018 to March 19, 2018, some GitLab.com personal access tokens and third-party credentials were inadvertently exposed publicly via an unprotected logging dashboard. The affected users represent approximately 0.5 percent of our GitLab.com user base. While the dashboard was originally protected from unauthorized access, a recent configuration change made this internal system publically accessible.

<!-- more -->

Upon further review, we discovered a limited number of tokens and third-party credentials were incorrectly stored in this system. We’ve already mitigated all issues that led to this exposure. Our audit logs only cover a portion of the time the dashboard was exposed, but only one login resulted in a deep query that resulted in a personal access token being exposed. This activity was positively linked to the user that immediately disclosed the issue to us. As such, we have no evidence that any of the affected credentials were used in a malicious manner.

We have notified the affected users via email to update their credentials and are implementing a series of security enhancements to prevent such issues from happening again. Note that self-managed GitLab customers are entirely unaffected, as their credentials are stored in their own database and this logging functionality is off by default in self-managed instances.

## Credentials written to logs

On February 28, 2018 we discovered internally that GitLab’s Gitaly service was, in certain circumstances, mishandling the sanitization of private third-party credentials for push-mirrored and imported repositories. These unscrubbed credentials were then sent to our logging system (ELK) and our exception management system (Sentry).

During the investigation, we realized that some other credentials were also leaking into our HAProxy load balancers logs. These were personal access tokens used for GitLab API access when passed via query parameters in an HTTP request. Additionally, credentials that allow access to some third-party Git repositories were leaked into the logs. These have been fixed in the following:

* [Sanitize URLs before logging them](https://gitlab.com/gitlab-org/gitaly/merge_requests/624)
* [Sanitize private_token field in HA Proxy logs](https://gitlab.com/gitlab-cookbooks/gitlab_fluentd/merge_requests/7)
* [Reconfigure OAuth mechanism, removing ‘*’ email domain access](https://gitlab.com/gitlab-cookbooks/gitlab-oauth2-proxy/merge_requests/10)

## Exposure of logs

On March 19, 2018, GitLab user Ryan Hefner discovered an authentication misconfiguration on our internal logging dashboard. A configuration change was made incorrectly on February 19, 2018, which resulted in potential public read-only access to the centralized, internal logging server for GitLab. This misconfiguration was resolved immediately upon notification.

GitLab uses an OAuth proxy service to authenticate all access to our internal logging infrastructure. Previously, this proxy service had been correctly configured to only allow access to authorized GitLab engineers. However, in the course of migrating this proxy service to our new cloud infrastructure, we inadvertently introduced a misconfiguration that allowed anyone with a valid Google account read-only access to our internal logging server, instead of the intended behavior of allowing only authorized GitLab engineering accounts.

## Impact

There is no evidence of user credential abuse. However, the audit logs for the dashboard only cover seven of the 30 days in question. The only audit log activity accessing sensitive information was from the user that immediately reported the issue to GitLab. We found no evidence of abuse against the API itself. Regardless, we are taking every precaution, and strongly recommending all affected Gitlab.com users rotate their personal access tokens. Affected users have received further instructions via email notifications, accordingly.

Although there is no evidence to suggest it happened, in the worst case an attacker could have gained access and obtained personal access tokens used in API calls between February 19, 2018 and March 19, 2018.

## Mitigations

Since the discovery, we have worked to investigate and mitigate all of these related security issues. We are continually improving our security processes and logging mechanisms to ensure that similar incidents will not occur again. These improvements are:

* Increase logging retention periods
* Fine-grain access controls to all logging infrastructure
* Regular, periodic audits of all our logs
* Adding mandatory review of any security-relevant changes by a GitLab Application Security engineer
* Document this process in our runbooks to ensure repeatability
* An additional measure we won't disclose because informing adversaries could render it less effective

If your project or account is affected by this security issue, you will receive an email notification listing affected projects with steps to rotate your personal access tokens. To proactively change them visit this page: [https://gitlab.com/profile/personal_access_tokens](https://gitlab.com/profile/personal_access_tokens).

We apologize for the impact this issue has caused our users. GitLab takes your information and your data extremely seriously. We have quadrupled the size of our internal security team in the last six months and have further plans to grow. We will learn from this incident and use it to improve upon our security even further.

In keeping with our company value of transparency we also believe in communicating about such incidents clearly and promptly. If you have any questions, please contact [security@gitlab.com](mailto:security@gitlab.com).
