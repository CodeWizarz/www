---
title: "Auto DevOps: Where we are and where we are headed"
author: Viktor Nagy # if name includes special characters use double quotes "First Last"
author_gitlab: nagyv-gitlab # ex: johndoe
author_twitter: nagyviktor # ex: johndoe
categories: unfiltered # please choose one category from list below
image_title: '/images/11_0/gitlab-11-0-released-cover.jpg' # optional – just remove this line if you don't want to use a cover image. See below for more info
description: "As we will soon start an Auto DevOps design sprint, this article aims to summarize our current knowledge about Auto DevOps, and sets the stage for future discussions."
tags: DevOps, customers
# cta_button_text: 'Watch the XXX release webcast live!' # optional
# cta_button_link: 'https://page.gitlab.com/xxx.html' # optional
guest: false # required when the author is not a GitLab Team Member or there is more than one author
ee_cta: false # required only if you do not want to display the EE-trial banner
install_cta: false # required only if you do not want to display the 'Install GitLab' banner
twitter_text: "Auto DevOps: Where we are and where we are headed" # optional;  If no text is provided it will use post's title.
# featured: yes # reviewer should set. Please remove this line if post is Unfiltered
postType: product # i.e.: content marketing, product, corporate
related_posts:
- "/releases/2018/06/22/gitlab-11-0-released/"
- "/blog/2021/01/22/cd-automated-integrated/"
# merch_banner: merch_one
# merch_sidebar: merch_one
---

{::options parse_block_html="true" /}



Auto DevOps is an advanced GitLab feature-set that leverages GitLab's [single application](https://about.gitlab.com/handbook/product/single-application/) to assist users in every phase of the development and delivery process, implementing automatic tasks that can be customized and refined to get the best fit for their needs. The Three Ways of DevOps put forward a rigorous flow of work from development to production, short and amply feedback loops to fix quality issues early and avoid rework, and a culture of learning by balanced experimentation and repetition. GitLab, as a technological solution, can help with the first two ways, and can make the cultural changes less heavy and costly. Auto DevOps is our solution to support DevOps best practices with a convention over configuration approach.

## A Bit of History

Auto DevOps was released in GitLab 11.0, on 22. June 2018. From the very beginning, it included License Management, Security tests, and support for Kubernetes deployments. In the past years, the Auto DevOps offering was extended in many ways, and today [it ties together 15 stages](https://docs.gitlab.com/ee/topics/autodevops/stages.html) from building a project to deploying it. Besides being "Auto" as in automatic, it supports [a vast array of customization possibilities](https://docs.gitlab.com/ee/topics/autodevops/customize.html) too. 

Throughout these years, the goal of Auto DevOps remained the same: to simplify DevOps best practices adoption at every organisation.

## Feedback we have heard

After running a dozen interviews with our customers, I have noticed a few emerging patterns that I would like to share with you:

### It's highly valued

First of all, Auto DevOps is highly valued by our users. I talked with customers who were transitioning from legacy infrastructure to Kubernetes, and after 2 years of transitioning are looking forward to start using Auto DevOps with its built-in security scanners and review apps support. We have a great market to serve, and this is an amazing position to be at!

### Auto DevOps utilized as exemplar templates

For various reasons, many customers find Auto DevOps to be unsuitable as-is. In these cases, it's considered as a set of GitLab CI templates that platform engineers can look at and learn from as they build out their own Auto DevOps forks. While we think it's great that these customers have found value in our Auto DevOps templates, we'd much rather create a solution that fulfills their needs without them having to write and maintain these templates forever.

### Auto DevOps is slow

An often heard problem with Auto DevOps pipelines is that they are slow. Especially, its Auto Testing features, which end up getting switched off for this reason. One of the core principles of DevOps is to have a fast feedback loop; slow pipelines are counter to that principles and are therefore unacceptable. Our solution should accept this as a basic tenant and requirement.

### Auto DevOps is hard to troubleshoot

Inherent in its name, it seems to be an automatic solution. While in actuality, it's a rather complex product with many pieces having to fit together just right to get it to work. As a result, if something goes wrong, then our users often turn to GitLab support for assistance. This is especially problematic, as erroneous configurations usually happen when Auto DevOps is tried out for the first time. Leading to a negative first impression. We should be able to provide a better experience by putting more effort into its onboarding flow.

### Auto DevOps does not scale well

Many GitLab users who claim that they use Auto DevOps actually use a forked version of it that incorporates custom CI templates, some Auto DevOps templates, and some custom logic too. In these situations, every new project created requires the redundant setup of these custom templates, because simply enabling Auto DevOps would only use the GitLab templates. This can be a problem in larger organizations, with dedicated platform teams, because they often have a requirement for standardization to simplify their engineering team's life. The current state of Auto DevOps does not serve this need well.

### Auto DevOps targets only Kubernetes

For a long time, the only supported deployment target for Auto DevOps was Kubernetes. This has changed in the past year with her additional support of AWS EC2 and ECS. Nevertheless, we still do not support application stores for mobile development, simple package creation, Lambda function, etc. On one hand, Kubernetes already restricts Auto DevOps to a special set of companies where there is likely a central platform team, while on the other hand, we don't have support for platform team-level customizations. At the same time, we were missing support for the most common deployment targets without a platform team.

## Who is the target user

The patterns show that there are two different user types (aka personas) for Auto DevOps:

- There are the bigger companies with standardized processes and a dedicated platform team that owns these processes. This team is responsible for every developer teams' pipelines and their primary job is to allow developers to focus only on developing the business logic, instead of working on deployments and infrastructure. These platform teams require a product that enables them to apply special company policies automatically to every project that works. While Auto DevOps allows many customizations, those customizations are brittle to changes in GitLab, and we don't have special logic in using these customized setups automatically.

- Then there are smaller companies, without a dedicated platform team. In these situations, usually, a lead engineer wears the platform engineer hat and takes care of the pipelines from the initial build through various scanners and non-production deployments to the final production deployment. These teams don't mind following our conventions as long as our solution doesn't require much time from them to get started while also supporting their deployment targets. Tools like Heroku, Vercel, or Netlify already paved the way for this approach.

## What's next

In the past 3 years, we have learned a lot about our users, this allows us to take a new look at Auto DevOps, and see how we can best serve our users' current goals and needs. For this reason, we're planning on running a Design Sprint in the coming month to determine the new direction and come up with a solution that will help teams to more easily adopt DevSecOps best practices. While moving through this journey we would love for you to [join the discussion on the Reimagining Auto DevOps epic](https://gitlab.com/groups/gitlab-org/-/epics/5148)... in the meantime, thank you for reading and I hope you're all as excited as we are to move Auto DevOps back to the future!
