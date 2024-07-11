---
layout: markdown_page
title: "Category Direction - Review Apps"
description: Review Apps let you build a review process right into your software development workflow by automatically provisioning test environments for your code. 
canonical_path: "/direction/verify/review_apps/"
---

## Review Apps

| -                     | -                             |
| Stage                 | [Verify](/direction/verify/)      |
| Maturity              | [Complete](/direction/maturity/) |
| Content Last Reviewed | `2023-04-05`    |

### Introduction and how you can help
Thanks for visiting this category direction page on Review Apps in GitLab. This page belongs to the [Pipeline Execution](/handbook/product/categories/#pipeline-execution-group) group of the Verify stage and is maintained by Jackie Porter ([E-Mail](mailto:<jporter@gitlab.com>) | [Twitter](https://twitter.com/JRMeshell)).

This direction page is a work in progress, and everyone can contribute:

- Please comment and contribute in the linked [issues](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=updated_desc&state=opened&label_name%5B%5D=Category%3AReview%20Apps) and [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=Category:Review+Apps) on this page. Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.
- Please share feedback directly via email, Twitter, or on a video call. If you're a GitLab user and want to discuss how GitLab can improve Review Apps, we'd especially love to hear from you.

### Overview
Review Apps let you build a review process right into your software development workflow by automatically provisioning test environments for your code, integrated right into your merge requests. Not only can you enable your teammates to easily participate in the review, but you also can also shift additional activities left, such as running [DAST](/direction/secure/dynamic-analysis/dast/) in your review apps.  
 
### Strategy and Themes
<!-- Capture the main problems to be solved in market (themes). Describe how you intend to solve these with GitLab (strategy). Provide enough context that someone unfamiliar with the details of the category can understand what is being discussed. -->
Review Apps enable users to perform usability testing for any number of code changes, spanning the personas of product managers, release managers, designers, and software engineers in a single place. As an end to end application, we offer other features involving the designer in the DevOps lifecycle, including [Design Management](https://about.gitlab.com/direction/plan/design_management/) in the [Create](https://about.gitlab.com/direction/create/) stage. Review Apps also ties into our [progressive delivery](/direction/ops/#progressive-delivery-and-deployment) vision of CI/CD as it gives you a glipse of how  your application will look after a specific commit, way before it reaches production.

Our ultimate goal is that Review Apps should spin up with a one-click button that works automatically regardless of the deployment target (this includes cloud-native and mobile as well). Anyone can view, comment and even fix any errors found directly from the review app itself.
 
![Review Apps]( /images/direction/cicd/review-apps.png) 
 
This area of the product is in need of continued refinement to add more kinds of Review Apps (such as for mobile devices), and a more robust and efficient experience, including configuration improvements and usability enhancements.

<!-- ### 1 year plan 

This section is currently commented out due to Review Apps being in maintenance mode for FY24. -->

<!-- 1 year plan for what we will be working on linked to up-to-date epics. This section will be most similar to a "road-map". Items in this section should be linked to issues or epics that are up to date. Indicate relative priority of initiatives in this section so that the audience understands the sequence in which you intend to work on them. 
 -->

#### What is next for us
There are no new planned features in Review Apps for 2024. Pipeline Execution will support high priority bug fixes in this category as they arise. Please note: [Visual Reviews is deprecated and will be removed in 17.0](https://docs.gitlab.com/ee/update/deprecations.html#the-visual-reviews-tool-is-deprecated). 

<!-- #### What we are currently working on

This section is currently commented out due to Review Apps being in maintenance mode for FY24. -->

<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

<!-- #### What we recently completed

This section is currently commented out due to Review Apps being in maintenance mode for FY24. -->

<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

<!-- #### What is Not Planned Right Now

This section is currently commented out due to Review Apps being in maintenance mode for FY24. -->

<!--  Often it's just as important to talk about what you're not doing as it is to
discuss what you are. This section should include items that people might hope or think
we are working on as part of the category, but aren't, and it should help them understand why that's the case.
Also, thinking through these items can often help you catch something that you should
in fact do. We should limit this to a few items that are at a high enough level so
someone with not a lot of detailed information about the product can understand -->

### Best in Class Landscape
<!-- Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" -->

BIC (Best In Class) is an indicator of forecasted near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape.

#### Key Capabilities 
<!-- For this product area, these are the capabilities a best-in-class solution should provide -->
Customers utilizing microservice architectures find it challenging to manage the pre-production environments needed to validate changes before they are shipped. While Review apps are great for single services it can be difficult to support a microservice architecture like this or applicates in which multi project pipelines are utilized to deploy the service(s). Two issues designed to address some of these challenges with Review Apps are:
 
* [Allow Review Apps to leverage a downstream deployment project](https://gitlab.com/gitlab-org/gitlab/-/issues/13249)
* [Multiple URL support for Review Apps](https://gitlab.com/gitlab-org/gitlab/-/issues/276905)

[gitlab#235686](https://gitlab.com/gitlab-org/gitlab/-/issues/235686) extends support for review apps from a child pipeline when using [parent-child pipelines](https://docs.gitlab.com/ee/ci/parent_child_pipelines.html).

We see additional opportunities to [improve the Review Apps user experience](https://gitlab.com/groups/gitlab-org/-/epics/5918) and enable faster code reviews. 

#### Roadmap
<!-- Key deliverables we're focusing on to build a BIC solution. List the epics by title and link to the epic in GitLab. Minimize additional description here so that the epics can remain the SSOT. This may be duplicative to the 1 year section however for some categories the key deliverables required to become the BIC solution will extend beyond one year and we want to capture all of the gaps. Moreover, the 1 year section may contain work that is not directly related to closing gaps if we are already the BIC or if we are differentiating ourselves.-->
The next set of features we are considering are captured in the [Review Apps to Lovable epic](https://gitlab.com/groups/gitlab-org/-/epics/6943).

#### Top 3 Competitive Solutions
<!-- PMs can choose to highlight a primary BIC competitor--or more, if no single clear winner in the category exists; in this section we should indicate: 1. name of competitive product, 2. links to marketing website and documentation, 3. why we view them as the primary BIC competitor -->

##### Heroku
One big advantage Heroku Review Apps have over ours is that they are easier to set up and get running. Ours require a bit more knowledge and reading of documentation to make this clear. We can make our Review Apps much easier (and thereby much more visible) by
implementing [One button to enable review apps, auto-edit `.gitlab-ci.yml`, auto-configure GKE](https://gitlab.com/groups/gitlab-org/-/epics/2349), which does the heavy lifting of getting them working for you.

##### Netlify Deploy Previews
Netlify Deploy Previews provide functionality similar to Review Apps and work with both GitLab and GitHub. Combined with their notifications capabilities this provides a compelling way to share a preview of changes with intersted stakeholders as they are happing. Netlify also provides the ability to let any user leave comments on these deploy previews as noted on the Usability Direction Page.
 
##### Vercel Previews
Vercel is a newer product with a suite of features focused on the web developer, including Previews. Their product is compatible with GitLab, GitHub, and BitBucket. Vercel recently launched [commenting on previews](https://vercel.com/blog/introducing-commenting-on-preview-deployments), which is similar to our [Visual Review Tool](https://docs.gitlab.com/ee/ci/review_apps/#visual-reviews). We are evaluating the Previews as part setting our category direction. 

<!--### Target Audience -->
<!--
List the personas (https://about.gitlab.com/handbook/marketing/strategic-marketing/roles-personas#user-personas) involved in this category.

Look for differences in user's goals or uses that would affect their use of the product. Separate users and customers into different types based on those differences that make a difference.
-->

<!-- ### Pricing and Packaging

-->

<!-- ### Analyst Landscape

-->




