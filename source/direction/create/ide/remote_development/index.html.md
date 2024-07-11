---
layout: markdown_page
title: "Category Direction - Remote Development"
---

- TOC
{:toc}

## Remote Development

| | |
| --- | --- |
| Stage | [Create](/direction/create/) |
| Maturity | [Minimal](/direction/maturity/) |
| Content Last Reviewed | `2023-09-07` |

### Introduction and how you can help

<!-- Introduce yourself and the category. Use this as an opportunity to point users to the right places for contributing and collaborating with you as the PM -->

<!--
<EXAMPLE>
Thanks for visiting this category direction page on Snippets in GitLab. This page belongs to the [Editor](/handbook/product/categories/#editor-group) group of the Create stage and is maintained by <PM NAME>([E-Mail](mailto:<EMAIL@gitlab.com>) [Twitter](https://twitter.com/<TWITTER>)).

This direction page is a work in progress, and everyone can contribute:

 - Please comment and contribute in the linked [issues](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name%5B%5D=snippets) and [epics]((https://gitlab.com/groups/gitlab-org/-/epics?label_name[]=snippets) on this page. Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.
 - Please share feedback directly via email, Twitter, or on a video call. If you're a GitLab user and have direct knowledge of your need for snippets, we'd especially love to hear from you.
</EXAMPLE>
-->

Thanks for visiting the category direction page for Remote Development in GitLab. This page belongs to the [IDE group](/handbook/product/categories/#editor-group) of the [Create stage](https://about.gitlab.com/handbook/engineering/development/dev/create/) and is maintained by Principal Product Manager, Eric Schurter ([@ericschurter](https://gitlab.com/ericschurter)). 

This direction page is a work in progress, and everyone can contribute:

- Please comment and contribute to issues linked througout this page or contained in our [category strategy epic](https://gitlab.com/groups/gitlab-org/-/epics/7419). Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.
- If you would like to share your feedback directly or schedule a video call, please reach out directly to Eric Schurter via [email](mailto:eschurter@gitlab.com).

### Overview
<!-- Describe your category so that someone who is not familar with the market space can understand what the product does. 
-->

A common obstacle faced by developers when first contributing to a project is the setup of their local development environment. The time-consuming process of managing interrelated dependencies and fixing version compatibility issues can be demotivating, especially for those who only contribute occasionally or switch between multiple projects frequently. In complicated environments, development teams may also impose restrictions, authentication credentials, build procedures, and standards that add to the fragile nature of the development environment.

At the end of the day, developers want to spend less time managing their development environment and more time contributing high-quality code. And at GitLab, our mission is to ensure _everyone can contribute_. With Remote Development, our goal is to eliminate the responsibility of configuring and maintaining a local development environment. 

### Strategy and Themes
<!-- Capture the main problems to be solved in market (themes). Describe how you intend to solve these with GitLab (strategy). Provide enough context that someone unfamiliar with the details of the category can understand what is being discussed. -->

Ephemeral, cloud-based workspaces will be configured in a single file stored in a repository, allowing you to provision a new environment with a single click and connect securely from the GitLab Web IDE or your desktop editor of choice. Monitoring tools and dashboards will be available in GitLab to manage running and suspended environments, ensuring efficient usage of resources. This will free up valuable development time, streamline onboarding of new developers, and increase security across an increasingly remote workforce.

A cloud-based development environment also enables organizations working in regulated industries to enforce a zero-trust policy that prevents source code from ever being stored locally while maintaining a high quality developer experience. GitLab workspaces contribute to our [vision for managing Software Supply Chain Security](/direction/supply-chain/) by providing a single place where dependencies and tools can be audited and verified, and access to those environments can be controlled through strong authentication. 

In this short (9-minute) video, Eric Schurter walks you through the goals and technical approach for the Remote Development category:

<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/apgU0y-u4A8" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

We're building Remote Development at GitLab against a few guiding principles: 

#### Environments as code

Developers should be able to define their workspaces in an easy-to-use document format, stored and versioned in a project repository alongside your source code.

#### Editor agnostic

Developer tooling is a very individual thing and productivity can depend on having access to the right IDE. In support of this, we aim to meet developers where they are by providing editor-agnostic workspaces with centrally-managed configurations that offer a seamless editing experience either from the GitLab Web IDE or your local IDE. 

#### Platform agnostic

Our initial iterations for Remote Development will be focused on a "bring your own cloud" solution, letting developers on both GitLab.com and Self-managed GitLab instances provision workspaces on their existing cloud platforms like Amazon Web Services, Google Cloud Platform, or Azure Cloud Services. We will eventually offer a fully-managed option within GitLab, provided as a service billed based on consumption, much like our [Runner SaaS](/direction/verify/runner_saas) offering. 

### 1 year plan
<!--
1 year plan for what we will be working on linked to up-to-date epics. This section will be most similar to a "road-map". Items in this section should be linked to issues or epics that are up to date. Indicate relative priority of initiatives in this section so that the audience understands the sequence in which you intend to work on them. 
 -->

 In 2023, we are focused on reaching a secure, production-quality, Viable Remote Development offering. 

 - [Remote Development Viable Maturity](https://gitlab.com/groups/gitlab-org/-/epics/9190)
 - [Data isolation with micro VMs](https://gitlab.com/gitlab-org/gitlab/-/issues/390414)
 - [Support for injecting JetBrains editors](https://gitlab.com/groups/gitlab-org/-/epics/9836)  
 - [Integration with `glab` CLI](https://gitlab.com/groups/gitlab-org/-/epics/9833)
 - [Connect to a workspace from the Web IDE](https://gitlab.com/groups/gitlab-org/-/epics/9896)

#### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->

- [Automatically terminate a workspace after a period of inactivity](https://gitlab.com/groups/gitlab-org/-/epics/10710)
- [Configure limits on workspace usage](https://gitlab.com/groups/gitlab-org/-/epics/10571)

#### What we are currently working on
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

- [Improve error handling and logging](https://gitlab.com/groups/gitlab-org/-/epics/10461)
- [Improve logic around workspace termination](https://gitlab.com/groups/gitlab-org/-/epics/10595)

#### What we recently completed
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

- [Inject GitLab credentials into a workspace to support cloning private repositories](https://gitlab.com/groups/gitlab-org/-/epics/10882) 
- [MVC 1 for connecting to a workspace via SSH](https://gitlab.com/groups/gitlab-org/-/epics/10908)
- [Securing a workspace](https://gitlab.com/groups/gitlab-org/-/epics/9837) 
- [Create a remote development module for GitLab Agent for Kubernetes](https://gitlab.com/gitlab-org/gitlab/-/issues/383997)
- [Define, create, and interact with a remote development workspace](https://gitlab.com/groups/gitlab-org/-/epics/10122)
- [Remove dependency on DevWorkspaceOperator](https://gitlab.com/groups/gitlab-org/-/epics/9895)
- [Remote Development Minimal Maturity](releases/2022/12/22/gitlab-15-7-released/#experience-the-web-ide-beta-and-remote-development)

#### What is Not Planned Right Now
<!--  Often it's just as important to talk about what you're not doing as it is to
discuss what you are. This section should include items that people might hope or think
we are working on as part of the category, but aren't, and it should help them understand why that's the case.
Also, thinking through these items can often help you catch something that you should
in fact do. We should limit this to a few items that are at a high enough level so
someone with not a lot of detailed information about the product can understand -->

Workspaces are personal and ephemeral. We anticipate developers will want to collaboarte within workspaces but we are not currently focused on providing a real-time collaborative editing environment suitable for pair programming. 

Most developers today use Visual Studio Code (VS Code) as their editor of choice, so our initial focus will be on providing support for that ecosystem. Establishing a client/host connection between VS Code and VS Code Server is architecturally simpler and provides a seamless experience for developers already familiar with VS Code. However, support for other IDEs like vim, JetBrains editors, Jupyter Notebook, Xcode, or others, will be added as the solution matures and we work toward our goal of an editor-agnostic solution. 

### Target Audience
<!--
List the personas (https://about.gitlab.com/handbook/marketing/strategic-marketing/roles-personas#user-personas) involved in this category.

Look for differences in user's goals or uses that would affect their use of the product. Separate users and customers into different types based on those differences that make a difference.
-->

The term "Remote Development" speaks to the challenges faced by software developers and those who lead or support their teams. By providing a mature remote development solution, the technical barriers to collaboration are lowered, allowing non-developers to make effective contributions as well. This enables us to cater to all [user personas](/handbook/product/personas/#user-personas) described in our handbook, with a focus on:

- **[Sasha (Software Developer):](/handbook/product/personas/#sasha-software-developer)** targets full time contributors to all types of projects (commercial, OSS, data science, etc.). These users expect and need a high level of reliability and speed in their interactions with both project files and Git.

- **[Delaney (Development Team Lead):](/handbook/product/personas/#delaney-development-team-lead)** targets users who often times have elevated roles which allow for the management of project settings, such as access control, security, commit strategies, and mirroring.

- **[Priyanka (Platform Engineer)](/handbook/product/personas/#priyanka-platform-engineer)** targets users who define pipelines, templates, and processes to improve developer efficiency across an organization.

### Pricing and Packaging

Remote Developement will be a multi-level offering, providing value across all tiers and distributions. 

**Free tiers** will be able to securely connect the Web IDE to a remote environment that is manually configured with a compatible code server and authentication token. We will provide detailed documentation and a configuration script to reduce friction in the configuration of the server.

With **GitLab Premium**, organizations will have the ability to specify development environments in a `devfile` and create remote environments on existing cloud infrastructure. This will allow team leads or DevOps engineers to monitor multiple environments from a centralized GitLab dashboard and standardize the environment across the organization, improving team efficiency.

Eventually, **Ultimate tiers** will have access to advanced monitoring and auditing tools, providing insight into usage across the organization and enforcing security best practices through development tooling. 

### Analyst Landscape

Several analysts have recently published reports highlighting the rapid adoption of cloud-based development workflows.

**Gartner®**

Gartner report titled, **Hype® Cycle for Agile and DevOps, 2021** discusses "Browser-based integrated development environments (IDEs) are consumed “as a service.” They enable browser-based remote access to a complete development environment, which obviates the need for local installation/configuration."* 

Further, it states "Browser-based IDEs provide consistent, secure access to preconfigured development workflows to developers. This frees them from setting up their own environments, eliminating the need to install and maintain prerequisites, software development kits (SDKs), security updates and workstation plug-ins."*

"Gartner predicts that, by 2026, 60% of cloud workloads will be built and deployed using browser-based IDEs". The report adds, “Five factors are driving their increased adoption": 

1. "Remote work and remote onboarding of software developers create a need for a frictionless onboarding experience."
1. "Environment setup issues can impede productivity and hurt the onboarding experience."
1. "Cloud-native (e.g., Kubernetes) deployments require new tooling that either isn't available or is inconvenient to set up on-premises."
1. "Browser-based IDEs make it easier to support and secure bring your own PC (BYOPC) use cases."
1. "Automating DevOps workflows introduces more plug-ins, extensions and API integrations, which make it cumbersome to manage on local machines."*

*_Gartner, Hype Cycle for Agile and DevOps, 2021, George Spafford, Joachim Herschmann, 12 July, 2021. GARTNER and HYPE CYCLE are a registered trademark and service mark of Gartner, Inc. and/or its affiliates in the U.S. and internationally and are used herein with permission._

GitLab's Web IDE already addresses some of Gartner's recommendations, by providing a platform from which anyone can contribute. By [migrating the Web IDE to VSCode](https://gitlab.com/groups/gitlab-org/-/epics/7143), we can rapidly increase the complexity of work and meet the needs of more serious development tasks. Pairing that with a [Server Runtime](https://gitlab.com/gitlab-org/gitlab/-/issues/329602), GitLab is positioned well to meet our customers' expectations when it comes to security, agility, and flexibility. 

*451 Research*

451 Research published an analysis of [Coder](https://coder.com/) and their approach to moving development workspaces to the cloud. 451 Research recognizes that "by moving developers, IT operators and others to the cloud, organizations can drive faster releases, productivity and efficiency by automating and abstracting IT environments and their management. The idea is that developers have more time to focus on new features, applications and innovation when they are unencumbered with setting up and running their own environments."

In the analysis, 451 Research cites results from their 2021 report, **Voice of the Enterprise: DevOps, Workloads & Key Projects**, that reveal a significant shift in the primary DevOps implementation environment, moving away from On-premise and Hosted Private Cloud workspaces to SaaS and Public Cloud over the next two years. 

451 Research's recommendation to stay competitive in this space is to "focus on enabling simplicity, speed and productivity for developers," something GitLab's single platform for DevOps is positioned well to deliver. 

_Source: 451 Research, a part of S&P Global Market Intelligence, Coverage Initiation: Coder moves development to the cloud with workspaces-as-code, September 2021, All Rights Reserved_

