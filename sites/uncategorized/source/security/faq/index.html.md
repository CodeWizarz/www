---
layout: security
title: Security - Frequently Asked Questions
description: "We designed this Frequently Asked Questions page to serve as a starting point for those interested in GitLab's Security."
canonical_path: "/security/faq/"
---

{::options parse_block_html="true" /}

## On this page
{:.no_toc .hidden-md .hidden-lg}

- TOC
{:toc .hidden-md .hidden-lg}

# GitLab Security Frequently Asked Questions
<br>
Are you concerned about security in Cloud Services? Are you interested in learning more about GitLab's security program? Are you confused about what a shared responsibility model is? You are not alone! 

To learn more, begin by downloading our [Community Customer Assurance Package](https://about.gitlab.com/security/cap/) that includes 2 completed common security questionnaires- CSA CAIQ Level 1 Questionnaire and Standard Information Gathering (SIG) Lite Questionnaire. These two questionnaires document over 300 commonly asked security questions and provide our customers and prospects with a single spot to collect this information. We've also collected a few Frequently Asked Questions below to aid in security reviews. 

----

### Compliance Reports and Security Assurance

**Does GitLab have an Information Security Program?**

Yes. GitLab, Inc maintains a documented Information Security program that includes [policies and procedures](https://about.gitlab.com/handbook/security/#resources) including but not limited to Access Management, Data Classification and Protection, and Incident Response. Links to these documents are available on the [Customer Assurance Package](https://about.gitlab.com/security/cap/) site.

**Is GitLab's Security Program aligned with industry standards?**

Yes. GitLab, Inc maintains a formal Security Assurance department responsible for monitoring and reporting on GitLab's compliance with various security frameworks. For the most up to date list of current security frameworks and certifications, roadmapped certifications, and instructions on obtaining assurance documentation, please reference [GitLab's Security Certifications and Attestations handbook page](https://about.gitlab.com/handbook/security/security-assurance/security-compliance/certifications.html). GitLab has documented [Security Controls](https://about.gitlab.com/handbook/security/security-assurance/security-compliance/sec-controls.html) that meet common industry standards. 

**Does GitLab hold any 3rd Party Compliance Attestations?**

Yes. GitLab, Inc currently has a SOC2 Type 2 Report, ISO 27001 certification, and several industry self-attestations that [can be provided under NDA](https://about.gitlab.com/security/cap/). For the most up to date list please review [GitLab's Security Certifications and Attestations handbook page](https://about.gitlab.com/handbook/security/security-assurance/security-compliance/certifications.html).


### Cloud Security

**Does GitLab.com depend on any cloud providers to support customer services?**

Yes. GitLab.com is deployed on [Google Cloud Platform (GCP)](https://cloud.google.com/security) Infrastructure as a Service (IaaS) as well as several other [Sub Processors](https://about.gitlab.com/privacy/subprocessors/). For detailed architecture please see our [Production Architecture](https://about.gitlab.com/handbook/engineering/infrastructure/production/architecture/)
	    
**What is GitLab's Shared Responsibility model?**

As part of GitLab Inc's contracting process, GitLab provides all [terms and conditions](https://about.gitlab.com/handbook/legal/subscription-agreement/#14-security--data-protection) with our customers to ensure all parties understand the shared responsibility model. Details on customer configurations can be found [within our user documentation](https://docs.gitlab.com/ee/). You can also access our Technical Paper on Shared Responsibility model by downloading our [Customer Assurance Package](https://about.gitlab.com/security/cap/).
	    

### GitLab Control Framework

In the spirit of GitLab Inc's [core value efficiency](https://about.gitlab.com/handbook/values/#efficiency), our Security Compliance team maintains [a set of security controls](https://about.gitlab.com/handbook/security/security-assurance/security-compliance/sec-controls.html) that address multiple underlying requirements. Some common controls are noted below. 

**Does GitLab encrypt my data in transit and at rest?**

Yes. GitLab, Inc utilizes TLS Strict, HTTPS, and Universal SSL to encrypt data in transit. Data is encrypted at rest using Google Cloud Platform supporting AES-256.

**Does GitLab have an incident response plan?**

Yes. GitLab, Inc has a dedicated [Security Incident Response team](https://about.gitlab.com/handbook/security/security-operations/sirt/sec-incident-response.html) and a documented [Incident Management Plan](https://about.gitlab.com/handbook/security/security-operations/sirt/#-incident-management-and-review) that  includes identification, containment, remediation and communication throughout the lifecycle of an incident. 

**Does GitLab regularly undergo penetration testing by a 3rd party firm?**

Yes. GitLab, Inc contracts with a third party service provider to conduct annual penetration tests of our infrastructure and product. GitLab requires an NDA to be in place prior to providing the annual report. A Detailed Letter of Engagement is [requested with an NDA](https://about.gitlab.com/security/cap/). 
	   
**Does Gitlab have a business continuity plan/disaster recovery plan?** 

Yes, GitLab has a [Business Continuity plan](https://about.gitlab.com/handbook/business-technology/gitlab-business-continuity-plan/) that is reviewed and tested annually.  

**What data does GitLab have access to (personal and business)?**

GitLab, Inc requires information for user account creation including, but not limited to, name, email, and IP addresses. Additional business, such as company name and number of employees, will be accessible to support billing and contracting. Personal information can be deleted from your profile and requests for data erasure can be made at any time. _GitLab, Inc is the Data Processor and our Customers are Data Controllers._ Other information that can be supplied, but is not required is listed below:
<br>
Personal Details (including but not limited to):
<br>

- City
- Postal Code
- Country
- State or Territory

**Does GitLab perform backups?**

Yes. GitLab performs [backups with continuous incremental data](https://about.gitlab.com/handbook/engineering/infrastructure/production/#backups). Backups are encrypted and [tested regularly](https://about.gitlab.com/handbook/engineering/infrastructure/database/disaster_recovery.html). 

**What are GitLabs RTO and RPO times?**

GitLab does not currently have a stated RTO/RPO for GitLab.com Disaster Recovery. Establishing stated goals as part of our recovery capabilities is an important goal for GitLab during 2023. In accordance with our focus on transparency, we will only provide these values when they can be relied upon based on actual test results of simulated disaster recovery scenarios. We welcome familiarization with our [SaaS architecture](https://about.gitlab.com/handbook/engineering/infrastructure/production/architecture/) as well as how we [monitor for availability](https://about.gitlab.com/handbook/engineering/monitoring/). We look forward to providing similar insight into our disaster recovery approach by the end of 2023. 

### GitLab Product Security

**How does GitLab handle security releases?**

GitLab releases patches for vulnerabilities in dedicated security releases. There are two types of security releases: 
* Monthly scheduled security release that is targeted to go out a week after the feature release (which deploys [every month](/handbook/engineering/releases/))
* Ad-hoc security releases for critical vulnerabilities. The fix for every vulnerability is backported to the current release, and the 2 previous `major.minor` versions.  

To help you understand the vulnerabilities that were fixed, a blog post accompanies each security release and includes a brief description, the 
versions affected, and the assigned CVE ID for each vulnerability. Feature and security release blog posts are located in the [`releases` section of our blog](https://about.gitlab.com/releases/categories/releases/). In addition, the issues detailing each vulnerability are made public 30 days 
after the release in which they were patched. It is highly recommended that all customers upgrade to at least the latest security release for their 
supported version.

To be notified when a security release is released, the following channels are
available:
- [Security Notices mailing list](/company/contact/)
- [Security Release RSS feed](/security-releases.xml)
- [All GitLab Releases RSS feed](https://about.gitlab.com/all-releases.xml)

**Can GitLab provide advance notice to customers surrounding a Security Release?**

We do not offer customers advance notice of security releases. We have two principal reasons for this:

* We mentioned above that regular security releases are targeted for release one week after our feature release (which deploys [every month](/handbook/engineering/releases/)). We set the date for the security releases after the feature release, and we’re not always able to accurately pinpoint an exact release date within that seven-day window (due to manual processes that still exist and potential, unforeseen delays that can arise).

* We often perform critical security releases ad-hoc, especially in cases involving a great deal of urgency. In these scenarios, providing a pre-announcement is difficult and could even delay a critical fix, putting our customers at risk. Instead, we typically release as soon as we have a fix and notify via our [security notices mailing list](/company/contact/).

We understand security releases and critical fixes aren’t always convenient for our users. We’re continuing to review and refine our communications processes surrounding critical security incidents and have set a goal of a [6 hour window for turnaround on customer communications related to an S1 severity vulnerability](/handbook/security/security-operations/sirt/security-incident-communication-plan.html#turnaround-on-customer-messaging) to get critical information into users’ hands as soon as possible.

**The best way to stay on top of security releases and critical fixes is to subscribe to our [security notices mailing list](/company/contact/).**

**Can GitLab team members access private repositories?**

Yes. GitLab, Inc Customer Support requires access to customer repositories hosted on gitlab.com, however team members will not access private repositories unless required for support and troubleshooting. Forms of access include, but are not limited to, [impersonation](https://docs.gitlab.com/ee/administration/admin_area.html#user-impersonation). When working on a support issue, we strive to respect your privacy as much as possible. Once we've [verified account ownership](/handbook/support/workflows/account_verification.html), we will only access the files and settings needed to resolve your issue. Support may sign into your account to access configurations but we will limit the scope of our review to the minimum access required to solve your issue. In the event we need to pull a clone of your code, we will only do so with your consent. All cloned repositories are deleted as soon as the support issue has been resolved. There are two exceptions to this policy on accessing private repositories: we are investigating a suspected violation of our [terms of service](/terms/) or we are compelled to access repositories as part of a legal or security matter.

**Can GitLab be hardened?**

Yes. GitLab can be hardened and we have released information for that. It's available in blog posts and our documentation. See [Hardening Your GitLab Instance](/security/hardening/index.md) for more information.

## Getting More information

The [Customer Assurance Package](https://about.gitlab.com/security/cap/) was designed to allow the anyone to review and evaluate GitLab's security posture. 

This FAQ applies solely to our Software as a Service (SaaS); GitLab.com.

You can sign up for security notices [here](https://about.gitlab.com/company/contact/)

