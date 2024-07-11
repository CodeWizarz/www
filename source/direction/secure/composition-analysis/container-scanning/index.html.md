---
layout: markdown_page
title: "Category Direction - Container Scanning"
description: "Container Scanning tests your Docker images against known vulnerabilities that may affect software that is installed in the image. Learn more!"
canonical_path: "/direction/secure/composition-analysis/container-scanning/"
---

- TOC
{:toc}

## Container Scanning

| | |
| --- | --- |
| Stage | [Secure](/direction/secure/) |
| Maturity | [Viable](/direction/maturity/) |
| Content Last Reviewed | `2023-09-18` |
| Content Last Updated  | `2023-09-18` |

### Introduction and how you can help
<!-- Introduce yourself and the category. Use this as an opportunity to point users to the right places for contributing and collaborating with you as the PM -->

Thanks for visiting this category direction page on Container Scanning in GitLab. This page belongs to the [Composition Analysis](/handbook/product/categories/#composition-analysis-group) group of the Secure stage. The Product Manager is [Sara Meadzinger](https://gitlab.com/smeadzinger).

This direction page is a work in progress, and everyone can contribute:

 - Please comment and contribute in the linked [issues](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3AContainer%20Scanning) or [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=Category:Container+Scanning) on this page. Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.
 - Please share feedback directly via email or on a video call. If you're a GitLab user and have direct knowledge of your need for container scanning, we'd especially love to hear from you.

### Overview
<!-- Describe your category so that someone who is not familiar with the market space can understand what the product does. 
-->

Container scanning analyzes the packages and libraries used in a container image.  It identifies dependencies that have been directly included and it also analyzes those dependencies to get a list of their dependencies (also known as indirect or transitive dependencies).  Once a full listing of all direct and transitive dependencies has been obtained, container scanning solutions analyze those dependencies to identify known vulnerabilities in those dependencies.

Container Scanning is often considered an element of Software Composition Analysis and Application Security Testing.

> GitLab was named as a [Challenger in the 2022 Magic Quadrant for Application Security Testing](https://about.gitlab.com/analysts/gartner-ast22/).

Additional details about our current features and capabilities can be [viewed in our documentation](https://docs.gitlab.com/ee/user/application_security/container_scanning/).

### Strategy and Themes
<!-- Capture the main problems to be solved in market (themes). Describe how you intend to solve these with GitLab (strategy). Provide enough context that someone unfamiliar with the details of the category can understand what is being discussed. -->

We have three main themes in our container scanning strategy:

1. Increase usability
   1. [Continuous vulnerability scans](https://gitlab.com/groups/gitlab-org/-/epics/7886)
   1. [Better support scanning of multiple images](https://gitlab.com/groups/gitlab-org/-/epics/3139)
   1. [Simplify setup for AWS ECR images](https://gitlab.com/groups/gitlab-org/-/epics/6145)
1. Decrease noise
   1. [Group/consolidate similar findings](https://gitlab.com/groups/gitlab-org/-/epics/5801)
   1. [Prioritize findings that are fixable by the dev team](https://gitlab.com/groups/gitlab-org/-/epics/6846)
   1. [Identify false positives](https://gitlab.com/gitlab-org/gitlab/-/issues/10046)
1. Integrate with the rest of GitLab
   1. [Automatically scan GitLab's container registry](https://gitlab.com/groups/gitlab-org/-/epics/2340)
   1. Alert when the database is updated and vulnerabilities exist in previously-scanned images (Epic/Issue creation in progress)

### 1 year plan
<!--
1 year plan for what we will be working on linked to up-to-date epics. This section will be most similar to a "road-map". Items in this section should be linked to issues or epics that are up to date. Indicate relative priority of initiatives in this section so that the audience understands the sequence in which you intend to work on them. 
 -->

#### What we recently completed
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

In GitLab 16.3 we addressed bugs related to the Container Scanning analyzer.

#### What we are currently working on
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

During 16.4 we are working to address a number of [high value improvements](https://gitlab.com/groups/gitlab-org/-/epics/9870), most of which are focused on making our Operational Container Scanning solution more up-to-date and functional to meet the needs of our users.

Also, during 16.4 we are working toward introducing [continuous vulnerability scans](https://gitlab.com/groups/gitlab-org/-/epics/7886). This new method of scanning will have significantly better performance and will allow users to have their vulnerability results updated continuously as new advisories are added to our advisory database. This work is a prerequisite for a large number of other features on our roadmap. Once this work is completed, users will no longer need to run regular scheduled scans to have their vulnerability results updated for container images that have been scanned as part of the CI pipeline for their default branch.

#### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->

Over the next few months, we plan on finishing the work for [continuous vulnerability scans](https://gitlab.com/groups/gitlab-org/-/epics/7886) so we can release the feature to users.

#### What is Not Planned Right Now

We currently do not have plans to add the following functionality during the next 12 months:
1. Support for runtime analysis of code execution to help filter out vulnerabilities that exist in code that is never executed.  As a workaround, users can explore our [partnership with Rezilion](https://about.gitlab.com/blog/2022/03/23/gitlab-rezilion-integration-reduces-vulnerability-backlog-identifies-exploitable-risks-to-fix/) which allows for this type of analysis to be performed and the results sent into GitLab.
1. Improvements to our ability to [automatically generate merge requests to update dependencies](https://docs.gitlab.com/ee/user/application_security/vulnerabilities/index.html#resolve-a-vulnerability). As a workaround, users can use the open source [Renovate](https://github.com/renovatebot/renovate#supported-platforms) project, which has an integration with GitLab.

### Best in Class Landscape
<!-- Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" -->

BIC (Best In Class) is an indicator of forecasted near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape.

#### Key Capabilities 

For this product area, these are the capabilities a best-in-class solution should provide:

1. The ability to accurately and comprehensively detect known vulnerabilities for both direct and transitive dependencies in a container image.
1. Support for detecting vulnerabilities across a wide variety of operating systems.
1. A robust advisory database that is curated to reduce false positives and contains data from a variety of sources.
1. Support for shifting vulnerability results left into the IDE.
1. Support for identifying fix versions when available.
1. The ability to differentiate between vulnerabilities in packages that exist in the base image vs vulnerabilities in packages that were introduced in a new image layer.
1. Support for automation to help keep dependencies up-to-date.
1. Support for runtime analysis of code execution to help filter out vulnerabilities that exist in code that is never executed.
1. Extensive analysis of other risk factors (quality, supply chain security, maintenance, etc) beyond just security vulnerabilities.

This list represents some key capabilities of a comprehensive container scanning solution.  Not all of these capabilities are currently supported by GitLab today.

#### Roadmap
<!-- Key deliverables we're focusing on to build a BIC solution. List the epics by title and link to the epic in GitLab. Minimize additional description here so that the epics can remain the SSOT. This may be duplicative to the 1 year section however for some categories the key deliverables required to become the BIC solution will extend beyond one year and we want to capture all of the gaps. Moreover, the 1 year section may contain work that is not directly related to closing gaps if we are already the BIC or if we are differentiating ourselves.-->

Our [prioritized roadmap](https://about.gitlab.com/direction/secure/composition-analysis/#priorities) can be viewed on our group direction page.  Plans to move the category from [Viable to Complete](https://gitlab.com/groups/gitlab-org/-/epics/299) are tracked in GitLab.

#### Top Competitive Solutions
<!-- PMs can choose to highlight a primary BIC competitor--or more, if no single clear winner in the category exists; in this section we should indicate: 1. name of competitive product, 2. links to marketing website and documentation, 3. why we view them as the primary BIC competitor -->

- [Black Duck](https://www.blackducksoftware.com/solutions/container-security)
- [Snyk](https://snyk.io/container-vulnerability-management)
- [Sonatype Nexus](https://www.sonatype.com/containers)
- [Qualys](https://www.qualys.com/apps/container-security/)
- [sysdig](https://sysdig.com/products/kubernetes-security/image-scanning/)
- [Aqua](https://www.aquasec.com/products/container-security/)
- [StackRox](https://www.stackrox.com/use-cases/vulnerability-management/)
- [Prisma Cloud - was TwistLock](https://www.paloaltonetworks.com/prisma/cloud/compute-security/container-security)

### Target Audience
<!--
List the personas (https://about.gitlab.com/handbook/marketing/strategic-marketing/roles-personas#user-personas) involved in this category.

Look for differences in user's goals or uses that would affect their use of the product. Separate users and customers into different types based on those differences that make a difference.
-->

Primary: [Sasha (Software Developer)](https://about.gitlab.com/handbook/product/personas/#sasha-software-developer) wants to know when adding a dependency to a container image if it has known vulnerabilities so alternate versions or dependencies can be considered.

Secondary: [Amy (Application Security Engineer)](https://about.gitlab.com/handbook/product/personas/#amy-application-security-engineer) and [Isaac (Infrastructure Security Engineer)](https://about.gitlab.com/handbook/product/personas/#isaac-infrastructure-security-engineer) want to know what dependencies in their container images have known vulnerabilities, to be alerted if a new vulnerability is published for an existing component, and to know how behind current version the components are.

Other:
1. [Cameron (Compliance Manager)](/handbook/product/personas/#cameron-compliance-manager)
1. [Devon (DevOps Engineer)](/handbook/product/personas/#devon-devops-engineer)
1. [Sidney (Systems Administrator)](/handbook/product/personas/#sidney-systems-administrator)
1. [Delaney (Development Team Lead)](/handbook/product/personas/#delaney-development-team-lead)

### Pricing and Packaging

The GitLab Container Scanning features are all packaged as part of the [GitLab Ultimate tier](https://about.gitlab.com/pricing/ultimate/). This aligns with our [pricing strategy](https://about.gitlab.com/company/pricing/#pricing-strategy) as these features are relevant for executives who are concerned about keeping their organization secured from known vulnerabilities.

### Analyst Landscape

Container Scanning is frequently bundled together with Dependency Scanning and License Compliance to provide an overall Software Composition Analysis (SCA) solution within the Application Security Testing (AST) market.  GitLab was recently named as a [Challenger in the 2022 Magic Quadrant for Application Security Testing](https://about.gitlab.com/analysts/gartner-ast22/).
