---
layout: markdown_page
title: "GitLab removes bottlenecks"
description: "If the goal is to deliver working features faster, then bottlenecks are things to be fixed to go faster. Learn how GitLab can help!"
canonical_path: "/solutions/remove-bottlenecks/"
---
## Why Bottlenecks?
- Source of friction in the process
- Where work backs up and doesn’t get done
- The work is waiting for something or someone

If the goal is to deliver working features faster (aka reduce cycle time), then bottlenecks are things to be fixed to go faster.

### Consider: [Gene Kim - Phoenix Project](https://itrevolution.com/the-three-ways-principles-underpinning-devops/)

In the Phoenix Project, they discover 'three ways' of DevOps, which are key to understanding the transformation:

1. The First Way: **Systems Thinking** <br> From the Business to the Customer or From Dev to Ops.
1. The Second Way: **Amplify Feedback Loops** <br> Feedback from Ops back to Dev
1. The Third Way: **Culture of Continual Experimentation and Learning** <br>Think many smaller feedback loops of learning and improvement.

When you distill this down, the point is to find and remove the **bottlenecks** that inhibit the flow of value to customers (from Dev to Ops).

## What are the most common bottlenecks?

###  Typical Bottlenecks: [11 Common DevOps Bottlenecks](https://www.forbes.com/sites/mikekavis/2014/12/18/11-common-devops-bottlenecks/#1dac2a177737)
From Mike Kravis on Forbes, where he writes about the key bottlenecks he sees in large organizations.


|  **Bottleneck**   |  **Notes / How GitLab Helps**  |
| 1. **Inconsistent environments** Where dev, test and production environments are configured differently, causing errors, rework, and wasted effort troubleshooting.| GitLab CI/CD, Review Apps, docker support, and kubernetes integration helps to make each environment consistent. |
| 2. **Manual intervention** All the manual work that people do from testing to packaging to configuring applications takes time, is error prone and slows down delivery.  Manual steps are simply not repeatable or scalable. | GitLab CI/CD enables automation to reduce manual tasks and steps |
| 3. **SDLC maturity**  Many organizations still have waterfall processes or 'water-scrum-fall' agile processes, which limits their ability to accelerate delivery. **| GitLab supports and enables adoption of Agile practices of scrum, kanban, and SAFe  |
| 4. **Legacy change management process** In many organizations, there are manual gates and reviews of changes to get approval like weekly "change advisory boards" based on ITIL practices tend to slow down and gate changes.   |  Organizations will need to understand how to evolve their change management processes.  GitLab enables auditing, traceability, and approvals of changes.  Also, Canary and Incremental deploys dramatically reduces the risk of deploying change. |
| 5. **Lack of operational maturity** In many situations, developers have limited access to application performance monitoring tools, so they lack insight into how their application is really working.   | GitLab includes application monitoring (Prometheus to give developers feedback)  |
| 6. **Outdated testing practices**  Manual testing simply cannot scale and keep up with delivery at agile and devops velocity. The silos between dev and QA teams is also a common source of friction and bottlenecks. |  GitLab CI enables automated testing including code quality, security testing (SAST, DAST, etc)  |
| **7. Automating waste**  If team automates the existing process, they are probably automating an inefficient process.  A best practice is to try to improve the process before automating it. |  This is a cultural and organizational issue - if a person automates a wasteful process, then they are simply getting bad results faster.  GitLab Auto Devops can help, by giving teams a working CI/CD pipeline, but ultimately the team must own their automation  |
| **8. Competing or misaligned incentives and lack of shared ownership** Often, silos have their own goals, objectives, and KPIs, if not well designed, often this creates situations where teams don't share the same common objectives. |  Leadership must understand the impact of the goals and incentives they place on their teams.  Are they encouraging an end to end (systems thinking) perspective or are they rewarding silos?  |
| **9. Dependence on heroic efforts**  In the Phoenix Project, 'Brent' was the hero who was vital for every project.  He was actually a bottleneck that slowed teams down because they depended on him rather than optimizing their processes.  |  This is a culture challenge, where firefighters get the accolades.  Leaders need to evolve the culture to encourage fire prevention (which is boring).  |
| **10. Governance as an afterthought**  Often, transformations do not account for how other processes and procedures need to change, such as portfolio planning, resource allocation, and approvals of changes. |  Inherently a cultural challenge, but GitLab also helps with Code Owners, Merge Request Approvals, and traceability from Epics to Issue to Merge Request to application performance in production.  |
| **11. Limited to no executive sponsorship** If leaders view the agile and devops transformation as non-strategic, then they won't make the transformation a priority and ensure success. |  Ultimately, long term success in a DevOps transformation is dependent on a cultural, process and tool transformation.  Without executive sponsorship and support, transformations are at risk of stalling or being overtaken by initiatives that have executive sponsorship.  |


### Three Key Take Aways:

1. Removing bottlenecks from the SDLC or DevOps lifecycle is a key objective for Application Delivery leaders
1. GitLab can dramatically help eliminate or reduce bottlenecks
   - Linkage from planning (Epics to Issues to MRs to Production)
   - World class automation with GitLab CI/CD
   - Governance and approvals with GitLab MRs
   - Management of containers, kubernetes, and environments
1. **Leadership** AND **GitLab** can enable and accelerate a DevOps transformation
