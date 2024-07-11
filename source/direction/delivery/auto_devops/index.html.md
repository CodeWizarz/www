---
layout: markdown_page
title: "Category Direction - Auto Devops"
description: "GiitLab's direction for “Auto DevOps” is to leverage our single application to assist users in every phase of the development and delivery process. Learn more!"
canonical_path: "/direction/delivery/auto_devops/"
---

- TOC
{:toc}

## Auto DevOps

Our direction for “Auto DevOps” is to leverage our [single application](https://about.gitlab.com/handbook/product/single-application/) to assist users in every phase of the development and delivery process, implementing automatic tasks that can be customized and refined to get the best fit for their needs.

With the dramatic increase in the number of projects being managed by software teams (especially with the rise of micro-services), it's no longer enough to just craft your code. In addition, you must consider all of the other aspects that will make your project successful, such as tests, quality, security, deployment, logging, monitoring, etc. It's no longer acceptable to add these things only when they are needed, or when the project becomes popular, or when there's a problem to address; on the contrary, all of these things should be available at inception.

[Watch this video of our CEO Sid explaining the importance of Auto DevOps](https://www.youtube.com/watch?v=i7qL1dS5x8g) and follow along with this issue where we are organizing to increase [Auto DevOps adoption](https://gitlab.com/gitlab-com/Product/-/issues/1801). 

- [Issue List](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3AAuto%20DevOps)
- [Overall Vision](/direction/delivery/)
- [UX Research](https://gitlab.com/groups/gitlab-org/-/epics/595)

Interested in joining the conversation for this category? Please join us in our
[public epic](https://gitlab.com/groups/gitlab-org/-/epics/480) where
we discuss this topic and can answer any questions you may have. Your contributions
are more than welcome.

## Vision

DevOps Adoption is [a known pain point](https://about.gitlab.com/direction/ops/#opportunities) that GitLab, as a complete DevOps platform delivered as a single application, can help alleviate. That adoption isn't just hard technically, it's also a challenge organizationally.  The vision for Auto DevOps is to ease that adoption pain. We will serve as a central mechanism for enabling users to continue to further their DevOps adoption journey by automatically implementing best practices, and recommending iterative improvements where appropriate. 

There is no current tool in the market that does what Auto DevOps is capable of doing. The best analogy we've found is this - consider that you are trying to navigate from New York to California by car in the year 1992. To get there it would be painful, even with a map because it is a multi-variate problem - one that requires lots of inputs and more than just instruction manuals and best practices. Now imagine you are doing that today with Google Maps on your phone! Google Maps removes all of the pain of those best practices, employs data to intelligently move beyond them and recommends pit stops if you ask. 

Auto DevOps will be something similar for DevOps practices. Today it can provide encoded best practices. In the future, Auto DevOps will become the navigation assistant for your DevOps journey - a guide for the journey of continuous improvement.

This vision offers enormous benefit to users confronted with the pain of adopting DevOps, and it serves our business. As our business is built around the whole DevOps cycle, if we can present DevOps practices in a unified and automated way to our users, we believe that they are open to adopt all our stages.

### Target persona

The target persona for Auto DevOps is the platform engineer who wants to simplify, possibly automate the ops-work that falls on software developers. The [pipeline authoring category](https://about.gitlab.com/direction/verify/pipeline_authoring/) deals with the question on simplifying DevOps practices for single engineers.

Platform engineers require a platform. They either have to build it themselves or can use GitLab. These platforms have to support complex processes for CI, security, compliance, and deployments alike. The Private [CI/CD Catalog](https://gitlab.com/gitlab-org/gitlab/-/issues/359047/) is the next step towards creating reusable components for a platform.

## Strategy

### Today

The Auto DevOps offering provides an integrated collection of CI templates and related integrations to build, test, scan, lint and deploy custom applications with minimal DevOps overhead. It is used by thousands of GitLab users and customers from development to production environments. It is good enough to work out of the box for many use cases and provides extensive customizations for almost every use case. For exceptional situations, it can be used as building blocks to build a custom Auto DevOps pipeline.

**We don't work actively on this category given other priorities.**

### What's Next & Why

We learned that the current Auto DevOps offering has many shortcomings:

- **no clear user focus**: While we presented Auto DevOps as being targeted to Software developers, they don't really like to think even about CI, and ops topics are foreign to most of them. As a result, if the Auto DevOps templates fail for them, they require external support. Moreover, in medium+ companies, there is often a dedicated platform/ops team to support the software developers, provide standard tools for them. Our solution was not really fit for their needs.
- **brittle solution**: The CI template based approach was very sensitive to changes, and the strict set of CI/CD stages made it extremely challenging to integrate with external tools.
- **versioning problems**: As CI templates can not be versioned, we regularly break our users' CI/CD pipelines when we introduce breaking changes.
- **limited deployment support**: The CI templates seems to limit our possibility of easily adding support for several possible deployment targets. Even extending beyong Kubernetes was a challenge. At the same time, even the Kubernetes targeting deployments are rather minimal as we don't support metrics integrated canary deployments.
- **hard to maintain and develop**: As the CI templates are brittle and the stages are static, adding new features is demanding.
- **not enough customization**: Given the above limitations, many users require customizations, but at the same time, they would like us to maintain these customisations.
- **hard to get started with success**: In most cases Auto DevOps pipelines fail on their first run. Setting up the user for success from the beginning does not seem to be realistic if we aim at full automation.
- **users don't mind manual setup**: Seemingly users are happy with minimal, well-directed manual setup steps. Instead of aiming at full-automation, we should find the right approach and balance between automatic and manual setups.

We are discussing two initiatives actively that would require sizeable investment from GitLab and could push this category forward:

- [Providing a generic job API within GitLab](https://gitlab.com/gitlab-org/gitlab/-/issues/328489)
- [Defining the terms of a complex pipeline from commit to deployment](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/84513)

At the same time, this discussion had a big effect on [the deployment direction of GitLab](https://about.gitlab.com/direction/delivery/). Thus we are building out the foundations in order to deliver on this vision.

## Maturity Plan

This category is currently at the "Minimal" maturity level, and our next maturity target is [Viable](/direction/maturity/). See the [Auto DevOps viable](https://gitlab.com/groups/gitlab-org/-/epics/1333) epic for more info.

### Group Ownership

Auto Devops ties together several feature from across GitLab [product categories](/handbook/product/categories/). Each individual feature will have its own maturity classification. 

| Feature | Responsible GitLab Group  |
| ------ | ------ |
| Auto Build | [Configure](/handbook/engineering/development/ops/configure/) |
| Auto [Test](/direction/verify/code_testing/)  | [Pipeline Security](/handbook/engineering/development/ops/verify/pipeline-security/) |
| Auto [Code Quality](/direction/secure/static-analysis/code_quality/)  | [Pipeline Security](/handbook/engineering/development/ops/verify/pipeline-security/) |
| Auto [SAST](/direction/secure/static-analysis/sast/)  | [Static Analysis](/handbook/engineering/development/sec/secure/static-analysis/) |
| Auto [Secret Detection](/direction/secure/static-analysis/secret-detection/)  | [Static Analysis](/handbook/engineering/development/sec/secure/static-analysis/) |
| Auto [Dependency Scanning](/direction/secure/composition-analysis/dependency-scanning/) | [Composition Analysis](/handbook/engineering/development/sec/secure/composition-analysis/) |
| Auto [License Compliance](/direction/secure/composition-analysis/license-compliance/) | [Composition Analysis](/handbook/engineering/development/sec/secure/composition-analysis/) |
| Auto [Container Scanning](/direction/secure/composition-analysis/container-scanning/) | [Composition Analysis](/handbook/engineering/development/sec/secure/composition-analysis/) |
| Auto [Review Apps](/direction/verify/review_apps/) | [Progressive Delivery](/handbook/engineering/development/ops/release/) |
| Auto [DAST](/direction/secure/dynamic-analysis/dast/)  | [Dynamic Analysis](/handbook/engineering/development/sec/secure/dynamic-analysis/) |
| Auto [Browser Performance Testing](/direction/verify/performance_testing/)  | [Pipeline Security](/handbook/engineering/development/ops/verify/pipeline-insights/) |
| Auto [Load Performance testing](/direction/verify/performance_testing/)  | [Pipeline Security](/handbook/engineering/development/ops/verify/pipeline-insights/) |
| Auto [Deploy](/direction/release/continuous_delivery/)  | [Progressive Delivery](/handbook/engineering/development/ops/release/) |

## Competitive Landscape

While there are "piece-meal" solutions that offer to automate a particular stage, there are no comprehensive tools that offer to address the entire devops lifecycle.

### DeployHQ

DeployHQ offers to "Automatically build and deploy code from your repositories", however, its UX is complex that its deployment targets limited.

[deployhq.com](https://www.deployhq.com)

### Keptn

Keptn provides a simplified setup for Kubernetes deployments, but requires other pipelines for non-delivery related tasks.

### Crossplane

Crossplane provide a control plane for infrastructure operations, but does not address the overall pipeline question.

### Backstage

Backstage.io provide an umbrella app for other applications. Thus platform engineers can put together full pipelines and project templates that are easily re-used by software engineers.

### Humanitec

Humanites provides a SaaS for internal development platforms.

## Analyst Landscape

There is currently no analyst category that aligns with Auto DevOps.

## Top Customer Success/Sales Issue(s)

[Use Auto DevOps for design.gitlab.com](https://gitlab.com/gitlab-org/gitlab-services/design.gitlab.com/issues/96)

## Top Customer Issue(s)


## Top Internal Customer Issue(s)


#### Top Vision Item(s) 

- [Disable Auto DevOps at the Group level for gitlab.com](https://gitlab.com/gitlab-org/gitlab-ce/issues/52447) 

- [Composable Auto DevOps](https://gitlab.com/gitlab-org/gitlab-ce/issues/47234)

- [Don't run Auto DevOps when no dockerfile or matching buildpack exists](https://gitlab.com/gitlab-org/gitlab-ce/issues/57483)
