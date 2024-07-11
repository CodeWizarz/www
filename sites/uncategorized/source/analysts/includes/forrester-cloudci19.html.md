---
layout: markdown_page
title: 'The Forrester Wave™: Cloud-Native Continuous Integration Tools, 2019'
description: "This page represents how Forrester views our cloud-native CI tools in relation to the larger market."
canonical_path: "/analysts/forrester-cloudci19/"
noindex: true
---
## GitLab and The Forrester Wave™: Cloud-Native Continuous Integration Tools, Q3 2019

This page represents how Forrester views our cloud-native CI tools in relation to the larger market and how we're applying that information as part of our ongoing product evolution.

![Forrester CI Wave](/images/analysts/cloud-ci-thumb.png){: .small}

### Forrester's Key Takeaways on the Cloud-Native CI Tools Market at time of report publication:

**Google, GitLab, Microsoft, AWS, And CircleCI Lead The Pack**
Forrester's research uncovered a market in which Google, GitLab, Microsoft, AWS, and CircleCI are Leaders; CloudBees and Atlassian are Strong Performers; Buildkite and Codefresh are Contenders; and Travis CI is a Challenger.

**Speed, Scale, And Security Are The Important Differentiators**
As organizations transition to continuous delivery (CD) and shift hosting of production workloads to cloud servers, traditional, on-premises continuous integration will no longer suffice. Cloud-native CI products with exceptional build speed, on-demand scale, and secure configurations will lead the market and enable customers to accelerate delivery speed and lower management costs, all while meeting corporate compliance needs.

### Forrester's take on GitLab at time of report publication:

GitLab's simple and cohesive approach lands it squarely as a leader. GitLab's approach of having a single application to manage each phase of software development comes through in its developer experience. The UI is easy to use, cohesive, and comes integrated with collaborative tools and development tasks at a glance; it was one of the most fluid UIs we evaluated. GitLab also shines with its preconfigured environments and its ability to support on-premises build agents that can execute on multiple operating systems, including Linux, Mac, and Windows.

GitLab's continuous delivery capability includes support for container registries and Kubernetes, making it easy to get started. GitLab's investment in [value stream management](/solutions/value-stream-management/) also pays off with strong analytics, and customers liked the flexibility of being able to orchestrate builds in the cloud but run them on-premises if they want to. Reference customers would like improved customer support as well as support for greater rules complexity for managing code branches.

## GitLab's commentary on this report

### Cloud provider agnostic CI

