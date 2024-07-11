---
title: "Workflow tips to ship faster without sacrificing security or quality"
author: Erica Lindberg
author_gitlab: erica
author_twitter: elindberg_
categories: culture
image_title: '/images/blogimages/workflow-tips-security-quality-cover.jpg'
description: "We partnered up with HackerOne to explain how to ship faster with
a security-first development mindset. Watch the recording and check out the slides here."
twitter_image: '/images/tweets/workflow-tips-security-quality.jpg'
tags: security, workflow
---

[Release early and often](/blog/2016/07/21/release-early-release-often/),
respond quickly to customer feedback, iterate. Rinse, repeat.
The value of getting new features and products in front of customers faster has made
its mark on the business world. As a result, development teams are under pressure
to shorten release cycles and meet tighter deadlines all while maintaining high
quality and security standards. How do experienced teams do it?

<!-- more -->

Accelerating the development lifecycle without cutting corners is no easy feat but
it can be done. While there's no "silver bullet" solution, adopting a security-first
mindset and a few workflow best practices can help.

Watch the our webcast with HackerOne below to get all the details on how you can build in quality and
security checks throughout your development lifecycle from GitLab's Product Manager, [Victor Wu](/company/team/#victorwu416),
and GitLab Security Lead, [Brian Neel](/company/team/#b0bby_tables).

You can watch the recording, check out the slides, and read a few of the highlights
below.

## Security as a first-class citizen

Ensuring every line of code is secure is a shared responsibility, meaning security
should be top of mind from the very beginning of the development process. Don't wait
until the very end to start the conversation around security and check for vulnerabilities.

> "We want to take security and make it a first-class citizen. You want security controls
baked into each stage of your development process. When we develop software and we
develop in small chunks, we always say we want cross-functional collaboration.
We want people at the table earlier on." - Victor Wu, Product Manager, GitLab

Whether you have dedicated security experts, or perhaps a lead engineer who's wearing
multiple hats, talk about security from the get go so that security issues
can be identified earlier, and vulnerabilities can be avoided altogether.

## Workflow best practices

In the webcast, Victor details how DevOps teams can bake quality and security controls
into their workflows so that these checks don't become cumbersome bottlenecks at the
very end of the process.

Here are a couple of his highlights:

### Make smaller changes and commit often.

Perhaps the most critical adjustments to make to your workflow is how you actually write
and collaborate on code. When we talk about development speed, a big part of this is transitioning
away from developing huge portions of code over long periods of time to making smaller changes more often
and making that work visible sooner.

> "We want to ship smaller pieces, often. Whether it's in an agile context, scrum,
or moving away from the more traditional waterfall requirements, we want to ship
in small pieces so we can react more quickly and minimize risk." - Victor

By adopting this practice, it's quicker to perform code reviews and
security checks because reviewers are only dealing with a couple of changes. Then,
if there is an issue, it becomes much easier to identify the cause because there
are fewer new variables to consider.

### Involve experts and reviewers early in the development process.

Involving collaborators and reviewers earlier in the development process does two things.
First, it can speed up the development process by giving stakeholders an opportunity
to anticipate problems *before* developers begin to write code, and nip them in the bud.
It's common to involve your UX team, product managers, and software architects during the
planning phase and throughout the code review process, but often security is left out.

Get your security experts involved in the earlier phases of your development process
so it doesn't become a bottleneck right before you're trying to release.

> "Let's get our UX folks early on, let's get our business managers involved early on.
Let's not wait until very late in the game before we bring our product managers,
senior engineers, our architect, and security experts." - Victor

Secondly, by keeping all stakeholders involved in the conversation throughout the
development process, you can ensure that by the time the code is ready to move
into production, most errors have been spotted and corrected.

### Get code into staging or test environments earlier.

This goes back to the high-level concept that we want to work on small pieces of code and get
them integrated into the mainline branch right away to minimize the risk of something not working,
or not accounting for certain things.

"The point of pushing code into production-like environments is to get your feature into a place that looks
and functions more like the real world," says Victor. Getting your code into staging or test environments sooner
can also help to minimize security risks.

> "You might have certain tools to scan dynamically and inject attacks into
your systems, whether that might be directly into your data or your code base.
In the same way that you have human testers doing manual testing, in addition to the automated testing,
you might have human users doing the security testing as well." - Victor

Again, if you're developing in small chunks, involving stakeholders earlier on into those environments,
that they can jump into those environments and start testing the feature.

### Leverage your community to spot and prioritize security issues and bugs faster.

Even with all the right quality and security checks threaded throughout the development process,
problems can slip through. In the webcast, Security Lead, Brian Neel, details the
evolution of the security development process (starts at 28:20) and why GitLab's security
team uses a bug bounty program to round out our security practices.

> "Right around the time you push a beta out to customers, you can open up a bug bounty program, and it provides
sort of an endless coverage from prior to version 1 all the way through version 2 and into the future for any new
vulnerabilities. You're constantly going to have professional hackers out there testing this code, testing it against new types of
vulnerabilities."

## Recording

<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/9_yicOrtbqM" frameborder="0" allowfullscreen="true"> </iframe>
</figure>


## Slides

<iframe src="//www.slideshare.net/slideshow/embed_code/key/fWsLY4ft2VvAMA" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe>

----

[Cover image](https://unsplash.com/search/security?photo=AmECs71KlSQ) by [Mike Wilson](https://unsplash.com), licensed
under [CC0 1.0 Universal](https://unsplash.com/license).
{: .note}
