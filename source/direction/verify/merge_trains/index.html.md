---
layout: markdown_page
title: "Category Direction - Merge Trains"
---

- TOC
{:toc}

## Merge Trains

| | |
| --- | --- |
| Stage | [Verify](/direction/verify/) |
| Maturity | [Viable](/direction/maturity/) |
| Content Last Reviewed | 2023-07-20 |

### Introduction and how you can help

Thanks for visiting this category direction page on Merge Trains in GitLab. This page belongs to the [Pipeline Execution](/handbook/product/categories/#pipeline-execution-group) group of the Verify stage and is maintained by Jackie Porter ([E-Mail](mailto:<jporter@gitlab.com>), [Twitter](https://twitter.com/JRMeshell)).

This direction page is a work in progress, and everyone can contribute:

- Please comment and contribute in the linked [issues](https://gitlab.com/gitlab-org/gitlab/-/issues/?sort=updated_desc&state=opened&label_name%5B%5D=Category%3AMerge%20Trains&first_page_size=50) and [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=Category:Merge+Trains) on this page. Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.
- Please share feedback directly via email, Twitter, or on a video call. If you're a GitLab user and want to discuss how GitLab can improve Review Apps, we'd especially love to hear from you.

### Overview

We aim to help you balance speed with reliability, keeping your pipelines green. This ultimately supports the stability of collaboration across branches and GitLab has introduced Merge Trains as the mechanism to accomplish this. When merge trains are used, each merge request joins as the last item in that train. Each merge request is processed in order and is added to the merge result of the last successful merge request. The merge request adds its changes, and starts the pipeline immediately under the assumption that everything is going to pass. If the merge request fails, it is kicked out of the train and the next merge request continues the pipeline of the last successful merge result. 

- [Maturity Plan](#maturity-plan)
- [Issue List](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3AMerge%20Trains)
- [Overall Vision](/direction/ops/)
- [UX Research](https://gitlab.com/groups/gitlab-org/-/epics/594)
- [Documentation](https://docs.gitlab.com/ee/ci/pipelines/merge_trains.html)

### Strategy and Themes

For an overview of our plans for Merge Trains, see epic [Merge Trains Vision](https://gitlab.com/groups/gitlab-org/-/epics/5122) and check out this overview video:

<!-- blank line -->
<figure class="video_container">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/H2KPKDBW6Tw" frameborder="0" allowfullscreen></iframe>
</figure>
<!-- blank line -->

Our top vision item is [Merge Trains should support fast forward merge](https://gitlab.com/groups/gitlab-org/-/epics/4911) as this will eliminate the frequent need for manually rebasing. We have heard from many developers that a large portion of their day is dedicated to this activity, and with this functionality, Merge Trains will take care of this for them. 

Beyond that we want to provide Developers and DevOps Engineers a better way to [visualize](https://gitlab.com/gitlab-org/gitlab/-/issues/277391) and administer the merge train.

### 1 year plan

In FY24, we plan to proceed with work to enable [Fast-forward merge support](https://gitlab.com/groups/gitlab-org/-/epics/4911#proposal) for merge trains. We have heard from users that while Merge Trains are great they often need to re-run the same pipeline to get the correct SHA value into a package prior to release. Reducing the number of pipelines required to merge a change by one means shipping value to customers faster.

<!--
#### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. 

#### What we are currently working on


#### What we recently completed
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

### Best in Class Landscape
<!-- Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" -->

BIC (Best In Class) is an indicator of forecasted near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape.

#### Key Capabilities 

* Queue merge requests and verify their changes work together before they are merged to the target branch
* Leverage merged results pipelines
* Support fast-forward merge requests
* Provide marge train visualisation and administration capabilities

#### Roadmap

This category is currently at the "Viable" maturity level, and our next maturity target is "Complete" ([see our definitions of maturity levels](https://about.gitlab.com/direction/maturity/)). We currently have basic capabilities and want to continue and extend these in future milestones.

Key deliverables to achieve this are:

- [Simplify merge strategies with Auto-merge](https://gitlab.com/groups/gitlab-org/-/epics/6687)
- [Merge Trains should support fast forward merge](https://gitlab.com/groups/gitlab-org/-/epics/4911)
- [API support for merge trains](https://gitlab.com/groups/gitlab-org/-/epics/5864)
- [Resolving Severity 1 and 2 bugs](https://gitlab.com/gitlab-org/gitlab/-/issues?sort=milestone_due_desc&state=opened&label_name[]=Category:Merge+Trains&label_name[]=type::bug&not[label_name][]=severity::3&not[label_name][]=severity::4)

#### Top Competitive Solutions

It looks like GitLab is the first to provide this functionality, although GitHub has annouced a [public beta](https://github.blog/changelog/2023-02-08-pull-request-merge-queue-public-beta/) for Merge Queue which includes fast-forward merge train support and visualizations of the queue.

[Aviator](https://www.aviator.co/) is the most comparable offering against Merge Trains, promising to "keep builds green forever", much like how we [positioned Merge Trains in 2020](https://about.gitlab.com/blog/2020/01/30/all-aboard-merge-trains/) during their release. Today, Merge Queues seem to support parity of Merge Trains for GitHub repositories. 

[Mergify](https://mergify.com/features/merge-queue) is another offering that integrates with GitHub repositories and multiple CI providers to supporty queued pull requests.

### Target Audience

Check out our [Ops Section Direction "Who's is it for?"](/direction/ops/#who-is-it-for) for an in depth look at the our target personas across Ops. For Merge Trains, our "What's Next & Why" are targeting the following personas, as ranked by priority for support: 

1. [Sasha - Software Developer](https://about.gitlab.com/handbook/product/personas/#sasha-software-developer)
1. [Priyanka - Platform Engineer](https://about.gitlab.com/handbook/product/personas/#priyanka-platform-engineer)

<!--### Pricing and Packaging


### Analyst Landscape
-->

### Top Customer Issue(s) and Top Customer Success/Sales Issue(s)

The most popular request is the epic [gitlab&4911](https://gitlab.com/groups/gitlab-org/-/epics/4911). When selecting to work with Fast Forward Merge without using merge trains, a user is offered to rebase master manually, in case master has advanced. Merge Train supporting fast forward merge would reconstruct the merge train and re-run pipelines automatically.

### Top Internal Customer Issue(s)

In an effort to dogfood our own features, we are actively working on using merge trains internally on gitlab-org [gitlab#195](https://gitlab.com/gitlab-org/quality/team-tasks/issues/195). A piece of functionality our internal team has requested after working with Merge Trains for a while is API support for merge trains to auto-merge, [gitlab#32655](https://gitlab.com/gitlab-org/gitlab/-/issues/32665). 
