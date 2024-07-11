---
layout: markdown_page
title: "Category Direction - Portfolio Management"
description: GitLab supports enterprise Agile portfolio and project management frameworks, including Scaled Agile Framework (SAFe), Scrum, and Kanban. Learn more!
canonical_path: "/direction/plan/portfolio_management/"
---

- TOC
{:toc}

## Portfolio Management

|                       |                               |
| -                     | -                             |
| Stage                 | [Plan](/direction/plan/)      |
| Maturity              | [Viable](/direction/maturity/) |
| Content Last Reviewed | `2023-10-09`

### Introduction and how you can help

Thanks for visiting this category direction page on Portforlio Management in GitLab. This page belongs to the [Product Planning](/handbook/product/categories/#product-planning-group) group of the Plan stage and is maintained by Amanda Rueda [E-Mail](mailto:<arueda@gitlab.com>)  [Twitter](https://twitter.com/amandamrueda).

This direction page is a work in progress, and everyone can contribute:

 - Please comment and contribute in the linked [issues](https://gitlab.com/groups/gitlab-org/-/issues/?sort=created_date&state=opened&label_name%5B%5D=Category%3APortfolio%20Management&first_page_size=100) and [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=Category:Portfolio+Management). Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.
 - If you're a GitLab user and want to discuss how GitLab can improve Portfolio Management tools, we'd especially love to hear from you! 


## Strategy and Themes
GitLab's vision is to provide tools that help our customers manage a portfolio of work and determine which opportunities have higher ROI when making strategic business planning decisions. 

Enterprises work on complex initiatives that cut across multiple teams and departments, often spanning months, quarters, and even years. We support organizing initiatives into  multi-level plans. We enable organizations to track efforts in flight and plan upcoming work to best utilize their resources and focus on the right priorities. 

GitLab supports popular [enterprise Agile portfolio and project management frameworks](https://about.gitlab.com/solutions/agile-delivery/), including Scaled Agile Framework [(SAFe)](https://about.gitlab.com/solutions/agile-delivery/scaled-agile/), [Scrum, and Kanban](https://about.gitlab.com/solutions/agile-delivery/).


|  Multi-level planning        |      Roadmaps    |    Kanban      |
| ---      | ---      | ---      |
| ![epicstree-direction.png](/direction/plan/portfolio_management/epic_tree_2023.png)  | ![roadmap_2023.png](/direction/plan/portfolio_management/roadmap_2023.png)   |![epic_board_2023.gif](/direction/plan/portfolio_management/epic_board_2023.gif)|

### UX Themes

These UX Themes represent the JTBD we've decided are the most important for our users. We're working on features that improve on the ability to accomplish these goals.

|Theme|[Persona](https://about.gitlab.com/handbook/product/personas/)|[JTBD](https://about.gitlab.com/handbook/product/ux/jobs-to-be-done/deep-dive/)|
|---|---|---|
|Support product managers in configuring and sharing hierarchy of work items to increase alignment in how planned work is driving larger goals|[Parker](https://about.gitlab.com/handbook/product/personas/#parker-product-manager)|When visualizing the plan of how my strategy will be implemented, I want to display how prioritized items cascade up toward larger vision and business objectives, so I can increase alignment on the overall impact and importance of even the most granular items within my plan. |
|Allow teams to group or relate work items to increase alignment on dependencies or related work.|[Parker](https://about.gitlab.com/handbook/product/personas/#parker-product-manager) <br><br> [Delaney](https://about.gitlab.com/handbook/product/personas/#delaney-development-team-lead) |When splitting prioritized initiatives or features into requirements, I want to group related slices of value and surface dependencies, so I can maximize alignment on the scope of a business goal and efficiently plan its incremental delivery.|
|Decrease effort and time it takes for teams to identify and monitor impediments so that they may be better mitigated. |[Delaney](https://about.gitlab.com/handbook/product/personas/#delaney-development-team-lead)  |When reviewing a plan, I want to identify and enable continual monitoring of high risk items, so I can maintain effectiveness of mitigation plans, even as they evolve.|
| Allow product managers to visualize and share progress and completion of goals in order to increase trust with stakeholders|[Parker](https://about.gitlab.com/handbook/product/personas/#parker-product-manager)  |When implementing to a plan, I need to monitor progress (velocity) so I can demonstrate that the team is efficiently capturing value for our stakeholders. |
|Increase alignment of teams by allowing them to visualize status of work within a workflow |[Parker](https://about.gitlab.com/handbook/product/personas/#parker-product-manager) <br><br> [Delaney](https://about.gitlab.com/handbook/product/personas/#delaney-development-team-lead) | When collaborating with a team or stakeholders, I want to communicate the current status of work continuously, so I can increase alignment on progress and any impediments that need to be addressed.|
|Support teams in managing their capacity to increase predictability | [Delaney](https://about.gitlab.com/handbook/product/personas/#delaney-development-team-lead) | When planning a release, I want to prioritize and sequence estimated work based on feasibly, capacity, and ROI, so I can incrementally deliver toward business objectives.|
|Empower users to prioritize work that best drives value|[Parker](https://about.gitlab.com/handbook/product/personas/#parker-product-manager)  | When reviewing proposed initiatives, I want to categorize opportunities based on how efficiently they drive the success of business objectives, so I can increase confidence in items I have prioritized, and feel empowered to say no to less impactful ideas. |
|Increase alignment of teams by allowing teammates to easily update others on progress or status either manually or automatically |[Sasha](https://about.gitlab.com/handbook/product/personas/#sasha-software-developer) | When collaborating with a team or stakeholders, I want to maintain transparency to the status of work, to enable others to self-serve that information, and so I can increase alignment on progress and any impediments that need to be addressed.|
| Support product teams in crafting a SSOT with well-documented requirements|[Parker](https://about.gitlab.com/handbook/product/personas/#parker-product-manager) |When planning a release, I want to prioritize and sequence estimated work based on feasibly, capacity, and ROI, so I can incrementally deliver toward business objectives. |

### 1 Year Roadmap

Our 1 year focus is to provide planning solutions that provide visibility into the success of your plans, bridge the gap between different teams and empowers you to confidently make planning decisions. By focusing on this direction, we aim to deliver a range of features that streamline your workflows and empower every user to contribute meaningfully. Let's delve into the roadmap and discover how it will transform your project management experience!

Currently, we are diligently working on achieving feature parity to enable the [migration of epics to work items](https://gitlab.com/groups/gitlab-org/-/epics/9290). This migration will leverage the powerful capabilities of the [work items framework](https://docs.gitlab.com/ee/architecture/blueprints/work_items/), which establishes a common backend for records such as epics and issues. By harnessing this framework, we can provide a consistent and streamlined experience across various planning workflows in GitLab.

The best part is that you, as a user, won't have to take any action—we will seamlessly migrate your data. You may notice some differences in the user interface, but rest assured, these changes will enhance your overall experience.

The work items framework brings several benefits to the table. First, it enables the reuse of components, allowing for more efficient development and deployment of new features. This means that our team can deliver enhancements at an accelerated pace, and users will have a more consistent experience. Second, the framework enables easier hierarchical aggregation of data, enabling better organization and management of complex projects. Third, it minimizes maintenance overhead, ensuring a more stable and reliable platform.

Once migrated to the work items framework, we will automatically unlock a wide array of enhancements that will significantly boost your productivity and efficiency. For example, adding Assignees or Design Management to Epics will be fairly low effort. It will also be much simpler to introduce additional work item types, like [Strategic Themes](https://scaledagileframework.com/strategic-themes/), to represent other critical objects in Portfolio Planning. 

Following the successful implementation of work items, we will shift our focus to [enhancing Enterprise Agile Planning workflows](https://gitlab.com/groups/gitlab-org/-/epics/7108). Our plan includes the implementation of our vision for [saved views and queries](https://gitlab.com/groups/gitlab-org/-/epics/5516), empowering you with advanced capabilities to manage and analyze your data effectively. 

The saved views and queries initiative aims to address user problems related to navigating and filtering data by creating a centralized experience which provides users with a single page where they can effortlessly create complex queries and view data in various formats such as lists, grids, boards, and roadmaps. We aim to streamline the user experience and empower users to customize their data visualization according to their specific needs. Additionally, users will have the ability to save their built queries for personal or team use, fostering collaboration and enhancing productivity. With this initiative, we expect users to easily access and manipulate data, visualize it in meaningful ways, and accomplish their tasks with improved efficiency and clarity.

![epicstree-direction.png](/direction/plan/portfolio_management/saved_view.png) 

Furthermore, we are committed to improving GitLab's roadmap experience by incorporating comprehensive delivery planning features that our users have expressed a strong desire for. You can explore these exciting features [here](https://gitlab.com/groups/gitlab-org/-/epics/2649#roadmap-features-users-want) and we encourage you to leave your valuable feedback as well as any suggestions for additional features that may not have been mentioned. Your input is essential in shaping the future of our product to better meet your needs.

Looking ahead, we'll begin to work on our long-term vision of expanding [dependency visibility](https://gitlab.com/groups/gitlab-org/-/epics/9742) throughout the planning and execution phases. With a comprehensive understanding of dependencies, you'll have better insights into potential bottlenecks and can proactively address them, create realistic and achievable roadmaps, align tasks and deliverables across teams and ultimately drive successful product development. 

In summary, our direction involves migrating to work items, which will bring numerous benefits to your experience. We are committed to continuously improving our platform, and our focus will shift to enhancing Enterprise Agile Planning workflows once the epic migration to work items is complete. With our upcoming initiatives, including saved views and queries and comprehensive delivery planning features, we aim to provide you with a powerful and intuitive portfolio management experience. Furthermore, improved dependency visibility will empower you with even greater insights, control, and trust in your product plans.


#### What we are currently working on

1. [Expose allowed children types for work items in API](https://gitlab.com/gitlab-org/gitlab/-/issues/378890). We will make the allowed relationships available to the API for users as well as for use in future picklists within the UI.
1. [Allow users to link work item records](https://gitlab.com/groups/gitlab-org/-/epics/7459). Similar to epics and issues, you will be able to link tasks and OKR records to one another using `related`, `blocked by` and `blocking` relationship types.
1. [Parent widget for the work items framework](https://gitlab.com/groups/gitlab-org/-/epics/11198). You will now be able to add or change the parent record within the work item record (tasks, OKRs) without having to navigate to a new page.
1. [Ancestry widget for the work items framework](https://gitlab.com/groups/gitlab-org/-/epics/11197). You will now be able to view the entire hierarchy lineage of the work item (tasks, OKRs) instead of just the immediate parent of the viewing record.



#### Next up

1. [Converting epics to work items](https://gitlab.com/groups/gitlab-org/-/epics/6033) - Epics and Issues have different data elements and behaviors, which leads to confusion for our users. Epics are only available at the group level, which significantly decreases their reach. We will collaborate with the Project Management group to build the capabilities that Epics need into the Work Items framework. Our first iteration of this was building the concept of parent/child relationships which was used for [tasks](https://docs.gitlab.com/ee/user/tasks.html#tasks). 
1. [Saved Queries and Views](https://gitlab.com/groups/gitlab-org/-/epics/5516) - It’s hard to query, save and share planning data with others. We plan to allow users to save a filtered list of their work item data so that they can easily come back to and share a list of work items. An example use cases is how at GitLab we frequently monitor our backlog for security issues and take that into account with every milestone plan. In the future, product managers and engineering team leads could have a shared saved query that surfaces all the security issues that have not been prioritized for their group.
1. Improvements to increase the maturity of [Roadmaps](https://gitlab.com/groups/gitlab-org/-/epics/2649) - Roadmaps are an industry standard way in which plans are visualized, and are key to an experience that is lovable by product and project managers. Key functionality like drag and drop editing are missing from our current implementation. 

#### What we recently completed

1. [Set parent quick action for work items](https://gitlab.com/gitlab-org/gitlab/-/issues/420798). You can now set a parent record via quick actions for work item records (tasks, objectives and key result). **16.5**
1. [Add child quick action for work items](https://gitlab.com/gitlab-org/gitlab/-/issues/420797). You can now add child work item records via quick actions. **16.5**
1. [Emoji quick action for work items](https://gitlab.com/gitlab-org/gitlab/-/issues/412275). React with an emoji via quick action for work item records (tasks, objectives and key result). **16.4**
1. [Quick action to set confidentiality for work items](https://gitlab.com/gitlab-org/gitlab/-/issues/412276). Set record confidentiality via quick action for work item records (tasks, objectives and key result). **16.4**
1. [Un/Subscribe quick action](https://gitlab.com/gitlab-org/gitlab/-/issues/420796). Turn on and off email notifications of a work item via quick action. **16.4**
1. [Add emoji reactions to comments on uploaded designs](https://gitlab.com/gitlab-org/gitlab/-/issues/29756). You can now express your thoughts more creatively by adding emoji reactions to comments in [Design Management](https://docs.gitlab.com/ee/user/project/issues/design_management.html). This feature adds a touch of fun and ease to collaboration, fostering better communication and enabling teams to provide quick feedback in a more expressive way. **16.3**
1. [Move Add button out of menu onto issue board list](https://gitlab.com/gitlab-org/gitlab/-/issues/399148): Based on feedback, we are returning the `Add` button to the issue board list. **16.3**
1. [Allow users to copy email and reference for work items](https://gitlab.com/gitlab-org/gitlab/-/issues/396553): Users will now be able to refer to a task or an OKR using the GitLab specific reference as well as create a comment for a task or OKR simply by sending the comment by email to the work item's email destination. **16.2**
1. [Quick action for unblocking issues](https://gitlab.com/gitlab-org/gitlab/-/issues/414400): As a follow-up to [adding a quick action for blocking issues](https://gitlab.com/gitlab-org/gitlab/-/issues/214232), we are now adding a feature to allow users to unblock issues via a quick action. **16.1**




#### What is Not Planned Right Now

In the next two years:
- We plan to build a flexible planning tool that can be configured to implement SAFe. We do not plan to implement a system that is optimized for SAFe only. 
- In order to meet the Portfolio Management vision described in this page, we have decreased investment in our Requirements Management, Test Management and Design Management categories. We will continue to address defects and support community contributions but we are not planning to make significant improvements. 


## Best in Class Landscape
<!-- Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" -->

BIC (Best In Class) is an indicator of forecated near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape.

### Key Capabilities 

| Feature |Description |
| ------ |------|
| Portfolio financial management  |Visibility and insight into funding capacity rather than projects. Instead of determining how much it will cost to achieve the next two milestones, managers determine how much capacity is required to deliver a consistent flow of value. | 
|Portfolio level planning |  Identifying which programs to invest in, and how much. Portfolios are largely trying to figure out what initiative to fund, based on when the previous one is scheduled to finish.    | 
| Program level planning  |  Breaking large deliverables into chunks that make sense for each team and coordinating the teams' work. Programs need to worry about dependencies and coordination.   | 
| Enterprise agile framework (including SAFe) |SAFe support includes the processes, roles, and artifacts that enable scaling across teams, and the ability to plan and track work and assess economic benefits using at a minimum Portfolio SAFe in SAFe v. 5.0. EAP tools may support multiple enterprise agile frameworks commonly used in the industry.|  
| Forecasting |[A forecast is a calculation about the future completion of an item or items that includes both a date range and a probability.](https://www.scrum.org/resources/blog/agile-forecasting-techniques-next-decade#:~:text=A%20forecast%20is%20a%20calculation%20about%20the%20future%20completion%20of%20an%20item%20or%20items%20that%20includes%20both%20a%20date%20range%20and%20a%20probability.) Forecasts take the progress to date of all of the programs, then make forward-looking predictions.  |
|Dependency management|Dependencies are the relationships between work that determine the order in which the work items (features, stories, tasks) must be completed by Agile teams. Dependency management is the process of actively analyzing, measuring, and working to minimize the disruption caused by intra-team and / or cross-team dependencies. |
| Roadmapping |  [Roadmaps are the glue that link strategy to tactics. They provide all stakeholders with a view of the current, near-term, and longer-term deliverables that realize some portion of the Portfolio Vision and Strategic Themes.](https://www.scaledagileframework.com/roadmap/#:~:text=Roadmaps%20are%20the%20glue%20that%20link%20strategy%20to%20tactics.%20They%20provide%20all%20stakeholders%20with%20a%20view%20of%20the%20current%2C%20near%2Dterm%2C%20and%20longer%2Dterm%20deliverables%20that%20realize%20some%20portion%20of%20the%20Portfolio%20Vision%20and%20Strategic%20Themes.)  _© Scaled Agile, Inc._  | 
| End-to-end visibility to the value stream  | This capability indicates the tool’s ability to show the progress of software throughout the value stream from ideation through to production realization of the customer and business value.|
| Collaboration  |  Collaboration tools have the highest value for distributed organizations. These tools can range from virtual boards and team rooms to threaded conversations or advanced, work-item-context chat tools.  |


### Top Competitive Solutions


1. [Jira Align](https://www.atlassian.com/software/jira/align/solutions). Jira Align (formerly known as AgileCraft) was acquired by Atlassian in early 2019. It's a cloud-based product that connects securely to one or more instances of Jira (of any flavour: Cloud, Server, or Data Center) to give insight into the state of play for all of the teams in an enterprise-level organisation. ([reference](https://www.adaptavist.com/blog/introduction-to-jira-align#:~:text=Jira%20Align%20(formerly,enterprise%2Dlevel%20organisation.)))
     - Based on strong reviews from Gartner, Forrester, Peer Insights, and my own user review, Jira Align is the **top competitor** in the Enterprise Agile Planning space due to its full support for enterprise agile frameworks such as SAFe, excellent roadmapping, forecasting, dependency management, and collaboration capabilities. While Planview and Digital.ai also scored high with analysts, I found their UX heavy and dated. Jira Align scores well in portfolio management functionality and usability.
1. [Planview AgilePlace](https://www.planview.com/products-solutions/products/agileplace/). Planview's solutions enable organizations to connect the business from ideas to impact, empowering companies to accelerate the achievement of what matters most. Planview’s full spectrum of Portfolio Management and Work Management solutions create an organizational focus on the strategic outcomes that matter and empower teams to deliver their best work, no matter how they work. The comprehensive Planview platform and enterprise success model enables customers to deliver innovative, competitive products, services, and customer experiences. Headquartered in Austin, Texas, with locations around the world, Planview has more than 1,000 employees supporting 4,000 customers and 2.4 million users worldwide. For more information, visit www.planview.com. ([reference](https://www.linkedin.com/company/planview/))
1. [Digital.ai](https://digital.ai/). Based out of Boston, Massachusetts, Digital.ai is an industry-leading technology company dedicated to helping Global 5000 enterprises achieve digital transformation goals. The company's AI-powered DevOps platform unifies, secures, and generates predictive insights across the software lifecycle. Digital.ai empowers organizations to scale software development teams, continuously deliver software with greater quality and security while uncovering new market opportunities and enhancing business value through smarter software investments. ([reference](https://www.linkedin.com/company/digitaldotai/about/#:~:text=Digital.ai%20is,smarter%20software%20investments.))

### GitLab opportunities

|Area of focus|GitLab|[Digital.ai](https://gitlab.com/gitlab-org/plan-stage/product-planning/competitive-research/-/issues/2#gitlab-vs-digitalai-agility-user-rating)|[Planview](https://gitlab.com/gitlab-org/plan-stage/product-planning/competitive-research/-/issues/3#gitlab-vs-planview-user-rating)|[Jira Align](https://gitlab.com/gitlab-org/plan-stage/product-planning/competitive-research/-/issues/4#gitlab-vs-jira-user-rating)|
|---|:---:|:---:|:---:|:---:|
| Portfolio financial management|⬜️ | 🟨|🟩 |🟨 |
| Portfolio level planning|⬜️ |🟩 |🟨 |🟨 |
| Program level planning| ⬜️|🟩 | 🟨| 🟩|
| Enterprise agile framework (including SAFe)| 🟨 |🟩 |🟩 |🟩 |
| Forecasting|⬜️ |🟨 |🟨 |🟩 |
| Dependency management| ⬜️ |🟨 |🟨 |🟩 |
| Roadmapping| 🟨 |🟩 |🟨 |🟩 |
| End to end visibility to the value stream|🟨 |🟩 |🟨 |🟩 |
| Collaboration|🟩 |🟨 |🟨 |🟩 |

- ⬜️  lacking 
- 🟨  needs improvement
- 🟩  excels


### Target Audience

- [Cameron, Compliance Manager](https://about.gitlab.com/handbook/product/personas/#cameron-compliance-manager)
- [Parker, Product Manager](https://about.gitlab.com/handbook/product/personas/#parker-product-manager)
- [Delaney, Development Team Lead](https://about.gitlab.com/handbook/product/personas/#delaney-development-team-lead)
- [Presley, Product Designer](https://about.gitlab.com/handbook/product/personas/#presley-product-designer)
- [Sasha, Software Developer](https://about.gitlab.com/handbook/product/personas/#sasha-software-developer)







