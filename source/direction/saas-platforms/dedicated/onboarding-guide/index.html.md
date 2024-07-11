---
layout: markdown_page
title: "GitLab Dedicated new customer onboarding guide"
---

- TOC
{:toc}

## Goal

This guide can be used to help new GitLab Dedicated customers prepare for the creation of their GitLab Dedicated instance. 

While the GitLab Dedicated engineering team is responsible for completing the tenant creation process, there are key pieces of information needed from the customer in order to ensure their GitLab Dedicated tenant environment is ready for them as soon as the sales process is complete.

More information about the GitLab Dedicated new customer process including onboarding can be found [here](https://internal.gitlab.com/handbook/engineering/horse/#new-customer-process (internal only).

## Who is this guide for?

This is primarily intended for use by members of the account team (primarily the [Solutions Architect](https://handbook.gitlab.com/job-families/sales/solutions-architect/) and/or [Customer Success Manager](https://handbook.gitlab.com/job-families/sales/customer-success-management/)) working with new GitLab Dedicated customers. 

For [transparency](https://handbook.gitlab.com/handbook/values/#transparency), we have made this available in our public handbook so it can be shared with customers directly as needed to provide visibility into our onboarding process.

## How to use this guide

The checklists below can be provided to customers (along with the related documentation) to set expectations for what configurations can be made as part of the initial tenant creation process and what information and/or input is needed from them for each configuration.

The information a customer provides can then be transferred to the GitLab Dedicated [new tenant onboarding issue](https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/blob/main/.gitlab/issue_templates/tenant_onboarding_request.md) (internal only) which will be assigned to a GitLab Dedicated team member once ready for engineering.

## First steps

1. Review detailed instructions on how to configure GitLab Dedicated: https://docs.gitlab.com/ee/administration/dedicated/index.html#onboarding
2. Review the available functionality of GitLab Dedicated: https://docs.gitlab.com/ee/subscriptions/gitlab_dedicated/

## Required information

Before opening an onboarding issue, be sure that you will be able to provide the [required information](https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/blob/main/.gitlab/issue_templates/tenant_onboarding_request.md#customer-information-required) in the first two sections of the onboarding issue.

NOTE:
This information must all be included in the description of the [new tenant onboarding issue](https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/blob/main/.gitlab/issue_templates/tenant_onboarding_request.md) before engineering can begin tenant provisioning.

Please confirm the following with your customer - feel free to copy the list below as is and send to your customer to complete.

~~~
- Email of the person/people who should receive the root credentials for their instance once created.
- Number of users - this should correspond with the number of Ultimate licenses being purchased.
- Primary, secondary, and backup AWS regions - note that for an instance to be geo-enabled, a secondary region must be provided.
- Instance subdomain - see documentation linked above for syntax
- Initial repository size - this should correspond with what has been agreed upon during the quoting process.
- Weekly maintenance window - see documentation linked above for available windows and select one from the list.
~~~

## Optional configurations

These additional configurations can be made by the GitLab Dedicated team while the tenant is being provisioned. 

1. IP allowlist - [see detailed intructions](https://docs.gitlab.com/ee/administration/dedicated/index.html#ip-allowlist)
2. Bring Your Own Key (BYOK) encryption - [see detailed instructions](https://docs.gitlab.com/ee/administration/dedicated/#encrypted-data-at-rest-byok)
   - BYOK requires an AWS account ID which must be requested ahead of time via the onboarding issue before the customer can create their keys in AWS.
3. SAML configuraiton - [see detailed instructions](https://docs.gitlab.com/ee/administration/dedicated/#saml)

NOTE:
These must also be included in the corresponding sections in the description of the [new tenant onboarding issue](https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/blob/main/.gitlab/issue_templates/tenant_onboarding_request.md). 

If not included in the description, they will not be added to the customer's GitLab dedicated tenant model and will need to be requested via subsequent support tickets using the [corresponding issue template](https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/tree/main/.gitlab/issue_templates?ref_type=heads).

## Out of scope

Configurations not listed here can be requested via subsequent issues using the [corresponding issue template](https://gitlab.com/gitlab-com/gl-infra/gitlab-dedicated/team/-/tree/main/.gitlab/issue_templates?ref_type=heads).

These will not be configured in the customer's GitLab Dedicated instance during the initial provisioning, but can be completed as soon as the customer's first weekly maintenance window. If needed sooner, please specify in the issue.

## Have questions?

Contact the GitLab Dedicated team via [#f_gitlab_dedicated](https://gitlab.slack.com/archives/C01S0QNSYJ2) Slack channel.