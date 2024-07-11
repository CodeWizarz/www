---
title: "Let's play Reviewer Roulette! An easy way to find a reviewer for your merge request"
author: Dennis Tang
author_gitlab: dennis
author_twitter: tangdennis
categories: engineering
image_title: '/images/blogimages/play-reviewer-roulette.jpg'
description: "Finding the right reviewer for a merge request can be tough. Reviewer Roulette makes the decision easier – by making it random!"
ee_cta: false
tags: inside GitLab, collaboration, frontend
---

GitLab is [growing quickly], and [constantly looking for more talented people] to join the team. While exciting, it can be tough to keep track of who's who, especially when you're new to the company.

So how do you know who to contact if you need a pair of eyes on your merge request?

## Meet Reviewer Roulette!

Reviewer Roulette is a Slack slash command to help GitLab team-members randomly select a person from a given team, which can be especially useful as multiple teams work together to deliver features in a single merge request.

![Demo of /reviewerroulette](/images/blogimages/play-reviewer-roulette/demo.gif){: .shadow.center.medium}

---

## The idea

It's quite common to find that your issue or merge request will have multiple labels to associate different feature areas and teams that are contributing to them. As someone who's recently joined GitLab, I'm still getting to know [all the different teams and people] that work at GitLab. That said, I'm working on a feature with the [CI/CD](/topics/ci-cd/) or discussion team, who should I reach out to if I have questions or need a review of my work?

![Various labels on Merge Requests in gitlab-ce](/images/blogimages/play-reviewer-roulette/labels.png){: .shadow.center.medium}

The idea arose from the [frontend team weekly call] where [Tim Zallmann] reminded us that, "Everyone on the frontend team is a reviewer." The team previously had a microservice built by [Luke Bennett] for this, however, it's no longer online. Beyond that, wouldn't it be convenient to simply type a command in Slack to be suggested someone to ping for a review?

I can say with confidence that GitLab is a company that truly exemplifies its values, and I was empowered by the value of [collaboration] to build something that could help our team (and others!) find reviewers. I couldn't be the only one who had this problem!

> **Do it yourself** Our collaboration value is about helping each other when we have questions, need critique, or need help. No need to brainstorm, wait for consensus, or do with two what you can do yourself.

I quickly went to work to (hastily) put together a proof-of-concept to see if it would something that people would want to use.

## Decision fatigue, be gone!

![Screenshot of /reviewerroulette](/images/blogimages/play-reviewer-roulette/screenshot.png){: .shadow.right.small.wrap-text}

It was presented to the frontend team and received warmly, and many people were keen to contribute and also [suggest ideas] that would make it even more useful!

Although it was originally intended for the frontend group, since I was building it from scratch, it was very easy to make the decision to have it work for all engineering teams.

With Reviewer Roulette, I don't have to ping entire Slack channels or guess from our team page to try to find _someone_ to talk to.

Additionally, it provides a number of other benefits such as:

1.  It promotes a more balanced distribution of reviewers amongst the team.
    * Less experienced reviewers have more opportunities to do code reviews
    * More experienced reviewers are not as heavily relied on
1.  It allows more team members to learn more about parts of the codebase they may not be as familiar with, increasing the knowledge of the team overall
1.  It provides more opportunities to apply our [code review guidelines] or [frontend style guides] to all team members
1.  It reduces bias towards reviewers that you may unconsciously prefer to select

Of course, we have our various subject matter experts such as our [frontend domain experts] and [gitlab-ce maintainers] who may provide the best insight for a given topic, but it's good to randomly select reviewers by default!

## How it's made

When it came to thinking about how to build Reviewer Roulette, it wasn't so much about the tech, than it being about being enabled to create something that will benefit the team.

Embracing our value of [efficiency], the solution is very much a boring one. It's a simple Node.js application utilizing `js-yaml` and `express` to be able to search our [team structure file] and respond to Slack's slash command requests properly.

## What's next

Reviewer Roulette is seeing regular usage, and has [plenty of features planned] to hopefully increase its usefulness.

While originally intended for engineering, it can [help the entire company] out. In addition to our [Coffee Break calls], we also have [a step in our onboarding process] to meet five different people across different teams and countries. That's something that Reviewer Roulette could easily help with!

We also plan on moving it to the frontend [GKE] cluster, and activating [Auto DevOps] to make builds and deployments painless.

If you're interested in checking it out, feel free to take a look at the [project]! Perhaps it might be useful to you and your team?

## Share your thoughts!

If there's interest in using Reviewer Roulette for your community contribution to GitLab projects, let us know in the comments and we can release it on Slack for everyone to use!

What do you think of Reviewer Roulette? Is this something you would use for your team? How do you pick people for reviewing?

[Photo](https://unsplash.com/photos/w6OniVDCfn0?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) by Krissia Cruz on [Unsplash](https://unsplash.com/search/photos/roulette?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
{: .note}

[growing quickly]: /company/okrs/#ceo-great-team-active-recruiting-for-all-vacancies-number-of-diverse-per-vacancy-real-time-dashboard
[constantly looking for more talented people]: /jobs/
[all the different teams and people]: /company/team/
[frontend domain experts]: /handbook/engineering/frontend/#frontend-domain-experts
[gitlab-ce maintainers]: /handbook/engineering/projects/#gitlab-ce
[frontend team weekly call]: /handbook/engineering/frontend/#frontend-group-calls
[Tim Zallmann]: /company/team/#tpmtim
[Luke Bennett]: /company/team/#__lukebennett
[suggest ideas]: https://gitlab.com/dennis/reviewer-roulette/issues/
[plenty of features planned]: https://gitlab.com/dennis/reviewer-roulette/issues/
[efficiency]: /handbook/values/#efficiency
[team structure file]: https://gitlab.com/gitlab-com/www-gitlab-com/blob/master/data/team.yml
[auto devops]: https://docs.gitlab.com/ee/topics/autodevops/
[coffee break calls]: /company/culture/all-remote/tips/#coffee-chats
[a step in our onboarding process]: https://gitlab.com/gitlab-com/people-group/employment-templates/-/blob/main/.gitlab/issue_templates/onboarding.md#day-4-morning-social
[help the entire company]: https://gitlab.com/dennis/reviewer-roulette/issues/12
[gke]: /partners/technology-partners/google-cloud-platform/
[project]: https://gitlab.com/dennis/reviewer-roulette/
[collaboration]: /handbook/values/#collaboration
[code review guidelines]: https://docs.gitlab.com/ee/development/code_review.html
[Frontend style guides]: https://docs.gitlab.com/ee/development/fe_guide/index.html#style-guides
