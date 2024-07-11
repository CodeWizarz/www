---
layout: markdown_page
title: "Glossary of Switchboard terms"
---

- TOC
{:toc}

## Goal

In creating the [Switchboard portal](/direction/saas-platforms/switchboard/) for [GitLab Dedicated](/direction/saas-platforms/dedicated/), we are introducing new terms and re-purposing some existing terms within the context of administration of GitLab Dedicated tenants by both customers and GitLab internal users. This can lead to confusion as the GitLab Dedicated team works to refine requirements for Switchboard internally and set expectations correctly with customers.

The goal of this glossary is to clearly define the important terms and concepts that we use when discussing Switchboard and its current or future-state functionality.

## Scope

The definitions in this document apply specifically to the Switchboard portal for GitLab Dedicated. These terms may have different definitions outside of Switchboard and GitLab Dedicated which are not listed here.

This document does not fully cover all of the concepts related to GitLab Dedicated. More information about GitLab Dedicated can be found at the links below:

- [GitLab Dedicated feature documentation](https://docs.gitlab.com/ee/subscriptions/gitlab_dedicated/)
- [GitLab Dedicated administration documentation](https://docs.gitlab.com/ee/administration/dedicated/)

## List of terms

### Switchboard personas

#### Customer

An organization using a GitLab Dedicated Tenant instance. Could be a third-party client, an internal group or GitLab department, or a GitLab partner. 

Read more about GitLab Dedicated's [target customer](/direction/saas-platforms/dedicated/#target-customer) profile.

#### Tenant Operator

An individual user of the GitLab Dedicated Tenant instance who is responsible for the configuration of their organization's instance via Switchboard. The customer grants access to the tenant operator. This aligns with GitLab's [Sidney](/handbook/product/personas/#sidney-systems-administrator) persona.

#### Customer User
A user of a GitLab Dedicated Tenant instance. This persona may or may not have access to Switchboard.

#### GitLab Operator

GitLab Engineer/SRE responsible for the operation and maintenance of GitLab Dedicated tenant infrastructure.

#### GitLab User
A GitLab team member who has access to Switchboard in order to assist GitLab Dedicated customers with their tenant instance. E.g. a customer success, customer support or professional services team member.

<!--
Sources:
- https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/blob/62fd622090f664874561d51607631e5ecf65ee04/architecture/blueprints/privatelink.md#personas
- https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/blob/62fd622090f664874561d51607631e5ecf65ee04/architecture/blueprints/backups.md#personas
-->

### Switchboard onboarding terms

#### GitLab Dedicated Onboarding issue
When a new customer is onboarded to GitLab Dedicated, their Solution Architect provides information to the GitLab Dedicated engineering team via an [onboarding issue](https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/blob/main/.gitlab/issue_templates/tenant_onboarding_request.md) (GitLab internal) that is used during the creation of their GitLab dedicated tenant instance.

Information collected in this issue is used as an input to the Switchboard onboarding flow.

This is one step on the full GitLab Dedicated New Customer process, see the full documentation [here](https://internal.gitlab.com/handbook/engineering/horse/#new-customer-process) (GitLab Internal).

#### Switchboard onboarding flow

UI flow in the Switchboard portal that enables a Tenant Operator to configure and then create their GitLab Dedicated tenant instance.

#### Minimum tenant configuration
This is the minimum set of parameters collected from the Customer via the Onboarding Issue that is required to provide access to the Switchboard Onboarding flow.

Read more about the information required to create a new GitLab Dedicated tenant in our [documentation](https://docs.gitlab.com/ee/administration/dedicated/index.html#onboarding).

### Switchboard architecture and technical concepts

This is a subset of terms related to Switchboard and GitLab Dedicated that are most helpful in understanding how Switchboard operates.

Current comprehensive architectural information and blueprints are available in the GitLab Dedicated group project [here](https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/tree/62fd622090f664874561d51607631e5ecf65ee04/architecture) (GitLab internal).

#### Amp service

[Amp](https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/amp) is a service endpoint used by Switchboard to interact with customer tenant environments. Amp is implemented as a Kubernetes API endpoint which is capable of applying configuration, forwarding ports, enabling remote access and setting up tooling for debugging purposes. 

Amp is Switchboard's sole method of interacting with GitLab Dedicated tenant environments - there is no direct interaction between Switchboard and a tenant.

#### Deployment

In Switchboard, the deployments section will show all deployments made to a customer's tenant. This includes the initial deployment which created the tenant, as well as subsequent updates to the tenant. This will include updates made by customer tenant operators as well as by GitLab operators.

See [Switchboard Onboarding prototype](https://www.figma.com/file/YaJQT4WARRk9u0YQveioPJ/Switchboard?type=design&node-id=811%3A36329&t=zWuTKzUH91ATFRT7-1) (GitLab Internal) for reference.

#### Deployment of tenant services
Activities and processes required for provisioning of cloud provider account, infrastructure resources, [GitLab Environment Toolkit](https://gitlab.com/gitlab-org/gitlab-environment-toolkit), and operational services when a new GitLab Dedicated tenant instance is created.

#### Deployment coordination
System that centralizes activities and processes required to operate GitLab Dedicated tenants at scale. This includes things like automation to provision new deployments, perform maintenance tasks, and enable observability across all tenants.

#### GitLab Dedicated Tenant model
The tenant model is a structured document that describes all aspects of a GitLab Dedicated tenant instance. The configured state of a tenant should be a pure function (no side effects) based on the tenant model. Changes made via Switchboard are reflected in the tenant model once they have been applied.

For more information about the full tenant model, see the [blueprint](https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/blob/main/architecture/tenant-model.md) (internal only). The full tenant model schema is documented in the [gitlab-dedicated project](https://gitlab-com.gitlab.io/gl-infra/gitlab-dedicated/tenant-model-schema/).

**Note: Onboarding vs full tenant models**

For the purposes of Switchboard onboarding business logic, a distinction is made between an `OnboardingTenant` and the full tenant model defined above.

The `OnboardingTenant` model is a separate record that stores the minimal pre-requisite data needed to create a dedicated instance, as well as information about the progress of a tenant in the [Switchboard onboarding flow](#switchboard-onboarding-flow). Once the onboarding flow is complete, the `OnboardingTenant` record is no long updated and all changes are made to the full (aka "live") tenant model.

See [/gitlab-dedicated/team/-/issues/2309#architecture](https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/issues/2309#architecture) (internal only) for history and further details.

#### GitLab Dedicated Tenant instance

A single fully-functioning GitLab instance and all its associated cloud services running a single copy of the GitLab application. Any Geo replication of the instance is considered part of the same Tenant.

A customer tenant operator interacts only with the tenant instance(s) that has been created for their organization upon purchasing GitLab Dedicated.

#### GitLab Dedicated Customer Tenant account
A cloud provider (currently AWS) account owned and operated by the GitLab Dedicated team for the purpose of running a tenant account. In Production-like environments, each Tenant Account hosts exactly one Tenant.

#### Maintenance window

4-hour weekly period when GitLab Tenant Operators may perform maintenance activities that may result in tenant instance downtime. More information about maintenance windows can be found in the GitLab Dedicated [documentation](https://docs.gitlab.com/ee/administration/dedicated/index.html#maintenance-window).

#### Security keys and Bring Your Own Key

When provisioning a new GitLab Dedicated tenant in Switchboard, customers may provide their own AWS KMS encryption keys. If none are provided, data will still be encrypted using customer-specific keys generated by AWS.

Read more about Bring Your Own Key (BYOK) encryption in the GitLab Dedicated [documentation](https://docs.gitlab.com/ee/administration/dedicated/#encrypted-data-at-rest-byok).

#### Switchboard authentication

Authentication for Switchboard is separate from authentication for a customer's GitLab Dedicated tenant instance or any other GitLab account. 

Switchboard user account and credentials are created by a GitLab Tenant Operator during the onboarding process for GitLab Dedicated.

#### Switchboard test environment

Instance of Switchboard connected to GitLab-only test environments for development.

#### Switchboard beta environment

Instance of Switchboard connected to GitLab Dedicated customer pre-production tenants.

#### Switchboard production environment

Instance of Switchboard connected to GitLab Dedicated customer tenants in Production.

<!--
Sources:
- https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/blob/62fd622090f664874561d51607631e5ecf65ee04/architecture/Architecture.md#switchboard-database
- https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/blob/62fd622090f664874561d51607631e5ecf65ee04/architecture/blueprints/automated_account_provision.md#business-process
- https://gitlab-com.gitlab.io/gl-infra/gitlab-dedicated/team/engineering/aws-account-structure.html
https://gitlab-com.gitlab.io/gl-infra/gitlab-dedicated/team/Roadmap.html#customer-tenant-account
- https://www.figma.com/file/YaJQT4WARRk9u0YQveioPJ/Switchboard?type=design&node-id=811%3A36329&t=zWuTKzUH91ATFRT7-1
- https://gitlab-com.gitlab.io/gl-infra/gitlab-dedicated/team/ (multiple additional pages)
-->

<!--
### **Switchboard functionality**
This section probably makes more sense to add later, but might not be necessary once we've created formal docs for Switchboard
-->