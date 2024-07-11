---
release_number: "10.8"
title: "GitLab 10.8 released with incremental rollouts, plus open source push mirroring"
author: Jeremy Watson
author_gitlab: jeremy_
author_twitter: d3arWatson
image_title: '/images/10_8/10_8-cover-image.jpg'
description: "GitLab 10.8 released with incremental rollouts, open source push mirroring, interactive security reports, group milestone burndowns, and much more!"
twitter_image: '/images/tweets/gitlab-10-8-released.png'
categories: releases
layout: release
tags: releases, features
---
We're super excited to share a host of awesome additions now available in GitLab 10.8! We've improved release automation, sped up security vulnerability remediation, open sourced a highly requested paid feature, and plenty more.

<!-- more -->

### Deploy with confidence
{:.intro-header}

Releasing new features always comes with a bit of anxiety. Even with stringent pre-release testing, a change to your production codebase can result in unforeseen effects. Our new [Incremental Rollouts](#incremental-rollout-deployments) feature helps developers deploy code with confidence by exposing changes to only a subset of users. Instead of rolling out to your entire user base all at once, incremental rollouts lets you gradually deploy to an increasing portion of your Kubernetes pods. If problems do occur, you can roll back without affecting the entire user base. We're excited to provide an improved way to protect users and manage the unexpected, so you're free to deploy more frequently.

### Push Mirroring is now open source
{:.intro-header}

When we [first released Push Mirroring](/releases/2016/04/22/gitlab-8-7-released/#remote-mirrors-ee-only), it was introduced as a paid feature. Since then, it has been one of the features that is [most requested](https://gitlab.com/gitlab-org/gitlab-ce/issues/18732) to be moved into our open source codebase. We take these requests seriously, and view having a balance between paid and open source features as [good stewardship](/company/stewardship/). Today, we're happy to share that [Push Mirroring has been open sourced](#push-mirroring-now-open-source)!

This opens up a few key use cases for GitLab Core users including freelance development and migration. Freelance developers can now mirror each of their clients repos. While folks migrating to GitLab from other git-based repositories can now take advantage of push mirroring to ease the migration path.

Whenever possible, we like to open source features to not only encourage greater usage of GitLab, but also to encourage more folks to [contribute to open source software](/community/contribute/).

### Ship securely faster
{:.intro-header-h3}

Keeping track of vulnerabilities without automation can be next to impossible. GitLab's built-in security functionality includes   [SAST](https://docs.gitlab.com/ee/user/application_security/sast/), [DAST](https://docs.gitlab.com/ee/user/application_security/dast/), [container scanning](https://docs.gitlab.com/ee/user/application_security/container_scanning/), and [dependency scanning](https://docs.gitlab.com/ee/user/application_security/dependency_scanning/) to keep you on top of vulnerabilities and ship secure code. And today, we're improving the experience.

When a vulnerability appears in a report you'll want to take action to either fix it or potentially ignore it if it's a false positive. Now with [Interactive Security Reports](#interactive-feedback-in-security-reports-alpha), you'll have the ability to take action right from the security report to either dismiss a vulnerability or create an issue to remediate it. By enabling users to take swifter action on vulnerabilities, we can help developers ship better, safer code.

### Over to you!
{:.intro-header-h3}

We couldn't be more excited to get these changes to you and to hear your feedback. Let us know what you think in the comments below – what are you looking forward to in this release? What can we continue to improve on?

Thanks for being a part of GitLab ❤️
