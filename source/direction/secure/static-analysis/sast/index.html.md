---
layout: sec_direction
title: "Category Direction - Static Application Security Testing (SAST)"
description: "Static Application Security Testing (SAST) checks source code to find possible security vulnerabilities."
canonical_path: "/direction/secure/static-analysis/sast/"
---

- TOC
{:toc}

## SAST

| | |
| --- | --- |
| Stage | [Secure](/direction/secure/) |
| Maturity | [Complete](/direction/maturity/) |
| Content Last Reviewed | `2023-08-23` |

<!-- Note: This document includes TODO comments. Publishing the updated content with TODOs remaining is a way to share the overall direction earlier and more iteratively, rather than waiting for all of the content requested by the new template to be ready to publish. -->

### Introduction and how you can help
This direction page describes GitLab's plans for the SAST category, which checks source code to find possible security vulnerabilities.
It helps developers identify weaknesses and security issues earlier in the software development lifecycle before code is deployed.
GitLab SAST runs on merge requests and the default branch of your software projects so you can continuously monitor and improve the security of the code you write.

This page is maintained by the Product Manager for [Static Analysis](/handbook/product/categories/#static-analysis-group), [Connor Gilbert](/company/team/#connorgilbert).

Everyone can contribute to where GitLab SAST goes next, and we'd love to hear from you.
The best ways to participate in the conversation are to:
- Comment or contribute to existing [SAST issues](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=created_date&state=opened&label_name%5B%5D=Category%3ASAST) in the public `gitlab-org/gitlab` issue tracker.
- If you don't see an issue that matches, file [a new issue](https://gitlab.com/gitlab-org/gitlab/-/issues/new?issuable_template=Feature%20Proposal%20-%20basic).
    - Post a comment that says `@gitlab-bot label ~"group::static analysis" ~"Category:SAST"` so your issue lands in our triage workflow.
- If you're a GitLab customer, discuss your needs with your account team.

### Overview
SAST checks source code to find possible security vulnerabilities.
It helps developers identify weaknesses and security issues earlier in the software development lifecycle before code is deployed.

SAST _does_:

- Use static analysis techniques to find issues early in the development process.
- Identify weaknesses, which may be vulnerabilities, in the code it scans.
- Analyze the control and data flow of your program, check how functions are called, and otherwise analyze what the code could do at runtime.
- Help find issues that code reviewers or tests might miss.

SAST _doesn't_:

- Find known vulnerabilities in software dependencies; this is software composition analysis.
- Run code and attempt to trigger behaviors behaviors; this is dynamic analysis.
- Look for generic bugs or maintenance issues; this is [Code Quality](/direction/secure/static-analysis/code_quality/).
- Replace code reviewers or tests; it augments them instead.

Security tools like SAST are best when integrated directly into the [DevOps Lifecycle](https://about.gitlab.com/stages-devops-lifecycle/).
We believe that every project can benefit from SAST scans, so we include it in [Auto DevOps](https://docs.gitlab.com/ee/topics/autodevops/) and make SAST scanning available at all GitLab tiers, including Free.
Additional features, including proprietary code analysis and integration with GitLab Vulnerability Management, are [available only in GitLab Ultimate](https://docs.gitlab.com/ee/user/application_security/sast/#summary-of-features-per-tier).

#### GitLab's solution
GitLab SAST runs on merge requests and the default branch of your software projects so you can continuously monitor and improve the security of the code you write.
SAST jobs run in your CI/CD pipelines alongside existing builds, tests, and deployments, so it's easy for developers to interact with.

While SAST uses sophisticated techniques, we want it to be simple to understand and use day-to-day, especially by developers who may not have specific security expertise.
So, when you [enable GitLab SAST](https://docs.gitlab.com/ee/user/application_security/sast/#configuration), it automatically detects the programming languages used in your project and runs the right security analyzers.

We want to give everyone the tools they need to write high-quality code, so [basic SAST scans](https://docs.gitlab.com/ee/user/application_security/sast/#summary-of-features-per-tier) are available in every GitLab tier.
However, all organizations that use GitLab SAST in their security programs should use Ultimate.
Only GitLab Ultimate includes:
- Proprietary technology for suppressing false positive results and tracking vulnerabilities as they move through codebases.
- Integrating SAST results into the merge request workflow.
- Vulnerability Management, Security Policies, and other capabilities that help you enforce security requirements.

To learn more, check the [SAST documentation](https://docs.gitlab.com/ee/user/application_security/sast/).

### Strategy and Themes
<!-- Capture the main problems to be solved in market (themes). Describe how you intend to solve these with GitLab (strategy). Provide enough context that someone unfamiliar with the details of the category can understand what is being discussed. -->

We want to help developers write better code and worry less about common security mistakes. SAST should help _prevent_ security vulnerabilities by helping developers easily _identify_ common security issues as code is being contributed and _mitigate_ proactively. SAST should _integrate_ seamlessly into a developer’s workflow because security tools that are actively used are effective.

- _Prevent_ - find common security issues as code is being contributed and before it gets deployed to production.
- _Identify_ - continuously monitor source code for known or common issues.
- _Mitigate_ - make it easy to remediate identified issues, automatically if possible.
- _Integrate_ - integrate with the rest of the DevOps pipeline and [play nicely with other vendors](https://about.gitlab.com/handbook/product/gitlab-the-product/#plays-well-with-others).

The importance of these goals is validated by GitLab's [DevSecOps Landscape Survey](https://about.gitlab.com/developer-survey/#security), which consistently finds that:
- Many organizations include security testing too late in the software development lifecycle.
- Developers are critical to remediating application security issues, but often don't have access to security tools.

### 1 year plan
<!--
1 year plan for what we will be working on linked to up-to-date epics. This section will be most similar to a "road-map". Items in this section should be linked to issues or epics that are up to date. Indicate relative priority of initiatives in this section so that the audience understands the sequence in which you intend to work on them.
 -->

GitLab Static Analysis and Vulnerability Research teams are collaborating to address important opportunities to improve the customer experience with SAST.
Important themes include:

1. **Result quality:** Security professionals and developers should be able to trust every result from GitLab SAST. Our work in this area involves:
  - Improving the detection engines used to process and analyze code, including the development of a new [next-generation detection engine](https://gitlab.com/groups/gitlab-org/-/epics/3260).
  - Adding, removing, and updating the detection rules used with the existing engines.
1. **"Day 1" experience and "Day 2" efficiency:** We believe that SAST can improve every codebase by supporting human reviewers, so we want to make SAST easy to enable ("Day 1") and operate going forward ("Day 2"). Concretely, this means:
  - Consolidating coverage from multiple separate analyzers to Semgrep-based analysis using GitLab-created rules. This provides a simpler, more consistent operational experience; allows GitLab to directly manage rules; and makes scans run faster.
  - Improving the default configuration of analyzers so they can be on by default, supporting our [Convention over Configuration product principle](/handbook/product/product-principles/#convention-over-configuration).
1. **Triage and remediation experience:** We value our users' time, and making it easier to _understand_ a potential vulnerability improves the chances it'll be resolved. We are working to:
  - Present SAST findings in context with modified code so each finding is easier to understand.
  - Improve the clarity of the guidance and reference material provided with each result.
  - Augment our efforts with AI to better explain vulnerabilities including the specific vulnerable code.
1. **Shifting further left:** GitLab SAST already scans code as soon as it's pushed, before code reviews even begin. But, we are investing in IDE integrations to offer scanning even earlier, before code leaves developer machines.

We expect different parts of these initiatives to deliver value in the short, medium, and long term.

Outside of these proactive priorities, we also react quickly to functional bugs.

#### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->

In the next 3 months, we are planning to work on:
- **Result quality:**
    - [Curating the detection rules](https://gitlab.com/groups/gitlab-org/-/epics/10907) that GitLab creates and maintains.
- **"Day 1" experience and "Day 2" efficiency:**
    - Consolidating [NodeJS scanning](https://gitlab.com/gitlab-org/gitlab/-/issues/395487) into the Semgrep-based analyzer.
- **Triage and remediation experience:**
    - [Integrating SAST results](https://gitlab.com/groups/gitlab-org/-/epics/10959) into the code diff view of merge requests (in the Changes tab). This project involves updating the Code Quality inline diff feature and adding SAST results to it.
    - [Improving Advanced Vulnerability Tracking](https://gitlab.com/groups/gitlab-org/-/epics/5144) by expanding the number of supported languages and handling additional cases where unrelated changes could cause tracking failures.
- **Shifting further left:**
    - Integrating security scanning results [into the VS Code IDE](https://gitlab.com/groups/gitlab-org/-/epics/9679), Integrating [results sourced from CI/CD pipeline-based scans](https://gitlab.com/groups/gitlab-org/-/epics/9004) into the VS Code IDE.
    - Investigating approaches to [real-time IDE-based scanning](https://gitlab.com/groups/gitlab-org/-/epics/10283), advancing past the first CI/CD pipeline-based iteration.

#### What we are currently working on
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

We are currently working on:
- **Result quality:**
    - Communicating in the product about changes to SAST rules, as part of the first phase of our [rule curation effort](https://gitlab.com/groups/gitlab-org/-/epics/10907).
- **"Day 1" experience and "Day 2" efficiency:**
    - Consolidating [NodeJS scanning](https://gitlab.com/gitlab-org/gitlab/-/issues/395487) into the Semgrep-based analyzer.
- **Triage and remediation experience:**
    - [Integrating SAST results](https://gitlab.com/groups/gitlab-org/-/epics/10959) into the code diff view of merge requests (in the Changes tab). This project involves updating the Code Quality inline diff feature and adding SAST results to it.
    - [Improving Advanced Vulnerability Tracking](https://gitlab.com/groups/gitlab-org/-/epics/5144) by completing expansion to all possible analyzers and finalizing algorithm improvements. This builds on improvements we released iteratively during [16.2](https://about.gitlab.com/releases/2023/07/22/gitlab-16-2-released/#improved-sast-vulnerability-tracking) and [16.3](https://about.gitlab.com/releases/2023/08/22/gitlab-16-3-released/#improved-sast-vulnerability-tracking).
- **Shifting further left:**
    - Completing [follow-up iterations](https://gitlab.com/groups/gitlab-org/-/epics/10996) on the recently released [integration of CI/CD pipeline-based security scan results into the VS Code IDE](https://gitlab.com/groups/gitlab-org/-/epics/9004).

We are also looking forward by investigating approaches to:
- [Real-time IDE-based scanning](https://gitlab.com/groups/gitlab-org/-/epics/10283), advancing past the first CI/CD pipeline-based iteration.

#### What we recently completed
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

Our recent work includes:

- [Showing security findings in the VS Code IDE](https://about.gitlab.com/releases/2023/08/22/gitlab-16-3-released/#security-findings-in-vs-code) (with findings from CI/CD-pipeline-based scans) (16.3).
- [Further expansion of coverage and improvements to the algorithm used in Advanced Vulnerability Tracking](https://about.gitlab.com/releases/2023/08/22/gitlab-16-3-released/#improved-sast-vulnerability-tracking) (16.3).
- [Updated error handling in the Semgrep-based analyzer](https://about.gitlab.com/releases/2023/08/22/gitlab-16-3-released/#sast-analyzer-updates) (16.3).
- [New documentation of how SAST rules work](https://docs.gitlab.com/ee/user/application_security/sast/rules.html) (16.3).
- [Improvements to SAST rules and customizability of Semgrep-based scanning](https://about.gitlab.com/releases/2023/07/22/gitlab-16-2-released/#sast-analyzer-updates) (16.2).
- [Expansion of coverage and improvements to the algorithm used in Advanced Vulnerability Tracking](https://about.gitlab.com/releases/2023/07/22/gitlab-16-2-released/#improved-sast-vulnerability-tracking) (16.2).
- [Shared ruleset customization files across multiple projects](https://about.gitlab.com/releases/2023/06/22/gitlab-16-1-released/#shared-ruleset-customizations-in-sast-iac-scanning-and-secret-detection) (16.1).
- [Clearer guidance and better coverage for SAST detection rules](https://about.gitlab.com/releases/2023/06/22/gitlab-16-1-released/#clearer-guidance-and-better-coverage-for-sast-rules) (16.1).
- [Semgrep-based scanning for Scala code](https://about.gitlab.com/releases/2023/05/22/gitlab-16-0-released/#faster-easier-scala-scanning-in-sast) (16.0).
- [Auto-resolution for findings when rules are disabled or removed](https://about.gitlab.com/releases/2023/03/22/gitlab-15-10-released/#automatically-resolve-sast-findings-when-rules-are-disabled), including removal of false-positive-prone default rules (15.10).

Check [older release posts](https://gitlab-com.gitlab.io/cs-tools/gitlab-cs-tools/what-is-new-since/?tab=features&selectedCategories=SAST&minVersion=13_00) for our previous work in this area.

#### What is Not Planned Right Now

We understand the value of many potential improvements to GitLab SAST, but aren't currently planning to work on the following initiatives:

- **Expanding language support:** Currently, we're focusing on making it easier and faster to use SAST on [the many languages and frameworks we already support](https://docs.gitlab.com/ee/user/application_security/sast/#supported-languages-and-frameworks), rather than adding support for new languages.
However, if we don't support a language you use, you can request support by [opening an issue in  epic 297](https://gitlab.com/groups/gitlab-org/-/epics/297) with details.
Or, you can [integrate third-party tools](https://docs.gitlab.com/ee/development/integrations/secure.html) using our [documented, open report format](https://docs.gitlab.com/ee/development/integrations/secure.html#report).
- **Incremental scanning:** We're currently focusing on making _all_ scans faster rather than developing different types of scans for different cases, such as [incremental scans](https://gitlab.com/gitlab-org/gitlab/-/issues/419734) that scan only modified code.

<!-- TODO: Add Best-in-Class Landscape section. -->
