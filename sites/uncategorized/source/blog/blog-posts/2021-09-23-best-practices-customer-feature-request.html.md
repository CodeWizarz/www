---
title: How to incorporate private customer needs into a public product roadmap
author: Christina Hupy and Neil McCorrison
author_gitlab: c_hupy and nmcorrison
categories: engineering
tags: workflow, features, customers, collaboration
description: "We've had lots of experience documenting and tracking private customer feature requests effectively. Here's our best advice and how to get the most out of GitLab issues and issue trackers."
twitter_text: "Everyone has customer feature requests. Here's how we handle them using @gitlab's issues and trackers"
featured: no
postType: content marketing
related_posts:
---

Effectively communicating a customer’s private needs to product teams is essential to a product’s success, but it can be a tricky undertaking.

Teams can face several challenges in communicating and tracking customers' requests, including protecting customer confidentiality, tracking priority and progress, and making sure the product team is getting actionable feedback that can be incorporated into product milestones.

This blog post shares GitLab's best practices and lessons learned, as well as a video conversation between GitLab CEO [Sid Sijbrandij](/company/team/#sytses) and Fleet CEO [Mike McNeil](https://www.linkedin.com/in/mikermcneil/).

In line with GitLab's [open core model](/company/stewardship/) and [transparency value](/handbook/values/#transparency), our product roadmap is public and the product team uses [public issue trackers](/gitlab-com/Product/-/issues) for feature requests and to plan the work. Because the issues are public, customers and community members can see how the product team works, what direction we are headed, and what the priorities are. Contributors can even decide to create a feature themselves.

Ever wonder what a DevOps Platform could do for your team? [Here's what you need to know](/solutions/devops-platform/)

When a customer indicates a feature request to a technical account manager (TAM), the manager searches for the relevant open feature request in the product teams' issue tracker and adds a comment with generic details about the customer such as number of users and product. If an issue for that feature request does not already exist, the technical account manager can create an issue with the [Feature Proposal](https://gitlab.com/gitlab-org/gitlab/-/issues/new?issuable_template=Feature%20Proposal%20-%20lean) issue template then and add the customer’s request as a comment.

For example, the comment should include the following:

> Hello `@product-manager`,  an Ultimate customer with 1500 users (`salesforce-link`) would like to see this feature prioritized, ideally within the next 6 months. They need this feature in order to X, which is important to them because Y, and they do not currently have a workaround. Additionally, releasing this feature would result in an estimated 250 additional users.

The TAM includes a link to the account in the customer relationship management system (CRM), in GitLab’s case Salesforce, so the internal teams can view the details. We even have a [feedback template](/handbook/product/how-to-engage/#feedback-template) to ensure the proper details are captured in the comment. The comment is public but the record in the CRM is private.

The product manager reviews the request and responds. Relevant [labels](/handbook/customer-success/csm/product/#priority-of-feature-requests) are added based on priority. For example, labels include **critical requests**, **high-priority requests**, **low priority requests** or **promised to a customer**. Milestones can be assigned to track timelines and make sure the feature ships on time. The feature tracking issue should be maintained regularly and acts as the single source of truth on the customer needs. These issues can also be reviewed for metrics on previously delivered feature requests.

**Elevating your DevOps skills? Join us at [Commit at KubeCon - Oct. 11!](/events/commit/)**

In this case, a noisy feature request issue with comments from customers is a good thing. It helps the product manager directly see where the action is and how customers would benefit, and it also helps when prioritizing what feature ships next. Seeing direct input from the customers provides context and also creates developer empathy and connection with the end user. Additional team members, including [solution architects](https://handbook.gitlab.com/job-families/sales/solutions-architect/) find it useful to subscribe to these issues, keeping them automatically updated on progress and discussion by the product team.

**Getting the product team involved early on is essential** to the success of this workflow. Another essential element is that the CSMs bring their customers'feedback directly to the issue where the work is being planned and prioritized.

**Contributing to GitLab:**   Once a product manager has triaged an issue and applied the appropriate [Product Development Workflow](/handbook/product-development-flow/) labels, it may be deemed that the feature is ready for the customer or community to help build the feature directly. Our motto is "Everyone Can Contribute", and the ~"Accepting Merge Requests" label ([handbook](/handbook/engineering/quality/triage-operations/#sts=Accepting%20merge%20requests)) is a great way to identify when a feature is ready for a community contribution. Customers who wish to contribute back to GitLab can ask for a [Merge Request Coach](https://handbook.gitlab.com/job-families/expert/merge-request-coach/) to help guide them through the process to ensure timely review and alignment with our engineering best practices.

GitLab learned early on that creating a separate issue for customer feedback can get complicated and ends up being disjointed from where the product managers are doing their work.

In summary, best practices for delivering customer feature requests to the product team include:

* Ensure the feedback is directly where the product managers are working and prioritizing features.
* Provide only generic details on the customer with a link to internal confidential information, but provide as much detail as possible regarding the customer's use case and business need.
* Share the feature request issue back with the customer. If they feel inclined, they can comment and add details. This builds trust between the customer, their account team, and the product team.
* Labels and milestones are essential for tracking. If something is critical to the customer, make sure the labels and milestones indicate as such.
* The feature request issue should act as the single source of truth for the customers' needs; aggregating this information elsewhere results in a disconnect between the need and the work.

Watch the full discussion between Sid and Mike:

<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/JH2cFhoUzsI" frameborder="0" allowfullscreen="true"> </iframe>
</figure>
Sid discussing GitLab's best practices on tracking customer feedback with Fleet CEO Mike McNeil
{: .note}

