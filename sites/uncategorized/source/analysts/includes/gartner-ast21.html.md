---
layout: markdown_page
title: "Gartner 2021 Magic Quadrant for Application Security Testing"
description: "This page shares how Gartner positioned us on the Magic Quadrant and viewed our application testing capabilities in relation to the larger market."
canonical_path: "/analysts/gartner-ast21/"
noindex: true
---
## GitLab and the Gartner Magic Quadrant for Application Security Testing, 2021
This page outlines how Gartner positions GitLab in their Magic Quadrant for Application Security Testing Magic Quadrant, 2021, how Gartner views our capabilities in relation to the larger market, and how GitLab is working with that information in our ongoing product evolution.

### Gartner Perspective on the Market and GitLab

**Gartner Market Definition**

In the published document, “Gartner defines the application security testing (AST) market as the buyers and sellers of products and services designed to analyze and test applications for security vulnerabilities."

**Gartner view of GitLab**

In this report, GitLab is named as a Challenger in an evolving AST market where we believe the major driver in the evolution is the need to support enterprise DevOps initiatives. They characterize the evolution where, “Customers require offerings that provide high assurance, high-value findings, while not unnecessarily slowing down development efforts. Clients expect offerings to fit earlier into the development process, with testing often driven by developers rather than security specialists."

### GitLab's Commentary on this Report

We are thrilled to be recognized by Gartner as a Challenger in the 2021 Magic Quadrant for Application Security Testing report and excited to see our unique and holistic take on embedding security into the DevOps workflow validated, in our opinion, by industry experts. GitLab believes our recognition as a Challenger in the Magic Quadrant represents a growing market understanding of the value of an approach that empowers and enables developers to find and fix vulnerabilities within their natural workflow while eliminating friction with the security team and providing earlier insight into application risks. 

