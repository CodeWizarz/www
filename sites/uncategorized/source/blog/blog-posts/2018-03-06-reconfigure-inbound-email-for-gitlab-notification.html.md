---
title: "GitLab inbound email issue notification"
date: 2018-03-06
author: Jim Thavisouk
author_gitlab: Thavisouk
author_twitter: gitlab
categories: news
tags: security, gitlab
description: "We've identified a potential risk impacting those using our email an issue to project, Reply by Email, and Service Desk features."
ee_cta: false
tags: security, inside GitLab
---

GitLab.com provides users the capability to [create new issues via email](https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#new-issue-via-email), which can also be managed by [Service Desk](https://docs.gitlab.com/ee/user/project/service_desk.html). This is accomplished through a dynamically generated email address that is currently being managed with GitLab's domain name (@gitlab.com). It has come to our attention that an attacker can abuse this process to perform actions outside the intended scope with the @gitlab.com domain. This issue impacts users who are using email an issue to project, [Reply by Email](https://docs.gitlab.com/ee/administration/reply_by_email.html), and Service Desk.

<!-- more -->

## Customer remediation steps

Our users should check to see if they are using the create new issues via email feature.

If aliases were used, update those aliases from `@gitlab.com` to `@incoming.gitlab.com`.

If domain whitelisting was used, please update those domains from `@gitlab.com` to `@incoming.gitlab.com`.

These changes can be made _immediately_.

## GitLab remediation strategy

We will update the addresses from `@gitlab.com` to `@incoming.gitlab.com`.

We will reach out to users directly that are still using the old address to make sure the new addresses are being used instead, by **April 17, 2018**.

All addresses with the @gitlab.com domain will be disabled **April 31, 2018**. Incoming email to the address will be rejected.
