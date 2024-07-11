---
title: From 2/3 of the self-managed Git market, to the next-generation CI system, to Auto DevOps
author: Sid Sijbrandij
author_twitter: sytses
author_gitlab: sytses
categories: insights
image_title: '/images/blogimages/whats-next-for-gitlab-ci.jpg'
description: 'GitLab first became the standard for self hosting git with two-thirds of the market, then became the next generation CI system, and the next step is creating Auto DevOps.'
tags: git, DevOps, news, CI/CD
---

GitLab has transformed from offering just version control to becoming the first integrated product for DevOps. With GitLab you can go all the way from chatting about an idea to measuring it in production without spending time on configuring a bunch of tools. The version control part of GitLab is now used by 2/3 of the market that self host Git. The continuous integration (CI) part of GitLab is now the most popular next generation CI system. Today we introduce the future direction of GitLab: Auto DevOps.

<!-- more -->

When we [announced our master plan in September of 2016](/blog/2016/09/13/gitlab-master-plan/), we gave our vision for a tool that changes the way developers create software. Before the end of 2016 we [completed the master plan](/releases/2016/12/22/gitlab-8-15-released/) and introduced Auto Deploy. Auto Deploy evolved and sparked a vision for a more integrated DevOps experience. Today we have a video to present that vision of Auto DevOps.

## GitLab has 2/3 market share in the self-managed Git market

With more than 100,000 organizations self-hosting GitLab, we have the largest share of companies who choose to host their own code. We’re estimated to have two-thirds of the single tenant market. When [Bitrise surveyed](http://blog.bitrise.io/2017/01/27/state-of-app-development-in-2016.html#self-hosted) ten thousand developers who build apps regularly on their platform, they found that 67 percent of self-managed apps prefer GitLab’s on-premise solution.

![Image via Bitrise blog](/images/blogimages/bitrise-self-hosted-chart.png){: .shadow}<br>

Similarly, in their survey of roughly one thousand development teams, [BuddyBuild found](https://www.buddybuild.com/blog/source-code-hosting#selfhosted) that 79% of mobile developers who host their own code have chosen GitLab:

![Image via buddybuild blog](/images/blogimages/buddybuild-self-hosted-chart.png){: .shadow}<br>

In their articles, both Bitrise and BuddyBuild note that few organizations use self-managed instances. We think there is a selection effect since both of them are SaaS-only offerings. Based on our experience, in large organizations (over 750 people), it is still more common to self host your Git server (frequently on a cloud service like AWS or GCP) than to use a SaaS service.

## GitLab CI is the most popular next-generation CI system

Our commitment to seamless integration extends to CI. Integrated [CI/CD](/topics/ci-cd/) is both more time and resource efficient than a set of distinct tools, and allows developers greater control over their build pipeline, so they can spot issues early and address them at a relatively low cost. Tighter integration between different stages of the development process makes it easier to cross-reference code, tests, and deployments while discussing them, allowing you to see the full context and iterate much more rapidly. We've heard from customers like [Ticketmaster](/blog/2017/06/07/continuous-integration-ticketmaster/) that adopting GitLab CI can transform the entire software development lifecycle (SDLC), in their case helping the Ticketmaster mobile development team deliver on the longstanding goal of weekly releases. As more and more companies look to embrace CI as part of their development methodology, having CI fully integrated into their overall SDLC solution will ensure these companies are able to realize the full potential of CI. You can read more about the benefits of integrated CI in our white paper, [Scaling Continuous Integration](http://get.gitlab.com/scaled-ci-cd/).

In his post on [building Heroku CI](https://blog.heroku.com/building-tools-for-developers-heroku-ci), Heroku’s Ike DeLorenzo noted that GitLab CI is “clearly the biggest mover in activity on Stack Overflow,” with more popularity than both Travis CI and CircleCI:

![Image via Heroku blog](/images/blogimages/heroku-questions-chart.png){: .shadow}<br>

While the use of Jenkins for CI is still higher than any other solution, we see more and more organizations moving from Jenkins, because upgrading their Jenkins server is a brittle process. The last two big things that GitLab CI lacked were scheduled builds (contributed to [GitLab 9.2](/releases/2017/05/22/gitlab-9-2-released/)) and cross-project builds (released in [GitLab 9.3 on June 22](/releases/2017/06/22/gitlab-9-3-released/)).

## Auto DevOps is next

We want to [deliver more of idea to production](https://gitlab.com/gitlab-org/gitlab-ce/issues/32639) and continue to make the flow even better. [Our direction](/direction/#ci--cd) is to fully automate DevOps with the concept of [Auto DevOps](https://gitlab.com/gitlab-org/gitlab-ee/issues/2517). In a cloud-native world, developers have many projects, and it doesn't make sense to have to set up their tools for every one of them. With help from the wider community we'll ensure that everything works out of the box, from code quality metrics to Review Apps, and from metrics to autoscaling.

Watch our Head of Product Mark Pundsack demonstrate our Auto DevOps vision, including Auto Create, Auto Build, Auto CI, Auto Deploy, Auto Code Quality, and Auto Review Apps:

<iframe width="560" height="315" src="https://www.youtube.com/embed/KGrJguM361c?rel=0" frameborder="0" allowfullscreen></iframe>

We couldn't have built GitLab into the tool and company it is today without the contributions of the wider community, and the feedback from our customers. We're excited to see what you build with GitLab.

Have thoughts about Auto DevOps? Comment on this blog post or on [the issue for Auto DevOps](https://gitlab.com/gitlab-org/gitlab-ee/issues/2517). Interested in what your team can do with GitLab Enterprise Edition? [Sign up for a free trial](/free-trial/) and let us know what you think.
