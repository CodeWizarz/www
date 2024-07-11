---
layout: markdown_page
description: "Here you can find information on how GitLab can help you with your SOX compliance. View more here!"
title: "Building SOX Compliant Applications with GitLab"
canonical_path: "/solutions/sox-compliance/"
---
## GitLab can help you with your SOX compliance

In 2002 the United States Congress passed the Sarbanes-Oxley Act, also known as SOX to help protect the public from fraudulent practices by corporations. For publicly traded companies, SOX compliance is critical. The software development process of these organizations must be designed, developed, tested, and deployed in ways that adhere to SOX compliance.

GitLab can help you meet SOX IT General Controls (ITGC) compliance requirements by providing you a powerful set of features that support best practice in software development from a single platform.

- [Access controls](#access-controls) - GitLab provides an access control system that allows you to easily maintain the principle of least privilege, ensuring that your users only have access to what they need to do their job.
- [IT security](#it-security) - GitLab provides many built in capabilities such as Static Application Security Testing (SAST), Dynamic Application Security Testing (DAST), Container Scanning, Dependency Scanning, and Vulnerability Reporting to help you deliver secure and compliant applications.
- [Data backup](#data-backup) - GitLab provides backup and restore procedures to ensure your data is not lost.
- [Change management](#change-management) - GitLab makes it easy to define and enforce policies for all software changes while maintaining a record of what was changed, when it was changed, and who changed it.

New features are added to GitLab [every month](https://about.gitlab.com/releases/categories/releases/).

## Access controls

| Solution  | Tier 	| SaaS / Self-Managed |
|-----------|----------	|----------	|
| [LDAP synchronization](https://docs.gitlab.com/ee/administration/auth/ldap/ldap_synchronization.html) | Premium | Self-Managed |
| [SAML group sync](https://docs.gitlab.com/ee/user/group/saml_sso/group_sync.html) | Premium | SaaS & Self-Managed |
| [SCIM for Self-Managed Instances](https://docs.gitlab.com/ee/administration/settings/scim_setup.html) | Premium | Self-Managed |
| [Users with Minimal access](https://docs.gitlab.com/ee/user/permissions.html#users-with-minimal-access)  | Premium | SaaS & Self-Managed |
| [User permissions export](https://docs.gitlab.com/ee/administration/admin_area.html#user-permission-export)  | Premium | Self-Managed |
| [Account deletion](https://docs.gitlab.com/ee/user/profile/account/delete_account.html)  | Premium | SaaS & Self-Managed |
| [Group access and permissions](https://docs.gitlab.com/ee/user/group/access_and_permissions.html)  | Premium | SaaS & Self-Managed |
| [Restrict project and group access by using impersonation](https://docs.gitlab.com/ee/user/clusters/agent/ci_cd_workflow.html#restrict-project-and-group-access-by-using-impersonation)  | Premium | SaaS & Self-Managed  |
| [Confidential issues](https://docs.gitlab.com/ee/user/project/issues/confidential_issues.html)  | Premium | SaaS & Self-Managed |
| [Protected branches](https://docs.gitlab.com/ee/user/project/protected_branches.html) | Premium | SaaS & Self-Managed |
| [Auditor users](https://docs.gitlab.com/ee/administration/auditor_users)  | Premium | Self-Managed |


# IT security

| Solution  | Tier 	| SaaS / Self-Managed |
|-----------|----------	|----------	|
| [Disable signups](https://docs.gitlab.com/ee/administration/settings/sign_up_restrictions.html)  | Premium | Self-Managed |
| [Installation security](https://docs.gitlab.com/ee/security/) | Premium | SaaS & Self-Managed |
| [Two-factor auth](https://docs.gitlab.com/ee/user/profile/account/two_factor_authentication.html)  | Premium | SaaS & Self-Managed|
| [Verified authors with signed commits](https://docs.gitlab.com/ee/user/project/repository/signed_commits/gpg.html)  | Premium | SaaS & Self-Managed |
| [Ensure removed users cannot invite themselves back](https://docs.gitlab.com/ee/user/group/manage.html#ensure-removed-users-cannot-invite-themselves-back)  | Premium | SaaS & Self-Managed |
| [Secret detection](https://docs.gitlab.com/ee/user/application_security/secret_detection/)  | Premium | SaaS & Self-Managed |
| [Group and project access report](https://gitlab.com/gitlab-com/cs-tools/gitlab-cs-tools/gitlab-group-member-report)  | Premium | SaaS & Self-Managed |
| [Audit events](https://docs.gitlab.com/ee/administration/audit_events.html)  | Premium | SaaS & Self-Managed|
| [Log system](https://docs.gitlab.com/ee/administration/logs/index.html)  | Premium | Self-Managed |
| [Incident management](https://docs.gitlab.com/ee/operations/incident_management/incidents.html)  | Premium | SaaS & Self-Managed |
| [Alerts](https://docs.gitlab.com/ee/operations/incident_management/alerts.html)  | Premium | SaaS & Self-Managed |
| [Monitor GitLab with Prometheus](https://docs.gitlab.com/ee/administration/monitoring/prometheus/index.html)  | Premium | Self-Managed |
| [Application security](https://docs.gitlab.com/ee/user/application_security/)  | Ultimate | SaaS & Self-Managed |
| [Compliance reports](https://docs.gitlab.com/ee/user/compliance/compliance_report/)  | Ultimate | SaaS & Self-Managed|
| [Security dashboard](https://docs.gitlab.com/ee/user/application_security/security_dashboard/)  | Ultimate | SaaS & Self-Managed |
| [Vulnerability reports](https://docs.gitlab.com/ee/user/application_security/vulnerability_report/)  | Ultimate | SaaS & Self-Managed |
| [Vulnerability pages](https://docs.gitlab.com/ee/user/application_security/vulnerabilities/)  | Ultimate | SaaS & Self-Managed|
| [Vulnerability severity levels](https://docs.gitlab.com/ee/user/application_security/vulnerabilities/severities.html)  | Ultimate | SaaS & Self-Managed|
| [Dependency list](https://docs.gitlab.com/ee/user/application_security/dependency_list/)  | Ultimate | SaaS & Self-Managed|
| [Credentials inventory](https://docs.gitlab.com/ee/administration/credentials_inventory.html)  | Ultimate | Self-Managed |


## Data backup

| Solution  | Tier 	| SaaS / Self-Managed |
|-----------|----------	|----------	|
| [Backup and restore GitLab](https://docs.gitlab.com/ee/raketasks/backup_restore.html)  | Premium | Self-Managed |
| [Encrypted system configuration](https://docs.gitlab.com/ee/administration/encrypted_configuration.html)  | Premium | Self-Managed |
| [SSL configuration](https://docs.gitlab.com/omnibus/settings/ssl/index.html#connecting-to-external-resources)  | Premium | Self-Managed|
| [PostgreSQL replication and failover](https://docs.gitlab.com/ee/administration/postgresql/replication_and_failover.html)  | Premium | Self-Managed |
| [Audit event streaming](https://docs.gitlab.com/ee/administration/audit_event_streaming.html)  | Ultimate | SaaS & Self-Managed |


## Change management

| Solution  | Tier 	| SaaS / Self-Managed |
|-----------|----------	|----------	|
| [MR approval rules](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/rules.html)  | Premium | SaaS & Self-Managed |
| [Push rules](https://docs.gitlab.com/ee/user/project/repository/push_rules.html)  | Premium | SaaS & Self-Managed |
| [Code owners](https://docs.gitlab.com/ee/user/project/code_owners.html)  | Premium | SaaS & Self-Managed |
| [Enable delayed project deletion](https://docs.gitlab.com/ee/user/group/manage.html#enable-delayed-project-deletion)  | Premium | SaaS & Self-Managed |
| [View description of change history](https://docs.gitlab.com/ee/user/discussions/index.html#view-description-change-history) | Premium | SaaS & Self-Managed
| [Security policies](https://docs.gitlab.com/ee/user/application_security/policies/)  | Ultimate | SaaS & Self-Managed |
| [MR security approvals](https://docs.gitlab.com/ee/user/application_security/index.html#security-approvals-in-merge-requests)  | Ultimate | SaaS & Self-Managed |
| [Requirements management](https://docs.gitlab.com/ee/user/project/requirements/)  | Ultimate | SaaS & Self-Managed |
| [Status checks](https://docs.gitlab.com//ee/user/project/merge_requests/status_checks.html)  | Ultimate | SaaS & Self-Managed |
| [License approval policies](https://docs.gitlab.com/ee/user/compliance/license_approval_policies.html)  | Ultimate | SaaS & Self-Managed |

THE INFORMATION PROVIDED ON THIS WEBSITE IS TO BE USED FOR INFORMATIONAL PURPOSES ONLY. THE INFORMATION SHOULD NOT BE RELIED UPON OR CONSTRUED AS LEGAL OR COMPLIANCE ADVICE OR OPINIONS. THE INFORMATION IS NOT COMPREHENSIVE AND WILL NOT GUARANTEE COMPLIANCE WITH ANY REGULATION OR INDUSTRY STANDARD. YOU MUST NOT RELY ON THE INFORMATION FOUND ON THIS WEBSITE AS AN ALTERNATIVE TO SEEKING PROFESSIONAL ADVICE FROM YOUR ATTORNEY AND/OR COMPLIANCE PROFESSIONAL.
