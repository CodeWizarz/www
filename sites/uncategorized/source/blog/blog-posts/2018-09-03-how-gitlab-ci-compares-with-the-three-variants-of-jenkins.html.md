---
title: "How GitLab CI compares with the three variants of Jenkins"
author: Sid Sijbrandij
author_gitlab: sytses
author_twitter: sytses
categories: insights
image_title:
description: "In this article, we compare GitLab CI with the three Jenkins variants and ask if there are things we can learn."
---

The creator of Jenkins just [announced two new versions of Jenkins](https://jenkins.io/blog/2018/08/31/shifting-gears/).
According to the author, the current legacy version of Jenkins is "trapped in a local optimum," and he proposes to make [Cloud Native Jenkins](https://jenkins.io/sigs/cloud-native/) and [Jenkins Evergreen](https://github.com/jenkinsci/jep/blob/master/jep/300/README.adoc) to get to a global optimum.

According to Forrester, [GitLab CI and Jenkins/Cloudbees are two of the four leading products for CI](/blog/2017/09/27/gitlab-leader-continuous-integration-forrester-wave/).
In this article, we compare GitLab CI with the three Jenkins variants. Here's what we learned.

The structure of this article is based on the items mentioned in the Jenkins announcement.

## Extensible

The governance, culture, and distribution mechanism of Jenkins and GitLab are comparable; both of them open core projects with a dominant company.
By the way, the proprietary version CloudBees Jenkins Enterprise is now known as CloudBees Core; for most open core projects the core is the open source part.

## General purpose

Both Jenkins and GitLab CI can be used for many tasks and can build on many operating systems.

## Community

Jenkins has 519 contributors to its source code, but many people contribute via plugins that are not in core.
GitLab has 2,000+ contributors overall, but only part of them contribute to CI.

## Service instability

According to the author, the current legacy version of Jenkins sometimes needs to be restarted once a day by an administrator.
GitLab CI is part of GitLab, and in case it runs out of memory, the application processes are automatically restarted one by one without disruption to the users or builds.
The article doesn't mention how Cloud Native Jenkins or Jenkins Evergreen addresses the problem.

## Brittle configuration

Legacy Jenkins can easily break if you install or upgrade a plugin.
GitLab CI has all functionality as part of its main code base, ensuring everything is tested before it is shipped to customers.
Jenkins Evergreen will come with essential plugins as part of the [distribution](https://github.com/jenkinsci/jep/blob/master/jep/300/README.adoc#automatically-updated-distribution).
The article doesn't mention how Cloud Native Jenkins addresses the problem; maybe it doesn't allow plugins.

## Assembly required

Legacy Jenkins doesn't work out of the box because too many choices are confusing users.
GitLab CI and GitLab are [based on convention over configuration](/handbook/product/product-principles/#convention-over-configuration), where we prefer choices that are well thought out and based on current best practices and avoid unnecessary configuration.
Cloud Native Jenkins redesigns Jenkins from the ground up on simpler primitives.
Jenkins Evergreen still uses the same plugins so it would be harder to simplify, but maybe by selecting a set of blessed essential plugins, you can make them work better together because they can assume the other plugin is installed.

## Reduced development velocity

Legacy Jenkins [releases once a week](https://jenkins.io/changelog/) but the changes seem relatively minor.
GitLab [releases every month with multiple major features](https://about.gitlab.com/releases/) although most are not for CI.
Cloud Native Jenkins is under heavy development, but I was not able to locate the source code.
Jenkins Evergreen has an [automatically updated distribution](https://github.com/jenkinsci/jep/blob/master/jep/300/README.adoc#auto-update) that has three improvements for project developers:

1. Greatly reduced time between core and "foundational" plugin changes landing.
1. Greatly reduced version matrix for testing core/plugin changes against one another.
1. Small-batch changes can automatically report success/error telemetry which provides rapid feedback for changes.

## Kubernetes as the runtime

This is part of Cloud Native Jenkins only, not of Legacy Jenkins or Jenkins Evergreen.

1. Serverless / function-as-a-service build execution (à la Jenkinsfile runner) that are isolated. => [GitLab CI Runner](https://docs.gitlab.com/runner/) already allows for isolated build execution. We're discussing [introducing a Lambda-based serverless runner](https://gitlab.com/gitlab-org/gitlab-runner/issues/3128).
1. Various pieces of functionalities deployed as separate microservices. => GitLab is mostly a Rails monolith with [parts that require high performance as separate Go microservices](https://docs.gitlab.com/ee/development/architecture.html#components).
1. Services interacting through [Kubernetes CRDs](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/) in order to promote better reuse and composability. => This is something currently not in GitLab, but we're keeping a close eye on this. We're open to suggestions on how to best do this. GitLab does have extensive [Kubernetes integrations](/solutions/kubernetes/).

## New extensibility mechanism

This means using something like [Knative builder](https://github.com/knative/build).
This is proposed to be part of Cloud Native Jenkins only, not of Legacy Jenkins or Jenkins Evergreen.
At GitLab, we're following the Knative news, for example [scale to zero is something we want to use for our review apps](https://gitlab.com/gitlab-org/gitlab-ee/issues/3585#note_90052063), and if Knative build becomes popular, we'll certainly consider supporting it.

## Data on cloud-managed data services

This is part of Cloud Native Jenkins only, not of Legacy Jenkins or Jenkins Evergreen.
GitLab CI already supports storing everything in object storage and a database, not using file storage at all.
GitLab itself still needs file storage for the Git repositories, since some Git commands require block access.

## Configuration as code

This is to be able to copy the configuration of one Jenkins master to another.
With GitLab, all the CI configuration is part of the repo in the [.gitlab-ci.yml file](https://docs.gitlab.com/ee/ci/yaml/) on a per project basis, so you don't need to copy master configuration between GitLab instances.
With Jenkins you can have some project configuration as part of a [Jenkinsfile](https://jenkins.io/doc/book/pipeline/jenkinsfile/) but you have to [configure plugins on the master level](https://github.com/jenkinsci/configuration-as-code-plugin/blob/master/README.md#plugin-management).

## Secure by default design

The [Jenkins Remoting Layer](https://github.com/jenkinsci/remoting#jenkins-remoting-layer) that handles communication between the orchestrator and the agent is "inherently prone to security vulnerabilities because of their design."
With GitLab CI, we run every build on a remote agent from the start of the project, having this as the default and only way helps keep the design elegant.
We do find that CI has been responsible for an above-average share of our security patches.
So far, everyone has [responsibly disclosed](/security/disclosure/) these, for which we are immensely grateful.

## Conclusion

The many plugin combinations for Jenkins has made Legacy Jenkins hard to configure and brittle when updating.
Cloudbees is introducing two new versions of Jenkins to remedy the problem: Cloud Native Jenkins will start from scratch, while Jenkins Evergreen will focus on a set of essential plugins.
GitLab CI adds new functionality in the main code base, avoiding the need for needless configuration and ensuring everything still works when updating.
