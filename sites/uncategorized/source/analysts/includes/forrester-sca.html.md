---
layout: markdown_page
title: "GitLab and The Forrester Wave™: Software Composition Analysis, Q2 2019"
description: "This page represents how Forrester views our SCA capabilities in relation to the larger market."
canonical_path: "/analysts/forrester-sca/"
noindex: true
---

This page represents how Forrester views our SCA capabilities in relation to the larger market and how we're working with that information to build a better product.  It is also intended to provide Forrester with ongoing context for how our product is developing in relation to how they see the market.

## Forrester's takeaway on the SCA Market at time of report publication:

### Remediation, policy management, and reporting are key differentiators.

"As developers continue to use open source to accelerate the release of new application functionality, remediation, policy management, and reporting will dictate which providers will lead the pack. Vendors that can provide developers with remediation advice and even create patches position themselves to significantly reduce business risk."

## Forrester's take on GitLab at time of report publication:

"GitLab is off to a fast start, but security pros will find developer focus frustrating. GitLab has been offering security products since 2017 and now offers static and dynamic analysis in addition to binary SCA. However, some of the developer use case-focused features of SCA will be uncomfortable to security pros. For example, the dismissing feature gives developers the ability to dismiss any vulnerability of any severity. This forces security pros to keep careful track of what vulnerabilities developers have chosen to ignore. Also, GitLab’s leaning is not to stop the build via quality gates. Instead, it recommends using a reviewer feature, which causes security pros to manually review the status of each build."


## Lessons learned and future improvements

### Security capabilities are off to a great start!

