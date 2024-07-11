---
layout: markdown_page
title: "Meeting ISO 13485:2016 Requirements with GitLab"
description: "Using GitLab's portfolio and project management (PPM) tools, you may be able to drive compliance with requirements across ISO 13485:2016. Learn more!"
canonical_path: "/solutions/iso-13485/"
---

## Using GitLab as a Quality Management System for ISO 13485:2016

ISO 13485:2016 is an international standard specifying requirements for a quality management system (QMS) for organizations involved in one or more stages of the medical device lifecycle - from design to disposal - including the suppliers and vendors to those organizations.

Using GitLab's portfolio and project management (PPM) tools, you may be able to drive compliance with requirements across ISO 13485:2016.

### Can GitLab be used as part of an ISO 13485:2016 QMS?

GitLab offers many features and controls that may be useful as part of an ISO 13485:2016 QMS. Because GitLab isn’t a compliance tool and makes no guarantees about compliance, every application used as part of your QMS must be evaluated based on your unique requirements and needs.

GitLab can be used as both an application within the QMS and as a functional tool to enable faster development and deployment. By merging PPM under the same roof as development and deployment, you can better centralize and simplify your QMS while increasing collaboration between teams and reducing silos.

### Creating and managing documentation

Documentation management is a key aspect of an ISO 13485:2016 QMS. GitLab has several built-in tools to help your organization manage the creation, modification, tracking, and distribution of documentation:

* The [Wiki](https://docs.gitlab.com/ee/user/project/wiki/) is a documentation system that's built into each GitLab project. Wiki pages can be created and managed through an easy-to-use web interface or Git for more advanced users. A complete [history](https://docs.gitlab.com/ee/user/project/wiki/#viewing-the-history-of-a-wiki-page) of all wiki pages is maintained so a comprehensive record can be kept.

* GitLab offers several [integrations](https://docs.gitlab.com/ee/user/project/integrations/index.html), including [Jira](https://docs.gitlab.com/ee/integration/jira/), making it easy to extend GitLab's PPM features.

* [Project import and export](https://docs.gitlab.com/ee/user/project/settings/import_export.html) can be used to effectively create project-level templates, making it easy to create and replicate more complex workflows. Project exports include everything in the project, including issues and files, making it a powerful tool for sophisticated workflows.

### Defining and enforcing processes

As part of your QMS you may have process enforcement requirements. GitLab offers several tools to enforce process, standards, review, and approvals for both documentation and code:

* [Merge request approvals](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/) can be used to enforce requirements and require review by specific persons or teams before merging the change. Beyond enforcing software requirements, this can be a powerful tool for document control change management for files stored in a project repository.

* [Push rules](https://docs.gitlab.com/ee/push_rules/push_rules.html) can be used to set requirements for commit messages. One example of how this can be used is to enforce a requirement that every commit must reference a requirement in Jira or the wiki.

* [Protected branches](https://docs.gitlab.com/ee/user/project/protected_branches.html) allow you to enforce rules for creating, pushing to, and deleting branches.

* In the future, the [Requirements Management](https://gitlab.com/groups/gitlab-org/-/epics/670) product category will allow for a more complete and structured way to granularly enforce and audit compliance with complex requirements.

### ISO 13485:2016 software validation with GitLab

A challenging new requirement in ISO 13485:2016 is QMS software validation. It requires organizations to create procedures to evaluate software used in its QMS, to evaluate the software before use and, as appropriate, as changes are made to the software.

One solution to creating validation procedures are [description templates](https://docs.gitlab.com/ee/user/project/description_templates.html):

* With description templates, you can create procedures in the form of an [issue](https://docs.gitlab.com/ee/user/project/issues/). Within a description template, you can upload or link to forms and other files, create task lists, and more. This means you can create a comprehensive, easy-to-follow validation process where work can be tracked and files can be referenced or uploaded. All actions in an issue, such as when the description is edited or a comment is made, are logged--making it easy to maintain a comprehensive record of all actions taken in the issue.

* Because of the ease with which description templates are used, anybody on your team can initiate the validation process by simply creating an issue and selecting the appropriate template.

* Issues can be further organized using [issue boards](https://about.gitlab.com/stages-devops-lifecycle/issueboard/).

Another solution to creating validation procedures is the [wiki](https://docs.gitlab.com/ee/user/project/wiki/):

* Because the wiki is a more familiar interface, it may be better suited to store the validation procedure. Using a wiki may also be more accessible to non-technical staff, as compared to description templates.

* In addition, you can incorporate description templates into your validation procedure hosted on the wiki. When [creating](https://docs.gitlab.com/ee/user/project/issues/managing_issues.html) a new issue, you can add the `?issuable_template=Template Name` parameter to the end of the new issue page URL. When people visit the link, it will take them to the new issue page with the appropriate description template already selected, removing the need for staff to manually find and select the correct template.

### Learn more about GitLab PPM

To learn more about GitLab PPM, watch GitLab product manager Victor Wu show how GitLab itself is created using GitLab PPM:

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/ME9VwseXMuo/0.jpg)](https://www.youtube.com/watch?v=ME9VwseXMuo)

THE INFORMATION PROVIDED ON THIS WEBSITE IS TO BE USED FOR INFORMATIONAL PURPOSES ONLY. THE INFORMATION SHOULD NOT BE RELIED UPON OR CONSTRUED AS LEGAL OR COMPLIANCE ADVICE OR OPINIONS. THE INFORMATION IS NOT COMPREHENSIVE AND WILL NOT GUARANTEE COMPLIANCE WITH ANY REGULATION OR INDUSTRY STANDARD. YOU MUST NOT RELY ON THE INFORMATION FOUND ON THIS WEBSITE AS AN ALTERNATIVE TO SEEKING PROFESSIONAL ADVICE FROM YOUR ATTORNEY AND/OR COMPLIANCE PROFESSIONAL.
