# Tech Stack - Add New System

## Business/Technical System Owner or Delegate to Complete

***Please do not merge before the Business Systems Analysts have reviewed and approved.***

* [ ] Rename this MR's title to `[System Name] - Tech Stack - Add New System`

**General Tech Stack Entry Tasks**
1. [ ] Link the Procurement Requisition for the new system (if third-party system):
    * [Requisition link]
2. [ ] Populate all data fields for the new system within the 'Changes' tab of this MR. Commit when ready. More instructions are [here](https://about.gitlab.com/handbook/business-technology/tech-stack-applications/#what-data-lives-in-the-tech-stack).
3. Is this new system replacing an existing system in the Tech Stack? 
    * [ ] Yes - Delete that existing system's entry from the Tech Stack using this MR as well. Next, create a [Tech Stack Offboarding Issue](https://gitlab.com/gitlab-com/business-ops/Business-Operations/-/issues/new?issuable_template=offboarding_tech_stack).
      * [Issue link]
    * [ ] No

**Access Tasks**
1. [ ] [Create an Issue](https://gitlab.com/gitlab-com/team-member-epics/access-requests/-/issues/new?issuable_template=Update_Tech_Stack_Provisioner) to add the Provisioner(s) of the new system to the appropriate Google/Slack/GitLab groups. _Note: If the Provisioner(s) of this system is already part of the Provisioner groups, skip this step. Please replace the [Issue link] placeholder below with `N/A - Already in Provisioner groups`_.
    * [Issue link]
2. [ ] Add the new system to **one** of two Offboarding templates below. More instructions are [here](https://about.gitlab.com/handbook/business-technology/tech-stack-applications/#updating-the-offboarding-templates).
    * [ ] Option 1 - Main [Team Member Offboarding](https://gitlab.com/gitlab-com/people-group/employment-templates/-/blob/main/.gitlab/issue_templates/offboarding.md) template
      * [MR link]
    - [ ] Option 2 - [Department-level Offboarding template](https://gitlab.com/gitlab-com/people-group/people-operations/employment-templates/-/tree/main/.gitlab/issue_templates/offboarding_tasks) folder
      * [MR link]

**Data Warehouse Question**
  1. Does data from the new system need to be integrated into the [Enterprise Data Warehouse (EDW)](https://about.gitlab.com/handbook/business-technology/data-team/platform/edw/) for reporting and analytics?
       * [ ] Yes - Create a '[New Data Source](https://gitlab.com/gitlab-data/analytics/-/issues/new?issuable_template=[New%20Request]%20New%20Data%20Source)' Issue in the Data Project to discuss cost, development, etc. with the Data team.
       * [ ] No

> Examples of system data integrated into the EDW:
  > - The data will be used as part of a new Key Performance Indicator or Performance Indicator.
  > - The data needs to be part of lead-to-cash analysis.
  > - The data needs to be joined with Marketo, Salesforce, or NetSuite data for cross-system analysis.

## Privacy Team to Complete

If the new system contains [Personal Data](https://about.gitlab.com/handbook/security/data-classification-standard.html#data-classification-definitions), has a [Privacy Review been completed?](https://about.gitlab.com/handbook/legal/privacy/#privacy-review-process): 
 1. [ ] If system contains [Orange](https://internal.gitlab.com/handbook/security/data_classification/) (internal only)/Red Personal Data:
       * [ ] Yes - Link a completed Vendor Privacy Review Issue, Coupa approval, or Zip approval
       * [ ] No - **Complete [Privacy Review Issue](https://gitlab.com/gitlab-com/legal-and-compliance/-/issues/new?issuable_template=Vendor-Procurement-Privacy-Review)**
 2. [ ] If system contains Yellow Personal Data (GitLab Team Member Names/Emails):
       * [ ] Yes - a Data Processing Agreement (DPA) was executed between GitLab and the Vendor
       * [ ] No - a DPA is not in place - Privacy Team will be in contact about completing a DPA, which is required for this Tech Stack Addition
 3. [ ] If system contains only Green Data or contains no [Personal Data](https://about.gitlab.com/handbook/security/data-classification-standard.html#data-classification-definitions), a Privacy Review is not required.

## Security to Complete

* [ ] If applicable, the Security Risk Engineer who created this MR should self-assign and unassign `@ndevarajan`
* [ ] Create [TS Add and BIA Tracking](https://gitlab.com/gitlab-com/gl-security/security-assurance/security-risk-team/third-party-vendor-security-management/-/issues/new?issue[title]=New%20System%20-%20[System%20Name]%20-%20TS%20Add%20and%20BIA%20Tracking&issuable_template=New%20System%20-%20TS%20Add%20and%20BIA%20Tracking) Issue:
  * [Tracking Issue link]
* [ ] Prior to merging, confirm the associated requisition has passed through all layers of approval for implementation
* [ ] @gitlab-com/gl-security/engineering-and-research/security-logging Security Logging Team reviews and follows the [Critical Logging Methodology Process](https://internal.gitlab.com/handbook/security/infrastructure_security_logging/programs/critical-logging-methodology.html/)
  * If applicable [Add/Change/Remove Logging Issue Request](https://gitlab.com/gitlab-com/gl-security/engineering-and-research/security-logging/security-logging/-/issues/new?issuable_template=add-remove-change-log-source)
* [ ] Security Assurance approved

## Business Technology to Complete
### To-dos before merging (@marc_disabatino)

* [ ] Ensure all sections/action items are completed.


/cc @gitlab-com/internal-audit @disla @gitlab-com/gl-security/security-assurance/security-risk-team
/assign @marc_disabatino @ndevarajan @emccrann
/labels ~BusinessTechnology ~BT-TechStack ~BT-TechStack-NewSystem ~"BT-TechStack::To do" ~BIA::Initiate
