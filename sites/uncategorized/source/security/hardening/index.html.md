---
layout: security
title: Security - Hardening Your GitLab Instance
description: "We designed this Hardening page to serve as a starting point for those interested in hardening a GitLab instance to help improve security."
canonical_path: "/security/hardening/"
---

{::options parse_block_html="true" /}

## On this page
{:.no_toc .hidden-md .hidden-lg}

- TOC
{:toc .hidden-md .hidden-lg}

Every customers' deployment and configuration of GitLab is unique. The security settings that you configure will vary greatly depending on your use case, risk assessment, and your environment.

How does one get started? GitLab has you covered! We have a lot of [information on security settings](https://docs.gitlab.com/ee/security/) for both GitLab SaaS and GitLab Self-Managed instances in our Docs pages. Our Docs pages also offer a wealth of [hardening recommendations](https://docs.gitlab.com/ee/security/hardening.html) for self-managed instances, and many of these settings apply to GitLab SaaS instances as well.

Looking for a consolidated list of hardening recommendations? Use the links below to view our quick-access hardening guides for GitLab Self-Managed and GitLab SaaS instances.

* [GitLab Self-Managed](#gitlab-self-managed-hardening)
* [GitLab.com](#gitlabcom-hardening-ultimate-tier)

----

## GitLab Self-Managed Hardening
<br>

### Enable multi-factor authentication
**Admin > Settings > General > Sign-in restrictions**

* Ensure that the checkbox next to Two-factor authentication (2FA) is checked. The default setting for Two-factor grace period is 48 hours. Adjust it to a lower value, such as 8 hours.
* Ensure the checkbox next to Enable admin mode is checked so that Admin Mode is active. Users with Admin access will have to use additional authentication to perform administrative tasks. With 2FA enabled, this will require additional 2FA authentication by the user.
* For more detailed information, refer to the documentation on [sign-in restrictions](https://docs.gitlab.com/ee/administration/settings/sign_in_restrictions.html).

### Enforce additional sign-up checks
**Admin > Settings > General > Sign-up restrictions**

* Next to Sign-up enabled ensure the checkbox is unchecked.
* Under Email confirmation settings ensure that Hard is selected. This will require the user to verify their email address during the sign-up process before their account is allowed access.
* The Minimum password length (number of characters) default setting of 12 characters is fine if additional authentication techniques are enforced. Options available for password complexity include Require numbers, Require uppercase letters, Require lowercase letters, and Require symbols. Check these boxes depending on your internal password standard (also check out [NIST SP 800-63B](https://pages.nist.gov/800-63-3/sp800-63b.html)).
* If all users' email addresses are under a single domain (e.g., example.com), consider adding it to the Allowed domains for sign-ups. This will prevent those with email addresses associated with other domains from signing up. For more detailed information, refer to the documentation on [sign-up restrictions](https://docs.gitlab.com/ee/administration/settings/sign_up_restrictions.html).

### Limit public visibility of your groups and projects
**Admin > Settings > General > Visibility and access control**

* The Default project visibility and Default group visibility for any newly created project or group should be set to Private by default. Only users that are granted specific access to a project or group will be able to access these resources. This can be adjusted later if necessary or when creating a new project or group. This ensures the default mode is secure to prevent accidental disclosure of information.
* For more details on Visibility and access control [refer to the documentation](https://docs.gitlab.com/ee/administration/settings/visibility_and_access_controls.html).

### Harden your SSH settings
**Admin > Settings > General > Visibility and access control**

* Typically, under Enabled Git access protocols it will be set to Both SSH and HTTP(S). If one of the Git protocols is not in use by your users, set it to either Only SSH or Only HTTP(S) accordingly. This will reduce the attack surface by limiting possibilities of compromise through an unused protocol. For SSH key types, the most recommended algorithms to use are, in order:

  1. ED25519
  2. RSA
  3. ECDSA

* When configuring default types and lengths for SSH keys, keep in mind the list above.
* Specific details on SSH settings can be found [here](https://docs.gitlab.com/ee/security/ssh_keys_restrictions.html) and [here](https://docs.gitlab.com/ee/administration/settings/visibility_and_access_controls.html#configure-enabled-git-access-protocols) for Git Access protocols.

### Review the account and limit settings
**Admin > Settings > General > Account and limit settings**

* This section allows you to limit the size of attachments, pushes, exports, imports, or repositories. As the specific size (in MB) will be tailored to your needs, review these settings and set limits in line with your internal policies. Session duration for users (in minutes) and lifetime of SSH keys and all access tokens (in days) can also be configured. Ensure the durations are in accordance with your internal policies and security best practices.
* Review the [documentation](https://docs.gitlab.com/ee/administration/settings/account_and_limit_settings.html) and apply changes that enforce your own policies.

### Secure your CI secrets
**Admin > Settings > CI**

* Passwords, tokens, keys, and other secrets that require any level of protection should never be stored in plaintext. Instead, some type of encrypted container technology (Secrets Manager) should be implemented, such as GCP's Secret Manager, AWS Key Management Service (KMS), or HashiCorp Vault. For self-managed and standalone instances, HashiCorp Vault is recommended, and many GitLab features can take advantage of Vault and are well described in the [documentation](https://docs.gitlab.com/search/?query=vault).
* For external communications, ensure any connectivity with external hosts in your CI/CD process is using encrypted channels. The use of TLS 1.2 or above is highly recommended and where possible mutual TLS will help things considerably. For details on the use of external secrets for your CI/CD pipeline, check [here](https://docs.gitlab.com/ee/ci/secrets/)for actual examples and configuration guides.

### Protect your pipelines for all branches
**Admin > Settings > CI**

* Pipelines are a part of jobs that execute steps in stages to automate tasks on behalf of the users of a project. They are a central component of CI/CD. By default, only the default branch gets a protected pipeline. Configure your other branches with the same level of security by following [these simple steps](https://docs.gitlab.com/ee/user/project/protected_branches.html#configure-a-protected-branch). This considerably hardens your pipelines.
* The security features enabled by default on protected pipelines are listed in our [documentation](https://docs.gitlab.com/ee/ci/pipelines/#pipeline-security-on-protected-branches).
* Once the pipeline has run, the code will be deployed in an environment. To limit interactions with that environment and to protect it from unauthorized users, you can set your key environments as protected.
* Prerequisites and full process are available in the [documentation](https://docs.gitlab.com/ee/ci/environments/protected_environments.html).
 
## GitLab.com Hardening (Ultimate Tier)

### Group settings

Many security-related settings can be set on the top-level group and will cascade down into all subgroups and projects. They are the easiest and most important in securing your GitLab.com instance.

#### General settings

In the top-level group, the following settings should be applied to provide the best security for the code within that group:

##### Make the group visibility level private

This is likely the most important setting among general settings. By marking the group “private", anyone who is not explicitly a member of the group will not be able to access it. Additionally, by making the top-level group private, all subgroups and projects will also be private and cannot be exposed.

##### Permissions and group features

Under permissions:

* Set “Prevent members from sending invitations to outside groups”. This will prevent accidentally adding people who should not belong to the group.
* Set “Prevent sharing a project with other groups”. This prevents accidental or malicious exfiltration of code by sharing or moving a project to another group outside the control of the top-level group owner.
* Allow project and group access token creation. Project and group access tokens are much like [personal access tokens](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html) with the following improvements:
  * They are visible to and manageable by group owners and maintainers, which means they can be revoked and have expiration dates set by an administrator to limit the opportunity for abuse.
  * They create a virtual “bot” user that does not count against your license count.
* Enable [delayed project deletion](https://about.gitlab.com/blog/2023/04/03/delayed-deletion/). This will give you a seven-day grace period to catch and prevent accidental or malicious removal of a repo. GitLab.com, like self-managed GitLab, does not have the ability to restore an individual project without significant expense for professional services.
* Allowlist the Classless Inter-Domain Routing (CIDR) or supernetting from which users should be accessing the code.
* Restrict membership to only those email domains belonging to your organization and contractors.
* Restrict creation of subgroups to Owners. This will help keep the structure of the top-level group within your policies and make [SAML Group Sync](https://docs.gitlab.com/ee/user/group/saml_sso/group_sync.html) for membership easier to manage.
* Block forking projects outside of this group hierarchy. This will help prevent code exfiltration.
* Require [two-factor authentication](https://docs.gitlab.com/ee/user/profile/account/two_factor_authentication.html). This disables the ability to use password authentication with Git over HTTPS.
* Disallow adding new members to projects within this group. All members must be inherited from the group.

##### Merge request approvals

[Merge request approvals](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/) help prevent injection of malicious code into the repository by having people other than the author review them. Enable merge request approvals for all projects in your group to:

* Prevent approval by authors.
* Prevent approvals by users who add commits.
* Prevent editing approval rules in projects and on individual merge requests.

#### SAML SSO

To more tightly control who can access your code in GitLab.com, set up [SAML SSO](https://docs.gitlab.com/ee/user/group/saml_sso/). This will ensure that everyone who accesses it is approved by someone in authority.

##### To configure SAML SSO:

* Enable SAML authentication for this group.
* Enforce SSO-only authentication for web activity for this group.
* Enforce SSO-only authentication for Git and Dependency Proxy activity for this group.
* Set the Default membership role to Minimal Access. Roles can be increased as needed in subgroups or individual projects, minimal access prevents any visibility to projects or subgroups where the user is not explicitly granted another role.
* Tightly control access to the Maintainer and Owner roles; every developer does not need to have a Maintainer role.

### Group auditing and compliance

Regularly and periodically review the [compliance reports](https://docs.gitlab.com/ee/user/compliance/compliance_report/) to verify who is approving merge requests and what MRs are getting approved.

Set up streaming group audit events to your corporate security information and event management (SIEM) system and monitor them for unusual activity. This needs to be repeated for each group and project in the hierarchy to get the maximum number of audit events.

### Group-level push rules

Setting restrictive push rules at the group level will help ensure malicious code is not injected into the repository:

* Require committers be verified.
* Reject unsigned commits.
* Ensure the commit author is a GitLab user.
* Prevent pushing secret files.
* Require commit author’s email to be from your email domain.

### CI/CD

The following settings can help insure the integrity of [CI/CD](https://about.gitlab.com/topics/ci-cd/) pipelines and reduce the opportunities for abuse and malice:

* Register runners at the lowest practical level to reduce the blast radius of any malicious use.
* Require tags to use all runners to reduce the opportunity for abuse.
* Define CI/CD variables – especially if they contain secrets – at the lowest practical level to reduce the blast radius of any malicious use.
* Use protected runners with protected variables and protected branches to significantly limit who can deploy into production environments or misuse cloud resources.
* Access to change the .gitlab-ci.yml pipeline definition file should be tightly controlled in all repos through the CODEOWNERS file to prevent malicious use of the CI/CD system.

### Project settings

Some settings do not cascade down from the group or are not available at the group level and must be set on individual projects instead. These include some repo-specific settings.

#### Repository

Set up protected branches and protected tags to go along with the protected runners and protected variables defined above.

#### CI/CD

##### General

* Disable public pipelines.
* Use separate caches for protected branches.

#### Protected environments

Use protected environments and tightly limit who can deploy and require approvals for deploying.

##### Token access

Restrict access to this project’s CI_JOB_TOKEN to only individual projects to ensure malicious projects to not retrieve the token and use it to access the API.

##### Secure files

Store keystores, provisioning profiles and signing certificates in the Secure Files storage rather than the repository.

### Project-level security testing and compliance

#### Configuration

##### Security testing

* Enable static application security testing [SAST](https://docs.gitlab.com/ee/user/application_security/sast/) to help prevent insertion of malicious code into the application.
* Enable dependency scanning and regularly review the dependency list or software, or software bill of materials [(SBOM)](https://about.gitlab.com/blog/2022/10/25/the-ultimate-guide-to-sboms/), generated by dependency scanning for vulnerabilities and malicious components.
* Enable [container scanning](https://docs.gitlab.com/ee/user/application_security/container_scanning/) and cluster image scanning.

##### Policies

As an alternative to the security testing section above, you may choose to enable scan execution policies. Enable [test scan result policies](https://docs.gitlab.com/ee/user/application_security/policies/scan-result-policies.html) to prevent merging code with critical vulnerabilities.

Following these best practices will help ensure that your code hosted on GitLab.com is safe from tampering and [public exposure](https://www.engadget.com/okta-stolen-source-code-205601214.html) and that your software supply chain is secure and only authorized users are accessing your software assets.

### Additional Resources

* If you want to learn more about how we do security **at GitLab**, review the [security section](https://about.gitlab.com/handbook/security/) of the handbook.
* [Group level settings documentation](https://docs.gitlab.com/ee/user/group/)
* [Project level settings documentation](https://docs.gitlab.com/ee/user/project/settings/)

