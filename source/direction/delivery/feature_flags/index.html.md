---
layout: markdown_page
title: "Category Direction - Feature Flags"
description: Feature Flags can be used as part of software development to enable a feature to be tested even before it is completed and ready for release. Learn more!
---

- TOC
{:toc}

## Overview

Feature Flags, a.k.a. [Feature Toggle](https://en.wikipedia.org/wiki/Feature_toggle), allows the application development team to control access to code across different environments. It is an effective way to decouple [deployment](/direction/delivery/) from the [delivery](https://martinfowler.com/delivery.html) or [release](https://www.bmc.com/blogs/software-deployment-vs-release/) of the software feature.

Feature flags is also a key safety measure when deploying software. Rather than rolling back and re-deploying, you can simply turn on or off a problematic change. As such
Feature flag is a linchpin for our [progressive delivery](/direction/ops/#progressive-delivery-and-deployment) strategy; it allows  for many small incremental versions of software to be simultaneously delivered without the cost of constant branching, merging and deploying code.

## Vision
GitLab is a complete and connected Feature Flag solution. 

GitLab Feature Flags enables you to set up feature flags for your applications and services, including server-side and client-side instrumentation with complete language support and unlimited scalability. GitLab Feature Flags provides you with the flexibility and control you need to target the exact audience you want. 

GitLab Feature Flags is also a connected capability in your DevOps platform, integrated intelligently from planning issues all the way to observability data. As a decision-maker setting up a feature flag or rolling out changes, you have full information and can even automate feature flag updates without manual intervention.

Lastly, GitLab Feature Flags supports your specific operating model. You can choose to self-manage your Feature Flag solution or have GitLab manage a globally available, SaaS feature flag solution. GitLab Feature Flags does not need to be managed in the same fashion as the rest of your DevOps platform.

## Current Status

The GitLab Feature Flag is built with an [Unleash](https://github.com/Unleash/unleash)-compatible
API, ensuring interoperability with any other compatible tooling,
and taking advantage of the various client libraries available for
Unleash. Unleash have recently announced that they are spinning up a hosted (paid) option while maintaining their open source offering. We will be monitoring this closely. 

While Feature flags are a great tool for incremental delivery, they can introduce technical debt when applied improperly. For example, feature flags can be forgotten and left as stale code.

- [Maturity Plan](#maturity-plan)
- [Issue List](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3AFeature%20Flags)
- [Overall Vision](/direction/ops/#release)
- [UX Research](https://gitlab.com/gitlab-org/ux-research/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=devops%3A%3Arelease&label_name[]=Category%3AFeature%20Flags)
- [Documentation](https://docs.gitlab.com/ee/operations/feature_flags.html)
- [Deep Dive video](https://www.youtube.com/watch?v=wrbfyTtDA8w&feature=youtu.be)

## What's Next & Why

The feature flags product category is currently in maintenance mode. We do not have any new features on our roadmap.

## Maturity Plan

This category is currently at the "Viable" maturity level, and our next maturity target is Complete (see our [definitions of maturity levels](/direction/maturity/)).

Our focus at the moment is on using the feature internally to deliver GitLab itself. This will be driving new requirements to the base features that are out there already, and also helping us to ensure the list for `complete` maturity is accurate. Our plan is for our feature flag solution to compete with other products on the market, such as [LaunchDarkly](https://launchdarkly.com/) or [Rollout](https://rollout.io/). As we work towards `complete` maturity, we expect that our primary adopters of this feature will be pre-existing GitLab users looking for incremental value. For buyers who are considering replacing other tools, and looking for something that integrates feature flags with issues, we will also provide a valuable solution as we head towards `complete` maturity.

Key deliverables to achieve this are:

- [Feature Flag Strategies](https://gitlab.com/groups/gitlab-org/-/epics/3978)
  - [Multiple strategies per Feature Flags](https://gitlab.com/gitlab-org/gitlab/issues/35554) (Complete)
  - [Feature Flag Gradual Rollout strategy based on lists](https://gitlab.com/gitlab-org/gitlab/issues/13308) (Complete)
  - [Feature Flags Flexible Rollout Strategy](https://gitlab.com/gitlab-org/gitlab/-/issues/36380) (Complete)
  - [Add Rule based Feature Flag rollout strategy support](https://gitlab.com/gitlab-org/gitlab/issues/33315)
  - [Ability to exclude Feature flags for specific users](https://gitlab.com/gitlab-org/gitlab/-/issues/14667)
  - [Support Upcoming Constraint-based Strategy](https://gitlab.com/gitlab-org/gitlab/-/issues/13854#note_430513413)

- [Feature Flag Context within GitLab](https://gitlab.com/groups/gitlab-org/-/epics/3977)
  - [Add ability to associate feature flag with contextual issue](https://gitlab.com/gitlab-org/gitlab/-/issues/26456) (Complete)
  - [Support Markdown for Feature Flags](https://gitlab.com/gitlab-org/gitlab/-/issues/320735) (Complete)
  - [Add ability to associate feature flag with contextual Merge Request](https://gitlab.com/gitlab-org/gitlab/-/issues/33615)
  - [Add ability to associate feature flags with contextual epic](https://gitlab.com/gitlab-org/gitlab/-/issues/33578)
  - [Feature Flag contextual code references](https://gitlab.com/gitlab-org/gitlab/-/issues/238540)
  - [Add ability to associate requirements with contextual feature flag](https://gitlab.com/gitlab-org/gitlab/-/issues/230616)

- [Get Feature Flags to Enterprise Grade](https://gitlab.com/groups/gitlab-org/-/epics/3976)
  - [Add feature flag permissions](https://gitlab.com/gitlab-org/gitlab/issues/8239)
  - [Capture Feature Flag Toggle actions in the audit log](https://gitlab.com/gitlab-org/gitlab/-/issues/224953)
  - [Create "Protected" Feature Flag strategies](https://gitlab.com/gitlab-org/gitlab/-/issues/230614)
  - [Create Best Practice Guide for using Feature Flags](https://gitlab.com/gitlab-org/gitlab/-/issues/230629)
  - [Feature Flags incremental interval](https://gitlab.com/gitlab-org/gitlab/-/issues/267109)

- [Move features to core: "Feature Flags"](https://gitlab.com/gitlab-org/gitlab/-/issues/212318) (Complete)
- [A/B testing based on Feature Flags](https://gitlab.com/gitlab-org/gitlab/issues/34813)
- [Create Feature Flags as an issue type](https://gitlab.com/groups/gitlab-org/-/epics/4507)

## Competitive Landscape

Other feature flag products offer more comprehensive targeting and
configuration. The simplicity of our solution is actually a strength
compared to this in some cases, but there is some basic functionality
still to add. 

A competitor review of LaunchDarkly can be found in [gitlab&4102](https://gitlab.com/groups/gitlab-org/-/epics/4102). If you have additional 
insights or are interested in joining in the conversation, please comment on the issue. 

## Analyst Landscape

Analysts are recognizing that this sort of capability is becoming
more a part of what's fundamentally needed for a continuous delivery
platform, in order to minimize blast radius from changes. Often,
solutions in this space are complex and hard to get up and running
with, and they are not typically bundled or well integrated with CD
solutions. 

This backs up our desire to not over complicated the solution space
here, and highlights the need for guidance. [gitlab#9450](https://gitlab.com/gitlab-org/gitlab/issues/9450)
introduces new in-product documentation to help development and
operations teams learn how to successfully adopt feature flags.

## Top Customer Success/Sales Issue(s)

Our top customer success issue, and one that comes up frequently in customer calls is [gitlab#8239](https://gitlab.com/gitlab-org/gitlab/-/issues/8239) which talks about feature flag permissions. This will explicitly give permissions to toggle feature flags on/off based on the environment. 

## Top Customer Issue(s)

Our top customer issue is [gitlab#206666](https://gitlab.com/gitlab-org/gitlab/-/issues/206666) which captures changes in feature flag strategy in an audit log. This will help in terms of compliance and in investigating historical feature flag changes.

## Top Internal Customer Issue(s)

Being able to link feature flags to issues via [gitlab#220333](https://gitlab.com/gitlab-org/gitlab/-/issues/220333) is our most active internal customer issue. This gives users full context of when a feature is hidden behing a feature flag and allows direct access to the flag from the issue to allow managing it's strategies, environemnts and status. 

### Dogfooding Efforts

Our Fulfilment team has been actively dogfooding our feature flags and have requested the ability to warn users before removing an environment from a feature flag, which will in fact, disable the feature flag via [285127](https://gitlab.com/gitlab-org/gitlab/-/issues/285127) and a way to easily locate feature flags from anywhere in the GitLab tool using quick search via [gitlab#285130](https://gitlab.com/gitlab-org/gitlab/-/issues/285130).
## Top Vision Item(s)

One of our main themes in CI/CD is [Progressive delivery](https://about.gitlab.com/direction/ops/#progressive-delivery). Feature flags, by definition, are a form of progressive delivery as they allow you to deploy code incrementally and control the audience that will receive the new code. Our top vision issues are connecting Feature Flags to issues, Merge Requests, and Epics so that our users can benefit from our single application toolchain. This will enable users to better understand the context of a feature flag and their state to the associated plan, release, and deployment.
