---
title: How GitLab boosts collaboration through visibility, accountability, and measurement
author: Amara Nwaigwe
author_twitter: its_amaracle
categories: company
image_title: '/images/blogimages/2016-year-in-review/gitlab-2016-in-review-cover.png'
description: Find out how we’re tackling new enterprise challenges like DevOps at scale, collaboration and performance monitoring in our “best release ever.”
cta_button_text: 'Check out our <strong>GitLab 9.0 release</strong> webcast!'
cta_button_link: 'http://get.gitlab.com/gitlab-9/'
---

From re-organizing teams to adopting new architectures, we're seeing a massive shift in how enterprise development teams build products. Ultimately, the goal of all of this change is to deliver amazing customer experiences, repeatedly. For most teams, a shift in the way they work will require changes to their tooling. We’re happy to have released [GitLab 9.0](/releases/2017/03/22/gitlab-9-0-released/) at a time when development teams have such a strong opportunity to change the way they deliver customer value.

<!-- more -->

## 9.0 Tackling New Enterprise Challenges

Every software development team likely feels pressure to move faster, shipping more software in shorter time periods. For enterprise teams, this new pace will lead to new ways of working.  

| Old Way               |     |New Way                   |  
| :-----------          |:---:| ------------:            |
| Monoliths             | ==> | Microservices            |    
| Siloed Teams          | ==> | Cross-functional Teams   |   
| Manual test & release | ==> | Automated test & release |
| Manual configurations | ==> | Infrastructure as Code   |
| Team-defined tooling  | ==> | Tools-as-a-Service       |  
| Annual releases       | ==> | Frequent releases        |

Each of these changes will ask more of your tools. Microservices leads you to question if manually setting up and maintaining integrations across hundreds of projects and their corresponding project services, like issue tracking and CI, is the best use of the team’s time. The need to create cross-functional teams will require greater access and visibility across functions and lines of businesses. It will also put more pressure on your tools to ensure that contextual information about your code is maintained as it moves from an initial idea to code running in production. Automation will demand tight integration across your tools to fully remove human interaction from specific parts of your workflow. [Infrastructure as Code](/topics/gitops/infrastructure-as-code/) will mean that your Ops teams will now need the same tools you provide your developers: versioning, testing, and so on. The ultimate goal of all of these changes is to enable faster delivery of value so you can better serve your customers.

We understand that keeping pace today requires some big shifts in the way teams work together. Last year, we made it our mission to ship the entire software development lifecycle — from idea to production — in a single user interface, and we accomplished that goal. You can see the full list of highlights in our ["2016 Year in Review" blog post](/blog/2017/01/24/gitlab-2016-year-in-review/). Now, we’re excited to introduce [GitLab 9.0](/releases/2017/03/22/gitlab-9-0-released/) and our next mission to tackle new modern development challenge, like enterprise collaboration, DevOps at scale, and performance monitoring.

### Enterprise Collaboration

As development teams work to break down silos and collaborate across teams, they'll need tools that can mirror their new cross-functional way of working, acknowledging that while the new enterprise team is distributed, they are more collaborative than ever before.

#### Subgroups (CE)

We’ve introduced [subgroups](https://docs.gitlab.com/ee/user/group/subgroups/) so you can now create groups within groups. Most teams have some level of hierarchy within them, like our own backend team that is split up across different jobs-to-be-done in our product.  Subgroups now support sharing different code repositories across hierarchical team structures. These more granular group settings not only allow teams to organize their users and projects into groups that better reflect their org structure, but they also help IT admins better manage permissions across projects. Admins won't have to worry about one-off requests to a repo, they can now organize these individuals into a subgroup and apply a group-level permission to it.

### DevOps at Scale

Our customers, who use GitLab as their DevOps toolchain, have shared that successful DevOps practices boil down to visibility and accountability across teams. The need for visibility and accountability places new requirements on the tools these teams work with. They can't have a series of tools strung together that drops anonymized code from a Git repository into a CI/CD platform and assumes that Ops teams to will be able to deploy it with no hickups. Tooling for DevOps isn't about just having the components of the toolchain, it's about making sure that everything works together and that contextual information is maintained from start to finish. To help further improve how development and operations teams work together, we've released GitLab Deploy Board.

#### Deploy Board (EEP)

Deploys are risky when there is a lack of visibility between Development and Ops. With this first iteration of [deploy boards](https://docs.gitlab.com/ee/user/project/deploy_boards.html), users will be able to watch a deploy from start to finish: seeing it roll out across pods.

### Measurement and Monitoring

For most teams, measurement and monitoring are tedious tasks in software development, but they're incredibly important to teams that are looking to continuously improve. Measurement, like GitLab's [Cycle Analytics](/stages-devops-lifecycle/value-stream-analytics/), is key to helping teams understand what parts of their development process might be slowing them down. In 9.0, we're moving beyond measurement and working to help teams solve application performance monitoring challenges. Monitoring is critical to ensuring application performance meets the team's quality bar. Imagine if your application monitoring tool could help you avoid pushing poor-performing code in the first place? That's exactly where we are heading.

#### Prometheus Environment Monitoring (CE)

To address the tedious setup of application performance monitoring, with 9.0 we will activate [monitoring by default](https://docs.gitlab.com/ee/user/project/integrations/prometheus.html). Users can now measure the performance of their application and measure the performance of GitLab.  

We are a company that ships a new version of our product every month so while the milestone 9.0 is a big deal for us, it is also just marks the beginning of the amazing things we have to come. We're a open company so you can always follow our product direction, click into open issues, and contribute your ideas and feedback!

<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/qkTTuDBKzvw" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

## [Watch the GitLab 9.0 Webcast](http://get.gitlab.com/gitlab-9/)

To see GitLab 9.0 in action, [register to watch](http://get.gitlab.com/gitlab-9/) the GitLab 9.0 release webcast on demand! During this webcast, Product managers Régis Freyd and Joshua Lambert explain how GitLab covers 100 percent of your DevOps toolchain and demonstrate GitLab Deploy Board and Prometheus Monitoring. Ready to bring GitLab 9.0 to your team? [Contact sales](/sales/) to get started.
