---
layout: markdown_page
title: "Category Direction - Editor Extensions"
---

- TOC
{:toc}

## Editor Extensions

|                       |                                  |
|-----------------------|----------------------------------|
| Stage                 | [Create](/direction/dev/#create) |
| Content Last Reviewed | `2023-09-12`                     |

### Introduction and how you can help

Thanks for visiting this direction page on Editor Extensions. This page belongs to the [Editor Extensions](/handbook/product/categories/#editor-extensions-group) group of the Create stage and is maintained by Kai Armstrong ([E-Mail](mailto:karmstrong@gitlab.com)).

This direction is constantly evolving and everyone can contribute:

- Please comment and contribute in the linked [issues](https://gitlab.com/groups/gitlab-org/-/issues/?sort=created_date&state=opened&label_name%5B%5D=group%3A%3Aeditor%20extensions&first_page_size=100) and [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=group::editor+extensions) on this page. Sharing your feedback directly on GitLab.com  or submitting a Merge Request to this page are the best ways to contribute to our strategy.
- Please share feedback directly via email, Twitter, or [schedule a video call](https://calendly.com/gitlabkai).

### Strategy and Themes
<!-- Describe your category. Capture the main problems to be solved in market (themes). Describe how you intend to solve these with GitLab (strategy). Provide enough context that someone unfamiliar with the details of the category can understand what is being discussed. -->

Code Editors and IDEs are one of the most important tools in a software engineers toolkit because the majority of their work is writing and working with code. They're customized with extensions for programming languages, coding standards and frameworks, and more for the type of work being done. They're also optimized for connecting to development runtime environments and services engineers need to do their work.

Engineers working on contributions often collaborate with product managers, designers and other engineers to complete their work. Initially this collaboration takes place in issues where engineers can ask clarifying questions, review designs and discuss solutions. When engineers begin to work on these contributions, issues serve as the reference document and requirements to complete their task.

Once those contributions have been worked engineers contribute those via a Merge Request. Merge Requests are a collaborative process that involves getting feedback on the work completed and then responding to that feedback through additional revisions and comments.

Configuration files are also common to software development and the tools of the DevOps life cycle. In GitLab there are files like `.gitlab-ci.yml` and `CODEOWNERS` which have specific syntaxes and parameters to properly configure. Making changes to these files often involves having documentation available and then validating content through commits or tools outside the editor.

GitLab is an effective tool which supports teams collaborating and building software together. However that collaboration is only available inside the GitLab application.

Developers, on the other hand, spend the majority of their time working locally implementing work outlined in issues, responding to merge request feedback and testing/debugging their applications. These tasks are the core of the developer experience, and GitLab should support developers closer to where they're doing their meaningful work to enable them to be more efficient in the delivery of that work.


### 1 year plan
<!--
1 year plan for what we will be working on linked to up-to-date epics. This section will be most similar to a "road-map". Items in this section should be linked to issues or epics that are up to date. Indicate relative priority of initiatives in this section so that the audience understands the sequence in which you intend to work on them. 
 -->

**In Progress:** [JetBrains plugin for GitLab Duo](https://gitlab.com/groups/gitlab-org/-/epics/10552)

JetBrains IDEs are a popular choice for many developers. GitLab is focused on delivering AI-assisted Code Suggestions to accelerate developer productivity. Adding support for JetBrains and then continuing to enhance our offering with other AI features will allow us to expand our reach.

**In Progress:** [Visual Studio extension for Code Suggestions](https://gitlab.com/groups/gitlab-org/-/epics/10554)

Visual Studio is a popular choice for teams working with .NET, C#, and C++ on Windows. Providing support for Code Suggestions in Visual Studio allows us to build a foundation to support developers on these platforms.

**In Progress:** [Neovim plugin for Code Suggestions](https://gitlab.com/groups/gitlab-org/-/epics/10737)

Neovim is a hyperextensible Vim-based text editor for developers. We're bringing Code Suggestions to this platform because not everyone wants to use a GUI based editor.

#### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to giant epics that lack clarity on what is next. -->

Once we've completed efforts to bring GitLab extensions to JetBrains, Visual Studio, and Neovim in support of Code Suggestions, we'll begin looking at other opportunities to expand the capabilities of the extensions in to the rest of the GitLab DevSecOps platform. Here are some areas we'll be looking to explore:

- [Real-time SAST scanning](https://gitlab.com/groups/gitlab-org/-/epics/10283): Partnering with the [static analysis group](https://about.gitlab.com/handbook/product/categories/#static-analysis-group) we'll work to extend the work they're targeting for SAST scanning to reach more users across IDEs.

- [Extending pipleine editor to IDEs](https://gitlab.com/gitlab-org/gitlab/-/issues/422373): Many features of the pipeline editor, like [config validation](https://gitlab.com/gitlab-org/gitlab-vscode-extension#validate-gitlab-cicd-configuration), [merged yaml](https://gitlab.com/gitlab-org/gitlab-vscode-extension#show-merged-gitlab-cicd-configuration), and [variable autocomplete](https://gitlab.com/gitlab-org/gitlab-vscode-extension#cicd-variable-autocompletion) are already available in VS Code. We'll look to extend to the rest of the pipeline editor features and bring those experiences to other IDEs.

#### What we are currently working on

<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

The Editor Extensions category is primarily focused on supporting Code Suggestions:

1. Delivering a plugin for **JetBrains IDE** supporting [Code Suggestions](https://docs.gitlab.com/ee/user/project/repository/code_suggestions.html)
1. Delivering an extension for **Visual Studio** supporting [Code Suggestion](https://docs.gitlab.com/ee/user/project/repository/code_suggestions.html)
1. Delivering a plugin for **Neovim** supporting [Code Suggestion](https://docs.gitlab.com/ee/user/project/repository/code_suggestions.html)
1. Creating a language server to power [Code Suggestion](https://docs.gitlab.com/ee/user/project/repository/code_suggestions.html) in our extensions and enable the community to contribute more integrations

<!-- #### What we recently completed -->
<!-- Lookback limited to 3 months. -->

#### What is Not Planned Right Now
<!--  Often it's just as important to talk about what you're not doing as it is to
discuss what you are. This section should include items that people might hope or think
we are working on as part of the category, but aren't, and it should help them understand why that's the case.
Also, thinking through these items can often help you catch something that you should
in fact do. We should limit this to a few items that are at a high enough level so
someone with not a lot of detailed information about the product can understand -->

The scope of this category does not extend beyond extension support and foundations for:

- Visual Studio Code
- JetBrains IDE's
- Visual Studio
- Neovim

The [GitLab CLI](https://about.gitlab.com/direction/create/gitlab_cli/) remains it's own category.

We're also not actively exploring support for any additional IDEs at this time. If you'd like to let us know what IDEs you want to see supported, please add a comment to [this epic](https://gitlab.com/groups/gitlab-org/-/epics/2431).

<!-- ### Target Audience -->
<!--
List the personas (https://about.gitlab.com/handbook/marketing/strategic-marketing/roles-personas#user-personas) involved in this category.

Look for differences in user's goals or uses that would affect their use of the product. Separate users and customers into different types based on those differences that make a difference.
-->

<!-- 
The software development process involves many people working across various parts of configuration, contribution and review. All of these users work together to advance software projects in their organization.

Engineering personas who are contributing to development, configuring or interacting with continuous integration and reviewing contributions from other team members. Users performing these tasks need tools that allow them to deeply understand the changes and provide meaningful feedback of both comments and code suggestions. These are specifically addressed by the following GitLab Personas:

- [Sasha (Software Developer)](/handbook/product/personas/#sasha-software-developer)
- [Devon (DevOps Engineer)](/handbook/product/personas/#devon-devops-engineer)
-->
