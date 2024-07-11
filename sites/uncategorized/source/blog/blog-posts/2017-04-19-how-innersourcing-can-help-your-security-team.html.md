---
title: How innersourcing can help your security team
author: Emily von Hoffmann
author_twitter: emvonhoffmann
author_gitlab: evhoffmann
categories: insights
image_title: '/images/unsplash/data.png'
description: Security is a major concern during the development process — innersourcing can help.
cta_button_text: 'Read our <strong>2016 Global Developer Survey report </strong> now!'
cta_button_link: 'http://get.gitlab.com/global-developer-survey/'
---

In today’s world of developer-defined tooling and accelerated delivery pace, security and compliance are becoming more difficult. With increased threats from advanced hackers, and security breaches rapidly turning into PR storms, your security team is under more pressure than ever before.

<!-- more -->

In our [2016 Global Developer Survey](http://get.gitlab.com/global-developer-survey/), 86 percent of respondents told us security is important or extremely important to them when developing code — code cannot be good without being deployed within a solid security architecture. In this context, innersourcing, or [the use of open source development techniques](http://www.inner-sourcing.com/open-source-and-opengl-a-response-from-tim-oreilly/) within the corporation, is a useful way for some enterprise teams to reap the benefits of open source principles while keeping their code private to non-employees.

Enterprise teams have a lot to gain from open source methods. Some of the most [important of these](/blog/2014/09/05/innersourcing-using-the-open-source-workflow-to-improve-collaboration-within-an-organization/) include making all software projects visible by default to all employees, and allowing anyone who can see the code to fork it and make changes freely. New ideas can also arise by allowing people outside the project to suggest changes with pull and merge requests, and having a line-by-line conversation about the code. Using unit and integration tests lets developers make changes without fear of breaking things. Similarly, incorporating continuous integration ensures that every change is automatically tested. These principles can help the entire team collaborate, but they have some specific applications for the security team.

### Break down silos

While in the past a developer might have [relied on word of mouth](/blog/2014/09/05/innersourcing-using-the-open-source-workflow-to-improve-collaboration-within-an-organization/) to learn about other projects in their organization, and had to track someone down to give them access if they wanted to contribute, innersourcing removes the barrier to entry. By reusing code from their colleagues on the security team, developers can be more efficient while also ensuring greater consistency in their code.

By allowing developers to work on projects outside of their department without having to ask for permission, innersourcing ensures that a security specialist can be easily looped into a project for review and feedback. This can also help improve the relationship between security and development teams. Together with security automation, security team members provide an additional feedback loop during the application development process, rather than refining security at the end.

### Spot (and fix) security issues

Innersourcing pairs the benefits of open source workflows, like greater collaboration and improved code quality, with greater assurance that code is secure: 39 percent of our survey respondents said innersourcing has helped them uncover security issues they hadn't seen before.

For example, using our own code review workflow, we [discovered a vulnerability in 9.0](/releases/2017/03/29/gitlab-9-dot-0-dot-2-released/) that could allow a user to rename upload directories for projects that they did not own, effectively breaking all links to those uploads. After its discovery, this was fixed in a subsequent security release, which we release as soon as we find vulnerabilities.

### Enable knowledge sharing and innovation

By making software projects visible within the company, and including thorough documentation, security team members can share the constraints and common problems they run into when reviewing developers' code. At GitLab, for both internal and external knowledge sharing, we publish blog posts for every security release, explaining the fixes included in each release, and giving credit to the person who reported the vulnerabilities. In addition, once a security issue is discovered in one project, a developer can quickly search all projects for similar bugs.

Helping development teams understand recurring security issues makes it more likely that they'll not only avoid making the same mistakes in the future, but that their combined skills might allow them to innovate around the security constraints.

<p class="alert alert-orange" style="background-color: rgba(252,163,38,.3); border-color: rgba(252,163,38,.3); color: rgb(226,67,41) !important; text-align: center;">Read our &nbsp;&nbsp;<i class="fab fa-gitlab" style="color:rgb(107,79,187); font-size:.85em" aria-hidden="true"></i> &nbsp;&nbsp;<strong>Global Developer Survey Report</strong> &nbsp;&nbsp;<i class="fab fa-gitlab" style="color:rgb(107,79,187); font-size:.85em" aria-hidden="true"></i> &nbsp;&nbsp;<a style="color: rgb(107,79,187);" href="http://get.gitlab.com/global-developer-survey/">Download it here</a>!</p>
