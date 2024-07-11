---
title: "Upcoming Runner changes for GitLab.com"
author: Joshua Lambert
author_gitlab: joshlambert
author_twitter:
categories: releases
image_title:
description: Minimum polling interval for older Runners on GitLab.com
---

Recent improvements to [GitLab Runner][runner-docs] have made processing CI pipelines significantly more efficient and responsive. To take advantage of the changes, GitLab-provided shared runners have been upgraded, and we encourage users to update their private runners as well.

In addition, private runners older than version 1.9.0 will soon be throttled when checking for new jobs. Please read on for more details.

<!-- more -->

## Improving responsiveness and efficiency of Runners on GitLab.com

Over the past year, [GitLab CI][gitlab-ci] has grown significantly in both capability and popularity. On GitLab.com during busy periods of the day, it is not unusual for well over one thousand jobs to be simultaneously executing for customers. As more companies embrace CI/CD and make the switch to DevOps, we are excited that GitLab can serve as such a transformational aspect of their development process.

With Runners becoming such a critical part of GitLab and customer workflows, we want to ensure their operation is as efficient as possible. One major change was released with GitLab Runner 1.9.0 three months ago, when we added support for [long polling](https://en.wikipedia.org/wiki/Push_technology#Long_polling). This enhancement significantly improves the method by which Runners retrieve new jobs from the GitLab server, improving both scalability and responsiveness.

Today on GitLab.com all shared runners and 30% of private runners are at least version 1.9.0, and the benefits have been significant. A runner's load on the API server has been reduced by 95%, and when idling it has been reduced by 99%. This enables GitLab to be more responsive to other requests, and offer additional scalability for the largest of deployments.

## GitLab.com support for deprecated Runners

While these changes are exciting, there are still over six thousand user-provided private runners based on less efficient versions over three months old. These older runners frequently check GitLab.com for new jobs, even while idle. As part of our goals to ensure GitLab.com is as responsive as possible, we are making a change to how often these runners can connect.

**Beginning Monday April 17th, private runners older than 1.9.0 will be throttled to check for new jobs at most once per minute.** These runners will continue to function as normal without changes, however may experience up to a one minute delay when picking up new jobs. It is also important to note that all runners prior to 9.0 are [deprecated along with APIv3][api-deprecation] and support will end in the near future.

We encourage all customers of GitLab.com to update their private runners to receive the latest improvements, and to ensure they continue to happily process pipelines well into the future. If you are not ready to upgrade your runners, you can [set the polling interval][runner-config] to one minute by configuring `check_interval`.

[runner-docs]: https://docs.gitlab.com/runner/
[gitlab-ci]: /features/continuous-integration/
[runner-config]: https://docs.gitlab.com/runner/configuration/advanced-configuration.html#the-global-section
[api-deprecation]: https://docs.gitlab.com/ee/api/v3_to_v4.html#v3-to-v4-version
