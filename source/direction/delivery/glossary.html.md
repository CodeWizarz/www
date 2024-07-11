---
layout: markdown_page
title: "Glossary of delivery terminology"
---

- TOC
{:toc}

# Goals

This glossary is meant to serve as a guide to help team members and users discuss topics related to the CD section and more specifically application delivery. It aims to achieve the following:  

* Align concept definitions to improve the effectiveness of communication between product and engineering team members.
* Reduce the potential for miscommunication.
* Help new team members and community contributors get up to speed faster, reducing the time to productivity.

# Scope

The terms and their definitions outlined in this document are provided in context specifically for the GitLab product. Therefore, these terms may have different meanings to users outside of GitLab.

## Relationships at a glance

[![](https://mermaid.ink/img/pako:eNqFkk1vwjAMhv9KlCsfgmtvCDhM0zRpTDtMvXiJWyLSuHITNob47wslhTKByClxntd-43gvFWmUmUReGCgZqtyJuJZua5hchc6LqRiNxGQgFlhb2h1DmVhDcwecijm5wpSBwRtyPfQqnuCBeMbdB9iAPfBS6AiMx5FdIW-NipBu7xKYoo8K3_D4Dlyif3IFQ-M5KB84JgelsGnwvo3bMvwxjW9e3bWpyUkzEDP2pgAVu2acskF3-bt452lFhf8Gxnn8kUzUoDZQduwbWUuhNdKyvSdl4gstufIfSQ4FsfhFppOk_31XinMXU-5ZXVujUhMTKYeyQq7A6Dgr-6Mul36NFeYyi1sNvMll7g6RC7UGj0ttPLHMCrANDiUET6udUzKLbcMOSiN3pmpwn0SXM7ZJXk4T2g7q4Q_5AOIH?type=png)](https://mermaid.live/edit#pako:eNqFkk1vwjAMhv9KlCsfgmtvCDhM0zRpTDtMvXiJWyLSuHITNob47wslhTKByClxntd-43gvFWmUmUReGCgZqtyJuJZua5hchc6LqRiNxGQgFlhb2h1DmVhDcwecijm5wpSBwRtyPfQqnuCBeMbdB9iAPfBS6AiMx5FdIW-NipBu7xKYoo8K3_D4Dlyif3IFQ-M5KB84JgelsGnwvo3bMvwxjW9e3bWpyUkzEDP2pgAVu2acskF3-bt452lFhf8Gxnn8kUzUoDZQduwbWUuhNdKyvSdl4gstufIfSQ4FsfhFppOk_31XinMXU-5ZXVujUhMTKYeyQq7A6Dgr-6Mul36NFeYyi1sNvMll7g6RC7UGj0ttPLHMCrANDiUET6udUzKLbcMOSiN3pmpwn0SXM7ZJXk4T2g7q4Q_5AOIH)

## List of terms

### Application

_Examples: `GitLab Switchboard`, `Amazon Checkout`_

An application consists of one or more [services](#service) and a set of configurations. The configurations might be connected to one or more [release artifacts](#release-artifact) and [environments](#environment).

An application consists of one or more services. Applications are a business and operations oriented grouping of services.

There is always only 1 copy of each application in an environment.

Nota bene, that a single GitLab project might host multiple applications (e.g: `kas` and `agentk` are hosted in a single repo).

### Artifact

An artifact is the result of a set of actions, typically identified by an address or an ID in the system. It's considered immutable and must contain the following cryptographically signed attributes: 

A list of all the sources and tools that were used to produce it for traceability.
* Addresses (e.g. URLs) of binaries that were output artifacts. This includes the size and cryptographic hash of the contents in each file.
* Links to source repo(s) and builds that produced it.
* Author or creator.
* Other metadata such as the results of the security scan, as well as the version of the scanner and its configuration; issue tracker milestone, git tag, etc.

These results need to be cryptographically signed so that a third party can trust that the creator of the artifact didn't forge them.

#### Examples:

* Docker images:
   * Gitaly, kas, main Rails app, Runner, Shell, etc
* Helm charts with default values
* CI artifacts
   * Source code scans, Container image scans, code coverage, unit test reports, license compliance checks
* Terraform plan
* Archives of directories
   * Kpt package

### Configuration

A configuration is an immutable set of key value pairs denoting the rules or settings for a particular service in a particular environment. The configuration can be identified by a unique hash and is part of a deployment. It's populated by data coming from:

* Service and environment specific configuration set up either by the Application Operator or the [the Platform Engineer](https://about.gitlab.com/handbook/marketing/strategic-marketing/roles-personas/#priyanka-platform-engineer).
* Service specific configuration set up by the [Application Operator](https://about.gitlab.com/handbook/product/personas/#allison-application-ops).
* Processes or the platform within GitLab (e.g. the user ID running a pipeline).
* Target infrastructures set up by the Platform Engineer.

A service configurations might be connected to one or more [release artifacts](#release-artifact) of a given [service](#service).

#### Example

In the case of gitlab.com, configuration is stored in:

* Config files in [repo](https://gitlab.com/gitlab-com/gl-infra/k8s-workloads/gitlab-com).
* In the CI definition in [the repo](https://gitlab.com/gitlab-com/gl-infra/k8s-workloads/gitlab-com) there is environment specific configuration.
* Helm charts with its defaults is part of the release.

Defaults baked into the application is part of the release. We don’t consider these to be configuration.

### Deployment

A deployment is a deployed [release artifact](#release-artifact) onto a specific [environment](#environment) of a [service](#service).
In general, only one active deployment exists in an enviornment. In advanced deployment cases, such as Blue/Green deployment and Canary deployment, multiple active deployments could exist at the same time.

**Deploying** is the potentially long-running act of updating an environment with a new version of the release artifact and the relevant configuration.

NOTE: To expose a deployment to end-users, the deployment must be [rolled out](#rollout).

### Environment

_Examples: `Production`, `Staging`, `Testing`, `Development`_

**Disambiguation:** Environments in the context of GitLab might refer to IDEs as well. When disambiguation is needed, we should call the environments in the delivery domain "application environments".

An environment is a logical concept that connects GitLab to a target infrastructure. It

* can access its target infrastructure for deployments and monitoring
* contains environment specific variables (a subset of environment variables)
* can deploy to its target infrastructure,

Environments can be of different types:

* in terms of functionality
   * production
   * non-production
* in terms of lifespan
   * long-living
   * ephemeral

Every environment has a single target infrastructure, a target infrastructure might have many environments. Thus multi-region setups require multiple environments.

You can have multiple instances of a given type (for example by region, provider, applications served). It’s useful to query the system by environment type, to be able to build dashboards around environment types.

[Services](#service) are tied to environments. Every service might be present in multiple environments and every environment might host multiple services. Not every service is expected to present in every environment and no environment is expected to host all the services.

Environments might be dynamically created during the pipeline execution, they might be templated.

#### Example

GitLab environments. Examples: gprd, gstg, pre

   * These are provisioned in Terraform
   * The version of the release artifact might be stored in the repository together with the configuration of that deployment ([example](https://gitlab.com/gitlab-com/gl-infra/k8s-workloads/gitlab-com/-/merge_requests/1099 ))
     * The version of the deployment in an environment is part of the state of the service
   * A log of deployments: a deployment is a CI job that matches up to an environment

### Release artifact 

A release artifact (or simply release) is a special case of an [artifact](#artifact), as it is the artifact to be delivered. The delivery might mean a deployment to an environment or making it available to download.
Every artifact might include multiple artifacts either directly or as referenced artifacts. A release artifact likely includes multiple artifacts.

Beside referencing other artifacts, the release artifact contains any deployed configuration in some form.

Some of the artifacts in a release might be part of a deployment, but a release might contain artifacts that are not part of the deployment. (e.g. metadata, like scan results)

### Rollout

A rollout is the action of putting a [deployment](#deployment) in front of its users. This might happen in many ways:

- Change the infrastructure, for example by configuring a load balancer.
- Change the application code flow using a feature flag. This does not require a new deployment.

The rollout step might happen together with a deployment or as a separate action.

A rollout might take many forms. For example:

- blue-green
- canary
- user or group based
- random percentile-based
- region based
- device based

As noted above, there are two big approaches to rollout. The following table summarizes provides a comparison:

| Feature flag | Network level |
| -----------  | --------------  |
| Changes the executed code path within a single deployment. | Changes the network traffic routing between deployments. |
| Typically manual rollout | Could be automatised based on error rates and metrics |
| A property of the environment. All the running deployments receive the same feature flag values. | A shared property of environment and deployment. Every deployment has its own rollout state. |

While we have two different approaches to rollout. We decided to refer to them as rollout for now. We will update the glossary if needed.

### Secrets

Secrets are part of the Configuration, typically key-value pairs that allow privileged or secure access between two or more components. Their management requires special attention, but it's outside the scope of this discussion. [See the Secrets Management category direction](https://about.gitlab.com/direction/verify/secrets_management/) on our approach to secrets.

### Service

_Examples: `Search API`, `Search UI`, `Frontend`, `Backend`, `Database`, `Caching`, `Monitoring`_

A Service is a logical concept that is a (mostly) independently deployable part of an application that is loosely coupled with other services to serve specific functionalities for the [application](#application). For external consumers of the service, every service exposes a set of APIs.

- A service could be structurally managed by container orchestration framework, such as Kubernetes.
- A service could be provided by an external organization e.g. Use Amazon RDS instead of running a database in Kubernetes.
- A service health could be observed via Metrics, Logs, Traces and Error Tracking.
- A service has a history of [deployments](#deployment) for each [environment](#environment) where it was already deployed.

"Service" is primarily relevant in web applications, that have a client-server model. The other native apps like mobile apps and windows/mac native applications would be called as "Application" rather than "Service". In these cases, the Application consists of a single Service, thus the two terms are equivalent.

### Target infrastructure

A target infrastructure in an immutable entity that contains one or more environment, along with applications that run in that environment. A target infrastructure typically runs multiple applications, but is not application specific. 

From GitLab's perspective, target infrastructures are considered external systems. The target infrastructure is responsible for the authenticating of GitLab with the infrastructure. Authorization is managed based on the respective best practices of the given infrastructure (e.g. IAM, RBAC). Accesses may be restricted to certain jobs or users and may be logged for compliance and be programmable. For example, retrieving and returning a JWT token. 
