---
title: "Why your code review process is broken, and how to fix it"
author: Emily von Hoffmann
author_gitlab: evhoffmann
categories: culture
image_title: '/images/blogimages/why-your-code-review-process-is-broken-and-how-to-fix-it.jpg'
twitter_image: '/images/tweets/code-review-process-broken-tweet.png'
description: "What do you do when you follow your code review process, and you’re still rudely greeted by code full of bugs, or a flood of user complaints?"
tags: collaboration, workflow
---
People in every field can relate to the feeling of carefully moving down your checklist, triple-checking your work, and confidently *sending that email*, or *posting that tweet*, or *merging those changes*, only to at some later interval experience unmistakable stomach-sinking at some surprise snafu. That’s why we identify areas with potential for human error and build in review cycles with hopefully explicit steps and goals — like code reviews! So what about when you follow all of those steps and you’re still rudely greeted by code full of bugs, or a flood of user complaints?

<!-- more -->

In other words, why exactly did your code review process “fail” to deliver what you designed it for? It’s not just overt technical errors we’re looking to avoid; our Discussion Product Manager [Victor Wu](/company/team/#victorwu416) told me that we can think of code review as being ineffective if it results in code being shipped that doesn’t meet business or product goals. In this case, poor code review contributes to the ultimate failure, and may lead the product to snowball over time, becoming harder to fix and add new features. Here are a few scenarios with some thoughts on what might have contributed to the code review breakdown.

### Feature shipped with a lot of defects

This one is easy to identify, but maybe not always as easy to remediate. What broke in the process that allowed this to happen? It might have something to do with rushed or unrealistic deadlines handed to developers, which we heard in our [Global Developer Survey](https://page.gitlab.com/2016-developer-survey_2016-developer-survey.html) is a major reason code gets shipped before it’s ready. One option here might be to try a cross-functional team, or review the channels available for communication with teammates in a different function than your own — the key to [better deadline-setting](/blog/2017/04/27/why-code-is-released-too-early/) is finding ways to develop empathy for other teams’ needs, and that won’t happen if you’re siloed.

It can be even trickier if the problem arises from within the culture of the dev team itself. There can be a power dynamic and intimidation factor inherent in the review process that could make a more junior reviewer, for example, not stick to their guns when their suggestions are insufficiently addressed. At GitLab, we follow best practices, largely based on the [thoughtbot code review guide](https://github.com/thoughtbot/guides/tree/master/code-review), that are designed to create an effective environment for code reviews.

>There can be a power dynamic and intimidation factor inherent in the review process that could make a more junior reviewer, for example, not stick to their guns when their suggestions are insufficiently addressed

The guide contains truisms that could apply to any setting where one’s creation might be critiqued by a teammate, like `avoid using terms that could be seen as referring to personal traits`, and `if you don't understand a piece of code, say so. There's a good chance someone else would be confused by it as well` for the reviewer, and `don't take it personally. The review is of the code, not of you` and `be grateful for the reviewer's suggestions` for the reviewee. It’s important to have the right person reviewing, and for everyone to internalize the respect and balance between the reviewee and reviewer roles.

### Feature shipped with poor usability or did not solve the underlying business problem

What happened here is likely to do with the [dynamic between the business and engineering teams](/blog/2017/03/07/your-engineers-need-to-understand-your-business-heres-why/). Engineers may feel disheartened by business managers who seem solely concerned with functionality. This disregard can be reciprocal, with engineers focusing on delivering quality work but unconcerned with the business and the end users.

It’s not uncommon for engineers to be excluded from business discussions, until requirements are [thrown over the wall](/blog/2017/03/07/your-engineers-need-to-understand-your-business-heres-why/) at them — this lack of alignment creates inefficiencies that can have long-term consequences. Engineers may feel uneasy about the timeline or the product direction, or they may simply feel whatever’s being asked of them is a bad idea. If their organization doesn’t have a channel open for them to discuss their concerns, they might feel they have no choice but to go along with it. Ideally, dev teams today will be heavily involved in business discussions, and they’ll have the responsibilities to match.

>Ideally, dev teams today will be heavily involved in business discussions, and they’ll have the responsibilities to match

### Feature shipped BUT...

It might be the case that all seems well when a feature ships, but going forward it takes much more time to develop new features, and there are many brittle edge cases. Victor told me that in this case, it’s more likely that the architecture is simply inadequate, and not enough effort was made to clean up tech debt. This is not the opportunistic tradeoff of tech debt and time to market that many startups weigh; it’s when tech debt feels like it’s spiraled out of control. This might be the confluence of the poor dynamics we’ve discussed above, with engineers pressed for time, [burned out and working long hours](https://codewithoutrules.com/2017/06/21/why-company-want-long-hours/), and perhaps feeling unable to push back against business demands.

On his blog *Code Without Rules*, Itamar Turner-Trauring [explains several possible reasons](https://codewithoutrules.com/2017/06/21/why-company-want-long-hours/) why organizations might have unhappy developers unable to do their best work, and he offers some tips for how individual developers might be able to regain some control over their work lives.

What are other scenarios you’ve experienced? Leave a comment and let us know.
