---
layout: markdown_page
title: "Category Direction - Component Catalog"
description: "Reusable pipeline configuration and definitions" 
canonical_path: "/direction/verify/component_catalog/"
---

- TOC
{:toc}

## Component Catalog

|                       |                                 |
|-----------------------|---------------------------------|
| Stage                 | [verify](/direction/verify/)    |
| Maturity              | [Minimal](/direction/maturity/) |
| Content Last Reviewed | `2023-06-04`                    |

### Introduction and how you can help

Thanks for visiting this direction page on the Components catalog category at GitLab. This page belongs to the [Pipeline Authoring Group](https://about.gitlab.com/handbook/engineering/development/ops/verify/pipeline-authoring/) in the Verify Stage and is maintained by Dov Hershkovitch. You can submit your feature requests using [GitLab issue tracker](https://gitlab.com/gitlab-org/gitlab/-/issues/new).

## Overview

We aim to foster a collaborative community of developers who can easily share, build, and maintain high-quality CI/CD configurations. By providing a platform that serves as a centralized hub for managing all DevOps-related assets within an organization, we aim to empower developers to focus on true innovation and unlock the full potential of the open-source ecosystem. Through our commitment to inclusivity, transparency, and accessibility, we strive to create a continuous learning and improvement culture where every community member can contribute.

### Strategy and Themes

DevOps is all about speed, it delivers value faster by shortening the software development life cycle. Organizations that want to accelerate their DevOps adoption need to set up a working pipeline so other teams can use it to automate their workflow. During the development of a pipeline configuration, engineers frequently encounter the following challenges:

1. *"Where can I find it?"* - Whenever engineers embark on setting up a new pipeline, they often search for existing pipelines in their organization or externally. This is because someone, at some point, has likely attempted to configure a similar pipeline.
2. *"How do I use it?"* - After engineers locate a suitable pipeline to work with, they require clear instructions on effectively using it. This guidance is crucial for understanding the pipeline's functionalities and ensuring its proper usage.
3. *"Does it always work as expected?"* - Engineers often question whether the pipeline is consistently reliable and delivers the expected results. They also evaluate its reusability and whether it can be shared effectively with other teams within the organization. These aspects are vital for determining the pipeline's suitability for wider adoption and collaboration.

While it is possible to solve each problem separately, GitLab believes that we need to solve those problems holistically by building a framework that contains tools that add functionality and improve your CI/CD workflow. We aspire to provide the best-in-class experience for building and maintaining CI/CD pipelines.

Our strategy is to provide an opinionated framework that:

1. Is the SSoT for users to browse and search for the desired pipeline components.
2. Contains shareable and reusable package components that could be attached to any CI/CD configuration.
3. Has an easy way to document the usage of each component.
4. Fosters a collaborative methodology by allowing users to contribute to the catalog by developing and publishing their own components.

We should adopt a bottom-up approach to construct this solution, starting with the smallest building blocks and gradually progressing upwards. By starting from the foundational elements and gradually building on them, we can create a robust and cohesive solution.

### 1 year plan


| Track | Status             | Feature | Details |
| ----- | ------------------ | ------- | ------- |
| 1     | Completed          | Deliver input interpolation as `Beta` | Allow users to construct a reusable pipeline configuration. |
| 2     | Completed          | Deliver experimental [CI/CD components](https://gitlab.com/groups/gitlab-org/-/epics/9409) | A component is the smallest building block in a catalog. |
| 3     | Completed             | Release experimental [CI/CD Components Catalog - index page](https://gitlab.com/gitlab-org/gitlab/-/issues/359047/) | Single page listing all available components in an organization. |
| 4     | In dev | [Restructure components](https://gitlab.com/groups/gitlab-org/-/epics/10728) | Restructure components to accommodate an existing customer structure. |
| 5     | Completed          | Release experimental [CI/CD Components Catalog - details page](https://gitlab.com/gitlab-org/gitlab/-/issues/392738) | Detailed view of a component. |
| 6     | In dev             | [Input interpolation improvements](https://gitlab.com/groups/gitlab-org/-/epics/10603) | Input enhancements. |
| 7     | Planning breakdown | Make inputs/interpolation a GA feature |  |
| 8     | Planning breakdown | Introduce [`steps`](https://gitlab.com/gitlab-org/gitlab/-/issues/357669) | A step is a script that the runner runs. |
| 9     |  In dev  | Make CI/CD catalog/components `Beta`. | Improved release workflow, improved Catalog UX, and stable directory structure. |
| 10    | Planning breakdown | [Visibility of Components usage](https://gitlab.com/gitlab-org/gitlab/-/issues/393326) | Provide an analytics dashboard for component usage. |
| 11    | Not started        | Create an [instance-wide catalog](https://gitlab.com/gitlab-org/gitlab/-/issues/411584) | Could evolve to become the Community catalog. |

#### Important Upcoming Tentative Dates

Upcoming dates can be found [here](https://about.gitlab.com/handbook/engineering/development/ops/project-plans/ci-catalog/#important-upcoming-tentative-dates).

In addition, you can watch this short [video](https://youtu.be/9usWxA6hFdw), which explains the remaining before transitioning the Catalog from Experimental to Beta
#### AI improvements

* To address the misperception surrounding [AI DevOps](https://gitlab.com/gitlab-org/gitlab/-/issues/408839), GitLab proposes including it as a component in the CI/CD Component Catalog. This move aims to improve visibility and showcase the robustness of AI DevOps within the GitLab DevSecOps Platform. By positioning it as a starting point for DevOps transformation, organizations can discover and leverage the comprehensive and opinionated nature of Auto DevOps. By incorporating Auto DevOps as a CI/CD component, GitLab aims to engage users and encourage them to explore its powerful features for their CI/CD workflows.
* [Intelligent search powered by generative AI](https://gitlab.com/gitlab-org/gitlab/-/issues/412663) - Unlike traditional keyword-based searches, Intelligent Search understands the intent behind user queries, enabling it to provide more accurate and relevant results. In addition, we can leverage AI to prompt for more information about specific inputs required by the user, which will result in configured and fine-tuned components with the relevant inputs. This could enhance the user experience and streamline the process of selecting, configuring, and using components from the catalog.

#### What is next for us

Over the next milestones, we will be focusing on answering the top three problems mentioned above:


1. [Restructure components](https://gitlab.com/groups/gitlab-org/-/epics/10728) - which will allow us to move the catalog from experimental to Beta
2. [Input interpolation improvements](https://gitlab.com/groups/gitlab-org/-/epics/10603). We strongly advocate for using inputs as the preferred approach for injecting parameters into a pipeline configuration. Embracing this capability empowers users to construct reusable pipeline configurations while promoting a deterministic behavior (*"Does it always works as expected?"*).

In addition, we'll continue the discussion with internal teams as they dogfood some of our popular CI/CD [template to component](https://gitlab.com/gitlab-org/gitlab/-/issues/390656)

#### What we are currently working on
16.5 Planning issue can be found [here](https://gitlab.com/gitlab-org/ci-cd/pipeline-authoring/-/issues/105) in the upcoming milestone, we are going to focus on:

* [Support variables in`inputs:`](https://gitlab.com/gitlab-org/gitlab/-/issues/387632) - which will help us transition inputs from Beta to GA

* [CI/CD Components Catalog - details page](https://gitlab.com/gitlab-org/gitlab/-/issues/392738)

#### Analyst Discussion 

* [Notes](https://docs.google.com/document/d/1ZOEl7ycibtxN6dDGfsQlfoc-09p7GXEqDUgCCrocUFQ/edit) from Gartner discussion (internal)
* Related articles 
  * [DevEx, a New Metrics Framework from the Authors of SPACE](https://www.infoq.com/articles/devex-metrics-framework/)
  * [DevEx: What Actually Drives Productivity](https://queue.acm.org/detail.cfm?id=3595878)
  
#### What we recently completed

1. [Input interpolation](https://about.gitlab.com/releases/2023/04/22/gitlab-15-11-released/#define-inputs-for-included-cicd-configuration)
2. [CI/CD components - experimental](https://about.gitlab.com/releases/2023/05/22/gitlab-16-0-released/#cicd-components)
3. [CI/CD Components Catalog - index page](https://gitlab.com/gitlab-org/gitlab/-/issues/359047/)
3. [CI/CD components - Details page](https://gitlab.com/groups/gitlab-org/-/epics/10428). A details page that surfaces additional information for each selected component (*"How can I use it?"*).

### What is coming up next 

Below is a tentative timeline proposal that outlines on a per milestone basis the committments by the Pipeline Authoring and Runner teams to CI Steps.  The CI Steps epic can be found [here](https://gitlab.com/groups/gitlab-org/-/epics/11535).

| Milestone | Release date | Projects (aka theme) priority 1 |
| ------ | ------ | ------ |
| `16.9`       |  2024-02-15      |  CI Steps - Experimental     |
| `17.1`       |  2024-05-21       |  CI Steps  - Beta    |
| `17.5`       |  2024-09-18       |  CI Steps - GA     |


### Best in Class Landscape

<!-- Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" -->

BIC (Best In Class) is an indicator of forecasted near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape.

#### Key Capabilities

1. Centralized Component Catalog: Create a centralized component catalog that serves as a single source of truth for users to browse and search for pipeline components. The catalog should be easily accessible and provide comprehensive information about each component, including its purpose, usage, and documentation.
2. Shareable and Reusable Components: Enable users to develop and publish their pipeline components to the catalog. Components should be designed to be shareable and reusable, allowing developers to easily attach them to their CI/CD configurations. This promotes collaboration and reduces duplication of effort within the organization.
3. Versioning: Implement versioning for components to ensure that users can pin their pipelines to a specific revision of a component. This helps in maintaining stability and allows for controlled updates.
4. Component Abstraction and Encapsulation: Encourage the development of components that abstract away complex pipeline configuration units. Components should encapsulate implementation details and provide a clear interface, enabling users to use them without needing to know the underlying details.
5. Documentation: Provide a mechanism for users to document the usage of each component. This should include clear guidelines, examples, and best practices to help users understand how to use the components effectively.
6. Collaborative Contribution: Foster a collaborative community where developers can contribute to the component catalog by developing and publishing their own components. Implement mechanisms for peer review, feedback, and contribution management to ensure the quality and reliability of the catalog assets.
7. Accessibility: Design the platform to be inclusive and accessible to all community members. Provide intuitive interfaces, clear navigation, and comprehensive search capabilities, making it easy for users to find the components they need.
8. Continuous Improvement and Learning: Establish a culture of continuous learning and improvement within the community. Encourage feedback from users, collect analytics on component usage, and iterate on the catalog based on user needs and preferences. Regularly update and enhance the catalog with new components, improved documentation, and additional features based on community contributions.

## Dogfooding

The best way to understand how GitLab works is to use it for as much of your job as possible, this is why we practice [dogfooding](https://about.gitlab.com/handbook/values/#dogfooding). We have recently begun collaborating with these internal teams in GitLab which expressed their desire to dogfood some of our features:

* Engineering Productivity team - This effort is tracked through this [collaboration issue](https://gitlab.com/gitlab-org/quality/engineering-productivity/team/-/issues/141), and the team is currently identifying commonly used CI/CD templates and attempting to convert them into components. Our goal is to understand our customers' challenges when converting their templates into components.
* Incubation team - This effort is tracked through this [collaboration issue](https://gitlab.com/gitlab-org/gitlab/-/issues/399480).
* Secure team - We've converted some of our existing templates such as SAST, Secret detection, and more. This effort is tracked through this [collaboration issue](https://gitlab.com/gitlab-org/gitlab/-/issues/390656).

## Competitive Landscape

Notable competitors in this space are:

- GitHub actions with their [actions marketplace](https://github.com/marketplace?category=&query=&type=actions&verification=).
- [Circle CI orbs](https://circleci.com/developer/orbs).
- CodeFresh also provide their users with a [CI step library](https://codefresh.io/steps/).

Watch this walkthrough video of the different contribution frameworks available by these competitors:

<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/7WSWGDtMD7A" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

## Glossary

This section defines the terminology used throughout this project. With these terms we are only identifying abstract concepts, and they are subject to changes as we refine the design by discovering new insights:

* **Component**: The reusable unit of pipeline configuration.
* **Project**: The GitLab project attached to a repository. A project can contain multiple components.
* **Catalog**: The collection of projects that are configured to contain components, which will be broken down into two flavors:
  * **Namespace catalog**: Scoped per namespace.
  * **Community catalog**: Single source of truth.
* **Version**: The release name of a tag in the project, which allows components to be pinned to a specific revision.

### Components catalog

The component catalog will be a collection of components. This collection:

* Is the SSOT for users to browse and search for the pipeline components they desire.
* Contains shareable and reusable packages of YAML configurations (components) that could be attached to any CI/CD configuration.
* Has an easy way to document usage of each component.
* Allows users to contribute to the catalog by developing and publishing their components.

### Namespace CI/CD Catalogs

When on Premium+ plan, each top-level namespace has access to a namespace catalog. This lists all catalog resources that are hosted directly or indirectly under the given namespace. A namespace catalog does not contain resources hosted under other top-level namespaces.

It's a searchable list of all released components repositories in a namespace. A GitLab instance can have many namespace catalogs. In the future, potentially could become "Organization CI/CD Catalogs" (especially useful for SaaS).

### Instance CI/CD Catalog

An instance catalog is available on GitLab instances. It lists catalog resources that have "internal" or "public" access level.

This catalog allows users of a GitLab instance to see what other components outside a given Namespace Catalog are available for a project to use.

It's a searchable list of all released public/internal CI/CD components in an instance. One per instance.

#### Community Catalog 

On GitLab SaaS, the Instance Catalog could be renamed as the "Community Catalog", to encourage open sourcing and contribution to components.

It's the name for GitLab.com's (SaaS) Instance CI/CD Catalog, configured for public CI/CD components only (no internal projects on SaaS).

### Pipeline component

A pipeline component is a reusable single-purpose building block that abstracts away a single pipeline configuration unit. Components are used to compose a part or entire pipeline configuration. It can optionally take input parameters and set output data to be adaptable and reusable in different pipeline contexts while encapsulating and isolating implementation details.

Components allow a pipeline to be assembled by using abstractions instead of having all the details defined in one place. Therefore, when using a component in a pipeline, a user shouldn't need to know the implementation details of the component and should only rely on the provided interface.

A pipeline component defines its type which indicates in which context of the pipeline configuration the component can be used. For example, a component of type X can only be used according to the type X use-case.

For the best experience with any system made of components, it's fundamental that components are:

* Single purpose: A component must focus on a single goal and the scope must be as small as possible.
* Isolated: When a component is used in a pipeline, its implementation details should not leak outside the component itself into the main pipeline.
* Reusable: A component is designed to be used in different pipelines. Depending on the assumptions it's built on, a component can be more or less generic. Generic components are more reusable but may require more customization.
* Versioned: When using a component we must specify the version we are interested in. The version identifies the exact interface and behavior of the component.
* Resolvable: When a component depends on another component, this dependency must be explicit and trackable.

Some of those best practices will be enforced in the product while others would need to be enforced by the user.
