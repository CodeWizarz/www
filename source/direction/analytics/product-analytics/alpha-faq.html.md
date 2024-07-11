---
layout: markdown_page
title: "Product Analytics - Experiment Phase FAQ"
description: "Frequently Asked Questions about the Product Analytics Experiment Program"
---

- TOC
{:toc}

1. Will I be charged during this phase?
   - No.
1. Is my customer personal data safe?
   - Yes. Any personal data processed by Product Analytics will be done in accordance with the [GitLab Privacy Statement](https://about.gitlab.com/privacy/). For enterprises, the [GitLab Data Processing Addendum](https://about.gitlab.com/handbook/legal/data-processing-agreement/) will apply to any personal data processed by this feature.
1. How long will this phase last?
   - The Experiment phase will be completed when we have received the amount of feedback we would like or on YYYY-MM-DD (to be determined as first customer is on boarded) — whichever comes first. GitLab is under no obligation to release Product Analytics as a Beta or Generally Available feature.
1. What is the future of this feature?
   - You can read about our future roadmap on the [Group Direction Page](https://about.gitlab.com/direction/analytics/product-analytics/) and open a new issue to leave a suggestion.
1. How much will this cost after the Preview?
   - TBD. If we decide to move this feature to General Availability, we will provide users with pricing prior to doing so. Namespaces that are in the Experiment or Beta phase may need to re-enable the feature, pay additional fees, and agree to new terms if the feature is moved to General Availability.
1. Can I submit a support ticket if I run into issues?
    - You can find levels of Support provided by GitLab in the [documentation for Experimental and Beta features](https://docs.gitlab.com/ee/policy/experiment-beta-support.html). During the Experiment and Beta phases of Product Analytics the product team may provide additional support, but it is not guaranteed.
1. What do I do if my data is gone?
    - As noted on the support levels, during the Experiment phase some data loss is expected. GitLab advises you to not store critical business information in the Product Analytics data store.
1. I'm seeing something that doesn't look right. What should I do?
    - During the Experiment phase leave a comment in the [feedback issue](https://gitlab.com/gitlab-org/gitlab/-/issues/391970). During the Beta leave a comment in the feedback issue and open a support ticket.
1. You should really build this idea I have. How do I submit a request?
    - Leave a comment in the [feedback issue](https://gitlab.com/gitlab-org/gitlab/-/issues/391970).
1. Where do I get the SDK App ID?
    - Use this [GraphQL mutation](https://docs.gitlab.com/ee/api/graphql/reference/#mutationprojectinitializeproductanalytics) after which go to Settings -> General -> Analytics.
1. How do I create a custom dashboard?
    - See the [documentation about defining a dashboard](https://docs.gitlab.com/ee/user/product_analytics/#define-a-dashboard).
1. How do I make a bar chart?
     - Coming soon
1. How do I make a funnel?
    - See the [funnel documentation](https://docs.gitlab.com/ee/user/product_analytics/#funnel-analysis).