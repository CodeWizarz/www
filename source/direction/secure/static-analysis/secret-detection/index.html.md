---
layout: markdown_page
title: "Category Direction - Secret Detection"
description: "Secret Detection helps you find and fix leaked secret values like passwords, authentication tokens, and private keys in your GitLab repositories. Learn more about where we're going."
canonical_path: "/direction/secure/static-analysis/secret-detection/"
---

- TOC
{:toc}

## Secret Detection

| | |
| --- | --- |
| Stage | [Secure](/direction/secure/) |
| Maturity | [Viable](/direction/maturity/) |
| Content Last Reviewed | `2023-08-23` |

### Introduction and how you can help
This direction page describes GitLab's plans for the Secret Detection category, which protects you against leaking credentials, tokens, or other secrets on GitLab.

This page is maintained by the Product Manager for [Static Analysis](/handbook/product/categories/#static-analysis-group), [Connor Gilbert](/company/team/#connorgilbert).

Everyone can contribute to where GitLab Secret Detection goes next, and we'd love to hear from you.
The best ways to participate in the conversation are to:
- Comment or contribute to existing [Secret Detection issues](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=created_date&state=opened&label_name%5B%5D=Category%3ASecret%20Detection) in the public `gitlab-org/gitlab` issue tracker.
- If you don't see an issue that matches, file [a new issue](https://gitlab.com/gitlab-org/gitlab/-/issues/new?issuable_template=Feature%20Proposal%20-%20basic).
    - Post a comment that says `@gitlab-bot label ~"group::static analysis" ~"Category:Secret Detection"` so your issue lands in our triage workflow.
- If you're a GitLab customer, discuss your needs with your account team.

### Overview
GitLab Secret Detection helps you avoid a particularly dangerous type of mistake: leaking credentials or other secrets in your code repositories.

We want GitLab to be a safe place to develop software, so we're working to make Secret Detection a standard part of the software development lifecycle (SDLC).
No one should have to think about secrets to be protected from leaking them.

#### The problem
Even experienced developers and teams can slip up and cause serious risk by committing secrets into their code repositories.

The potential damage is significant:
- Secrets often provide access to sensitive data, production systems, or cloud resources that can be abused.
- If a repository is public, automated tools or malicious users can detect and abuse leaked secrets—there are even public sites dedicated to listing these leaks.
- Even if a repository is private within a team or organization, leaked secrets can no longer be trusted to uniquely identify the authorized user(s) in a [non-repudiable](https://en.wikipedia.org/wiki/Non-repudiation) way.

#### GitLab's solution
GitLab Secret Detection helps you prevent the unintentional leak of sensitive information like authentication tokens and private keys.

Secret Detection checks your Git repositories to detect secrets or credentials, then it reports potential findings.
Secret Detection jobs run in your CI/CD pipelines.

We want everyone to be secure, so:
- [Parts of Secret Detection](https://docs.gitlab.com/ee/user/application_security/secret_detection/#features-per-tier) are available in every GitLab tier.
- Secret Detection is on by default in [Auto DevOps](https://docs.gitlab.com/ee/topics/autodevops/).

In GitLab Ultimate, after you enable Secret Detection:
- You can see and address new Secret Detection findings in [merge requests](https://docs.gitlab.com/ee/user/application_security/#view-security-scan-information-in-merge-requests).
- Results appear in the [Vulnerability Report](https://docs.gitlab.com/ee/user/application_security/vulnerability_report/).
- [Automatic responses](https://docs.gitlab.com/ee/user/application_security/secret_detection/post_processing.html) help mitigate leaks as soon as they occur.

Secret Detection doesn't target a specific language, so you can easily [enable it in any project](https://docs.gitlab.com/ee/user/application_security/secret_detection/).
Our approach takes advantage of [patterns for well-identifiable credentials](https://gitlab.com/gitlab-org/security-products/analyzers/secrets/-/blob/master/gitleaks.toml) like service account keys and API tokens, but also searches for more generic secret types like passwords in certain contexts.

To learn more, check the [Secret Detection documentation](https://docs.gitlab.com/ee/user/application_security/secret_detection/).

Outside of the Secret Detection category, GitLab also offers other features that relate to secret values:
- [Push rules](https://docs.gitlab.com/ee/user/project/repository/push_rules.html#prevent-pushing-secrets-to-the-repository) block files with certain names from being pushed to your repositories.
- The [Secrets Management](/direction/verify/secrets_management/) category focuses on enabling GitLab to use and manage secret values.

### Strategy and Themes
<!-- Capture the main problems to be solved in market (themes). Describe how you intend to solve these with GitLab (strategy). Provide enough context that someone unfamiliar with the details of the category can understand what is being discussed. -->

We're working toward two overall goals in Secret Detection:

1. Making GitLab a safe place to develop software.
1. Helping customers achieve their security and compliance requirements in a unified DevSecOps platform.

We're specifically focusing on solving the following user problems:
1. **Coverage:** Protecting against credential leaks wherever they occur—in a Git repository, an issue, a job log, or anywhere else.
1. **Time to Remediate:** Reducing the window of time between when a secret is leaked and when it no longer poses a threat.
1. **Prioritization:** Knowing which leaks are the most urgent and serious, so teams can respond to those issues more quickly.

### 1 year plan
<!--
1 year plan for what we will be working on linked to up-to-date epics. This section will be most similar to a "road-map". Items in this section should be linked to issues or epics that are up to date. Indicate relative priority of initiatives in this section so that the audience understands the sequence in which you intend to work on them. 
 -->

Our strategic one-year focus is a balance between:
1. Improving the usability of the Secret Detection product in its current architecture.
2. Delivering a platform-wide, on-by-default Secret Detection experience based on a [new architecture that doesn't rely on CI/CD pipelines](https://gitlab.com/gitlab-org/gitlab/-/issues/376716).

This means we plan to work on:
1. **Prioritization:** [Adjusting severity of findings](https://gitlab.com/groups/gitlab-org/-/epics/10320) based on context.
1. **Prioritization:** [Tracking leaks better](https://gitlab.com/gitlab-org/gitlab/-/issues/387583) as they move through a codebase, to avoid repeatedly surfacing the same leaks.
1. **Prioritization:** [Speeding triage](https://gitlab.com/groups/gitlab-org/-/epics/10325) by allowing more exceptions and ruleset customization, including at the group level.
1. **Time to Remediate:** Adding new [secret scanning partners](https://docs.gitlab.com/ee/user/application_security/secret_detection/post_processing.html#supported-secret-types-and-actions) who we notify when secrets are leaked on GitLab.com.
    - Interested potential partners can learn more in [epic 4944](https://gitlab.com/groups/gitlab-org/-/epics/4944).
1. **Coverage:** Designing and building a [consistent, platform-wide, on-by-default experience](https://gitlab.com/groups/gitlab-org/-/epics/8667) that doesn't require users to modify their CI/CD pipelines, and protects content outside of codebases.
    - This includes aligning [Minimum Viable Change (MVC)](/handbook/product/product-principles/#the-minimal-viable-change-mvc) iterations in other areas, like [client-side token detection](https://gitlab.com/gitlab-org/gitlab/-/issues/405147) or job-log token masking, toward a unified user experience. <!-- TODO, need link for job logs -->
1. **Coverage:** Supporting scanning [before code leaves a developer's computer](https://gitlab.com/groups/gitlab-org/-/epics/10323).
1. **Prioritization:** Improving the end-to-end workflow for detected secrets. This includes providing better organization-wide visibility of possible leaks and better context as leaks are detected. <!-- TODO, need link -->

Outside of these proactive priorities, we also react quickly to functional bugs and to problems with rule efficacy.

#### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->
<!-- TODO, need links -->

In the next 3 months, we are planning to:
- Add additional partners to our existing program where partners are automatically notified to protect our mutual customers.
- Improve the technical foundation of our partner integrations.
- Fix known bugs in the existing service.
- Complete technical investigations related to our forward-looking service architecture.
- Investigate, and implement if possible, a new approach to tracking detected secrets.

#### What we are currently working on
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

We are currently working on:
- Prototyping approaches to on-by-default system-wide secret detection scanning using a [new architecture](https://gitlab.com/gitlab-org/gitlab/-/issues/376716) that doesn't require a CI/CD pipeline job.

We are also looking forward by investigating approaches to:
- Ways to [better differentiate](https://gitlab.com/groups/gitlab-org/-/epics/10320) between higher- and lower-impact Secret Detection findings.
- [Better tracking](https://gitlab.com/gitlab-org/gitlab/-/issues/387583) of Secret Detection findings as they move through the codebase.

#### What we recently completed
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

Our recent work includes:

- Completing a new benchmarking tool, then using its results to identify rules to target for false-positive reduction (16.3).
- [Showing security findings in the VS Code IDE](https://about.gitlab.com/releases/2023/08/22/gitlab-16-3-released/#security-findings-in-vs-code) (with findings from CI/CD-pipeline-based scans) (16.3).
- Expansion of [automatic response to leaked secrets](https://docs.gitlab.com/ee/user/application_security/secret_detection/automatic_response.html):
    - [Postman API](https://about.gitlab.com/releases/2023/08/22/gitlab-16-3-released/#automatic-response-to-leaked-postman-api-keys) (announced in 16.3)
    - [Google Cloud](https://about.gitlab.com/releases/2023/06/22/gitlab-16-1-released/#automatic-response-to-leaked-google-cloud-secrets) (announced in 16.1)
- Ability to [share ruleset customizations across multiple projects](https://about.gitlab.com/releases/2023/06/22/gitlab-16-1-released/#shared-ruleset-customizations-in-sast-iac-scanning-and-secret-detection) (16.1)
- Additional detection rules:
    - [OpenAPI API keys and CircleCI access tokens](https://about.gitlab.com/releases/2023/07/22/gitlab-16-2-released/#secret-detection-updates) (16.2)
    - [Meta, Oculus, and Instagram API access tokens, and tokens for the Segment Public API](https://about.gitlab.com/releases/2023/05/22/gitlab-16-0-released/#secret-detection-updates) (16.0)
- Updated the [SECRET_DETECTION_DISABLED CI/CD variable](https://gitlab.com/gitlab-org/gitlab/-/issues/362311) to allow required jobs not to be overridden.
- Updated the Secret Detection analyzer to support a new [JSON report format](https://gitlab.com/gitlab-org/gitlab/-/issues/375364) required by the GitLab security report processing system in version 16.0 and higher.

Check [older release posts](https://gitlab-com.gitlab.io/cs-tools/gitlab-cs-tools/what-is-new-since/?tab=features&selectedCategories=Secret+Detection&minVersion=13_00) for our previous work in this area.

#### What is Not Planned Right Now
- **Blocking pushes on the server side:** We understand the value of preventing commits that contain secrets from even being pushed to GitLab.
However, there are very tight latency requirements for any service that's in such a critical, high-traffic flow.
Instead of pursuing server-side blocking **now**, we're:
    1. Working to improve how the system works in non-blocking mode.
    1. Working toward [client-side features](https://gitlab.com/groups/gitlab-org/-/epics/10323) that provide similar protection without site reliability concerns.
- **Repositories outside of GitLab:** We don't plan to offer protections for projects hosted outside of GitLab.
- **Credentials not common in software:** We plan to focus on the types of credentials that are most common in DevSecOps workflows and in software development.
This means we **won't** actively pursue rules that are:
    - For services unlikely to be used in a software project.
    - Closer to Data Loss Prevention, for example searching for personally identifiable information (PII) or credit card numbers.

### Best in Class Landscape
<!-- Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" -->

_ℹ️ Best In Class (BIC) is an indicator of forecasted near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape._

#### Key Capabilities 
Secret Detection products should:

- Help developers avoid making leaks in the first place.
- Enable quick responses to any leaks that are made.
- Deliver trustworthy, accurate findings, with appropriate priority, so that the right findings are remediated quickly.
- Automatically respond to leaks, without human intervention, when possible.
- Provide security users with overall visibility into exposures anywhere within their organization.

#### Roadmap
<!-- Key deliverables we're focusing on to build a BIC solution. List the epics by title and link to the epic in GitLab. Minimize additional description here so that the epics can remain the SSOT. This may be duplicative to the 1 year section however for some categories the key deliverables required to become the BIC solution will extend beyond one year and we want to capture all of the gaps. Moreover, the 1 year section may contain work that is not directly related to closing gaps if we are already the BIC or if we are differentiating ourselves.-->

The plan [described above](#strategy-and-themes) reinforces our competitive standing.

In addition to those main themes, we will likely pursue additional detection techniques including:
- Checks for whether detected credentials are still active.
- Machine Learning or other solutions for identifying generic or lower-confidence secrets. These secrets, which include passwords and tokens that don't have an identifiable structure, are more difficult to detect while minimizing false-positive results.

#### Top Competitive Solutions
<!-- PMs can choose to highlight a primary BIC competitor--or more, if no single clear winner in the category exists; in this section we should indicate: 1. name of competitive product, 2. links to marketing website and documentation, 3. why we view them as the primary BIC competitor -->

Secret Detection is available in a variety of packaging types:
- Dedicated products like [GitGuardian](https://www.gitguardian.com/) or [TruffleHog Enterprise](https://trufflesecurity.com/trufflehog/).
These products focus on credential leaks, so they typically offer more secret-specific workflows.
- Features in SAST products like [Veracode](https://www.veracode.com/security/static-analysis-tool), [Fortify](https://www.microfocus.com/en-us/cyberres/application-security/static-code-analyzer), or [Snyk](https://docs.snyk.io/scan-application-code/snyk-code/introducing-snyk-code/key-features/ai-engine#hardcoded-secrets).
These products typically add secret detection alongside other types of features, so their workflows are more limited.
- As an integrated part of a platform like GitHub.
These platforms typically offer less advanced workflows, but may offer broader always-on protection.
Platforms differ in the level of scanning they offer for private repositories, the level of customization organizations can apply, and the pricing tier in which such features are available.

We analyze our product against each of these different product types because we serve customers who are accustomed to each of them.
Our approach emphasizes the value of the most comprehensive DevSecOps platform by:
- Protecting the entire DevSecOps lifecycle, including code, issues, and other content.
- Shifting security earlier in the development process, so everyone can contribute to security.

### Target Audience
As with many security categories, Secret Detection is a bridge between different communities:

- Security teams, who are responsible for protecting their organization from credential leaks.
    - These teams often drive the implementation of tools like Secret Detection.
    - They're also often responsible for responding to alerts and incidents related to compromised credentials.
    - User personas include [Alex, the Security Operations Engineer](https://about.gitlab.com/handbook/product/personas/#alex-security-operations-engineer) and [Sam, the Security Analyst](https://about.gitlab.com/handbook/product/personas/#sam-security-analyst).
- Development teams, who are responsible for building software.
    - These teams may accidentally leak credentials in the course of their work.
    - They don't _want_ to be the source of a security breach, but they also don't want to be blocked by unreliable tooling or onerous processes.
    - User personas include [Sasha, the Software Developer](https://about.gitlab.com/handbook/product/personas/#sasha-software-developer), and Sasha's teammates and managers.

### Pricing and Packaging
Secret Detection products vary in how they're provided:
- Some are integrated features within the platforms they protect.
- Others are standalone products.
- Others are modules within other products, like SAST scanners.

GitLab packages and prices Secret Detection primarily as part of Ultimate.
Basic protection features are available in all tiers.
We intend to expand the level of protection available in all tiers, while still delivering unique [organization-level value](https://about.gitlab.com/company/pricing/#three-tiers) in Ultimate.

### Analyst Landscape
Analysts usually include Secret Detection as a secondary feature of Application Security Testing (AST) coverage.
See [Category Direction - Static Application Security Testing (SAST)](../sast/#analyst-landscape) for up-to-date analyst coverage.
