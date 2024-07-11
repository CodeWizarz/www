---
title: "HumanGeo switched from Jenkins to GitLab and cut costs by 1/3"
author: William Chia
author_twitter: thewilliamchia
author_gitlab: williamchia
categories: engineering
image_title: '/images/blogimages/humangeo-switches-jenkins-to-gitlab.jpg'
description: "Management overhead was bogging down the team at HumanGeo. GitLab freed up more than just cash."
cta_button_text:
cta_button_link:
tags: customers, CI, user stories
---

As a software development company, [HumanGeo](http://www.thehumangeo.com/) ships a lot of code. Specializing in geospatial visualization, they have clients in every sector from video game companies to government agencies. The ability to manage multiple projects, iterate quickly, and operate at scale is critical to their success. Over time, a robust DevOps practice has evolved to allow them to quicken their pace of innovation. But traditional tools in their stack, like Jenkins CI, haven’t be able to deliver.

<!-- more -->

I recently caught up with [Justin Shelton](https://twitter.com/kwonstant), an engineer at HumanGeo, to talk about their expanded use of GitLab and how it’s improved both their workflow and budget. Here’s what he had to say:

## Ease of use cuts admin time by 96%

**William**: Can you tell me about the benefits you’ve seen from GitLab in terms of ease-of-use?

**Justin**: Defining CI as code fits great with the "Infrastructure as Code" philosophy. We already push hard to have AWS environments expressed in CloudFormation templates, provisioning via Ansible, and so on. With GitLab CI, we can manage our CI pipeline the same way – with code.

Managing YAML for Domain Specific Language (DSL) is way easier than managing Groovy for Jenkinsfiles (or most other config formats, for that matter). YAML is far more widespread and easy to understand, so more developers at junior and senior levels are exposed to it. The path to getting smart on writing GitLab CI DSL is much faster than coming up to speed on Groovy. While Jenkins is overwhelmingly customizable and familiar, it became Yet Another Thing to Manage™. In the end, GitLab CI shares a lot of the same (and in some cases more) configuration options.

As full stack engineers we do a lot of our own systems administration. Reducing our platform management burden is a huge plus. We used to spend a 5-6 hours each month managing Jenkins and keeping it running. Now, I might spend 10-15 minutes a month managing GitLab CI.

## Flexible CI runners cuts costs 33%

**William**: In [your blog post](http://blog.thehumangeo.com/gitlab-autoscale-runners.html) you shared that GitLab helped to cut infrastructure costs. How did that work in practice?

**Justin**: The ability to integrate with handlers, like the Docker Machine interface I talk about in the post, is huge for helping to manage costs. We get resources when we need them, and can spin them down when we don't. That saves big money compared to maintaining a large instance and having to manage the JVM size and other factors whenever we run out of space. With Jenkins we used to run a dedicated m2.xlarge on AWS all the time for CI purposes. Now, with GitLab, we are able to run spot instances for only around 40 hours a week, resulting in about 1/3 cost savings. Engineers can change a few config items, and managers can see savings. Win!

## Increasing the pace of innovation

**William**: How else has GitLab adoption impacted your workflow?

**Justin**: The speed of development is huge – new features get added every month, and I get genuinely excited to check out the release notes and update our instance every month. (Another perk is how simple this is, upgrading with two apt commands is as easy as it gets.)

[Auto DevOps](https://docs.gitlab.com/ee/topics/autodevops/) is the thing I'm most excited to dig into further that's come out recently. I'm excited about taking some of our bespoke release processes and tightening them up using this process. We're sticklers for code quality, so the Code Quality features were big, and we want to start utilizing Auto DevOps for canary releases as well.

## Learn exactly how they did it

At HumanGeo using Jenkins CI proved to be costly in both time and money. Switching to GitLab reduced administration overhead, lowered spend, and increased development velocity. Justin wrote up a post to share all the technical details on [how HumanGeo scaled GitLab CI runners](http://blog.thehumangeo.com/gitlab-autoscale-runners.html). Check it out and let know us know what you think in the comments or on Twitter.

"[Pipe Dream](https://unsplash.com/photos/T7s_TnKO-dk)" by [Sharosh Rajasekher](https://unsplash.com/@sharosh) on Unsplash
{: .note}
