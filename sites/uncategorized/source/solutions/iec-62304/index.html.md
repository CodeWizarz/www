---
layout: markdown_page
title: "Meeting IEC 62304:2006 Requirements with GitLab"
description: "By using GitLab, you can use tools across the development lifecycle to contribute to compliance with requirements across IEC 62304:2006. Learn more!"
canonical_path: "/solutions/iec-62304/"
---
## Building effective workflows for and meeting IEC 62304:2006 requirements with GitLab

IEC 62304:2006 defines requirements for the lifecycle of medical device software. It prescribe processes, activities, and tasks to improve the safety and effectiveness of a medical device by taking a comprehensive, risk-based approach to software development.

GitLab is a complete DevOps platform, delivered as a single application, providing tools from project planning to security testing. By using GitLab, you can use tools across the development lifecycle to contribute to compliance with requirements across IEC 62304:2006.

### Creating and documenting plans and processes

Software development plans and processes can be created, maintained, and referenced throughout GitLab. With [Wiki](https://docs.gitlab.com/ee/user/project/wiki/), you can include a comprehensive documentation system into every project. You can also [integrate](https://docs.gitlab.com/ee/user/project/integrations/index.html) every project with a long list of external services, including Jira. If you have one set of requirements across several projects, you can use [project import/export](https://docs.gitlab.com/ee/user/project/settings/import_export.html) to create a template project with all the information required in it and then seamlessly import it into new projects as needed. Because of the collaborative nature of GitLab, itâs easy to keep your documentation both current and visible across relevant teams. And throughout the software development lifecycle, you can seamlessly reference and incorporate your plans and processes.

### Managing system, development, and customer requirements

With [description templates](https://docs.gitlab.com/ee/user/project/description_templates.html), you can create templates with the requirements and other considerations the development team need to incorporate into the software or development process. Along with [task lists](https://docs.gitlab.com/ee/user/markdown.html#task-lists), you can track the incorporation of requirements into the process and provide an easy-to-use way to track those tasks for developers and reviewers.

To enforce requirements and coding standards throughout the software development lifecycle, you can use [merge request approvals](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/) to require all merge requests are reviewed and approved by the appropriate person(s). With [push rules](https://docs.gitlab.com/ee/push_rules/push_rules.html), you can create and enforce unique rules which, if not followed, will decline a push. And using [protected branches](https://docs.gitlab.com/ee/user/project/protected_branches.html), you can set granular permissions for who can interact with branches and how, further enforcing specific requirements. In the future, the [Requirements Management](https://about.gitlab.com/direction/plan/certify/) product category will allow for a more complete and structured way to granularly enforce and audit compliance with complex requirements.

Using [Service Desk](https://about.gitlab.com/stages-devops-lifecycle/service-desk/), you can interact with and collect feedback from customers and other external stakeholders. This allows you to seamlessly monitor, document, and evaluate feedback as part of your software maintenance process, straight from GitLab.

### Maintaining traceability

[Labels](https://docs.gitlab.com/ee/user/project/labels.html) and [related issues](https://docs.gitlab.com/ee/user/project/issues/related_issues.html) can be used to maintain traceability across the entire software development lifecycle. Using labels, issues and merge requests can be associated back to specific requirements, requests, plans, or customer feedback. By [subscribing](https://docs.gitlab.com/ee/user/project/labels.html) to a label, you can be notified when specific labels are used, helping increase visibility and reducing the risk of important items being missed. And on your GitLab instance, you can [search](https://docs.gitlab.com/ee/user/search/) through issues and merge requests by label and other criteria.

Issues can be [exported](https://docs.gitlab.com/ee/user/project/issues/csv_export.html) into a CSV format. You can select which issues to include in the export and all labels associated with those labels are included in the export file. With exports, issues with a particular label can be traced back to specific requirements and other issues. Because of the flexibility of CSV files, the export can be converted to other formats and otherwise manipulated to meet your specific requirements and use case.

With the [Audit Event](https://docs.gitlab.com/ee/administration/audit_events.html) tool, you can get visibility into group- and project-level events, including when users are added/removed from a group or project. The [goal](https://gitlab.com/groups/gitlab-org/-/epics/474) is for all group and project events to be auditable with the Audit Event tool, such as [project tags](https://gitlab.com/gitlab-org/gitlab-ee/issues/5246) and [merge request approval settings](https://gitlab.com/gitlab-org/gitlab-ee/issues/7531).

### Identifying and managing risks

Every new code commit can be automatically scanned for security vulnerabilities with [Static Application Security Testing](https://docs.gitlab.com/ee/user/application_security/sast/) (SAST). SAST can help you identify unsafe code and several classes of software vulnerabilities in 12 different languages, including C and C++. Every scan generates a [SAST report artifact](https://docs.gitlab.com/ee/ci/yaml/artifacts_reports.html#artifactsreportssast) which is added directly to the merge request, so every security finding maintains full traceability. With SAST's ease-of-use, you can maintain security scanning coverage of your entire codebase.

When risks are identified and remediation efforts begin, your team can use [issue boards](https://docs.gitlab.com/ee/user/project/issue_board.html) to track, prioritize, visualize, and document your efforts. Risk findings can be expressed in terms of an issue and viewed in the context of an issue board. Because of the powerful traceability features discussed above, you can maintain full traceability across the risk management process.

### What are the requirements for IEC 62304:2006 and how can GitLab help meet them

Every organization has different requirements and workflows, so which GitLab features are used and how depends on your organization's unique needs. The sections above aim to provide an example of how some features may be used to meet several key IEC 62304:2006 requirements, but GitLab isn't a compliance tool and every compliance decision must be made by your organization within its unique context.

THE INFORMATION PROVIDED ON THIS WEBSITE IS TO BE USED FOR INFORMATIONAL PURPOSES ONLY. THE INFORMATION SHOULD NOT BE RELIED UPON OR CONSTRUED AS LEGAL OR COMPLIANCE ADVICE OR OPINIONS. THE INFORMATION IS NOT COMPREHENSIVE AND WILL NOT GUARANTEE COMPLIANCE WITH ANY REGULATION OR INDUSTRY STANDARD. YOU MUST NOT RELY ON THE INFORMATION FOUND ON THIS WEBSITE AS AN ALTERNATIVE TO SEEKING PROFESSIONAL ADVICE FROM YOUR ATTORNEY AND/OR COMPLIANCE PROFESSIONAL.
