---
layout: markdown_page
title: "Feature Comparison: Azure DevOps vs. GitLab CI/CD"
description: "Microsoft has provided a feature comparison vs. GitLab which, although it is not fully accurate, highlights the areas where they see an advantage over us."
---

- TOC
{:toc}


Microsoft has provided a [feature comparison vs. GitLab](https://docs.microsoft.com/en-us/azure/devops/learn/compare/azure-devops-vs-gitlab) which, although it is not fully accurate, highlights the areas where they see an advantage over us. Areas noted are:

#### Triggers and Gates

We're in the middle of making a major overhaul to our cross-pipeline triggering capabilities. We already have a `trigger` keyword to start a downstream pipeline in any project, and we're introducing a `needs` keyword to define these relationships from the downstream itself via [gitlab#9045](https://gitlab.com/gitlab-org/gitlab/issues/9045). We're also adding status checking behaviors via [gitlab#11238](https://gitlab.com/gitlab-org/gitlab/issues/11238) that will enable control over waiting/acting on different

As far as gates, we think it's important for CI/CD pipelines not to be built with manual approval gates in them. That said, we of course recognize the importance of collecting approvals as part of a well run, compliant delivery process. To that end we're implementing [gitlab#9187](https://gitlab.com/gitlab-org/gitlab/issues/9187) to wait for approvals on the MR before proceeding, which can follow your standards for MR approvals. This bundles the approval nicely right into the natural development workflow, avoiding a "process trap" where a sub-optimal solution is easy to gravitate towards and get stuck in. More information on how we're thinking about compliance in the release process can be viewed at our [Release Governance](/direction/release/release_governance) category page.

Build triggering and batching is also something we're looking into. We're introducing Merge Trains via [gitlab#9186](https://gitlab.com/gitlab-org/gitlab/issues/9186), with a quick follow up to add a parallelization strategy [gitlab#11222](https://gitlab.com/gitlab-org/gitlab/issues/11222). Merge trains are a very powerful way to control the flow of changes into a target branch/environment by ensuring that master is always green. In concert with features like [merged results pipelines](https://docs.gitlab.com/ee/ci/pipelines/merged_results_pipelines.html), which run branch pipelines on the potential merge result into the target branch, it's very easy to keep a green master using GitLab.

#### Platforms

Auto DevOps works with Kubernetes on any of these platforms, including your own self-hosted Kubernetes, and looks and acts identically to your developers no matter which provider use. We do want to make it absolutely as easy as possible to deploy to these providers, even if you're not using Auto DevOps/Kubernetes, so we have issues like [gitlab#26777](https://gitlab.com/gitlab-org/gitlab/issues/26777) which will provide syntactic sugar to make things simpler without locking you in.

As far as runners, it is actually already possible to use runners with these operating systems, but it requires you to bring your own which is a definite barrier to getting up and running quickly. We are tracking the infrastructure deliverables we need to achieve this goal in our epic [gitlab-com&42](https://gitlab.com/groups/gitlab-com/-/epics/42), along with the issue [gitlab-runner#4601](https://gitlab.com/gitlab-org/gitlab-runner/issues/4601). As these are completed we will bring Windows and macOS into the shared fleet as well.

They also list that we do not support ARM development, however this is false. We do have an open issue for running a GitLab Runner on ARM at [gitlab-runner#2076](https://gitlab.com/gitlab-org/gitlab-runner/issues/2076) which will allow you also to build _from_ ARM devices.

#### Orchestration

In the orchestration category it's listed that we don't provide a visual editor for build and release orchestration. This is true, but it's because we've prioritized trying to keep our YAML syntax clean and understandable. We have two related open issues: [gitlab#15622](https://gitlab.com/gitlab-org/gitlab/issues/15622) (visualize YAML) and [gitlab#15754](https://gitlab.com/gitlab-org/gitlab/issues/15754) (edit YAML) but for now we continue to plan to focus on keeping pipelines easy and efficient to work with as-code.

That said, there is a role for non-technical users to engage with pipelines - we just don't see that as the same thing as providing visual tools for editing release automation. For us, we are focused on solving these problems in the [Release Orchestration](/direction/release/release_orchestration) category where we want to provide better ways for these users to engage with the release process without worrying about (even abstracted) technical implementation details.

#### Code Quality & Security

Although the page says we do not, we support JUnit and Java testing natively via our support for [unit test reports](https://docs.gitlab.com/ee/ci/unit_test_reports.html). We also support a `parallel` [keyword](https://docs.gitlab.com/ee/ci/yaml/#parallel) for automatically parallelizing your test runs. We support .NET TRX format by leveraging [trx2junit](https://github.com/gfoidl/trx2junit), an open source conversion tool, and also plan to support the TRX format directly via [gitlab#28798](https://gitlab.com/gitlab-org/gitlab/issues/28798). We have plans to improve how we show test results over time via [gitlab#1020](https://gitlab.com/gitlab-org/gitlab/issues/1020). We also do actually already provide easy dynamic provisioning of environment in not just Azure or AWS, but any platform (including on-premise) using our [Review Apps](https://docs.gitlab.com/ee/ci/review_apps/) feature.

Mobile app testing is a priority for us, and you can read more at our [use case page for mobile](/direction#mobile-strategy).

Finally, we do not rely on third-party plugins for security scanning (although you're welcome to bring your own). GitLab has this built in, and you can see our vision for how we are continuing to improve on these capabilities in our [Secure](/direction/secure/) and [Govern](/direction/govern/) category pages.

#### Deployment Targets

As opposed to the claim in the document, it's actually possible to run your own GitLab runners on premise without hosting your own GitLab instance. Simply register your runners and they will work without requiring opening up an inbound firewall port from GitLab. This works for any installation - on-premise Kubernetes, cloud, physical hardware - you can always keep your runners close to your code for security, and we support this out of the box.

Although the page refers to stale documentation for publishing to the App Store, we do have a recent blog post describing [how to get up and running with GitLab and FastLane](https://about.gitlab.com/blog/2019/03/06/ios-publishing-with-gitlab-and-fastlane/) which has everything you need to get up and running doing iOS builds and App Store deployments with GitLab. More information can be found about our mobile strategy on our [Mobile Use Case](/direction#mobile-strategy) page.

#### Integrations and Extensions

GitLab CI/CD does in fact support [using an external repo](https://docs.gitlab.com/ee/ci/ci_cd_for_external_repos/), although we don't support SVN or other non-git repos except through technologies like [SubGit](https://subgit.com/) which could provide a transparent gateway. We also can provide CI/CD for [GitHub](https://about.gitlab.com/solutions/github/) or [BitBucket](https://docs.gitlab.com/ee/ci/ci_cd_for_external_repos/bitbucket_integration.html) repositories easily.

It's true we do not provide a marketplace for CI/CD plugins. For the moment, our strategy is that moving towards having GitLab rely on too many third party plugins is a major risk for DevOps teams, as any maintainer of a Jenkins server will testify. Instead, our strategy is to [play well with others](https://about.gitlab.com/handbook/product/gitlab-the-product/#plays-well-with-others) and welcome anyone who wants to make integrations work together with GitLab. We just don't foresee, at least for now, a future where there's an ecosystem of third-party plugins that you need to draw from in order to get what would otherwise be basic functionality out of GitLab. If you see a gap here and would like some technology you use to work better with GitLab we'd love for you to create an issue and let us know.