As an end-to-end DevSecOps Platform that includes not only Source Code Management, but also [industry-leading Continuous Integration (CI)](https://about.gitlab.com/analysts/forrester-cloudci19/) and recognized [Security capabilities](https://about.gitlab.com/solutions/dev-sec-ops/), GitLab is uniquely positioned to [seamlessly unite security and DevOps](https://about.gitlab.com/solutions/dev-sec-ops/). Our DevSecOps platform is the end-to-end secure software factory that helps you plan, create, deploy, secure, and manage your modern software and the infrastructure upon which it relies. GitLab provides the visibility and controls necessary to not only create more secure software but also to protect the integrity of your software factory and its deliverables.


### Product Highlights

This year, GitLab has moved from Niche Player to the Challengers Quadrant on the basis of ability to execute and completeness of vision. 

We are delighted to see such a reaction to the past year’s work. During that time, we’ve focused on key areas of application security testing and vulnerability management:

_**Comprehensive, integrated security testing for the developer**_

With GitLab Ultimate, all of our security scanners are seamlessly integrated into the CI pipeline. They are run at both code commit and upon merge and can also be run on-demand outside of a pipeline. When run in the pipeline, vulnerabilities are shown for the “diff” (differential, or incremental code change), allowing the developer to see vulnerabilities they created (without noise from ones they did not) while they are still iterating on the code and best able to efficiently resolve them.  

_**Policy Automation provides guardrails**_

It’s not enough to automate the process of scanning. When and how policies are applied, and how exceptions are handled, also needs to be automated to bring consistency and auditability. GitLab provides a broad range of policies and [common controls for compliance](https://docs.gitlab.com/ee/administration/compliance.html). A couple of favorites include: [MR approvals](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/) that allow you to determine what will fail a build and require active approval by an individual or a group; [Compliance Frameworks](https://docs.gitlab.com/ee/user/project/settings/index.html#compliance-frameworks)  which require a compliant CI template be used ensuring required scans are performed; and, [Audit Events](https://docs.gitlab.com/ee/administration/audit_events.html) which show who changed what, where, when across the entire lifecycle. You can read more relative to [securing your software supply chain](https://www.linkedin.com/feed/update/urn:li:activity:6793547455918157824/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base%3BucXFhlzmT%2B2rxpvAOh1c5A%3D%3D&licu=urn%3Ali%3Acontrol%3Ad_flagship3_profile_view_base-featured_item_detail_view) and watch [this webinar](https://www.youtube.com/watch?v=7xd1bBOn9JI) to see a demo of the relevant features in action.

_**Earlier visibility into security risks**_

In the past year, we have matured the tools we provide for the security pro too. The [Security Dashboard](https://docs.gitlab.com/ee/user/application_security/security_dashboard/) shows trends over time and, at the group level, highlights projects with the most risk via an A-F score card. [Vulnerability management](https://docs.gitlab.com/ee/user/application_security/vulnerability_report/) provides a unified view of vulnerabilities from all scan types as soon as the developer merges their code. Like the dashboard, this also is at the project level, group of projects, or across the entire GitLab instance.

_**Breaking down silos between Dev and Sec**_

Having one tool for both developers and security pros can unite efforts and improve collaboration. A single source of truth is more efficient and things don’t get lost in translation between tools. When a vulnerability is found, the developer or the security pro can open a confidential issue with one click. The issue remains tied to the vulnerability making it super easy to see the state of remediation efforts and to comment/collaborate on the resolution.

_**All-in-one, but use what you need**_

GitLab makes it simple to embrace our security capabilities. As a single platform, we offer all the GitLab capabilities (SCM, CI/CD, Security, and more) to the user for one price and one product. Subscriptions can be [purchased by tier](https://about.gitlab.com/pricing/), starting with the Free tier (intended for individual users), Premium tier (intended for small/medium businesses), and [Ultimate tier](https://about.gitlab.com/pricing/ultimate/) (intended for Enterprises with more sophisticated requirements and scale). You will find [Static Application Security Testing (SAST)](https://docs.gitlab.com/ee/user/application_security/sast/) and Secret Detection in the Free tier and all of the [other scanners](https://docs.gitlab.com/ee/user/application_security/) (DAST, Dependencies, Containers, License compliance, API fuzzing, coverage-guided fuzzing) and dashboards (security, compliance, [value stream management](/solutions/value-stream-management/)), as well as [Dependency Lists](https://docs.gitlab.com/ee/user/application_security/dependency_list/index.html) in GitLab Ultimate. If you haven’t tried Ultimate, check out the [Free Trial](https://about.gitlab.com/free-trial/).

Because of the strength of our security capabilities, we do have customers using GitLab for security alone while continuing to use other SCM and CI products. We meet our customers where they are. [We can integrate](https://docs.gitlab.com/ee/integration/) with other products, [including other securing scanners](https://docs.gitlab.com/ee/development/integrations/secure.html), (pulling their vulnerability findings into our pipeline and dashboards), or we can replace them. The choice is yours.

### What's Next
We’re excited about our unique ability to lead the application security testing market into a new frame of thinking that harnesses the software factory to create more secure code while better protecting the factory itself.  We continue to mature our security testing and vulnerability management capabilities with almost 25% of our R&D budget devoted to these areas. It’s wonderful to see some of the world’s largest enterprises in the most regulated industries moving to GitLab for our security capabilities and the unique perspective we bring. These organizations are able to break down departmental silos, empower cross-functional teams achieve transparency end-to-end in their DevOps lifecycle.

With GitLab, “Everyone Can Contribute”. We invite you to contribute to our [product direction](https://about.gitlab.com/direction/secure/) and [roadmap](https://about.gitlab.com/direction/secure/#upcoming-releases) which we share publicly. Issues listed under upcoming releases are actual issues (aka stories) assigned to engineers. Please converse with them directly in the issue to share your feedback.


_Gartner, Magic Quadrant for Application Security Testing, Dale Gardner, Mark Horvath, Dionisio Zumerle, 27 May 2021._
{: .note .font-small .margin-top40}

_Gartner does not endorse any vendor, product or service depicted in its research publications, and does not advise technology users to select only those vendors with the highest ratings or other designation. Gartner research publications consist of the opinions of Gartner’s research organization and should not be construed as statements of fact. Gartner disclaims all warranties, express or implied, with respect to this research, including any warranties of merchantability or fitness for a particular purpose._
{: .note .font-small}
