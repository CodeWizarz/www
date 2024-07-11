---
layout: markdown_page
title: "Product Direction - Service Desk"
description: "Connect users and customers of your product to support"
canonical_path: "/direction/service_management/service_desk/"
---

## On this page

{:.no_toc}

- TOC
{:toc}

## Service Desk

| | |
| --- | --- |
| Stage | [Service Management](/direction/service_management/) |
| Maturity | [Viable](/direction/maturity/) |
| Content Last Reviewed | `2023-06-01` |

### Overview

Service desk is a point of contact between users and service providers. It captures the demand for incident resolution and service requests.

We view the service desk as an integral part of GitLab. Developers use GitLab to create, launch, and operate software products. When there is a demand service requests, questions about the software, or other forms of feedback from users of the product, we want the feedback loop to be efficient and seamless. GitLab Service Desk is responsible for bringing these requests directly to the developers all within the same platform.

Furthermore, beyond shortening the feedback loop for developers, in alignment with [GitLab's 10-year vision](/company/vision/#vision), we want GitLab to be a general service desk for all users of the platform.  

### Vision

Provide a complete, yet lightweight and customizable customer support solution that seamlessly integrates with the GitLab ecosystem and brings customers, support staff, and developers closer together.

### Mission

- Make Service Desk useful for professional support teams so they efficiently and effectively work through their support issues.
- Helping organizations build a professional and on-brand customer support workflow that grows with the business.
- Making Service Desk an integral part of the GitLab support workflow by providing the tools our teams need.
- Helping managers and support ops automate repetitive tasks for their support staff.
- Increase awareness of the capabilities of GitLab Service Desk and how it can help our customers handle customer support.

### Strategy and Themes
<!-- Capture the main problems to be solved in the market (themes). Describe how you intend to solve these with GitLab (strategy). Provide enough context that someone unfamiliar with the details of the category can understand what is being discussed. -->

#### Themes

Service desk solutions should be able to solve the following problems:

1. **Intake:** Provide channels for access. Depending on the use case, channels may include forms, phone, service portals, mobile applications, chat, emails, walk-ins, sms, social media, and public and corporate forums. The intake of service requests should assist in capturing the requisite details for resolution.
1. **Ticket Management:** Service agents need a tool to understand the request, understand the timeline, collaborate with teammates, log the request, consider additional information, and resolve the request.
1. **Queue Management:** Service agents should have the tools that enable them to work on the next appropriate ticket.
1. **Trigger and Automation:** Help agents be efficient and enable requesters to self-service.
1. **Reporting & Analytics:** Provide reporting capability and the ability to analyze trends and outcomes.

#### Strategy

[GitLab Service Desk](https://docs.gitlab.com/ee/user/project/service_desk/) is built on top of existing GitLab capabilities, including [work item types](https://docs.gitlab.com/ee/development/work_items.html), [CI](https://docs.gitlab.com/ee/ci/), [Quick Actions](https://docs.gitlab.com/ee/user/project/quick_actions.html), Analytics Dashboards, and more. We intend to leverage the capabilities built for DevOps use cases and add enhancements to efficiently address the needs of a service desk solution.

We plan to focus initially to introduce a new [work item "ticket"](https://gitlab.com/groups/gitlab-org/-/epics/10419). This will enable us to differentiate from generic GitLab issues, streamline the UI by removing unnecessary elements, add useful enhancements, and create the corner-stone to build additional capabilities. 
After establishing the new fundamental service desk work unit, we will move on to build out other [essential Service Desk capabilities](https://gitlab.com/groups/gitlab-org/-/epics/8769).

##### Target Segmentation

Service desk, in the software context, provides value to software teams large and small. We currently have the following segmentation:

1. Enterprise software vendor supporting enterprise software customers. The service desk agent is a full-time support engineer.
1. Enterprise software teams have internal customers and need to provide support to the users. The developers play the role of support.
1. SMBs or single developers providing support to the users of their product or software project. The developers play the role of support.

We ultimately plan to offer a delightful service desk experience to all three segments. We hypothesize that as we are building out the missing essential service desk capabilities, GitLab Service Desk is a better fit for SMBs and potential enterprise teams with internal customers. We can begin to target enterprise users once GitLab Service Desk reaches complete maturity.

### 1-year plan

Below is our 4-Quarter Rolling Roadmap

<!-- Roadmap should be updated at least quarterly -->

| FY24'Q2 (May-Jul 2023) | FY24'Q3 (Aug-Oct 2023) | FY24'Q4 (Nov'23-Jan'24) | FY25'Q1 (Feb-Apr 2024) |
|------------------------|------------------------|-------------------------|------------------------|
| [MVC for Service Desk Work Item](https://gitlab.com/groups/gitlab-org/-/epics/10419) | [Improvements to Service Desk Lists](https://gitlab.com/groups/gitlab-org/-/epics/10706) | [Triggers](https://gitlab.com/gitlab-org/gitlab/-/issues/413709) | [Automation](https://gitlab.com/gitlab-org/gitlab/-/issues/413710) |
| | [SLA](https://gitlab.com/groups/gitlab-org/-/epics/8828) | Real-time collision detection | [Custom Meta Data](https://gitlab.com/groups/gitlab-org/-/epics/10442) |

Please note, this table only includes thematic epics or major features. It is not meant to be a precise, or exhaustive list of work we plan to do. For planning details, please reference our [planning issues](https://gitlab.com/gitlab-org/monitor/respond/-/issues/?sort=closed_at&state=opened&search=Planning%20issue).

##### What is next for us

<!-- We list the next 3 planning issues here. This section should be updated monthly. We also list major themes that we are working on next. -->

- [16.1 (2023-05-22 to 2023-06-22)](https://gitlab.com/gitlab-org/monitor/respond/-/issues/208)
- [16.2 (2023-06-22 to 2023-07-22)](https://gitlab.com/gitlab-org/monitor/respond/-/issues/209)
- [16.3 (2023-07-22 to 2023-08-22)](https://gitlab.com/gitlab-org/monitor/respond/-/issues/245)

In addition to various value-adding features, the main focus for us in FY24'Q2 is to establish the Service Desk Work Item. To do this, in 16.1, we are [spiking](https://gitlab.com/gitlab-org/gitlab/-/issues/412055) on what it takes to build on the work items framework and how we might iterate towards a production Service Desk ticket. The outcome of this exercise is to create an iteration plan that we will execute on in 16.2 and 16.3. 

##### What we recently completed

- Wrap up previous in-flight work on Incident Management
- Complete [Metrics Deprecation and Removal](https://gitlab.com/groups/gitlab-org/-/epics/10107)
- Complete [Self-monitoring Deprecation and Removal](https://gitlab.com/groups/gitlab-org/-/epics/10030)
- Improvements to Service Desk capabilities around variable placeholders and attribution of title and comments to external users

#### What is Not Planned Right Now
<!--  Often it's just as important to talk about what you're not doing as it is to
discuss what you are. This section should include items that people might hope or think
we are working on as part of the category, but aren't, and it should help them understand why that's the case.
Also, thinking through these items can often help you catch something that you should
do. We should limit this to a few items that are at a high enough level so
someone with not a lot of detailed information about the product can understand -->

TBD

#### Top [1/2/3] Competitive Solutions
<!-- PMs can choose to highlight a primary BIC competitor--or more if no single clear winner in the category exists; in this section, we should indicate: 1. name of a competitive product, 2. links to marketing website and documentation, 3. why we view them as the primary BIC competitor -->

##### [Atlassian Jira Service Management](https://www.atlassian.com/software/jira/service-management)

Atlassian very successfully pivoted Jira project management and issue tracking into Jira Service Management. We view them as the exemplary case of having transitioned from a software planning tool to tackling the much larger market of ITSM. The way Atlassian started was to implement service desk on top of existing Jira capabilities.

##### [Zendesk](https://www.zendesk.com/)

Zendesk is a powerful service desk tool with broad market appeal. It is the feature complete service desk tool that we also use at GitLab for external customer support. 

##### [ServiceNow](https://www.servicenow.com/)

ServiceNow is a dominant player in ITSM and offers a comprehensive enterprise solution with service desk, along with other management and workflow tools built in. 

### Target Personas
<!--
List the personas (https://about.gitlab.com/handbook/marketing/strategic-marketing/roles-personas#user-personas) involved in this category.

Look for differences in users' goals or uses that would affect their use of the product. Separate users and customers into different types based on those differences that make a difference.
-->

1. [Sasha (Software Developer)](https://about.gitlab.com/handbook/product/personas/#sasha-software-developer) - Software developers may be directly responsible to support the software they built, such as for internal tools. This is the persona GitLab Service Desk supports today.
1. Support Engineer - These engineers are the customer-facing representatives of the business and want to be able to efficiently resolve problems as they arise. They are frustrated by manual steps which divert their focus from solving real problems for the customers they serve and strive to represent their company in the best way possible. This is the longer-term target persona for GitLab Service Desk.

### Pricing and Packaging

Service Desk is currently available in the free tier.

#### Free

- Email intake
- Single external participant

#### Premium

- Multiple external participants
- SLAs

#### Ultimate

TBD

#### Other

- CI powered automations

### Analyst Landscape

TBD
