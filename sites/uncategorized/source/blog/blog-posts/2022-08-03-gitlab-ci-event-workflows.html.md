---
title: Event-based CI workflows in GitLab 
author: Jackie Porter, Grzegorz Bizon
author_gitlab: jrepoter
author_twitter: JRMeshell
categories: company
image_title: '/images/blogimages/kelly-sikkema-lFtttcsx5Vk-unsplash.jpg'
description: "Learn about a proof of concept to automate more with GitLab CI workflows and share your feedback."
tags: features, product, cicd
twitter_text: "A proof of concept for CI workflows came from our July 2022 Verify Stage Hackathon. Now we want your feedback on how this feature can make your life easier."
featured: yes
---

Maybe you have been in a position where there are specific tasks that must kick off in your software development process based on events in the platform or other systems. Perhaps you are even a GitLab CI user and love the flexibility that pipelines offer for project automation and want to be able to extend this to other types of items. Out of the [July 2022 Verify Stage Hackathon](/blog/2022/07/28/verify-week-hackathon/), a proof of concept for CI workflows has been released and we are looking for feedback on ways this feature can help make your life easier. 

## What are CI worfklows?

The idea behind the [proof of concept](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/91244) is to instrument an event-based service to trigger pipelines. The current instrumentation features a definition of this service in the `.gitlab-ci.yml` and a hook into the existing [webhooks](https://docs.gitlab.com/ee/user/project/integrations/webhook_events.html) GitLab provides today. These components make up the `workflow` definition. 

## What can CI workflows do?

The possibilities for CI workflows are endless. If you wanted to triage issues, a workflow can be set on issue creation. Let’s say you want to automatically run pipelines based on merge request state changes - just use a workflow even in `.gitlab-ci.yml` to start a pipeline when a merge request is made “ready” or someone approved your code in it. 

Here is a brief overview of the proof of concept in action: 

<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/cwfRI9m3rRs" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

## What’s next?

GitLab CI workflows are one component of a broader [GitLab workflow](https://gitlab.com/groups/gitlab-org/-/epics/8349) and automation goals. Up next, we are looking to [formally instrument CI workflows via GitLab](https://gitlab.com/gitlab-org/gitlab/-/issues/363384). We also are looking ahead to [Platform Events](https://gitlab.com/gitlab-org/gitlab/-/issues/355658) or [Cloud Events](https://gitlab.com/gitlab-org/gitlab/-/issues/335095), which help extend the number of events to trigger various automations from beyond the existing webhooks/system hooks. 

Is this something that you are interested in or have feedback on? Tag `@dhershkovitch` on our [GitLab CI Workflows Issue](https://gitlab.com/gitlab-org/gitlab/-/issues/363384). 

Cover image by [Kelly Sikkema](https://unsplash.com/photos/lFtttcsx5Vk) on [Unsplash](https://unsplash.com)
{: .note}
