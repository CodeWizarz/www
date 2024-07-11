---
title: 3 Rules for tackling thousands of open issues
author: Jacob Schatz
author_twitter: jakecodes
author_gitlab: jschatz1
categories: culture
image_title: '/images/blogimages/how-our-engineers-tackle-thousands-of-open-issues.jpg'
description: Keep your DevOps teams focused and productive with these three simple rules.
cta_button_text: 'Watch <strong>"Managing the DevOps Culture Shift"</strong>'
cta_button_link: 'https://www.youtube.com/watch?v=py8c6-3zyKM&feature=youtu.be'
---

 Every engineering team likely has a process for triaging issues and allocating them to different team members. Otherwise, it can be difficult to mobilize to put out small fires without losing sight of bigger goals for building new things over the course of your release cycle.

<!-- more -->

At GitLab, the pile of work to be done is perhaps even more visible than most. Right now, on the GitLab Community Edition [issue tracker](https://gitlab.com/gitlab-org/gitlab-ce) alone, there are 6,826 open issues, a number that could be numbing at best, and overwhelming at worst if viewed without a strong system for prioritization. Although I'm now the Frontend Lead, I started at GitLab as an engineer, and quickly became more productive than in any other previous job. I attribute this largely to the simple process that every new technical hire learns when they join, including a clear roadmap to follow when they start work every day. The key difference for me is that people at GitLab spend most of their time writing code, rather than talking about and planning it.

The secret hinges largely on our [issue board and labels](/stages-devops-lifecycle/issueboard/), with which we meticulously track progress and conversation. This also helps us meet other goals that are necessary for successful asynchronous work — we always opt for fewer meetings, and more communication through the issue tracker. All of these methods were passed down (and remixed) by our CTO, [Dmitriy Zaporozhets](/company/team/#dzaporozhets).

It boils down to three rules that help engineers sort issues and know exactly what to work on next, largely without consulting anyone:

### 1. Regressions have the highest priority.
Why do we fix regressions before anything else? A regression is some functionality that used to work but no longer does, so we want to make sure that all the stuff we've built continues to serve our users. We believe we need to have a commitment to the code that's already in the codebase before continuing to write new things. When a regression is fixed, it goes into the next stable release. By marking a merge request as `pick into stable`, we signal release managers to collect it the next time they come around looking for fixes to include. It works like garbage collection — we place it all by the side of the road, and the truck comes to pick it all up.  

### 2. Deliverables are always second.
Deliverables are the things that we are promising to deliver in the next release, and ideally, they are the highest priority (as long as nothing else that used to work is broken). A deliverable takes precedence over other work because we want to have a way to show our customers what will be coming out in the next release. These are planned based on bandwidth and time, after Product talks with leads and we figure out how we are going to make it happen.

When a developer gets to a new release, the only work that I actively assign involves the deliverables. Unless someone has an emergency, I don't assign any other work to any one developer; they are free to decide what they want to work on outside of their key deliverables. These are important to assign specifically, because each team member has their strengths, and with limited time before deadlines we have to delegate issues properly. If a deliverable doesn't make it into the current release, it is automatically pushed to the following release — we won't drop it until it is finished.  

### 3. With free time, grab bugs unless told otherwise.
There are always bugs to fix. We always aim to fix bugs quickly to create the most stable software, which is why not every Frontend Developer gets a deliverable. We also want to move fast and break things, so we want some developers available to work only on bugs. Often I tell new hires on the Frontend team to work on bugs and regressions for the first few months, unless there is an emergency. That helps them wrap their head around the codebase, and get comfortable.

In addition to making expectations very clear to developers, these rules also simplify my role as a manager. I can filter issues according to whether they're labeled "regression," "deliverable," or "bug" to quickly see where progress is being made. All communication happens in the issues, so the right people can jump in and speak to the question. There's no reason to have me be a mediator, instead, Frontend can talk to UX directly, and so on for the other teams.

Ideally, managers try to remove all formal meetings about projects and instead rely on flowing, open, recorded communication. This is the best system we've developed for managing remote engineers: they all know what to do, they’re very self-sufficient, and because of our development cycle it’s really easy to see whether we're on pace to meet our goals. By having issues [in the open](https://gitlab.com/gitlab-org/gitlab-ce/issues), everyone can stay focused on solving the problem.


<p class="alert alert-orange" style="background-color: rgba(252,163,38,.3); border-color: rgba(252,163,38,.3); color: rgb(226,67,41) !important; text-align: center;">Watch our webcast &nbsp;&nbsp;<i class="fab fa-gitlab" style="color:rgb(107,79,187); font-size:.85em" aria-hidden="true"></i> &nbsp;&nbsp;<strong>Managing the DevOps Culture Shift</strong> &nbsp;&nbsp;<i class="fab fa-gitlab" style="color:rgb(107,79,187); font-size:.85em" aria-hidden="true"></i> &nbsp;&nbsp;on demand. <a style="color: rgb(107,79,187);" href="https://www.youtube.com/watch?v=py8c6-3zyKM&feature=youtu.be">Register here</a>!</p>

----

Cover image: "[wocintech (microsoft) - 69](https://www.flickr.com/photos/wocintechchat/25926648871/)", by [WOCinTech Chat](https://www.flickr.com/photos/wocintechchat/). Licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/legalcode).
{:.note}
