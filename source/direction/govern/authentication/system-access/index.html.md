---
layout: handbook-page-toc
title: "System Access Category"
description: "Welcome to the System Access category page, which sits within the Authentication and Authorization group at GitLab."
---

## System Access

| | |
| --- | --- |
| Stage | [Govern](/direction/govern/) |
| Maturity | [Complete](/direction/maturity/) |
| Content Last Reviewed | `2023-02-14` |

### Introduction and how you can help

Welcome to the System Access category page, which sits within the Authentication and Authorization group at GitLab. System Access is rather broad, but hopefully by the time you are done reading this page, you will have a much better idea of what it means to us.

There are many different entry points in the GitLab Ecosystem. The System Access category is all about maintaining those entry points and ensuring the users that authenticate through them are permitted to do so. We provide various tooling to make system access as secure and flexible as possible.

This direction page is a work in progress, and everyone can contribute:

 - Please comment and contribute in the linked [issues](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=created_date&state=opened&label_name%5B%5D=Category%3ASystem%20Access&first_page_size=20). Make sure to tag `@hsutor` so she can read and respond to your comment. Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision. 


### Strategy and Themes
 Authenticating with GitLab is considered a core component of the platform. Every product on the market provides some level of authentication. For GitLab, the base version of our authentication needs to be stronger than the advanced versions of authentication other products may have.

 Why?

 Two reasons come to mind:
    1. Technically advanced user base, who has security at the forefront of their minds
    2. We help our customers protect their most valuable asset: their intellectual property

We provide a wide array of authentication methods, and the associated methods for securing auth even further.

#### Authentication Methods

- Username/Password (including integrating with third party Identity Providers, such as Azure AD and Okta)
- SSK keys
- Access Tokens (Personal, Project, Group)
- Service Accounts (non-human bot accounts)

#### Controls

- IP address restrictions
- Credential lifecycle limits
- Password complexity policy
- Session management
- Multi-factor authentication, including webauthn
- Granular, flexible permissions


### 1 year plan

1. [Customizable Roles](https://gitlab.com/groups/gitlab-org/-/epics/4035) - The current 5 static roles that GitLab comes with out of the box are not flexible enough to meet the compliance and security needs of today's enterprise. We will be allowing admins / group owners to define their own roles, which will consist of permissions currently present in [this table](https://docs.gitlab.com/ee/user/permissions.html). 

2. [FedRAMP compliance](https://about.gitlab.com/solutions/public-sector/fedramp/)

3. [Service Accounts](https://gitlab.com/groups/gitlab-org/-/epics/6777) - will roll Group and Project Access tokens into a new concept called Service Accounts, which will be better attuned to the needs of integrations rather than human users. We have started laying the groundwork for Service Accounts with [code](https://gitlab.com/gitlab-org/gitlab/-/issues/387073) in 15.9.

4. [Enterprise Users](https://gitlab.com/gitlab-org/gitlab/-/issues/322039) - Allow Administrators and Group Owners more control over their claimed users, including limiting their ability to change their e-mail address and delete company-owned intellectual property.

#### What is next for us

- [Consolidate Permissions for Customizable Roles](https://gitlab.com/gitlab-org/gitlab/-/issues/382094)
- FedRAMP required items

- [Service Accounts UI](https://gitlab.com/gitlab-org/gitlab/-/issues/338354)

#### What we are currently working on
- **[Enterprise Users Badging](https://gitlab.com/gitlab-org/gitlab/-/issues/372895)**. We're adding a "Managed by" badge to Enterprise Users that will give non-admin users a clear visual indicator that their account is managed by their company. 

- **[SCIM Group Sync for GitLab.com](https://gitlab.com/gitlab-org/gitlab/-/issues/299257)**. Today, SAML is the only way you can programmatically update a user's group. We will be adding group syncing support for customers who currently use SCIM to provision and manage their users.

- **[Automatic Claims of Enterprise Users for any user matching a verified domain](https://gitlab.com/groups/gitlab-org/-/epics/9675)**. Any organization that has a verified domain will automatically claim any users matching that domain as their own Enterprise Users. Previously, this was only possible with SAML and SCIM provisioned users.

#### What we recently completed
- [Self-Managed Group SCIM](https://gitlab.com/groups/gitlab-org/-/epics/8902)
- [Customzable Roles MVC](https://gitlab.com/gitlab-org/gitlab/-/issues/20277)
- [Group Owners can reset user's 2FA](https://gitlab.com/groups/gitlab-org/-/epics/9484)
- [Remove OTP requirement for 2FA with webauthn](https://gitlab.com/gitlab-org/gitlab/-/issues/378844)

#### What is Not Planned Right Now

- Token enhancements, aside from [spiking on the rotation API](https://gitlab.com/gitlab-org/gitlab/-/issues/387606)
- Major functionality additions to LDAP or SAML


#### Key Capabilities 
<!-- For this product area, these are the capabilities a best-in-class solution should provide -->

#### Roadmap
<!-- Key deliverables we're focusing on to build a BIC solution. List the epics by title and link to the epic in GitLab. Minimize additional description here so that the epics can remain the SSOT. -->

#### Top [1/2/3] Competitive Solutions
<!-- PMs can choose to highlight a primary BIC competitor--or more, if no single clear winner in the category exists; in this section we should indicate: 1. name of competitive product, 2. links to marketing website and documentation, 3. why we view them as the primary BIC competitor -->

### Maturity Plan
<!-- It's important your users know where you're headed next. The maturity plan section captures this by showing what's required to achieve the next level. The
section should follow this format:

This category is currently at the XXXX maturity level, and our next maturity target is YYYY (see our [definitions of maturity levels](https://about.gitlab.com/direction/maturity/)).

- Link to maturity epic if you are using one, otherwise list issues with maturity::YYYY labels) 

(For non-marketing categories this section is optional)  -->

### Target Audience
<!--
List the personas (https://about.gitlab.com/handbook/marketing/strategic-marketing/roles-personas#user-personas) involved in this category.

Look for differences in user's goals or uses that would affect their use of the product. Separate users and customers into different types based on those differences that make a difference.
-->
