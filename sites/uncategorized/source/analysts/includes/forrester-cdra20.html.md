---
layout: markdown_page
title: "The Forrester Wave: Continuous Delivery And Release Automation, Q2 2020"
description: "This page represents how Forrester views our CDRA capabilities in relation to the larger market, Q2 2020."
canonical_path: "/analysts/forrester-cdra20/"
noindex: true
---
## GitLab and the Forrester Wave for Continuous Delivery and Release Automation (CDRA) 2020

This page represents how Forrester views our CDRA  capabilities in relation to the larger market and how we're working with that information to build a better product. It is also intended to provide Forrester with ongoing context for how our product is developing in relation to how they see the market.

For those with access to Forrester Research, a link to the report can be found [here](https://www.forrester.com/report/The+Forrester+Wave+Continuous+Delivery+And+Release+Automation+Q2+2020/-/E-RES157265). 

### Forrester's Key Takeaways on the CDRA Market in the report:


**Visualizations Of Complex Application And Deployment Models Are Key Differentiators**

> As the continuous delivery market continues to consolidate, and with upstream continuous integration capabilities and higher-order management becoming the norm, vendors are competing increasingly on breadth of functionality. The ability to visualize complex application and deployment models continues to be a differentiator, as does the management of deployment outcomes. Appropriate use of advanced analytics and machine learning is also a key factor, with continuing vendor investment resulting in valuable capabilities such as improved release readiness.

### Forrester's take on GitLab in the report:

**GitLab is expanding its comprehensive platform quickly.** 

> GitLab emerged from the continuous integration side of the market and, with its foundation in source control, has strong headwaters capabilities. GitLab supports continuous integration and deployment to cloud-native platforms, but support for legacy platforms is lacking. More recently, the company has added continuous delivery features, including continuous integration and deployment for Kubernetes. The product bases its application modeling on Helm charts, thus requiring Kubernetes to function. The firm grounds its strategy in a very active open source community and a clear ability to execute on this business mode. GitLab distinguishes itself as one of the fastest-innovating vendors in this evaluation.

**GitLab's take:** Having already established ourselves as consistent leaders in CI and cloud native CI over the last couple years, investing in CD has been a priority to make sure the other half of the "CI/CD equation" can be easy and attainable for anyone. Being named in the CDRA market as a strong performer for the first time speaks volumes about our pace of innovation and commitment to making not just CDRA, but CI/CD in its entirety, easy and attainable for everyone developing software. 

## GitLab's commentary on this report

GitLab cited as a **Strong Performer** in the Forrester Continuous Delivery and Release Automation (CDRA) report for Q2 2020 is only the beginning. Here's why:

**Rapid innovation is a part of our DNA at GitLab** and plays a huge role in continuously delivering new functionality and improving upon existing features by shipping the smallest possible change each month, embracing what we call a [minimal viable change (MVC)](https://about.gitlab.com/handbook/values/#minimal-viable-change-mvc) approach. It's extremely exciting to see GitLab positioned favorably among the market in recent years' CI analyst Waves and now this CDRA Wave as we mature our [Release](https://about.gitlab.com/direction/ops/#release) capabilities. Simply put, it's rare to see a single solution cover so much ground in the CI/CD market and do it well, as a majority of DevOps solutions typically specialize in either CI or CD, not both. This means that alternative solutions rely on integrations to make up for what they lack in native product capabilities, or require users to combine multiple products and add complexity to their likely already complex DevOps toolchain in order to achieve similar success.  

Although we've still got work to do in the CDRA realm to become a leader, we see the results of this Wave as very positive reinforcement that we're taking the right approach. Check out some of the highlights from the publication, what we've learned, and where we're headed below.

### Our highlights

How a vendor fares in the realm of CDRA has a direct correlation to the strength and maturity of their CI/CD capabilities. As a result, reports like this CDRA Wave act as one of many solid indicators for a vendor's ability to help businesses achieve their goals and automate their software development processes. We think the highlights below indicate that we're headed in the right direction.

**GitLab among vendors with the highest score** in the following criteria:
- Build automation/continuous integration
- Deployment and operations
- CDRA vision and value proposition
- Product innovation
- Market approach and viability

## Lessons learned 

**Where we disagree**

Although Forrester cites "Visualizations Of Complex Application And Deployment Models as Key Differentiators" above and we acknowledge there's value in this approach to support complex deployments depending on the situation, we don't fully agree with the need to create a visualization modeling tool in order to achieve similar success in GitLab. We believe the use of [Directed Acyclic Graphs (DAG)](https://docs.gitlab.com/ee/ci/directed_acyclic_graph/#dag-visualization), [parent-child pipelines](https://docs.gitlab.com/ee/ci/parent_child_pipelines.html), and [runbooks](https://docs.gitlab.com/ee/user/project/clusters/runbooks/) will more than sufficiently support advanced orchestration and choreography of deployments. 

**Where we agree**

It's no secret that GitLab one of the strongest Kubernetes integrations anywhere. However, based on feedback in the publication, we acknowledge that we have an opportunity to improve our support for non-Kubernetes release choreography legacy deployments. On our Release Orchestration [direction page](https://about.gitlab.com/direction/ops/#release-orchestration), we've added a greater investment and support for non-Kubernetes release choreography by investing in improved visibility and deployment monitoring, as well as expanding our ability to include Release Runbooks.

On our [Continuous Delivery](https://about.gitlab.com/direction/release/continuous_delivery/) direction page, we have added support for [AWS deployments](https://gitlab.com/groups/gitlab-org/-/epics/2351) and have extended our auto DevOps functionality to non-Kubernetes AWS targets. 

You can check out our [top vision items](https://about.gitlab.com/direction/release/release_orchestration/#top-vision-items) for Release Orchestration, [Continuous Delivery](https://about.gitlab.com/direction/release/continuous_delivery/#top-vision-items) and [Advanced Deployments](https://about.gitlab.com/direction/release/advanced_deployments/#top-vision-items) to find more details about our longer term focuses for usability, maturity, and nimbleness of orchestrating releases and automating deployments in GitLab based on lessons learned.

### What role does CDRA play going into the future?

Gone are the days of manual, time consuming, ways of releasing software unless you're behind the curve -- the good news? It's never too late to get on the right path. Analyst reports like this CDRA Wave provide valuable insights you can use to be better informed when making decisions that impact your business to assess where your organization is today versus where you want to be.

As the pace of technology and software development continues to place an immense amount of pressure on both vendors and businesses to modernize how they deliver their applications, automation plays a central role. The CDRA market will keep evolving and become more important than ever since it has a direct correlation to the strength/maturity of an organization's overall CI/CD capabilities. As called out previously by Forrester, we've seen a noticeable trend where "the continuous delivery market continues to consolidate" over recent years. I'd take this a step further and say that the "DevOps market continues to consolidate," meaning companies are finding value in reducing the number of products that make up their DevOps toolchains as opposed to adding to the complexity, a trend that seems to resemble a more realistic and attainable version of the tool consolidation trend we saw from software development in the "mainframe era" pre-DevOps. Less complexity makes software development processes more scalable, easier to maintain, and more cost efficient, which wasn't necessarily the case at the turn of the digital age even a couple decades ago. 

Heading into the near future, all indications point to this trend of tool consolidation becoming more of a focal point among the greater DevOps community. I think we'll see a larger number of publications and analyst coverage with CI, CD, and release automation evaluated together as a group instead of segmenting them like we do with CI and CD today. One thing is for sure, the future is bright and this is a great time for us at GitLab to raise the stakes of our complete DevOps platform, not hedge our bets.

## Closing

Since 2018, we've made significant investments to add new functionality, improve existing features, and make [Continuous Delivery](https://about.gitlab.com/direction/release/continuous_delivery/), [Advanced Deployments](https://about.gitlab.com/direction/release/advanced_deployments/) and [Release Orchestration](https://about.gitlab.com/direction/release/release_orchestration/) with GitLab more mature products areas. 

Some relevant features we're looking forward to shipping in upcoming releases:
- [Associate group milestones to releases](https://gitlab.com/gitlab-org/gitlab/-/issues/121476) 
- [Support sharing of environments in a group](https://gitlab.com/gitlab-org/gitlab/-/issues/196168)
- [Group Deploy Keys](https://gitlab.com/gitlab-org/gitlab/issues/14729)
- [Post-deployment monitoring](https://gitlab.com/groups/gitlab-org/-/epics/3088)
- [Implement Scale Up/Down Switch from Deploy Boards](https://gitlab.com/gitlab-org/gitlab/-/issues/218140)

And some exciting features recently shipped as of July 2020:
- [Support More actions in the Release Pages UI](https://gitlab.com/groups/gitlab-org/-/epics/2312)
- [Release generation from within .gitlab-ci.yml](https://gitlab.com/groups/gitlab-org/-/epics/2510)
- [Set a deploy freeze in the UI](https://gitlab.com/gitlab-org/gitlab/issues/24295)
- [Run pipelines in the parent project for MRs from forks](https://gitlab.com/gitlab-org/gitlab/-/issues/217451)

We're constantly humbled and motivated by the trust our active community of contributors and customers place in our ability to continue improving GitLab while we work to become a leader in CDRA. Each day we get closer to making seamless application delivery a reality and release management easier but we can't do it without our community. And for that, we thank you! As we continue to invest, iterate, and prepare for the future, we welcome your feedback along the way. [Everyone can contribute](https://about.gitlab.com/company/strategy/#why) at GitLab. 

Until next time.

