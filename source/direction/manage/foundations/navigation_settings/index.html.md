---
layout: markdown_page
title: "Category Direction - Navigation & Settings"
description: "This is the Product Direction Page for the Navigation and Settings patterns within GitLab."
canonical_path: "/direction/manage/foundations/navigation_settings/"
---

- TOC
{:toc}

## Navigation & Settings

|                       |                               |
| -                     | -                             |
| Stage                 | [Manage](/direction/manage/)  |
| Maturity              | N/A |
| Content Last Reviewed | `2023-08-11`                  |

### Introduction and how you can help
<!-- Introduce yourself and the category. Use this as an opportunity to point users to the right places for contributing and collaborating with you as the PM -->

Thanks for visiting this direction page on the Navigation & Settings category at GitLab. This page belongs to the [Foundations Group](https://about.gitlab.com/handbook/product/categories/#foundations-group) within the Manage Stage and is maintained by [Christen Dybenko](mailto:cdybenko@gitlab.com). 

This direction page is a work in progress, and everyone can contribute:

- Please comment and contribute in the linked [issues](https://gitlab.com/groups/gitlab-org/-/issues/?sort=weight&state=opened&label_name%5B%5D=Category%3ANavigation%20%26%20Settings&first_page_size=20) and [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=Category:Navigation+&+Settings) on this page. Sharing your feedback directly on GitLab.com or submitting a merge request to this page are the best ways to contribute to our strategy.
- Please share feedback directly via email, Twitter, or [schedule a video call](https://calendly.com/cdybenko-gitlab/meeting-30). If you're a GitLab user and have direct feedback about your needs for Navigation, we'd especially love to hear from you. To contribute, please open an issue using the `~"Category:Navigation & Settings"` label, or reach out to us internally in the `#g_manage_foundations` Slack channel.

As a global, foundational aspect of the GitLab product, the Foundations Group within the Manage stage leads navigation and settings. Still, it is a collaborative cross-stage effort, because Navigation is vital to the GitLab experience and significantly impacts users. Because of this, Foundations must align with every stage group to ensure that Navigation's overall useability takes precedence when balancing the business needs of individual stage groups.

You can find regulary updates on Navigation in this [epic](https://gitlab.com/groups/gitlab-org/-/epics/8434). Our [most recent update](https://gitlab.com/gitlab-org/manage/foundations/team-tasks/-/issues/183) includes information on selecting Super Sidebar as our North Star Design! 

<br>

### Strategy and Themes
<!-- Describe your category. Capture the main problems to be solved in market (themes). Describe how you intend to solve these with GitLab (strategy). Provide enough context that someone unfamiliar with the details of the category can understand what is being discussed. -->

Navigation is the highway through which every feature is accessed or discovered, and it must be accessible for all types of people and abilities. For this reason, Navigation is one of the most important parts of any application’s user interface. 

When Navigation is effective, users trust that they can rely on it to help orient and empower them within the product. This is an example of the habituating UI tenet of “I quickly achieve mastery”[<sup>1</sup>](#footnotes), which means the user can go from zero knowledge to completing their task. From a business perspective, habituation can drive overall user retention, net retention, and conversions to paid tiers as the users trust the product more and return to use it on a daily basis.

Users with accessibility needs must be considered when designing and building Navigation. Many companies cannot adopt software that is not compliant with accessibility standards, and accessible Navigation is essential to comply with accessibility standards such as [VPAT](https://en.wikipedia.org/wiki/Voluntary_Product_Accessibility_Template).

#### Scope of Vision

Our near-term vision includes an overhaul of the top and left Navigation in GitLab. Looking further down the road, we will also start to focus on things like the product landing page and global search to increase success in navigating GitLab. Settings are also part of the long-term Navigation strategy, but right now we have put that on hold to focus on primary Navigation.


<details markdown="1">

<summary>Investment in navigation</summary>

Knowing that Navigation is a crucial part of our user’s adoption and confidence in GitLab, we have invested heavily in a new Navigation design. We have seen a great deal of user feedback showing that users have frustration and difficulty feeling oriented in GitLab, including picking up where they left off, because our robust feature set can be overwhelming. 

We resourced a full product team (Foundations) to address foundational parts of GitLab like Navigation & Settings and our Design System to help improve the overall usability of our product. We believe that iterating on the user feedback helps us reach our goal of a fulfilling experience in GitLab. It’s a big undertaking and will take many steps, but we are on our way to delivering an amazing user experience.

</details>


<details markdown="1">

<summary>Challenges for navigation</summary>

#### Complexity of Navigation

At GitLab, our current Navigation structure has compounded complexity. The first challenge is that we have nine stages and [500+ features](https://about.gitlab.com/features/), and we know that our Navigation must enable the users to quickly find the things that matter to them. The second challenge is that we have [14 user personas](https://about.gitlab.com/handbook/product/personas/#list-of-user-personas) who use our features for their day-to-day work, and our Navigation has to consider their varying needs. This means that Navigation that works well for one persona may not work well for others.


#### Who moved my cheese?

Due to habituation, Navigation can be difficult to change, because users learn patterns and gain muscle memory around the things they use every day. For these reasons, big changes or constant updates to Navigation could adversely affect a user’s ability to do their daily work. Even features that are eventually high satisfaction can undergo an initial phase of negative feedback (who moved my cheese?), since they can initially disrupt existing use patterns. We should be mindful that this reaction exists and use feature flags,  surveys, and internal beta testing as necessary. 

#### Custom Navigation

We're still evaluating if we need customizable navigation to address the challenges our users face.  There have been many references to wanting to customize the Projects and Group menus  in GitLab. However, we also know that Navigation customization presents some risks. For example, it’s incredibly difficult to write consistently helpful documentation for an inconsistent menu experience. Similarly, users may forget they’ve customized their menu by removing something and assume it no longer exists. In light of this, we will continue to listen and learn, we recently added Pinning to the Navigation which is a non-destructive way to ensure that the needs of both a customized experience and a consistent experience are in balance.


#### Other types of Navigation

Our vision includes space for many other navigational concepts that we can consider to help users feel oriented and to pick up where they left off. Examples of these are dashboards, user landing pages, keyboard Navigation, and other complementary features that will support this vision and give users what they need.

</details>



<details markdown="1">

<summary>Driving business value with SUS</summary>
We feel we can have an impact in the retention of users and drive the overall net retention of our customers. All of our PPI metrics are segmented by tier, and we will also track our SUS (lag metric) verbatims based on tiered feedback. Along with SUS reviews, we are determining if there are any data visualizations that will give us a more robust look at our navigation usage and may lead to a new PPI.
</details>



<details markdown="1">

<summary>Measuring navigation's impact to SUS</summary>

#### Multi-faceted measurement to track the success of the north star rollout

Given that there are risks and challenges to changing the habituation of our users, we need many modes of data collection that inform the success of our delivery and adoption of the new navigation. Overall, positively impacting SUS is the goal, but we want to also make sure that we are not causing a detriment to conversions. 

The metrics are:

- Track SUS ratio of total navigation level items (Design/UXR/Product)
   - Risk to this as it is a lag metric
- ✅ Long term - total clicks on navigation to page views as PI (Product/Eng)
- UXR Longitudinal Study in 16.1
- ✅ User surveys at time of launch to get feedback and during the Internal Beta opt in (UXR)
- ✅ Navigation is fully tracked on a modern event naming architecture. The tracking should be included with each MVC we ship so it is fully instrumented. (Eng)

</details>

<br>

### 1 year plan
<!--
1 year plan for what we will be working on linked to up-to-date epics. This section will be most similar to a "road-map". Items in this section should be linked to issues or epics that are up to date. Indicate relative priority of initiatives in this section so that the audience understands the sequence in which you intend to work on them. 
 -->

 View the Foundations roadmap as a gantt [here](https://about.gitlab.com/direction/manage/foundations/#quartery-plan-for-fy2024).

#### Navigation

 Given the challenges outlined above which changing navigation, we use a three-pronged approach to ensure we design a great Navigation experience for our users.

**1)**  We narrowed our north star vision from the [six designs](https://gitlab.com/gitlab-org/gitlab/-/work_items/111592007) to just one. This design is guidepost for future work. We are now building in 15.7-16.0. See [epic](https://gitlab.com/groups/gitlab-org/-/epics/9044) and [design](https://gitlab.com/groups/gitlab-org/-/uploads/538add4ea9f7f4ed6b1bb4c3f97ebc3a/Project___Overview.png).

**2)**  A quarterly review of SUS verbatims has given us insight to these 3 themes that we are using to test our north star vision during UXR. We will continue to refine these themes as we move forward.

1. Minimize feeling overwhelmed
   - ✅ Left sidebar reduction of items into sections
   - ✅ Improved settings findability (pinning, command palette)
   - Improved settings IA => Moved to own theme
1. Orient users across the platform
   - ✅ Context switcher
   - ✅ Re-location of breadcrumbs to the top of the page
   - ✅ Persistent sidebar for consistency (Profiles, help, other global pages)
1. Pick up where you left off
   - ✅ “Your work” area
   - ✅ Pinning
   - ✅ Increased priority of search in Menu Menu and Super Sidebar

We can consider these themes “closed” when we test the design prototype with our users (after 16.1) and they report overall feelings in alignment with each of them. We can use the same user survey to collect feedback about MVCs that we ship, which will ensure we continue to deliver improved usability.

We will also monitor the SUS verbatims for instances of negative sentiment decreasing over time and a decreasing ratio of navigation feedback in the total number of verbatims.

**3)** We will validate any Navigation changes in the app by tracking all usage data on Navigation.

**4)** We have increased the fidelity of the [navigation proposal process](https://about.gitlab.com/handbook/product/ux/navigation/#how-to-propose-a-change-that-impacts-navigation) to reduce changes that could affect SUS.


### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->

For the next three months, our focus is: 

* The main focus of Q3 (Aug-Oct) is removing the toggle for all users. This includes scheduling the remaining issues in our [toggle removal backlog](https://gitlab.com/groups/gitlab-org/-/issues/?sort=created_asc&state=opened&label_name%5B%5D=group%3A%3Afoundations&label_name%5B%5D=Navigation%3A%3ARemove%20Toggle&first_page_size=100).
* Communicating the breaking changes we will make to the page URLs via a [blog and deprecation](https://gitlab.com/groups/gitlab-org/-/epics/11135), so our customers so they can give feedback ahead of 17.0.


### What we are currently working on
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

- 16.3 - We are shipping our [Context Switcher](https://gitlab.com/gitlab-org/gitlab/-/issues/409522), our [logged out state](https://gitlab.com/gitlab-org/gitlab/-/issues/389603) and have started [theming](https://gitlab.com/gitlab-org/gitlab/-/issues/378549) with a focus on unblocking the toggle removal by 16.4 or 16.5.


### What we recently completed
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

- 16.3 - Release our Navigation Longitudinal Study results and prioritizing our next quarter for UXR. 
- 16.2 - Launched a new Command Palette to compliment the new navigation and closed a 6-year old [issue](https://gitlab.com/gitlab-org/gitlab/-/issues/17390)
- 16.1 - Toggled to on by default for all users
- 16.0 - Released the navigation behind a toggle as a Generally Available, with opt-in
- 15.11 GitLab Dogfood Experiment (internal beta)
- 15.10 Released the [Exploring Sidebar](https://gitlab.com/gitlab-org/gitlab/-/issues/384879)
- 15.10 [Persistent sidebar](https://gitlab.com/gitlab-org/gitlab/-/issues/382325)
* 15.9 Released the [Your Activity](https://gitlab.com/gitlab-org/gitlab/-/issues/389997). Adds default functionality to our Your Work for viewing your own activity.
* 15.9 Released the [Your Work sidebar](https://gitlab.com/gitlab-org/gitlab/-/issues/384342). This drives consistency and sets the stage for our [Super Sidebar](https://gitlab.com/groups/gitlab-org/-/epics/9044) rollout
* 15.7 Determine how users will [opt in to using the new navigation](https://gitlab.com/gitlab-org/gitlab/-/issues/378666)
* 15.6 - After narrowing down the north star direction, we will utilize [RITE to iterate on a single proposal](https://gitlab.com/gitlab-org/gitlab-design/-/issues/2050#the-approach) that addresses any lingering usability questions.
* 15.6 - We took the final design for the north start and [broke it down into 10 MVCs](https://gitlab.com/groups/gitlab-org/-/epics/9044).
* 15.3 - 15.6 - Create and test [six designs](https://gitlab.com/gitlab-org/gitlab/-/work_items/111592007) from the [north star vision](https://gitlab.com/gitlab-org/gitlab/-/issues/365403) with two phases of testing in UXR and get it down to 1 final design. This final design is the guidepost for all of our MVCs and ultimately what we ship to customers for the next year+. It’s the most valuable design investment we are doing on Navigation to meet our goals.
* 15.4 - Ship the [“Menu Menu” change](https://gitlab.com/groups/gitlab-org/-/epics/8405) as a small but valuable iteration on our current top Navigation that sets the stage for the north star design. It brings the current “Menu” menu, in alignment with the top bar and removes the redundant word “Menu.” 

<br>

### What is Not Planned Right Now
<!-- Often it's just as important to talk about what you're not doing as it is to
discuss what you are. This section should include items that people might hope or think
we are working on as part of the category, but aren't, and it should help them understand why that's the case.
Also, thinking through these items can often help you catch something that you should
in fact do. We should limit this to a few items that are at a high enough level so
someone with not a lot of detailed information about the product can understand
the reasoning-->

**Navigation:** 

* As a general rule, we are not redesigning individual content pages that are owned by other teams. 
* We are not allowinig top-level navigation additions to the Project and Group sidebar for at least 6 months post launch of the new navigation.
* For now, we have de-prioritized all other Navigation issues and work until we get the North Star MVC live. We are also not diving into full designs for dashboards or user pages until we get our north star underway. We will still be pursuing opportunity canvases and exploration into the business value of re-prioritizing these items.
* We are not currently driving ARR through upselling or cross-selling with navigation. We could re-visit this if we begin to work on dashboards at some point.

**Settings:** 

   * Even though the category is Navigation & Settings, Settings are not prioritized on our current roadmap in the interest of getting the north star Navigation designed and into the build track. 
   * In the future, we aim to focus on the following goals for settings:
      - Improving discoverability of existing settings
      - Incorporating search within the settings experience
      - Consistently applying UI patterns and realigning the information architecture within settings pages
      - Providing quick access to settings without removing the user from their current context
      - Ensuring that settings are visible by the correct permission levels and context


<!-- ### Best in Class Landscape
Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" 

BIC (Best In Class) is an indicator of forecated near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape.-->

<!-- #### Key Capabilities 
For this product area, these are the capabilities a best-in-class solution should provide -->

<!-- #### Roadmap
Key deliverables we're focusing on to build a BIC solution. List the epics by title and link to the epic in GitLab. Minimize additional description here so that the epics can remain the SSOT. -->


<!-- #### Top [1/2/3] Competitive Solutions
PMs can choose to highlight a primary BIC competitor--or more, if no single clear winner in the category exists; in this section we should indicate: 1. name of competitive product, 2. links to marketing website and documentation, 3. why we view them as the primary BIC competitor -->

<br>

### Maturity Plan
<!-- It's important your users know where you're headed next. The maturity plan section captures this by showing what's required to achieve the next level. The section should follow this format:

This category is currently at the XXXX maturity level, and our next maturity target is YYYY (see our [definitions of maturity levels](https://about.gitlab.com/direction/maturity/)).

- Link to maturity epic if you are using one, otherwise list issues with maturity::YYYY labels) 

(For non-marketing categories this section is optional) -->

As this is not a marketing category, we don't have a specific measure of maturity.

<br>

### Target Audience
<!--
List the personas (https://about.gitlab.com/handbook/marketing/strategic-marketing/roles-personas#user-personas) involved in this category.

Look for differences in user's goals or uses that would affect their use of the product. Separate users and customers into different types based on those differences that make a difference.
-->

All [roles & personas](https://about.gitlab.com/handbook/product/personas/) interact with Navigation. We are focusing on helping users orient themselves around the things that are most important to them, so that they can be more productive.

<hr>

##### Footnotes

1. [UI Traps](https://uitraps.com/) is a UXR framework created by [researchers](https://uitraps.com/about/) from various large tech companies. See this [screenshot](https://drive.google.com/file/d/1SwnMRMWEZ8TtAaPgEmvvBggZkwPsOxJ1/view) of the tenets. They are presented as cards.
