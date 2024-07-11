---
title: "Inside GitLab’s code review flow"
author: Emily von Hoffmann
author_twitter: emvonhoffmann
author_gitlab: evhoffmann
categories: culture
image_title: '/images/blogimages/code-review-blog.jpg'
description: "We keep a quality-conscious mindset throughout the development process, sharing the responsibility among everyone instead of seeing review as an obstacle at the end."
cta_button_text: 'Watch our webcast, <strong>Code Review: A Business Imperative</strong> now!'
cta_button_link: 'https://www.youtube.com/watch?v=XluG9mAQdSo&feature=youtu.be'
---

Code review, or engineers manually reviewing code as it is being developed, is one of several tools that organizations have to maintain code quality. Having a clean codebase allows developers to quickly build new features, which comes in handy if you find yourself needing to react promptly to the market.  

<!-- more -->

Since teams can feel pressed to skimp on code reviews due to deadline pressure, it’s important to create a clear, repeatable process that becomes a habitual part of the workflow. In addition to the business benefits of keeping code quality high, a robust code review process also carries benefits for productivity, like helping share technical knowledge across teams, and looping in the right people during the process instead of at the end. With a tool like GitLab, where the intuitive UI and discussion features make it easy for non-technical people to contribute, code review can also become a mechanism for uniting stakeholders in your organization.

While using GitLab to build GitLab, we apply a quality-conscious mindset throughout the development process, sharing the responsibility among everyone instead of seeing review as an obstacle at the end.

### How we think about code reviews

We review every single change, so nothing is ever committed directly to master, but we think “code review” is too narrow a term for what we do. Software engineers manually reviewing code is just one part of the entire product development process, and is interrelated with many other processes, so it doesn’t make sense to think about them separately. They all move us closer to our desired outcome: awesome features, shipped on a monthly basis, that meet our customer needs and grow our business.

### Who is involved

Our three core teams involved in the process are product managers, designers, and software engineers. All three teams are constantly collaborating and sharing resources; our roles are not strictly defined by our job titles. PMs and designers may write code, engineers may mock up a design, and everyone discusses the features and the product overall.

### Our process

We have the benefit of constant dogfooding, or using our own product so as to discover new use cases, test our assumptions, and generally improve GitLab for our users. Loosely, we have a product-design phase, and a code implementation phase. We use [GitLab issues](/stages-devops-lifecycle/issueboard/) to mediate product-design discussions, and GitLab merge requests to mediate code discussions. We encourage “[WIP](/blog/2016/01/08/feature-highlight-wip/)”, or work in progress, merge requests for code collaboration, especially when people with different skills are working together: non-engineers often actively engage in WIP merge request discussions to hash out edge cases and design decisions. Since we ship monthly, we schedule work monthly, and putting up WIP merge requests early helps us plan ahead and adjust the scope when we need to.

We generally assign one backend engineer and one frontend engineer to each feature, which is scoped as small as possible to reduce risk and help us move fast. The backend engineer and frontend engineer collaborate in the WIP merge request, and there is at least one reviewer who reviews the code and makes comments. When all comments, bugs, and design questions are addressed, we merge the feature branch into master. All designers, product team members, and engineers typically check out branches themselves and run code in a local or virtual environment to verify features throughout the development process. (This is also the case for our marketing and people operations teams — GitLab's UI makes it simple for non-technical users to get up to speed and start contributing without needing to work from the command line.) Engineers do their own manual and sanity testing, but we use [Test Driven Development](http://agiledata.org/essays/tdd.html) to catch most errors. We don’t follow a strict Agile flow, instead, we call it [Conversational Development](http://conversationaldevelopment.com/).

### The benefits

We believe that this approach, which doesn’t segregate code review to the end of the process and entirely burden the reviewer, places responsibility on all of us. If something is broken, it is because we all failed collectively, so we do a retrospective and think about how to fix it. In a very concrete way, code reviews help enforce conventions, consistency, and technical standards among your team. Newer team members can accelerate their education about the product by creating code and then reviewing it critically. A collaborative code review process helps engineering and product teams work closely together to make the best decisions.


Watch our webcast, [Code Review: A Business Imperative](https://www.youtube.com/watch?v=XluG9mAQdSo&feature=youtu.be) to learn how code review can help you keep up with the market by shipping better features, faster.
{: .alert .alert-gitlab-orange}
