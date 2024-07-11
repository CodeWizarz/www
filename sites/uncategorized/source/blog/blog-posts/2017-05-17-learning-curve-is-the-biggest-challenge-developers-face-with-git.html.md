---
title: "Why Git is worth the learning curve"
author: Emily von Hoffmann
author_twitter: emvonhoffmann
author_gitlab: evhoffmann
categories: insights
image_title: '/images/why-git-is-worth-the-learning-curve.jpg'
twitter_image: '/images/tweets/why-git-is-worth-the-learning-curve.png'
description: "Although the learning curve can pose a challenge, teams have a real incentive to transition to Git."
cta_button_text: 'Read our <strong>Global Developer Report</strong> now!'
cta_button_link: 'https://page.gitlab.com/rs/194-VVC-221/images/gitlab-enterprise-survey-2016-report.pdf'
---
Over the last decade, distributed version control systems, like Git, have gained popularity and are [regarded as the most important development tools](https://page.gitlab.com/rs/194-VVC-221/images/gitlab-enterprise-survey-2016-report.pdf) by
developers. Although the learning curve can pose a challenge, developers told us that Git enhances their ability to work together and ship faster, suggesting that managers have a real incentive to help their teams over the initial hill imposed by the transition to Git.

<!-- more -->

With the full history of the repository stored on each developer’s machine, using Git makes commits, merges and other commands much faster, even enabling developers to work offline. Upgrading your source code management solution to a distributed version control system is the first step toward building a flexible working environment that can support modern development teams, but moving away from legacy systems and tools can be a daunting prospect.

### The challenge

In our [Global Developer Survey](https://page.gitlab.com/rs/194-VVC-221/images/gitlab-enterprise-survey-2016-report.pdf), the biggest concern respondents cite about using Git is the associated learning curve, with 40 percent saying they consider it an issue:

![learning curve is the biggest challenge devs face with Git](/images/blogimages/why-git-is-worth-the-learning-curve.png){: .shadow}<br>

There are several reasons why this could be the case. Broadly, Git has a different underlying model than other VCS, one that makes it more intuitive for [computer scientists and mathematicians](http://eagain.net/articles/git-for-computer-scientists/), but potentially less so for those with other backgrounds. Unlike with some programming languages where knowledge of one eases the adoption of another, Git commands are different from those in other version control systems, making familiarity with another system only a minor advantage. Finally, the number of Git commands and arguments that make it a particularly powerful tool also complicate the beginner’s task of learning the ropes. For teams transitioning to Git, this not only means migrating repositories, but relearning ingrained habits and workflows, and it may sting a bit.

### The rewards

#### Greater collaboration and code quality

Nearly 80 percent of respondents [confirmed](https://page.gitlab.com/rs/194-VVC-221/images/gitlab-enterprise-survey-2016-report.pdf) that they see increased collaboration with teammates as a major benefit of the Git workflow, which nudges teams to update each other early and often, enabling them to collect feedback regularly and integrate suggestions throughout the process. The accessibility of Git repositories makes it easier for contributors and specialists across your organization to collaborate, making it more likely that errors are spotted, resulting in better and more stable code. Feature branches, or branches containing one feature or bug fix, allow teams to discuss and perfect their code at the merge request stage, before changes are accepted into master. Before merging, a developer can commit their code locally to ensure it works, preserving the quality of the master code base.

#### “Cheaper” branching

The branching capabilities within Git are largely responsible for its popularity. Developers can create a new branch and isolated environment to work on new features, bug fixes, customer requests, or experiment on something new with minimal cost. Branching with Git is “cheap” in that it's easy to do and doesn’t take up a lot of space. Creating a new branch requires but a single command and no network connection, unlike Subversion and other centralized version control systems, where branching is a slow and repetitive process resulting in a complete copy of all code.

#### Easier merging

When coupled with a source code management tool like GitLab, you can enhance merging capabilities with a user interface that allows you to review and comment on changes on branches before merging. At GitLab, we call this a merge request and run [continuous integration](/features/continuous-integration/) on every branch as an additional quality gate to ensure everything that goes into the master code base works. With GitLab branching and merging, you can even protect branches to prevent merges that aren’t ready, and apply merge request approvals for an added layer of security.

More good news: just a few commands are required to get started, and the open source community around the world ensures there’s always someone awake to answer your question.


<p class="alert alert-orange" style="background-color: rgba(252,163,38,.3); border-color: rgba(252,163,38,.3); color: rgb(226,67,41) !important; text-align: center;">Read our &nbsp;&nbsp;<i class="fab fa-gitlab" style="color:rgb(107,79,187); font-size:.85em" aria-hidden="true"></i> &nbsp;&nbsp;<strong>Global Developer Survey Report</strong> &nbsp;&nbsp;<i class="fab fa-gitlab" style="color:rgb(107,79,187); font-size:.85em" aria-hidden="true"></i> &nbsp;&nbsp;<a style="color: rgb(107,79,187);" href="https://page.gitlab.com/rs/194-VVC-221/images/gitlab-enterprise-survey-2016-report.pdf">Check it out it here</a>!</p>
