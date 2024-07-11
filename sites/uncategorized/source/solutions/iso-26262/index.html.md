---
layout: markdown_page
title: "Using GitLab for ISO 26262-6:2018 - Product development at the software level"
description: "ISO 26262-6:2018 prescribes several guidelines and requirements for product development at the software level. Learn more!"
canonical_path: "/solutions/iso-26262/"
---

## Understanding ISO 26262-6:2018

ISO 26262 is a series of standards regulating electrical and electronic components installed in road vehicles with a focus on their safety. ISO-26262-6 is part of that series focusing on "Product development at the software level" and covers software application design, production and testing.

ISO 26262-6:2018 prescribes ways to identify and mitigate safety risks for automotive applications. These methods depend on so-called Automotive Safety Integrity Levels (ASILs) which represent safety risk severity classes related to a specific software application. There are 4 ASILs marked with letters A through D from least to most severe, where ASIL-D stands for potential death or severe injury.

It is important to understand that GitLab itself cannot be ISO-26262 certified since it does not run within a road vehicle. Instead, GitLab and software development process implemented on top of it can significantly support teams in achieving the actual automotive application compliance. This can be achieved by:

* increasing test coverage and frequency which helps mitigate risks, especially when full-scope testing is not possible as it is with artificial intelligence systems or autonomous driving
* creating an auditable/traceable record of tests and ensuring every change is easily connected with its author
* versioning requirements, code, test definitions and documentation
* increasing consistency and eliminating human error via [class-leading Continuous Integration](https://about.gitlab.com/blog/2017/09/27/gitlab-leader-continuous-integration-forrester-wave/)

## The V-Model

ISO 26262 relies on the V-Model known in the automotive industry as a framework for matching requirements (left bar of a V) with corresponding tests (right bar of a V) on all levels to provide traceability.

![ISO-26262 V-Model](/images/iso-26262/v-model-iso-26262.png)*V-Model as defined by ISO-26262 standard*

It is important to observe there is no time scale in this picture. The standard does not insist all requirements are known prior to development nor does it prescribe waterfall model. On the contrary in section 5.2 it says:

>Development approaches or methods from agile software development can also be suitable for the development of safety-related software, but if the safety activities are tailored in this manner, ISO 26262-2:2018 6.4.5 is considered. However, agile approaches and methods cannot be used to omit safety measures or ignore the fundamental documentation, process or safety integrity of product rigour required for the achievement of functional safety.

and further:

>Continuous integration based on an automated build system can support consistency of sub-phases and facilitate regression tests. Such a build system typically performs code generation, compiling and linking, static code analysis, documentation generation, testing and packaging. It allows, subject to tool chain and tool configuration, repeatable and, after changes, comparable production of software, documentation and test results.

## Safety requirements management

The standard recommends defining requirements in accordance with ASIL level of a software application under development. These requirements need to be built and maintained in a traceable, versioned way.

You can manage work items needed to build requirements (as well as code) using [GitLab issues](https://docs.gitlab.com/ee/user/project/issues/). [GitLab Pages](https://docs.gitlab.com/ee/user/project/pages/) in turn, can be used to store, version and manage requirements. GitLab Pages are building templated static webpages directly out of the [repository](https://docs.gitlab.com/ee/user/project/repository/). Repositories can be used to store any file type, including PDFs, spreadsheets, Word documents, and more. A common choice is to use Markdown files for documentation, which make it easy to modify and track changes to the files directly from GitLab. The result is a:

* highly structured webpage,
* with full version tracking and
* the same rigorous [merge request](https://docs.gitlab.com/ee/user/project/merge_requests/) workflow that you use for managing your source code.

In fact, the page you are reading just now is generated using the same mechanism.

For documentation which should be versioned but is not subject to rigorous review and approval workflow, [wiki](https://docs.gitlab.com/ee/user/project/wiki/) is built into each GitLab project. Wiki pages can be created and managed through an easy-to-use web interface. A complete [history](https://docs.gitlab.com/ee/user/project/wiki/#viewing-the-history-of-a-wiki-page) of all wiki pages is maintained.

Successful digital product lifecycle does not end when the product is shipped. Listening to users feedback and incorporating it into the product is paramount to its success. Using [Service Desk](https://about.gitlab.com/stages-devops-lifecycle/service-desk/), you can interact with and collect feedback from customers and other external stakeholders. This allows you to seamlessly monitor, document, and evaluate feedback as part of your software maintenance process, straight from GitLab.

## Software design and safe coding guidelines

The standard prescribes specific guidelines for software architecture design, for example:

* Restricted size and complexity of software components
* Restricted size of interfaces
* Strong cohesion within each software component
* Loose coupling between software components

These recommendations are similar to modern microservice architecture of any enterprise application. Known consequences of applying them include smaller, easy to automate test surface and in consequence faster change cycle. This creates an opportunity for test-driven development, where requirements are expressed as code and executed on each change to ensure consistency, traceability and eliminate human error.

## Software implementation and verification

The standard requires several practices for safe coding. Some of them are language-specific, some not:

* One entry and one exit point in subprograms and functions
* No dynamic objects or variables, or else online test during their creation
* Initialization of variables
* No multiple use of variable names
* Avoid global variables or else justify their usage
* Restricted use of pointers
* No implicit type conversions
* No hidden data flow or control flow
* No unconditional jumps
* No recursions

Some of the violations may be detected automatically, for example by MISRA scanner, some others can be found by peers during code review. Regardless of the method used it is worth testing early and often. GitLab makes it easy to work following [GitLab flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html) with short-lived feature branches and early merges into *master*. This helps:

* minimize the inventory of work and avoid costly refactors
* keep developers focused as they get instant feedback on the quality of their work and potential issues

![GitLab Flow](/images/iso-26262/gitlab-flow.svg)*GitLab Flow: tests executed on each commit, test information readily available during code review*

GitLab can also help by running [code quality scan](https://docs.gitlab.com/ee/user/project/merge_requests/code_quality.html) on each commit. If the built-in code scanner is not sufficient or appropriate for your work environment, it is easy to integrate [third-party scanner](https://docs.gitlab.com/ee/user/project/merge_requests/code_quality.html#implementing-a-custom-tool).

An important part of ongoing code quality management, both from governance and psychological standpoint, are code reviews. Every time change gets merged to *master* it must be seen by the team. GitLab supports that by [protecting branches](https://docs.gitlab.com/ee/user/project/protected_branches.html) from which releasable code should be built (e.g. disallowing direct push to *master*). Merge Request contains results of all relevant tests executed automatically on the branch as well as a link to [live environment](https://docs.gitlab.com/ee/ci/review_apps/) where the application version under review is installed. Detailed [merge request approval rules](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/rules.html) can be used to require review by specific persons or teams.  This process can further be enhanced with [push rules](https://docs.gitlab.com/ee/push_rules/push_rules.html) ensuring every commit meets certain documentation standards, e.g. every commit must be linkable with a specific work item or requirement.

For those tests which are not automated, you can use [description templates](https://docs.gitlab.com/ee/user/project/description_templates.html) and [task lists](https://docs.gitlab.com/ee/user/markdown.html#task-lists) to define test suites, link them back to requirements and provide an easy-to-use way to track those tasks for developers and reviewers.

## Application Security

With more cars being connected to the Internet and updated over the air, application security starts playing a significant role in automotive software development. ISO-26262-6:2018 encourages securing your application in section 5.2

>Cybersecurity can also be considered when developing the embedded software of a particular item, see ISO 26262-2:2018, 5.4.2.3. In order to be able to develop software, specific topics are addressed in this clause concerning the modelling, design and/or programming languages to be used, and the application of guidelines and tools.

Similarly to code quality, security can only be done well in an iterative process. Treating it as an afterthought leads to significant rework best case and project failures in the worst one. GitLab can execute a complete set of security scans at each change cycle:

* [Static Application Security Tests](https://docs.gitlab.com/ee/user/application_security/sast/) to identify vulnerabilities in your source code
* [Dependency Scanning](https://docs.gitlab.com/ee/user/application_security/dependency_scanning/) to look for them in third party libraries you are using
* [Container Scanning](https://docs.gitlab.com/ee/user/application_security/container_scanning/) to find them in base docker images you are using to ship your code
* [Dynamic Application Security Testing](https://docs.gitlab.com/ee/user/application_security/dast/) to attack actual instance of your application with a range of existing exploits

All scan results are available for the team approving Merge Request.

## Software integration

Not all tests can be done by scanning code. More complex scenarios, especially around autonomous driving or fault injection, can only be executed by exposing the live application to some input and measuring their output. The traditional factor limiting development team throughput is the availability of the suitable test environments. A modern solution to this conundrum is using Kubernetes to provision complete test environments and data. This approach brings a couple of advantages:

* Logical environments are separated from computing capacity, they are easy to provision dynamically and tear down if not needed anymore
* Every time the provisioned environment is fresh and in a predictable state. This state can easily be versioned for consistency and traceability
* Kubernetes works on-premise and in any cloud which makes it easy to run as many environments as the project need without excessive planning

GitLab has adopted Kubernetes early and provides [first-class support](https://docs.gitlab.com/ee/user/project/clusters/) for deploying both your test workflows as well as application this way. Kubernetes clusters can be added company, department and project level giving you flexible balance between speed and cost efficiency.

## Why GitLab?

Traditional toolchain used for digital product development is built of many domain tools integrated together. In some cases, these systems require third party plugins for integration or automotive-specific use-cases. These integrations are by definition fragile and they result in a brittle process. With data scattered across systems, often kept in many copies it tends to be notoriously difficult to audit too. The underlying toolchain is risky and expensive to operate eating resources which could be spent on product development.

GitLab is different. Being single application for entire software development lifecycle GitLab helps you:

* Spend less time maintaining your tools and more developing your products
* Deliver higher throughput of work while keeping your work traceable and auditable with single user database and single [audit trail](https://docs.gitlab.com/ee/administration/audit_events.html)
* Automate repeatable tasks and know where to automate in the first place
* Ensure the whole process is secure and tamper-proof
* Build more secure products which contributes to their safety

## Disclaimer

THE INFORMATION PROVIDED ON THIS WEBSITE IS TO BE USED FOR INFORMATIONAL PURPOSES ONLY. THE INFORMATION SHOULD NOT BE RELIED UPON OR CONSTRUED AS LEGAL OR COMPLIANCE ADVICE OR OPINIONS. THE INFORMATION IS NOT COMPREHENSIVE AND WILL NOT GUARANTEE COMPLIANCE WITH ANY REGULATION OR INDUSTRY STANDARD. YOU MUST NOT RELY ON THE INFORMATION FOUND ON THIS WEBSITE AS AN ALTERNATIVE TO SEEKING PROFESSIONAL ADVICE FROM YOUR ATTORNEY AND/OR COMPLIANCE PROFESSIONAL.