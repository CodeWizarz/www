---
layout: markdown_page
title: "Category Direction - Code Quality"
description: "Eliminate bugs, style violations, and mistakes before they're merged. Learn more about where GitLab Code Quality is going."
canonical_path: "/direction/secure/static-analysis/code_quality/"
---

- TOC
{:toc}

## Code Quality

| | |
| --- | --- |
| Stage | [Secure](/direction/secure/) |
| Maturity | [Minimal](/direction/maturity/) |
| Content Last Reviewed | `2023-08-23` |

<!-- Note: This document includes TODO comments. Publishing the updated content with TODOs remaining is a way to share the overall direction earlier and more iteratively, rather than waiting for all of the content requested by the new template to be ready to publish. -->

### Introduction and how you can help
This direction page describes GitLab's plans for the Code Quality category, which helps you keep your code maintainable, idiomatic, and correct.

This page is maintained by the Product Manager for [Static Analysis](/handbook/product/categories/#static-analysis-group), [Connor Gilbert](/company/team/#connorgilbert).

Everyone can contribute to where GitLab Code Quality goes next, and we'd love to hear from you.
The best ways to participate in the conversation are to:
- Comment or contribute to existing [Code Quality issues](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=created_date&state=opened&label_name%5B%5D=Category%3ACode%20Quality) in the public `gitlab-org/gitlab` issue tracker.
- If you don't see an issue that matches, file [a new issue](https://gitlab.com/gitlab-org/gitlab/-/issues/new?issuable_template=Feature%20Proposal%20-%20basic).
    - Post a comment that says `@gitlab-bot label ~"group::static analysis" ~"Category:Code Quality"` so your issue lands in our triage workflow.
- If you're a GitLab customer, discuss your needs with your account team.

### Overview
GitLab Code Quality helps you eliminate bugs, style violations, and mistakes before they're merged.
These features can:
- Make code authors more productive by catching errors earlier.
- Help code reviewers focus on logic, design, and other higher-order concerns, not style nitpicks or problems that an automated tool could surface more easily.
- Reduce the risk of bugs when software lands in production.

Code Quality shows quality findings in:
- A [merge request widget](https://docs.gitlab.com/ee/ci/testing/code_quality.html#merge-request-widget), in all tiers.
- A [pipeline report](https://docs.gitlab.com/ee/ci/testing/code_quality.html#pipeline-details-view), in GitLab Premium and Ultimate.
- The [merge request changes (diff) view](https://docs.gitlab.com/ee/ci/testing/code_quality.html#merge-request-changes-view), in GitLab Ultimate.
- A [project quality summary view](https://docs.gitlab.com/ee/ci/testing/code_quality.html#project-quality-view), in GitLab Ultimate.

You can provide [findings from any tool](https://docs.gitlab.com/ee/ci/testing/code_quality.html#implement-a-custom-tool) by saving a JSON report as a [CI/CD artifact](https://docs.gitlab.com/ee/ci/yaml/artifacts_reports.html#artifactsreportscodequality).
This approach is great if you already use linters or other tools in your development process, or if you have custom organization-specific rules.

GitLab also provides a scanning system based on [CodeClimate](https://github.com/codeclimate/codeclimate) open-source scanning tool and its analyzers.
However, we are currently [planning to remove this dependency](#1-year-plan).

To learn more, check the [Code Quality documentation](https://docs.gitlab.com/ee/ci/testing/code_quality.html).

#### Related categories
Outside of the Code Quality Detection category, GitLab also offers other features that help you build quality software:
- [Advanced security and compliance](https://docs.gitlab.com/ee/user/application_security/).
- [CI/CD](https://docs.gitlab.com/ee/ci/).
- [Code coverage reports](https://docs.gitlab.com/ee/ci/testing/code_coverage.html) and [test coverage visualization](https://docs.gitlab.com/ee/ci/testing/test_coverage_visualization.html).
- [Test case management](https://docs.gitlab.com/ee/ci/test_cases/).
- [Unit test reports](https://docs.gitlab.com/ee/ci/testing/unit_test_reports.html).

### Strategy and Themes
<!-- Capture the main problems to be solved in market (themes). Describe how you intend to solve these with GitLab (strategy). Provide enough context that someone unfamiliar with the details of the category can understand what is being discussed. -->

_Ambitious vision:_ Code Quality is the single best way in GitLab to tell a code author and reviewer about a quality or linting problem in the diff they've submitted.

We believe we can accomplish this vision by [shaping Code Quality](https://gitlab.com/groups/gitlab-org/-/epics/8790) into a flexible, open, community-oriented feature area.
Adopting a more "pluggable" model should help us:

- **Meet teams where they are** instead of requiring a one-size-fits-all approach. This includes respecting team preferences about the tools they wish to use, including tools that may be organization-specific or closed-source.
- Encourage individual users and teams to **experiment and take the initiative** to move their teams forward. We want users to be able to build their workflows around GitLab Code Quality freely without relying on first getting patches included in GitLab or an upstream project like CodeClimate.
- **Maximize compatibility** with different project organization structures and requirements, including when projects need particular tool versions or must be executed in certain ways.
- Enable reporting on a **wider variety of languages**—and even **non-code content** like technical documentation—than a single GitLab team could support.

This approach is similar to the way that other products take standard coverage file formats. Within GitLab, similar examples include accepting the [JUnit XML format for test reporting](https://docs.gitlab.com/ee/ci/testing/unit_test_reports.html#how-it-works), and accepting [CycloneDX reports for Software Bill of Materials information](https://docs.gitlab.com/ee/ci/yaml/artifacts_reports.html#artifactsreportscyclonedx).

This approach does mean de-emphasizing the "automatic" scanning that has been a key part of how GitLab Code Quality has historically been presented and framed.
We're still exploring ways that we could maintain this kind of automatic experience, but have become convinced that the current CodeClimate-based scanning system is _not_ the way forward.

### 1 year plan
<!-- 1 year plan for what we will be working on linked to up-to-date epics. This section will be most similar to a "road-map". Items in this section should be linked to issues or epics that are up to date. Indicate relative priority of initiatives in this section so that the audience understands the sequence in which you intend to work on them. -->

Our one-year focus includes two top priorities:
1. **Usability:** Improving how quality findings are shown and explained in the merge request and elsewhere.
1. **Pluggable Scanning:** Refocusing the feature category on [an approach](https://gitlab.com/groups/gitlab-org/-/epics/8790) that meets teams where they are, supports the tools they already use, and encourages a broad set of GitLab- and community-developed integrations.

We intend to, at some point in 2023, announce the deprecation and upcoming End of Support for CodeClimate-based scanning.
We currently plan to decide this timeline once we've evaluated how other tools can best be integrated directly with Code Quality; having that knowledge and documentation prepared will allow us to specify actionable steps to migrate away from CodeClimate-based scanning.

#### Effect of future scanning changes
If you're considering whether or not to adopt Code Quality based on the upcoming changes to scanning, consider the following:

- You can already adopt the new approach; it's supported today. For example, you can use a tool like `eslint` directly and [inject its report](https://docs.gitlab.com/ee/ci/testing/code_quality.html#integrate-multiple-tools) into the Code Quality system using the standard report format. We're working to collect examples of this in [documentation](https://docs.gitlab.com/ee/ci/testing/code_quality.html#integrate-multiple-tools), though we haven't completed this collection yet.
- You can still use CodeClimate-based scanning. We will continue to maintain the built-in [`Code-Quality` CI/CD template](https://gitlab.com/gitlab-org/gitlab/-/blob/master/lib/gitlab/ci/templates/Jobs/Code-Quality.gitlab-ci.yml) until it reaches formal, announced deprecation or End of Support status. If you chose to adopt CodeClimate-based scanning today, you will need to take action to update the scanner configuration later.

#### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->

In the next 3 months, we are planning to:
- Using the results of our dogfooding [in gitlab-org](https://gitlab.com/gitlab-org/gitlab/-/issues/382153) and [in security analyzers](https://gitlab.com/gitlab-org/gitlab/-/issues/385109) to identify iterative steps toward our [Bring-Your-Own-Tool direction](https://gitlab.com/groups/gitlab-org/-/epics/8790).
This will clarify how users can avoid CodeClimate and its Docker-in-Docker requirements.
- [Expanding the amount of information shown](https://gitlab.com/groups/gitlab-org/-/epics/9666) in the UI for each finding.
We expect this will make findings easier to understand and fix.
- Aligning with a [new design for findings in the merge request](https://gitlab.com/groups/gitlab-org/-/epics/10959) that will include both SAST and Code Quality findings.

#### What we are currently working on
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

We are currently working on:
- Dogfooding Code Quality [in gitlab-org](https://gitlab.com/gitlab-org/gitlab/-/issues/382153) by configuring various code scanning jobs to output Code Quality reports.
- Using the results of dogfooding [in gitlab-org](https://gitlab.com/gitlab-org/gitlab/-/issues/382153) and [in security analyzers](https://gitlab.com/gitlab-org/gitlab/-/issues/385109) to identify iterative steps toward our [Bring-Your-Own-Tool direction](https://gitlab.com/groups/gitlab-org/-/epics/8790).
This will clarify how users can avoid CodeClimate and its Docker-in-Docker requirements.
- Updating the way [quality findings are displayed in the merge request](https://gitlab.com/groups/gitlab-org/-/epics/9666) as part of [adding SAST findings in the diff view](https://gitlab.com/groups/gitlab-org/-/epics/10959).

#### What we recently completed
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

Our recent work includes:

- Development of a "drawer" UI concept to [show more detail about quality findings](https://gitlab.com/gitlab-org/gitlab/-/issues/399910). This concept is still behind a feature flag, but it's the basis for the [updated MR drawer](https://gitlab.com/groups/gitlab-org/-/epics/10959) that's currently in development.
- [Updates](https://about.gitlab.com/releases/2023/06/22/gitlab-16-1-released/#code-quality-analyzer-updates) to support new CodeClimate plugins and a customizable Docker-in-Docker path.
- Analysis of how existing quality tools can be integrated with the [existing report format](https://docs.gitlab.com/ee/ci/testing/code_quality.html#implement-a-custom-tool), to inform [our future direction in this area](https://gitlab.com/groups/gitlab-org/-/epics/8790).

Check [older release posts](https://gitlab-com.gitlab.io/cs-tools/gitlab-cs-tools/what-is-new-since/?tab=features&selectedCategories=Code+Quality&minVersion=13_00) for our previous work in this area.

#### What is Not Planned Right Now
- **Proprietary quality analysis:** We currently plan to focus on integrating with existing quality tools instead of creating our own quality analyzer.
    - We believe that improving the experience for users of all quality tools—including open-source linters, third-party products, and custom tools—delivers value sooner, and doesn't detract from our ability to bring a proprietary tool to market later.
- **Mixing quality and security:** We aren't planning to blur the lines between security and quality findings. We believe it's valuable to keep quality and security findings distinct, since these tools and processes are maintained by different personas and are subject to different organizational requirements.
    - For example, while quality tools and their rules are typically managed by software engineering departments, security tools (and rules about how to handle security findings) typically involve security professionals and are monitored for adherence to compliance controls.
    - However, users should see a [consistent user experience](https://about.gitlab.com/handbook/product/ux/performance-indicators/system-usability-scale/) for quality and security findings, and we shouldn't have to [inefficiently](https://about.gitlab.com/handbook/values/#efficiency) build each workflow feature twice either.
- **Modifications to CodeClimate:** We don't believe we have an effective path forward to modify CodeClimate or its plugins. This conclusion is based on the collective weight of a mix of factors:
    - We don't have a clear technical path toward removing the Docker-in-Docker requirement, despite more than one [investigation](https://gitlab.com/gitlab-org/gitlab/-/issues/357464).
    - The AGPL license used for most CodeClimate core components and plugins makes contributions and operations more difficult for GitLab and for customers.
    - Many existing plugins do not have active communities and [do not receive regular updates](https://gitlab.com/groups/gitlab-org/-/epics/8790#the-status-quo).
    - The workflow for typical development tool usage includes development teams updating and maintaining their project configurations to use tools in many contexts, rather than just in CI. (See [UX research](https://gitlab.com/gitlab-org/ux-research/-/issues/1886).)
    - It is simpler and more efficient to run tools like `eslint` directly, rather than mediating their configuration and operation through multiple layers of indirection.
    - Mediating access through CodeClimate doesn't provide unique capabilities: the underlying tools for each [official CodeClimate plugin](https://docs.codeclimate.com/docs/list-of-engines) are each available to use directly.

### Dogfooding
<!-- Note: this is a custom section, not called for by the Direction template. -->

GitLab teams [collaborate](https://handbook.gitlab.com/handbook/values/#collaboration) more [efficiently](https://handbook.gitlab.com/handbook/values/#efficiency) by using Code Quality to surface issues during code review. Team members have integrated:
- The `vale` linter [used for product documentation](https://gitlab.com/gitlab-org/gitlab/-/blob/3d6884cb7294b1e42d35f8b7e8448d3c6dbc918e/.gitlab/ci/docs.gitlab-ci.yml#L86-102).
- The `markdownlint` linter, [used in the GitLab internal handbook](https://gitlab.com/internal-handbook/internal.gitlab.com/-/blob/d5d6752120a080713718a87481f6170d03f1fa00/.gitlab-ci.yml#L131-148) (accessible to team members only).
- Go linting, in [security analyzers](https://gitlab.com/gitlab-org/security-products/ci-templates/-/blob/4d7d299a5b97ed5f5c9626f9e88a25ddf7a84c45/includes-dev/go.yml#L40-45).
- CodeClimate-based analysis, [in `gitlab-org/gitlab`](https://gitlab.com/gitlab-org/gitlab/-/blob/3d6884cb7294b1e42d35f8b7e8448d3c6dbc918e/.gitlab/ci/reports.gitlab-ci.yml#L1-18).

Team members have also proposed integrations to enforce [design system migration](https://gitlab.com/gitlab-org/gitlab/-/issues/355051).

<!-- TODO: Add Best-in-Class Landscape section. -->
