---
title: Complete, but never finished/:/ Review Apps
author: Rebecca Dodd
author_twitter:
author_gitlab: rebecca
categories: insights
image_title: '/images/blogimages/review_apps_cover.png'
description: Find out how we used a continuous approach to release Review Apps early and improve on it in small iterations.
cta_button_text: 'Check out our <strong>Continuous Everything</strong> webcast!'
cta_button_link: 'https://page.gitlab.com/20170301_continuouseverything.html'
---

Continuous methods go beyond integration, delivery and deployment. Releasing early and often, and keeping all team members in the loop throughout the development lifecycle, helps everyone in an organization to work more efficiently and deliver customer value consistently. Here at GitLab, we strive to make being continuous part of our lives. One example of this is our Review Apps feature.

<!-- more -->

## What are Review Apps?

[Review Apps](/stages-devops-lifecycle/review-apps/) are ephemeral app environments that are created dynamically every time you push a new branch up to GitLab, and they're automatically deleted when the branch is deleted. What this means in practice is that rather than having a single dev environment for a project, or even separate dev apps for each developer, you get a new app for every topic branch, automatically. This lets you test and demo new features easily: product managers can check out exactly what a merge request is going to look like without having to download and run a topic branch, while QA and other users can take a look without having a development environment installed on their laptop at all.

## How we released Review Apps

We really wanted to add the Review Apps feature, because having a live environment for every feature a team is working on is just so transformative. We spent months debating the best way to go about doing this, until we arrived at what we thought was the best method. Now, we had all of these great ideas to magically make it work, automatically detect your environment, and more. But if we tried to do all those things, it would be months before we shipped for people to use and get feedback (even ourselves!).

We knew we had to cut the scope until we could develop and ship the essence of this feature in a single release. Ultimately we came up with a way to add two simple options to our CI platform: to set the Name and URL of an environment. We shipped just that small set of changes in [8.12](/releases/2016/09/22/gitlab-8-12-released/), and it enabled users to start leveraging review environments right away.

## Continuous improvement on Review Apps

In [the next release](/releases/2016/10/22/gitlab-8-13-released/) we added the ability to stop and delete these apps, because there wasn’t a UI-based method to stop them in the first release! In [the following release](/blog/2016/11/22/introducing-review-apps/), we started to get back to some of that magic by being able to automatically stop and delete review environments whenever a branch was merged and removed.

This approach allowed us to collect really early feedback on the feature, and ensure we were building in the right direction.

To find out more about how to introduce a continuous mentality throughout your entire organization, [register now](https://page.gitlab.com/20170301_continuouseverything.html) to watch our webcast, **From Continuous Integration to Continuous Everything**, on demand.