The top 4 leaders in this report are Google, GitLab, Microsoft, and AWS. While Google, Microsoft, and AWS all offer CI tooling that can be used with other clouds, their offerings work the best when used in conjunction with their cloud infrastructure products. GitLab is cloud provider agnostic. Because most enterprises use [multiple cloud providers](https://www.ciodive.com/news/is-multi-cloud-the-answer-most-companies-are-using-up-to-5/517077/), GitLab partners with all of the major [cloud providers](https://about.gitlab.com/partners/#cloud-partners) and [Kubernetes providers](https://about.gitlab.com/partners/#kubernetes-partners) to make sure GitLab works great with any cloud.

- GitLab CI can build and test code that is stored anywhere.
- GitLab CD can [deploy your software anywhere](https://about.gitlab.com/stages-devops-lifecycle/deploy-targets/)
- You can [install GitLab Self-managed on any infrastructure](https://about.gitlab.com/install/).
- You can [install GitLab Runners on any infrastructure](https://docs.gitlab.com/runner/install/).
- You can register Runners installed on any infrastructure to your GitLab.com projects or GitLab Self-managed instance allowing you to use multi-cloud and hybrid environments.

Using GitLab enables workflow portability. Whatever cloud you use you have the same compliance, the same security, the same method of delivering software, the same productivity measure, the same way of working across clouds.

### Top scores for enterprise strategy and product road map

GitLab scored highly with a 3.76 for overall current offering and 4.20 for overall strategy on a 5 point scale. Within the categories of "enterprise strategy and vision" and "product roadmap" GitLab scored a perfect 5.00 out 5. As part of our [transparency value](https://about.gitlab.com/handbook/values/#transparency) we make our [CI/CD strategy and roadmap](https://about.gitlab.com/direction/ops/) publicly available.

### CI Wave vs Cloud-Native CI Wave

In 2017 Forrester released the Forrester Wave™: Continuous Integration Tools where GitLab attained the highest score for current offering and the highest score for strategy. This report evaluated all CI tools regardless of whether they were self-managed or offered as SaaS. As of this writing (Q3 2019), Forrester has not updated this 2017 report.

The Forrester Wave™: Cloud-Native Continuous Integration Tools, Q3 2019 report is a **net new** report that is not an update to the previous 2017 CI Wave. This report represents an emerging market of enterprises moving many workloads to the cloud and looking to do the same with their CI. GitLab serves this market well as indicated by a leadership position in the report, but this is only a subset of the total enterprise customer base for GitLab. This report evaluated the "GitLab.com" SaaS offering and associated business exclusively, while both the SaaS product and self-managed product were evaluated in the 2017 CI Wave.

GitLab was evaluated a Leader in both reports.

### Forrester defines "cloud-native" as "SaaS"

One of Forresters inclusion criteria for this report is:

> A cloud-native continuous integration product. The product must be available to users using a software-as-a-service (SaaS) deployment model and must operate in a public cloud.

This definition of cloud-native differs from the Cloud Native Computing Foundation (CNCF) Cloud Native Definition:

> Cloud native technologies empower organizations to build and run scalable applications in modern, dynamic environments such as public, private, and hybrid clouds. Containers, service meshes, microservices, immutable infrastructure, and declarative APIs exemplify this approach.

Frequently we hear GitLab users and customers use the term "cloud native" to refer to their [application modernization](https://about.gitlab.com/blog/2019/03/27/application-modernization-best-practices/) efforts centered around adopting [Kubernetes](https://about.gitlab.com/solutions/kubernetes/) and [microservices](https://about.gitlab.com/topics/microservices/) which fits more with the CNCF definition. Elsewhere on the GitLab website we use the term "[cloud native](https://about.gitlab.com/topics/cloud-native/)" with the CNCF definition in mind. For the purpose of commentary on this report we use the Forrester definition on this page.

We know that enterprises care about both of these concepts. On one side, for enterprises that are shifting workloads and ops concerns to the cloud, having their CI in the cloud is critically important. They will benefit from selecting a CI vendor like GitLab that is a SaaS provider and a Leader in this space. Even businesses that are just exploring options for CI delivered as SaaS, GitLab is a great option because we can support on-premises, hybrid, and multi-cloud workloads as well as workloads on our SaaS platform. On the other side, for enterprises that are adopting Kubernetes and Microservices GitLab is also a great solution because of our native Kubernetes integration, built-in container registry, and advanced CI capabilities.

### Lessons Learned

**Migration Support**: GitLab scored low marks for migration support. While there is a [Jenkins migration guide](https://docs.gitlab.com/ee/ci/migration/jenkins.html) today, this is an area that can be improved by providing more guidance around best practices for moving from other CI tools to GitLab. Another option is building importers and translation tools that can aid in migration. These tools seem to be of limited value for CI migration. Most often our customers who have migrated don't want to 1:1 replicate their current pipelines in GitLab because their current pipelines are not working well. By starting over they build better pipelines rather than carrying forward the mistakes imposed by their previous tool.

**Support for custom tool integrations**: While GitLab provides APIs and a small set of pre-built integrations, our focus is on delivering a great experience when using GitLab as a single, end-to-end DevOps platform. Because GitLab has so many capabilities built-in it alleviates the need to integrate with many 3rd party tools. At the same time, many enterprises can't or won't move off of legacy SDLC tooling. As such we'll need to increase the number of first class integrations we offer to support these businesses.

**Enterprise Security and Compliance**: While GitLab scored highly for Enterprise Security and Compliance, we know this is also an area to continually improve in due to it being a critical business need.

Here are specific issues and areas we're focusing in on:
* [Align SAML SSO capabilities on self-managed and GitLab.com, bringing SCIM to self-managed.](https://gitlab.com/gitlab-org/gitlab/issues/12823)
* [Focus on provider-specific improvements to make sure our solution works with the most popular solutions in the marketplace (Okta, OneLogin, et al).](https://gitlab.com/groups/gitlab-org/-/epics/1774)
* [Solve the authorization problem with SAML SSO in a similar way to LDAP, enabling group sync with compatible identity providers.](https://gitlab.com/gitlab-org/gitlab/issues/118)

This continues the investments we've already made into [SAML SSO on GitLab.com](https://docs.gitlab.com/ee/user/group/saml_sso/#saml-sso-for-gitlabcom-groups), including improvements like [SSO enforcement](https://docs.gitlab.com/ee/user/group/saml_sso/#sso-enforcement), [group-managed accounts](https://docs.gitlab.com/ee/user/group/saml_sso/#group-managed-accounts), and [SCIM](https://docs.gitlab.com/ee/user/group/saml_sso/scim_setup.html#scim-provisioning-using-saml-sso-for-groups) for provisioning/deprovisioning.


