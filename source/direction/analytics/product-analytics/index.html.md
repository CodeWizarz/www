---
layout: markdown_page
title: "Group Direction - Product Analytics"
description: "The Product Direction for GitLab's Product Analytics Group."
canonical_path: "/direction/analytics/product-analytics/"
---

- TOC
{:toc}

Welcome to the GitLab Product Analytics group direction. 

# Overview and Vision
The Product Analytics group vision is in alignment and contributes to the [Analyze Stage vision](/direction/analytics/#vision) and simply stated is ". .  to continue to extend DevOps across its most painful gap - measuring user value." Giving teams the tools they need to stay user-focused can have positive impact on their performance, job satisfaction and productivity as noted in the [Accelerate State of DevOps 2023](https://cloud.google.com/blog/products/devops-sre/announcing-the-2023-state-of-devops-report).

## Our unique opportunity
When conducting user research about the product analytics space, a common theme we heard is that developers find it hard to add instrumentation code to their app or to successfully gather together the reported data. This could be because they are unfamiliar with their app's architecture, the specific SDK of the instrumentation tool, or because they had to use another tool to configure reporting and monitor results. GitLab is the One DevOps platform and therefore has a unique opportunity to address these pain points that other solutions may have.

One area in which we have an opportunity is to make it easy for developers to add instrumentation code. This is the first step in any analytics workflow. Given that developers represent a key persona we collaborate with, we have a better sense of what they like, do not like, are good at, and what sorts of experiences they prefer. Additionally, they are already familiar with GitLab and many conventions of our product. This gives us the ability to create an approach to adding product instrumentation that is easy and familiar to our users. If developers are excited and easily able to add instrumentation to their apps, they will add more, which means their teams will get more valuable insights. Other functional counterparts, such as Product Managers, will see how easy it is for developers to use GitLab to instrument their apps, so they will also be excited to use GitLab, rather than another tool. We are collaborating with the [Analytics Instrumentation Group](/direction/analytics/analytics-instrumentation) who are providing interfaces to developers to enable the gathering of insights.

Another opportunity we have is to do the entire analytics reporting and analysis directly within GitLab, rather than requiring users to use another tool. We know from talking to users that accessing another tool is time-consuming and friction filled. Being able to go from reading a GitLab issue to looking at an MR to visualizing the latest Product Analytics data in a single place will make it easy for users to get access to the insights from their data quickly. Because it is so painless to view analytics data, these users will do so more and more often, which means that they get even more value out of GitLab.

In addition to the benefits mentioned previously, our ability to store the user's application code presents a significant longer-term opportunity. By leveraging this contextual information, we can offer more comprehensive analytics solutions than any other product. For instance, we could explore the possibility of suggesting or automatically adding analytics instrumentation code to different parts of the app. While this requires extensive research, one potential outcome could be direct suggestions within merge requests (MRs) along with code snippets to automatically instrument newly added sections of code.

## Use Cases
There are many use cases for Product Analytics. One way you can think about these is to segment them by the type of digital product analyzes and the subsequent questions those who create it would seek to be answer. For example, a team that publishes a blog is primarily interested in page views of blog posts.

### Initial Use Cases
Our initial use case is focused on our ability to [dogfood](/handbook/values/#dogfooding). As a result they focus on Web Apps. Our initial use case is:
- Web applications (specifically Javascript and Ruby on Rails)
- With a particular interest in views, funnels, and conversion
- Those that are already instrumented with Snowplow

### Our ideal first customer
The ideal customers for Product Analytics are customers already invested in the GitLab DevSecOps platform. These customers have no usage tracking today and cannot explore, visualize or share data that shows the value the software they develop provides or where they should invest in features next. We have found this may be, but is not limited to, an internal tools or platform team who offers self-serve capabilities to other development teams through webapps but do not know if that software investment is paying off today. 

#### Use Cases and Personas We Are Not Pursuing
It is important to identify the use cases and personas that we want to pursue and it is equally important to identify those that we do not wish to pursue. Because analytics can mean many things to many different people, this is especially important.

We do not plan at this time to pursue use cases and personas around:

* Marketing analytics for marketing and sales organizations
    * This might include capabilities such as page clicks or traffic trends over time and how they relate to the effectiveness of a marketing campaign or lead generation strategy.
    * Example companies in this space: [Google Analytics](https://analytics.google.com/analytics/web)
* Application performance monitoring for software reliability engineering organizations
    * This might include capabilities such as crash debugging and error tracking analytics and feeding it into product health measures, uptime measurements, and reliability dashboard
    * Example companies in this space: [Sentry](https://sentry.io/welcome/), [Firebase Crashlytics](https://firebase.google.com/products/crashlytics), [Raygun](https://raygun.com/), and [Rollbar](https://rollbar.com/)
    * The [Monitor stage](/direction/monitor/) is better positioned to address those use cases.
* GitLab Usage Analytics
    * This may include things like DORA metrics or Value Stream Analytics which are use cases for [Value Stream management](/direction/value_stream_management).

Note that while the above are use cases and personas we are not actively pursuing, this does not mean that those personas will not find some value in what we provide. It means that they are not our primary focus. We do not intend to block functionality around these, just that they are not our primary focus. For example, page views and traffic trends are also useful for marketing personas, but we intend to use them for guiding product-related use cases, not for addressing marketing-related use cases. Similarly, understanding error reporting for a given feature may be important to understand a feature, but we are not focused on making a product quality or bug tracking platform using those pieces of data.

# Strategy and Product Categories
Our Strategy to achieve this vision is to start by helping users store, query and visualize quantitative data to measure user value. We will collaborate with the Analytics Instrumentation team to give users the tools they need to instrument and collect data from deployed applications.

## Current Categories
Given our focus on developers, the software delivery value stream, and DevOps - we will compose our new DevOps stage, Analyze, based on the set of categories we commonly see in User Engagement [competitors](#competitors).

Currently the Product Analytics group includes a two categories.

- Product Analytics Visualizations - This category is focused on helping customers understand and gain insights from usage patterns in their software.
- Product Analytics Data Management - This category is focused on the Bring Your Own Cluster capabilities to support the Self Managed customers implementing Product Analytics.

In the future we envision more categories as we broaden our scope to cover additional personas and user cases. Those new categories include:
- [Experiments](https://gitlab.com/groups/gitlab-org/-/epics/8445) - Crafting hypothesis driven tests to determine product improvement success
- In-App Messaging - Engage users from directly within your product and shifting to qualitative data collection
- Customer Surveys - Conduct polls and other inquiries to determine customer preference, reaction and satisfaction continuing down the path of qualitative data
- Session Recording - Understanding and analyzing detailed individual usage patterns

### Additional Categories of the outer loop 
There are a number of existing (or considered) product categories in GitLab that could be considered part of the outer loop that the Analytics section will partner closely with to ensure we provide a cohesive experience. Those include:
- [Error Tracking](/direction/analytics/observability/error_tracking/) - For user experienced errors
- [Feature Flags](/direction/delivery/feature_flags/) - For experiments and A/B testing
- [Service Desk](/direction/service_management/service_desk/) - For Customer Surveys and feedback
- Real User Monitoring - For Error Tracking and Session Recording

We plan to collaborate and build with these categories where possible, rather than re-inventing new solutions for these related use cases.

## What is next for us and why
We have a plan to [iteratively](https://about.gitlab.com/handbook/values/#iteration) develop Product Analytics features. We will start small and incrementally add new capabilities. Each iteration will let us learn more and solicit feedback to improve, before we start our next iteration. Our first iteration was primarily internally focused and we are now turning our attention to the first customer facing releases.

With our Experimental Release complete we are engaging with external users to show them Product Analytics to improve the Product Analytics offering. We now turn our focus to the work for the [Beta](#Beta) release to enable customers to opt into Product Analytics themselves. This is the next iteration outlined as an epic below.

These roughly correlate to our current guidance in the [handbook](https://about.gitlab.com/handbook/product/gitlab-the-product/#experiment-beta-ga) and [documentation](https://docs.gitlab.com/ee/policy/experiment-beta-support.html) about phased releases. We will continue to provide timing guidance for each as we make progress.

### What we are currently working on

#### Beta
[This iteration](https://gitlab.com/groups/gitlab-org/-/epics/9900) will be available to any Ultimate Custerom interested in signing up to try Product Analytics on GitLab.com. Our goal with this release will be to identify any potential issues, bugs, or edge cases with our features that would prevent us from being ready for production-grade usage and fully opening up for GA. This aligns with our FY24'Q3 [OKR](https://gitlab.com/gitlab-com/gitlab-OKRs/-/work_items/3359).

Once we are in Beta, we will be feature complete for what will be available in the GA release. The Beta is intended primarily to understand tweaks that may need to be made to existing features, ensure we are ready for production-grade loads, and fix any bugs. We are tracking this work in the [Beta Epic](https://gitlab.com/groups/gitlab-org/-/epics/9900).
    
Pricing and packaging should be relatively complete by this release, though may change before the GA release.

A key difference between the Experiment and Beta is that we will expect much greater load on GitLab during this period, since any Ultimate SaaS customer can sign up for it.

#### Additional Features / Improvements
Since releasing Product Analytics internally and as an Experiment we have received excellent feedback on existing features and have better understood the problems our users have that influenced the roadmap of planned features. One key theme that stuck out whas that users do not want to learn another query language to view their data. This reinforced that we should release the [Custom Dashboard Designer](https://gitlab.com/groups/gitlab-org/-/epics/8574), [Visualization Designer](https://gitlab.com/groups/gitlab-org/-/epics/11555) and make improvements to the existing visualizations specifically the [Single Statistic visualization](https://gitlab.com/gitlab-org/gitlab/-/issues/416788).

We also received feedback that while the default dashboards are helpful what users really want is to track custom events and [query the data](https://gitlab.com/gitlab-org/gitlab/-/issues/422515) so we will work to make it easier to access that data in the Visualization Designer.

In our own usage of Product Analytics we know that seeing how many users transition from one step to the next like from the dashboard list to a specific dashboard, or through the Visualization Designer is important to see where there could be friction in the process. To address that we will take the next steps to enable the [visualization of funnels](https://gitlab.com/groups/gitlab-org/-/epics/9016) and implement an MVC designer for them.

These features and improvements are being considered separately from work towards the Beta or Ganeral availability release. None of them are required to be complete before entering those phases of Product Analytics.

#### General availability (GA)
[This iteration](https://gitlab.com/groups/gitlab-org/-/epics/9902) will be when the Product Analytics capabilities are available for all users to take advantage of, just like any other capability within GitLab.

Our minimal feature set that we will work on to get us to our first GA will likely include:

* Adding [schema-driven dashboards](https://gitlab.com/groups/gitlab-org/-/epics/8574) as a way to visualize and consume information from Analytics. Our first iteration will have had hardcoded, pre-configured dashboards, so this epic will allow for more customization. Additionally, other groups within GitLab are interested in using this dashboarding approach, so we expect to collaborate with them so they can benefit from this initiative as well.
* Multiple [visualization options](https://gitlab.com/groups/gitlab-org/-/epics/9351) for dashboards to present data for users in the way most valuable to them.
* Enabling users to [bring their own Product Analytics cluster](https://gitlab.com/groups/gitlab-org/-/epics/8921)

Once our first user-facing release is available, we will respond to feedback on where we'll next focus our efforts to build a ["Lovable"](/direction/maturity/) product. We have several ideas, and have validated some of these with customers, for follow-on iterations after this release, which are listed below. Some of these may also be included in our initial GA release.

* More and better ways to [query data](https://gitlab.com/groups/gitlab-org/-/epics/9386)
* Introducing [funnel analysis](https://gitlab.com/groups/gitlab-org/-/epics/9016)
* Defining a more specific [event taxonomy](https://gitlab.com/groups/gitlab-org/-/epics/8645)
* Enriching results with data from other GitLab features, like [releases](https://docs.gitlab.com/ee/user/project/releases/) or [feature flags](https://docs.gitlab.com/ee/operations/feature_flags.html)
* Allowing [dashboards to be embedded in external applications](https://gitlab.com/groups/gitlab-org/-/epics/8940)
* Providing [data export capabilities](https://gitlab.com/groups/gitlab-org/-/epics/8981)
* Improving speed of analytics to be near real-time

## What we recently completed
Our latest iteration was focused on the [Experiment Release](https://gitlab.com/groups/gitlab-org/-/epics/9899) of Product Analytics that onboards the first external customer(s). As these customers scale it allows us to learn about how the managed product analytics stack handles load and make improvements to the feature set based on a wider set of [customer feedback](https://gitlab.com/gitlab-org/gitlab/-/issues/391970).

Our first iteration was focused on an [internal preview](https://gitlab.com/groups/gitlab-org/-/epics/8462)
of Product Analytics that we can [dogfood](https://about.gitlab.com/handbook/product/product-processes/#dogfood-everything).
This let us work through the technical questions of how to best develop Product Analytics, how to host and maintain relevant infrastructure, as well as how to use it like an end-user would. This culminated with us adding Product Analytics to the internal handbook, [Pajamas](design.gitlab.com), [Metrics Dictionary](metrics.gitlab.com), and VersionApp for dogfooding purposes.

## Competitor Pricing
Due to the heavy emphasis on SaaS and the high data volumes - most pricing in this market is consumption-based. 
- [MixPanel](https://mixpanel.com/pricing/) - SaaS - Pay by the Monthly Tracked User
- [Heap](https://heap.io/pricing) - SaaS - Single Fee sessions/year limits
- [Pendo](https://www.pendo.io/pricing/) - SaaS - Unlimited Seats - tiered by sophistication of capabilities (Roadmapping, feedback in higher tiers)
- [LogRocket](https://logrocket.com/pricing) - SaaS - Seats + Session Limits for lower tiers - features in higher tiers.
- [PostHog](https://posthog.com/pricing) - Self-Managed - By Event Volume

# How we do it

## Performance Indicators
Our Performance Indicator is Weekly Active Users defined as users viewing a dashboard and is being tracked in [Sisense](https://app.periscopedata.com/app/gitlab/1140634/Analyze-Product-Analytics?widget=16722272) (internal link). 

## Jobs to Be Done
We are [conducting research on critical jobs to be done](https://gitlab.com/gitlab-com/Product/-/issues/4274) for the Analytics section.

## Personas
The existing personas we serve are below, in priority order. We will likely [need additional personas](https://gitlab.com/gitlab-com/Product/-/issues/4273) in the future.

1. [Sasha - Software Developer](/handbook/product/personas/#sasha-software-developer)
1. [Parker - Product Manager](/handbook/product/personas/#parker-product-manager)

Some nuance can be added to our personas and how we approach them. Nearly all analytics questions, workflows, funnels, or any metrics gathering will require technical work to add instrumentation, test, and deploy it. This is the reason we are focusing on Sasha as our primary persona before Parker. We are addressing Sasha in the context that they are supporting Analytics efforts for their team. This means they are interested in how to do tasks related to adding instrumentation code, deploying it, and debugging it in support of analytics-related questions and projects. This is a more focused version of the Sasha overall persona.

As part of considering these personas, consider what personas we are _not_ including in this initial list. Specifically, we are not targeting executive personas or Directors with the initial offering. Sasha and Parker are individual contributors and have unique needs different than Directors or executives. They are focused mainly on specific applications and the analytics related to them, whereas executives and Directors will be concerned about multiple, or a "fleet", of applications. We intend to go after these personas eventually and will not intentionally create capabilities that exclude them, but they are not our primary focus at this point.

# Competitors
The market is divided between big tech entrants building on top of complete Marketing Automation platforms marketed towards enterprise marketing orgs and stand-alone tools user engagement tools that are marketed towards Product (and occasionally Development) teams.

* **Enterprise Marketing Automation** - Some examples of these are Adobe’s [RT CDP](https://business.adobe.com/products/real-time-customer-data-platform/RTCDP.html), Oracle’s [Unity](https://www.oracle.com/cx/customer-data-platform/), Twilio’s [Segment](https://segment.com/) and Microsofts [Dynamic 365 CDP](https://dynamics.microsoft.com/en-us/customer-data-platform/). This class of products all focus on customer data collection for the purposes of marketing automation with limited direct customer engagement tools. The primary buyer for this class of tools is a CMO. Interestingly, **many of these tools focus their attention on developer-enabled data management** as that is a critical stepping stone to enabling Marketing and Product teams ([mParticle](https://www.mparticle.com/?)). 
* **User Engagement** - Another class of products is targeting smaller organizations and Product and Development teams directly. These include [Pendo](https://www.pendo.io/), [Amplitude](https://amplitude.com/), [PostHog](https://posthog.com/), [LogRocket](https://logrocket.com/), [GlassBox](https://www.glassbox.com/?utm_source=ppc&utm_medium=google&utm_campaign=brand&lsd=OA-PPC-Adwords&gclid=CjwKCAiA9aKQBhBREiwAyGP5lSLyGJZUQIIli9pacrvj18QYa4SXm2XPSZnI9twyNEjD-WulIgN1qBoC1a4QAvD_BwE) and Google’s [Firebase Engage](https://firebase.google.com/products-engage). The primary buyer of this class of tools is a CTO/CPO. Interestingly, **few of these products offer both a SaaS and Self-Managed option**.
