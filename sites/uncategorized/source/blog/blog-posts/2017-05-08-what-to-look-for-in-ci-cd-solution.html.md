---
title: What to look for in a continuous integration tool
author: Rebecca Dodd
author_twitter:
author_gitlab: rebecca
categories: insights
image_title: '/images/blogimages/what-to-look-for-ci-cd.jpg'
description: With so many options out there, here's what you need to weigh up when deciding on a CI/CD tool.
cta_button_text: 'Check out our <strong> Continuous Everything</strong> webcast!'
cta_button_link: 'https://page.gitlab.com/20170301_continuouseverything.html'
---

The advantages of continuous integration and delivery for catching errors while they're still easy to fix and speeding up your time to market are [well documented](/blog/2017/04/12/ways-ci-cd-helps/), but even if you're sold on CI/CD, it can be tricky to take the next step. How do you choose the solution that's right for your team?

<!-- more -->

The factors to consider when choosing a [CI/CD tool](/topics/ci-cd/) are similar to those of [choosing a Git management solution](/blog/2017/04/20/choosing-git-management-solution/): hosted vs. on-premise, open source vs. commercial, and integrations. You'll also want to look at how easily the tool allows your team to visualize the release process and nip potential issues in the bud.

## Hosting

Whether you prefer SaaS or to host yourself, you have options. Integrations with third-party services are sometimes easier with a cloud-based service, but some organizations prefer the peace of mind that comes with everything being housed within their walls. Ultimately you need to weigh up what resources you have at your disposal for hosting, and how you want to use them.

## Open source vs. commercial

Using an open source solution has its advantages: it's free, and you can look under the hood and make alterations if needed. Make sure you do your research before committing though: do you need priority access to support? How will you manage if the vendor decides to abandon the product? Are there any features specific to a product that would make things easier for your team? Ask these questions first.

## Support for integrations

It's fairly common for an organization's software development lifecycle to rely on several integrated tools (such as [issue boards](/stages-devops-lifecycle/issueboard/) and other discussion features). Find out what your teams are already using and if the CI/CD solution you're considering is supported. There's been growing interest in built-in CI/CD, which means developers can spend less time stringing together their tooling and more on new features and improvements. Bringing all your tools under one product with one interface and datastore is also useful for things like [cycle analytics](/product/cycle-analytics/), which can help to reduce the time between coming up with an idea and deploying it.

## Visualizing the release process

One of the advantages of leveraging CI/CD is being able to see changes and new additions from the moment they're created. Does your chosen solution offer [Review Apps](/stages-devops-lifecycle/review-apps/), so you can automatically check out a live preview of new code? You might also benefit from [Deploy Boards](/releases/2017/03/22/gitlab-9-0-released/#deploy-boards-eep), where you can watch a deploy roll out across pods and monitor the health and deployment status of each environment, all in one place. This makes it easier to spot problems and stop or roll back with one click.  These are just a couple of features that can make a significant difference to your team's efficiency.

## So how does GitLab CI/CD stack up?

We offer **self-managed** options for both
[GitLab Enterprise Edition and Community Edition](/stages-devops-lifecycle/)
and a **hosted** option for GitLab Enterprise Edition Premium on [GitLab.com](/).

We have a **free and open source** offering, GitLab Community Edition, and two **enterprise** offerings,
Enterprise Edition Starter and Enterprise Edition Premium, with advanced features such as [GitLab Geo](/solutions/geo/), High Availability via our [Reference Architectures)](https://docs.gitlab.com/ee/administration/reference_architectures/) and [Disaster Recovery](https://docs.gitlab.com/ee/administration/geo/disaster_recovery/), [File Locking](https://docs.gitlab.com/ee/user/project/file_lock.html) and [Service Desk](https://docs.gitlab.com/ee/user/project/service_desk.html).

You can **visualize your release process** in all versions of GitLab with GitLab [CI/CD Pipelines](https://docs.gitlab.com/ee/ci/pipelines/index.html), [Review Apps](/stages-devops-lifecycle/review-apps/) and [Prometheus monitoring](https://docs.gitlab.com/ee/administration/monitoring/prometheus/).
GitLab Enterprise Premium comes with [Deploy Boards](https://docs.gitlab.com/ee/user/project/deploy_boards.html) and
[Canary Deployments](/releases/2017/04/22/gitlab-9-1-released/#canary-deployments-eep) for even more advanced control over deployments.

Visit our [Product page](/stages-devops-lifecycle/) and [DevOps tools page](/competition/) to see how GitLab measures against other tools.

To learn more about CI/CD and how it can help you release earlier and more often, watch our webcast, "[From Continuous Integration to Continuous Everything](https://page.gitlab.com/20170301_continuouseverything.html)" on demand.
{: .alert .alert-gitlab-orange}  

<iframe width="560" height="315" src="https://www.youtube.com/embed/PavW0JeY_Qc" frameborder="0" allowfullscreen></iframe>


“spiral” by Vadim Timoshkin is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/)
{: .note}