For our first official security-oriented analyst evaluation, we are excited to be included among the ten vendors evaluated and proud of where we stand for our very early security capabilities. This was a great opportunity for analyst feedback and objective insight into how GitLab compares. We take to heart not only areas where we shine - but also where improvement is needed. Based on this analyst report and analyst interaction feedback, we are already addressing improvement opportunities in our [roadmap](https://about.gitlab.com/direction/secure/#upcoming-releases) and [vision](https://about.gitlab.com/direction/secure/#direction). We also welcome [your contribution](https://about.gitlab.com/community/contribute/) and invite you to help us understand what you would like to see as our security capabilities grow.

As a company dedicated to releasing incrementally, delivering first on breadth and then on depth, it is not uncommon for GitLab to initially place in more of a challenger position, as our feature set generally does not have the same maturity as established players in the space. However, when GitLab enters a space, we do so boldly, with clear intentions and a solid strategy.  GitLab’s strategy for application security testing and software composition analysis focuses more equally on both the developer and the security professional than traditional solutions.  You will find some areas in strategy where we were not scored as highly as we believe we should be due to our more aggressive focus on development.

Forrester's takeaway above regarding developers continuing to use open source is closely aligned to the GitLab [vision for application security testing](https://about.gitlab.com/direction/secure/#direction) and our work in progress for [auto remediation](https://gitlab.com/groups/gitlab-org/-/epics/133). While not available in the evaluated version (11.6), a subsequent release can now [detect a more current patch available](https://about.gitlab.com/releases/2019/03/22/gitlab-11-9-released/#vulnerability-remediation-merge-request) and enable the developer to create a [new branch and apply the patch](https://docs.gitlab.com/ee/user/application_security/security_dashboard/#create-a-merge-request-from-a-vulnerability) with one click. Upcoming versions will [automatically run the pipeline and present the results](https://gitlab.com/groups/gitlab-org/-/epics/275) to the developer to accept or reject.

### Updates since the evaluation

GitLab has provided a major [new release every month](https://about.gitlab.com/releases/categories/releases/) for 90 consecutive months. Forrester evaluated version 11.6 for this report while versions [11.7](https://about.gitlab.com/releases/2019/01/22/gitlab-11-7-released/), [11.8](https://about.gitlab.com/releases/2019/02/22/gitlab-11-8-released/) and [11.9](https://about.gitlab.com/releases/2019/03/22/gitlab-11-9-released/) have since been released. You will find several features that Forrester felt were lacking have already been added including improvements to the security dashboard, additional languages added to SAST scanning, and secrets detection.

Specifically, we have added the following since 11.6 was evaluated:
- [Group Security Dashboard](https://docs.gitlab.com/ee/user/application_security/security_dashboard/#viewing-the-vulnerabilities)
   - [Added filters](https://about.gitlab.com/releases/2019/01/22/gitlab-11-7-released/#filter-vulnerabilities-in-the-group-security-dashboard) to display vulnerabilities by severity, report type, and project name
   - Added [Dependency Scanning results](https://about.gitlab.com/releases/2019/01/22/gitlab-11-7-released/#show-dependency-scanning-results-in-the-group-security-dashboard) and [Container Scanning   results](https://about-src.gitlab.com/2019/03/22/gitlab-11-9-released/#container-scanning-results-in-the-group-security-dashboard) to the existing SAST results
   - Enabled [adjustable time ranges for security dashboard   charts](https://about-src.gitlab.com/2019/03/22/gitlab-11-9-released/#adjustable-time-ranges-for-security-dashboard-charts)
- [SAST language coverage](https://docs.gitlab.com/ee/user/application_security/sast)
   - [JavaScript](https://about.gitlab.com/releases/2019/02/22/gitlab-11-8-released/#sast-support-for-javascript)
   - [TypeScript](https://about.gitlab.com/releases/2019/03/22/gitlab-11-9-released/#sast-for-typescript)
   - [SAST for multi-module Maven projects](https://about-src.gitlab.com/2019/03/22/gitlab-11-9-released/#sast-for-multi-module-maven-projects)
- [Merge Request Approval Rules](https://about.gitlab.com/releases/2019/02/22/gitlab-11-8-released/#merge-request-approval-rules) for those wishing to have more control - easily define [rules](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/rules.html#multiple-approval-rules) for who needs to approve a change, whether it's a specific user, group, or role.
- [Confidential issues for security vulnerabilities](https://about.gitlab.com/releases/2019/02/22/gitlab-11-8-released/#confidential-issues-for-security-vulnerabilities)
- [Detect secrets and credentials in the repository](https://about.gitlab.com/releases/2019/03/22/gitlab-11-9-released/#detect-secrets-and-credentials-in-the-repository) developers may unintentionally commit secrets and credentials to their remote repositories. GitLab 11.9 introduced a Secret Detection feature that scans the content of the repository to find API keys and other information that should not be there. [Results are displayed](https://docs.gitlab.com/ee/user/application_security/sast#secret-detection) in the SAST report in the merge request widget, pipelines reports, and the security dashboards.

Note that as of August, 2019, the GitLab **License Management** capabilities have been renamed to **License Compliance**.

### Our comments about Forrester’s summary and evaluation of GitLab

**Dismissing vulnerabilities**
We understand that some security professionals may be uncomfortable that a developer can “dismiss” a vulnerability found in a scan. Vulnerabilities that are dismissed by the developer are still included in both the pipeline report and the security dashboards. Security can easily revert the dismissal if they disagree. If security wants to review every dismissal, they are easily identified. We are also adding the ability to [capture comments](https://gitlab.com/gitlab-org/gitlab-ee/issues/10364) for the dismissal to aid in communication between the developer and the security team. This aligns with our focus on providing as much visibility into all activities as possible to speed and simplify collaboration while maintaining accountability.

**Quality gates**
A gated waterfall approach to security is incongruent with an iterative DevOps methodology. That is why GitLab’s preference is indeed to not “stop the build via quality gates”. For application security testing to scale alongside DevOps, developers must be empowered to find and resolve vulnerabilities on their own - without becoming security experts. Our [vision](https://about.gitlab.com/direction/secure/#direction) is that many of the vulnerabilities will be fixed via auto remediation where the developer is informed of the fix, and may choose to review/approve but does not need to do the remediation tasks themselves. In the meantime, we recognize that some enterprises may still want a gated review. We currently offer [merge request approval rules](https://about.gitlab.com/releases/2019/02/22/gitlab-11-8-released/#merge-request-approval-rules) to aid in this workflow. With planned [Security gates](https://gitlab.com/gitlab-org/gitlab-ee/issues/9928), GitLab will introduce a way to enable approval rules only if critical vulnerabilities are introduced with the new code, so the security team can focus on reviewing only those changes. We want to be clear that using manual approvals is not a requirement of the tool, though it may be a requirement of the user’s policy.

**Policy management**
As a result of this report, in addition to [Security gates](https://gitlab.com/gitlab-org/gitlab-ee/issues/9928), we have reprioritized adding the ability to [block the merge request if blacklisted licenses are found](https://gitlab.com/gitlab-org/gitlab-ee/issues/6924), enabling users to set the policy and have it automatically enforced by GitLab.

**Roadmap execution**
To put it simply, we disagree with Forrester’s assessment of this aspect. In fact we invite you to form your own opinion, taking into consideration that we are the only vendor that transparently publishes the entire [roadmap](https://about.gitlab.com/direction/secure/#upcoming-releases), we have delivered a product, capable of consideration on the Wave in just over 18 months, and anyone can [contribute](https://about.gitlab.com/community/contribute/).

**Product vision**
Our principal takeaway from the Forrester assessment of product vision and buyer need alignment is that developer and security professional’s opinions on both the current and future state of good security practices continue to vary significantly. We do believe that empowering development to more easily achieve good security practices is the right approach and will continue to empower better Dev-Sec-Ops collaboration.   For more on how we intend to do that, see the GitLab vision at: https://about.gitlab.com/direction/secure/.

**SDLC integration**
Much like the difference of opinion regarding our roadmap and vision, we think that the value we provide in our complete SDLC product (no integration needed, but you can if you want to) is both compelling and competitive for DevOps teams, developers and security professionals working with those teams.

For those who want to integrate other tools into GitLab CI/CD in order to include the results from other scanners in the GitLab pipeline report, we offer many integrations including:

**[Source Code Management (SCM)](https://docs.gitlab.com/ee/ci/ci_cd_for_external_repos/)**
* [GitHub](https://docs.gitlab.com/ee/ci/ci_cd_for_external_repos/github_integration.html)
* [Bitbucket](https://docs.gitlab.com/ee/ci/ci_cd_for_external_repos/bitbucket_integration.html)

**Build tools**
* [Jenkins](https://docs.gitlab.com/ee/integration/jenkins.html)
* [Atlassian Bamboo](https://docs.gitlab.com/ee/user/project/integrations/bamboo.html)
* [CodeShip](https://codeship.com/gitlab)

**IDE**
* [Visual Studio](https://marketplace.visualstudio.com/items?itemName=MysticBoy.GitLabExtensionforVisualStudio)
* [IntelliJ ](https://plugins.jetbrains.com/plugin/7447-gitlab-integration-plugin)
* [Eclipse](https://marketplace.eclipse.org/content/mylyn-gitlab-connector)
* [Atom](https://atom.io/packages/gitlab-integration)

**[Ticketing](https://docs.gitlab.com/ee/integration/external-issue-tracker.html)**
* [Jira](https://docs.gitlab.com/ee/integration/jira/)
* [Redmine](https://docs.gitlab.com/ee/user/project/integrations/redmine.html)
* [Bugzilla](https://docs.gitlab.com/ee/user/project/integrations/bugzilla.html)
* [YouTrack](https://docs.gitlab.com/ee/user/project/integrations/youtrack.html)

**Repositories**
* [Jfrog Artifactory](https://docs.gitlab.com/ee/ci/examples/README.md#contributed-examples) and [JFrog blog article](https://jfrog.com/blog/gitlab-and-artifactory-on-your-mark-get-set-build)

**Browser extensions**
* [GitLab Notifier for Google Chrome](https://github.com/sue445/chrome-gitlab-notifier/blob/master/README.md)
* [Sourcegraph for GitLab](https://about.sourcegraph.com/blog/sourcegraph-for-gitlab)

**Blacklisting/whitelisting**
In this analysis, we feel our Blacklisting/whitelisting capabilities may not have been fully appreciated. In addition to blacklisting a license from within the pipeline, we can also automate blacklisting with predefined lists in the [manage project settings](https://docs.gitlab.com/ee/user/compliance/license_compliance/index.html#project-policies-for-license-compliance). This automation will apply to all further changes (merge requests) in the project. Each project can have its own policies. GitLab will also support [defining policies at the group level](https://gitlab.com/gitlab-org/gitlab-ee/issues/7149), making life easier if multiple similar projects are in the same group.

**Bill of materials**
How does the product proactively control or restrict components that don't meet policy guidelines from entering the SDLC? GitLab already has a way to determine which component is vulnerable using Dependency Scanning. It also has a similar check for license compliance. We know this capability needs to improve, and  our plans are to provide a [new dedicated view](https://gitlab.com/groups/gitlab-org/-/epics/858) where dependencies are the main focus.

**Reporting**
Reporting is intended for the developer in the pipeline report where he/she will also find all of the security scans (SAST, DAST, Container, Dependency, and License Management). For the security professional, unresolved and dismissed vulnerabilities are shown across projects in the [Security Group Level Dashboard](https://docs.gitlab.com/ee/user/application_security/security_dashboard/#viewing-the-vulnerabilities). Upcoming improvements to the dashboard include features targeting Security Directors, with metrics like [showing mean time to resolution](https://gitlab.com/gitlab-org/gitlab-ee/issues/7550).

## Summing it up…

**We believe GitLab is ideal for the enterprises who are:**
*Using GitLab for CI/CD
*Practicing iterative development via DevOps
*Using containers and serverless

For the enterprise that has not invested in app sec tools, GitLab can quickly provide scanning, often necessary for regulatory compliance, with one single application. GitLab offers SAST, DAST, Dependency, Container Scanning and License Management with [one app](https://about.gitlab.com/stages-devops-lifecycle/application-security-testing/) - no need to evaluate and buy from multiple vendors then stitch together integration with the DevOps toolchain.

For the enterprise already deeply invested in traditional app sec tools, GitLab affords a broader and [earlier scanning effort](https://about.gitlab.com/solutions/dev-sec-ops/), using a tool that developers are already using. GitLab can scan every code change, much the way that every airplane passenger gets scanned through TSA security. Save the deeper scans for later and/or less frequent evaluation.  Consider using GitLab on select projects to experience the more efficient workflow and potentially reduce your scanning costs from costlier tools.


