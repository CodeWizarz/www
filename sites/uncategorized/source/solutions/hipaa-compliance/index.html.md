---
layout: markdown_page
title: "Building applications that meet HIPAA standards"
description: "See how using GitLab can help you with HIPAA compliance. Find more information here!"
canonical_path: "/solutions/hipaa-compliance/"
---
## See how using GitLab can help you with HIPAA compliance

The  Health Insurance Portability and Accountability Act of 1996 ([HIPAA](https://www.hhs.gov/hipaa/for-professionals/index.html)) sets security, privacy, and breach notification standards to maintain the confidentiality, integrity, and availability of protected health information (PHI).

## Identifying and managing risks and vulnerabilities

A [risk analysis](https://www.hhs.gov/hipaa/for-professionals/security/guidance/final-guidance-risk-analysis/index.html) is one of the implementation specifications of the Security Management Process standard, which requires organizations to conduct a comprehensive analysis of the potential risks and vulnerabilities to the confidentiality, integrity, and availability of their PHI.

GitLab offers several security tools which can help organizations identify and track risks and vulnerabilities across the software lifecycle:

* [Static Application Security Testing (SAST)](https://docs.gitlab.com/ee/user/application_security/sast/), which scans source code for known vulnerabilities.
* [Dynamic Application Security Testing (DAST)](https://docs.gitlab.com/ee/user/application_security/dast/), which scans a running web application for known vulnerabilities.
* [Container Scanning](https://docs.gitlab.com/ee/user/application_security/container_scanning/), which scans containers for known vulnerabilities.
* [Dependency Scanning](https://docs.gitlab.com/ee/user/application_security/dependency_scanning/), which scans dependencies for known vulnerabilities.
* [Security Dashboard](https://docs.gitlab.com/ee/user/application_security/security_dashboard/), which allows you to view the vulnerabilities in all of your projects and groups.
* [License Compliance](https://docs.gitlab.com/ee/user/compliance/license_compliance/index.html), which searches your project for software licenses.

## Defining and enforcing development standards and processes

 As part of your security and risk mitigation strategy, you may decide to implement development standards and processes. GitLab offers several tools to enforce process, standards, review, and approvals for both code and documentation:

* [Merge request approvals](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/) can be used to enforce requirements and require review by specific persons or teams before merging the change. Beyond enforcing software requirements, this can be a powerful tool for document control change management for files stored in a project repository.

* [Push rules](https://docs.gitlab.com/ee/push_rules/push_rules.html) can be used to set requirements for commit messages. One example of how this can be used is to enforce a requirement that every commit must reference a requirement in Jira or the wiki.

* [Protected branches](https://docs.gitlab.com/ee/user/project/protected_branches.html) allow you to enforce rules for creating, pushing to, and deleting branches.

* In the future, the [Requirements Management](https://gitlab.com/groups/gitlab-org/-/epics/670) product category will allow for a more complete and structured way to granularly enforce and audit compliance with complex requirements.

THE INFORMATION PROVIDED ON THIS WEBSITE IS TO BE USED FOR INFORMATIONAL PURPOSES ONLY. THE INFORMATION SHOULD NOT BE RELIED UPON OR CONSTRUED AS LEGAL OR COMPLIANCE ADVICE OR OPINIONS. THE INFORMATION IS NOT COMPREHENSIVE AND WILL NOT GUARANTEE COMPLIANCE WITH ANY REGULATION OR INDUSTRY STANDARD. YOU MUST NOT RELY ON THE INFORMATION FOUND ON THIS WEBSITE AS AN ALTERNATIVE TO SEEKING PROFESSIONAL ADVICE FROM YOUR ATTORNEY AND/OR COMPLIANCE PROFESSIONAL.
