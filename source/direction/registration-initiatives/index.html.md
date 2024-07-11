---
layout: markdown_page
title: "Registration Initiatives"
description: This page captures and summarizes 
canonical_path: "/direction/registration-initiatives/"
---

- TOC
{:toc}

### Problem

Today GitLab lacks visibility into who our free self-managed users are. Users can simply follow the [self managed install steps](https://docs.gitlab.com/omnibus/installation/index.html) and be up and running with GitLab in minutes. This open-core model is a huge strategic advantage as it lowers the barrier to entry for our product. The downside is that users are not required to register or "sync" their instance with GitLab preventing us from knowing who they are, providing better support and GTM motions, and offering services that may enable them to get even more value out of GitLab. 

This problem has compounding effects as you think through the implications:

GitLab:
* Product lacks visibility into feature usage, adoption, usability issues, and defects. 
* Inefficent GTM motions from outreach and lead generation to sales and support motions upgrading a free self-managed instance to a paid plan. 

End Users & Customers:
* Limited support solutions for customers. 
* Inefficent upgrade experience if that user intends to start a trial or upgrade their instance to a paid tier. 
* Poor customer experience if they run into issues or struggle with adoption and configuration. 

### Direction

We aim to solve this problem by focusing on a couple of key areas. [Cloud Licensing](https://about.gitlab.com/pricing/licensing-faq/cloud-licensing/) will provide a modernized approach to license management for our customers. While only avaliable for instances on a paid tier today, in the future it will address visibility and provide a conduit for GitLab inc to support users who sync their instances with GitLab. [Registration Features](https://internal.gitlab.com/handbook/product/pricing/registration-features/) (internal handbook) will provide an incentive for instances to opt-in to syncing their instances with GitLab and deliver additional value to users who may not be ready to upgrade to a paid tier.  

#### Cloud Licensing

As a piece of underlying infrastructure, we need to enable a way for a customer to "sync" a self managed instance with us. This new system's primary purpose will be to activate and sync paid self-managed licenses for new customers, but can be used to sync unpaid licenses. We launched the first iteration of Cloud License in 14.1 and in 15.1 we've begun to onboard all customers to the new licensing system by default. 

The value to GitLab includes increased visibility into seat utilization along with improved efficiency for sales and support. To the customer, we can provide real-time visibility into an account's utilization and improved tools for user management.

[Epic](https://gitlab.com/groups/gitlab-org/-/epics/5140)

#### Registration Features

Allow free self-managed EE instances that register with GitLab and activate [Service Ping](/handbook/product/analytics-instrumentation-guide/#usage-ping) to access otherwise paid features. These features would add value to the customer's installation and give them a "preview" of what features they could access at a paid tier. Our initial user target for registration features was GitLab Administrators, as they are the users most likely making the decision to activate registration features. As we progress beyond our initial phase, we will look to expand our scope and add features that could also be beneficial to users as well as those with pricing themes. In FY23 we've completed some research which will provide a framework and guidance to make rapid decisions on which features may be a good fit for Registration Features, and intend to release additional registration features on a regular basis going forward.  

[Direction Page](https://internal.gitlab.com/handbook/product/pricing/archived-projects/registration-features/)





