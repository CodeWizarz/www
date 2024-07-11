---
layout: markdown_page
title: "Category Direction - Jenkins Importer"
description: "The Jenkins Importer category represents a collection of tools and documentation to help you migrate from your existing Jenkins to GitLab CI/CD."
canonical_path: "/direction/verify/jenkins_importer/"
---

- TOC
{:toc}

## Introduction and how you can help

Thank you for visiting this category strategy page on Jenkins Importer. The Jenkins Importer is open for community contribution (including non-Development GitLab team members). The Jenkins Importer is a part of the pipeline authoring team and not in the scope of work in our roadmap for the coming quarter. We will revisit this decision every quarter. If you have any questions or suggestions, please reach out to Dov Hershkovitch, Pipeline authoring senior product manager, via Zoom or Email



## Jenkins Importer

The Jenkins Importer category represents a collection of tools and documentation to help you migrate away from your existing Jenkins implementation and easily move to GitLab CI/CD. There can be a lot of complexity in the details when it comes to a large, enterprise Jenkins installation that uses a lot of different maintained (or even non-maintained) plugins, but our goal is to make 80% of the automatable tasks easy and then offer Professional Services as needed for the remaining 20%.

People ask for a Jenkins importer often: they are bought into the GitLab concept, they can quickly import their projects from GitHub/Bitbucket and the next logical question is "okay how about Jenkins?" Customers are fearful of the amount of time it's going to take to "rebuild" their CI pipelines in another system. This comes from the years of effort they've had to put into building and maintaining Jenkins and their pipelines, and they are fearful of going down that road again. At least for the moment, many enterprises do not yet see Auto DevOps as a real option for them to decrease this work.

At the same time, putting Jenkins jobs into a container and wrapping them inside of a GitLab job doesn't bring the benefits of GitLab CI to you. As a result it's important we build tools which help bring things to GitLab in a way which facilitates the end goal of ensuring a modern, efficient CI/CD process for development teams. This could temporarily include running Jenkins jobs compartmentalized inside of GitLab jobs, but this is not a workable end-state even if it is an important step along the journey.

- [Issue List](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3AJenkins%20Importer)
- [Overall Vision](/direction/ops/#verify)
- [UX Research](https://gitlab.com/groups/gitlab-org/-/epics/592)
- [Migration Docs](https://docs.gitlab.com/ee/ci/migration/jenkins.html)

## What's Next & Why

Our plan is to implement the epic [gitlab-org&2779](https://gitlab.com/groups/gitlab-org/-/epics/2779) which will implement a wrapper around the open source (CloudBees implemented) [Jenkinsfile Runner](https://github.com/jenkinsci/jenkinsfile-runner). This will enable teams which are in the middle of a migration to identify parts of the Jenkins stack which are less urgent to be converted and set them aside temporarily.

We've concluded our customer-involved beta testing (internal issues [gitlab#213158](https://gitlab.com/gitlab-org/gitlab/-/issues/213158) and [gitlab#208932](https://gitlab.com/gitlab-org/gitlab/-/issues/208932)). Feedback from this process will be used to refine the tooling and then launch it on real customer engagements. 

### Why Not Build a Translator First?

Building a wrapper has been determined to bear more fruit in the immediate term than implementing an automated translator ([scripted](https://gitlab.com/gitlab-org/gitlab/issues/208275) or [declarative](https://gitlab.com/gitlab-org/gitlab/-/issues/208276)) between GitLab and Jenkins. As is common, translators between various CI languages, configuration, idioms, and best practices requires human reasoning to do correctly. We've extensively evaluated ([1](https://gitlab.com/groups/gitlab-org/-/epics/2735#note_295171851), [2](https://gitlab.com/groups/gitlab-org/-/epics/2735#note_295172306), [3](https://gitlab.com/groups/gitlab-org/-/epics/2735#note_295172127), [4](https://gitlab.com/gitlab-org/gitlab/-/issues/208668)) the feasability of strict translators. Our evaluations have always resulted in the determiniation that in the majority of circumstances a strict translation would leave users desiring to quickly convert to GitLab CI/CD from Jenkins in a WORSE position.

## Maturity Plan

[ux-research#765](https://gitlab.com/gitlab-org/ux-research/issues/765) has been created to understand the full scope of what is needed to mature this category. The intent is to uncover all different usecases Jenkins satisfies and how they could translate to GitLab. Furthermore, we intend to uncover the client's expectation and painpoints towards converting existing configurations.

The beta testing issues (internal issues [gitlab#213158](https://gitlab.com/gitlab-org/gitlab/-/issues/213158) and [gitlab#208932](https://gitlab.com/gitlab-org/gitlab/-/issues/208932) will also guide us to defining the next maturity steps for this category.

The complete list of issues relevant for this category can be found under the epic [gitlab-org&2735](https://gitlab.com/groups/gitlab-org/-/epics/2735).

## Competitive Landscape

GitHub recently launched [GitHub Valet](https://github.com/github/gh-valet) to migrate GitLab, Azure and other pipelines to GitHub Actions. This is the biggest movement in the space to date and makes it easier for organiziations already on GitHub for SCM to migrate away from other CI tools to GHA.

There are other importers out there of various capability and reliability. Atlassian has [documentation](https://confluence.atlassian.com/bamboo/importing-data-from-jenkins-317949257.html) on their solution, as well as a [video demo](https://www.youtube.com/watch?v=9SGWRWcJTyA). Bamboo also offers [documentation on their solution](https://confluence.atlassian.com/bamboo/importing-data-from-jenkins-317949257.html). None of these however provide a complete lift and shift capability, successfully translating between the concepts and technologies between the different systems.

Jenkins used to offer a wrapper to convert from Jenkins to Jenkins X, but has discontinued it and now provide professional services to support migrations.

## Top Customer Success/Sales Issue(s)

We haven't yet seen a consensus on the sales/CS side on which of the three pillars (listed below in your vision section) are most important to deliver first, but conversations are ongoing. In a general sense, all are important unlocks.

## Top Customer Issue(s)

There are a few places where we can improve our [customer-facing migration documentation](https://docs.gitlab.com/ee/ci/migration/jenkins.html):

- [gitlab#208274](https://gitlab.com/gitlab-org/gitlab/issues/208274) takes the learnings from our field support team and adds them to the docs.
- [gitlab#208273](https://gitlab.com/gitlab-org/gitlab/issues/208273) will add a step by step blog post for actually performing an example migration
- [gitlab#208272](https://gitlab.com/gitlab-org/gitlab/issues/208272) will make a similar video for those who prefer a video to a blog post.

## Top Vision Item(s)

There are three pillars in our vision for this category representing the kinds of Jenkinsfiles that need to be imported or ways we can execute them:

- [gitlab#208277](https://gitlab.com/gitlab-org/gitlab/issues/208277): Wrapper for Jenkins execution inside of GitLab
- [gitlab#208276](https://gitlab.com/gitlab-org/gitlab/issues/208276): Importer for declarative and imperative Jenkins configuration
- [gitlab#208275](https://gitlab.com/gitlab-org/gitlab/issues/208275): Importer for scripted Jenkins configuration
