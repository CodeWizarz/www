---
layout: markdown_page
title: "Category Direction - Software Composition Analysis"
description: "Dependency Scanning is a technique that identifies project dependencies and checks if there are any known, publicly disclosed, vulnerabilities. GitLab's goal is to provide License Compliance as part of the standard development process. Learn more!"
canonical_path: "/direction/secure/composition-analysis/software-composition-analysis/"
---

- TOC
{:toc}

## Software Composition Analysis

| | |
| --- | --- |
| Stage | [Secure](/direction/secure/) |
| Maturity | [Viable](/direction/maturity/) |
| Content Last Reviewed | `2023-09-18` |
| Content Last Updated  | `2023-09-18` |

### Introduction and how you can help
<!-- Introduce yourself and the category. Use this as an opportunity to point users to the right places for contributing and collaborating with you as the PM -->

Thanks for visiting this category direction page on Software Composition Analysis (Dependency Scanning and License Compliance) in GitLab. This page belongs to the [Composition Analysis](/handbook/product/categories/#composition-analysis-group) group of the Secure stage. The Product Manager is [Sara Meadzinger](https://gitlab.com/smeadzinger).

This direction page is a work in progress, and everyone can contribute:

 - Please comment and contribute in the linked [issues](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3ADependency%20Scanning) or [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=Category:Dependency+Scanning) on this page. Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.
 - Please share feedback directly via email or on a video call. If you're a GitLab user and have direct knowledge of your need for dependency scanning, we'd especially love to hear from you.

### Overview
<!-- Describe your category so that someone who is not familiar with the market space can understand what the product does. 
-->

Dependency scanning analyzes the dependencies used in a project.  It identifies dependencies that have been directly included and it also analyzes those dependencies to get a list of their dependencies (also known as indirect or transitive dependencies).  Once a full listing of all direct and transitive dependencies has been obtained, dependency scanning solutions analyze those dependencies to identify known vulnerabilities in those dependencies.

Dependency Scanning leverages the [GitLab Advisory Database](https://about.gitlab.com/direction/secure/vulnerability-research/advisory-database/) to check if any of these dependencies have known vulnerabilities, and it indicates if a package upgrade is needed.

Dependency Scanning and License Compliance are often considered two elements of Software Composition Analysis and Application Security Testing.

License compliance analyzes the dependencies used in a project.  It identifies dependencies that have been directly included and it also analyzes those dependencies to get a list of their dependencies (also known as indirect or transitive dependencies).  Once a full listing of all direct and transitive dependencies has been obtained, license compliance solutions analyze those dependencies to identify how those dependencies are licensed.  Typically this information is stored in the metadata for the package; however, it may also be present in a file in the dependency's code repository.  This type of analysis allows users to get a full list of all the licenses they are using in the project so they can ensure they are willing to adhere to the associated terms and conditions.

> GitLab was named as a [Challenger in the 2022 Magic Quadrant for Application Security Testing](https://about.gitlab.com/analysts/gartner-ast22/).

Additional details about our current features and capabilities can be [viewed in our documentation](https://docs.gitlab.com/ee/user/application_security/dependency_scanning/).
- [License scanning](https://docs.gitlab.com/ee/user/compliance/license_scanning_of_cyclonedx_files/)
- [License approval policies](https://docs.gitlab.com/ee/user/compliance/license_approval_policies.html)
- [License list](https://docs.gitlab.com/ee/user/compliance/license_list.html)

### Strategy and Themes
<!-- Capture the main problems to be solved in market (themes). Describe how you intend to solve these with GitLab (strategy). Provide enough context that someone unfamiliar with the details of the category can understand what is being discussed. -->

We have five main themes in our software composition analysis strategy:

1. **Shifting dependency scanning and license compliance left** - Our goal is to provide Dependency Scanning and License Compliance as part of the standard development process. This means that Dependency Scanning and License Compliance are executed every time a new commit is pushed to a branch, identifying newly introduced vulnerabilities in the merge request. We also include Dependency Scanning and License Compliance as part of [Auto DevOps](https://docs.gitlab.com/ee/topics/autodevops/).
1. **Accurate component detection** - Our goal is to be able to identify the correct dependencies and versions accurately for the languages that we support.  For this reason, we attempt to build Java and Python projects before identifying dependencies so that we are not forced to guess which version in a version range is actually used in the final application.
1. **Accurate license detection** - Our goal is to support multiple license detection methods and to allow those methods to work together to identify licenses accurately.  Eventually we would like to add support for full SPDX expressions so we can accurately handle packages with complex license scenarios.
1. **Continuous scanning** - Scanning for known vulnerabilities needs to be a continuous effort because the list of known vulnerabilities is constantly growing. To stay secure, users need a solution that will be updated constantly with the latest threat data.
1. **Comprehensive license detection** - Our goal is to continue to add data to our license database so we can cover both a high percentage of the total open source packages available for the languages that we support.  Ideally we will achieve full coverage for the most popular packages for each language that we support.

### 1 year plan
<!--
1 year plan for what we will be working on linked to up-to-date epics. This section will be most similar to a "road-map". Items in this section should be linked to issues or epics that are up to date. Indicate relative priority of initiatives in this section so that the audience understands the sequence in which you intend to work on them. 
 -->

#### What we recently completed
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

In GitLab 16.2 we added [Dependency and License scanning support for NuGet v2](https://gitlab.com/gitlab-org/gitlab/-/issues/398680).

#### What we are currently working on
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

During 16.4 we are working to address a number of [high value improvements](https://gitlab.com/groups/gitlab-org/-/epics/9870), most of which are focused on making our Operational Container Scanning solution more up-to-date and functional to meet the needs of our users.

Also, during 16.4 we are working toward introducing [continuous vulnerability scans](https://gitlab.com/groups/gitlab-org/-/epics/7886). This new method of scanning will have significantly better performance and will allow users to have their vulnerability results updated continuously as new advisories are added to our advisory database. This work is a prerequisite for a large number of other features on our roadmap. Once this work is completed, users will no longer need to run regular scheduled scans to have their vulnerability results updated for container images that have been scanned as part of the CI pipeline for their default branch.

#### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->

Over the next few months, we plan on finishing the work for [continuous vulnerability scans](https://gitlab.com/groups/gitlab-org/-/epics/7886) so we can release the feature to users.

Over the next few months, we plan to continue to improve and [mature our new method of license scanning](https://gitlab.com/groups/gitlab-org/-/epics/9995) to make it a more reliable source of license information.

#### What is Not Planned Right Now

We currently do not have plans to add the following functionality during the next 12 months:
1. Support for runtime analysis of code execution to help filter out vulnerabilities that exist in code that is never executed.  As a workaround, users can explore our [partnership with Rezilion](https://about.gitlab.com/blog/2022/03/23/gitlab-rezilion-integration-reduces-vulnerability-backlog-identifies-exploitable-risks-to-fix/) which allows for this type of analysis to be performed and the results sent into GitLab.
1. Expanded language support for the functionality that currently exists to [automatically generate merge requests to update dependencies](https://docs.gitlab.com/ee/user/application_security/vulnerabilities/index.html#resolve-a-vulnerability). As a workaround, users can use the open source [Renovate](https://github.com/renovatebot/renovate#supported-platforms) project, which has an integration with GitLab.
1. Full support for advanced SPDX expressions
1. Automatic categorization of licenses by type

### Best in Class Landscape
<!-- Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" -->

BIC (Best In Class) is an indicator of forecasted near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape.

#### Key Capabilities 

For this product area, these are the capabilities a best-in-class solution should provide:

1. The ability to accurately and comprehensively detect known vulnerabilities for both direct and transitive dependencies in a project.
1. Support for detecting vulnerabilities across a wide variety of programming languages.
1. A robust advisory database that is curated to reduce false positives and contains data from a variety of sources.
1. Support for shifting vulnerability results left into the IDE.
1. Support for identifying fix versions when available.
1. Support for viewing the hierarchical chain of dependencies (typically in a dependency graph or dependency tree) to allow developers to see which upstream dependency will needs to be updated to fix a downstream vulnerability.
1. Support for automation to help keep dependencies up-to-date.
1. Support for runtime analysis of code execution to help filter out vulnerabilities that exist in code that is never executed.
1. Extensive analysis of other risk factors (quality, supply chain security, maintenance, etc) beyond just security vulnerabilities.
1. The ability to accurately and comprehensively detect licenses for both direct and transitive dependencies in a project.
1. Support for detecting licenses across a wide variety of programming languages.
1. Support for multiple methods of detecting licenses (metadata, files, embedded licenses).
1. The ability to detect licenses for closed-source dependencies.
1. The ability to support both basic and complex SPDX expressions.
1. The ability to easily show legal and compliance teams the terms and conditions of licenses that are being included.
1. The ability to enforce policies prohibiting specific licenses from being used in an organization.
1. Reporting and filtering to allow users to easily see which licenses are already in use.
1. Automatic license classification to organize licenses into categories based on their terms and conditions.

This list represents some key capabilities of a comprehensive software composition analysis solution.  Not all of these capabilities are currently supported by GitLab today.

#### Roadmap
<!-- Key deliverables we're focusing on to build a BIC solution. List the epics by title and link to the epic in GitLab. Minimize additional description here so that the epics can remain the SSOT. This may be duplicative to the 1 year section however for some categories the key deliverables required to become the BIC solution will extend beyond one year and we want to capture all of the gaps. Moreover, the 1 year section may contain work that is not directly related to closing gaps if we are already the BIC or if we are differentiating ourselves.-->

Our [prioritized roadmap](https://about.gitlab.com/direction/secure/composition-analysis/#priorities) can be viewed on our group direction page.  Plans to move the category from [Viable to Complete](https://gitlab.com/groups/gitlab-org/-/epics/1664) are tracked in GitLab.

#### Top Competitive Solutions
<!-- PMs can choose to highlight a primary BIC competitor--or more, if no single clear winner in the category exists; in this section we should indicate: 1. name of competitive product, 2. links to marketing website and documentation, 3. why we view them as the primary BIC competitor -->

- [Black Duck by Synopsys](https://www.blackducksoftware.com/solutions/application-security)
- [CA Veracode](https://www.veracode.com/security/)
- [Contrast](https://www.contrastsecurity.com/open-source-security-software)
- [Datadog](https://www.datadoghq.com/)
- [GitHub](https://github.com/)
- [greenkeeper](https://greenkeeper.io/)
- [HCL AppScan](https://www.hcltechsw.com/wps/portal/products/appscan/features)
- [JFrog Xray](https://jfrog.com/xray/)
- [Micro Focus Fortify](https://www.microfocus.com/en-us/portfolio/application-security)
- [Snyk](https://snyk.io/product/)
- [Sonatype Nexus](https://www.sonatype.com/nexus-auditor)
- [Whitesource](https://www.whitesourcesoftware.com/open-source-security/)

### Target Audience
<!--
List the personas (https://about.gitlab.com/handbook/marketing/strategic-marketing/roles-personas#user-personas) involved in this category.

Look for differences in user's goals or uses that would affect their use of the product. Separate users and customers into different types based on those differences that make a difference.
-->

Primary: [Sasha (Software Developer)](https://about.gitlab.com/handbook/product/personas/#sasha-software-developer) wants to know when adding a dependency if it has known vulnerabilities so alternate versions or dependencies can be considered.

Secondary: [Amy (Application Security Engineer)](https://about.gitlab.com/handbook/product/personas/#amy-application-security-engineer) and [Isaac (Infrastructure Security Engineer)](https://about.gitlab.com/handbook/product/personas/#isaac-infrastructure-security-engineer) want to know what dependencies have known vulnerabilities, to be alerted if a new vulnerability is published for an existing component, and to know how behind current version the components are.

Other:
1. [Cameron (Compliance Manager)](/handbook/product/personas/#cameron-compliance-manager)
1. [Devon (DevOps Engineer)](/handbook/product/personas/#devon-devops-engineer)
1. [Sidney (Systems Administrator)](/handbook/product/personas/#sidney-systems-administrator)
1. [Delaney (Development Team Lead)](/handbook/product/personas/#delaney-development-team-lead)

### Pricing and Packaging

The GitLab Dependency Scanning features are all packaged as part of the [GitLab Ultimate tier](https://about.gitlab.com/pricing/ultimate/). This aligns with our [pricing strategy](https://about.gitlab.com/company/pricing/#pricing-strategy) as these features are relevant for executives who are concerned about keeping their organization secured from known vulnerabilities.

### Analyst Landscape

Dependency Scanning and License Compliance are frequently bundled together with Container Scanning to provide an overall Software Composition Analysis (SCA) solution within the Application Security Testing (AST) market.  GitLab was recently named as a [Challenger in the 2022 Magic Quadrant for Application Security Testing](https://about.gitlab.com/analysts/gartner-ast22/).
