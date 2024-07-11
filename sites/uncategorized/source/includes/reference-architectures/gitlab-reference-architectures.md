---
layout: markdown_page
title: GitLab Reference Architectures
---

GitLab is a modular, highly scalable application, distributed in a variety of
packaged formats. When properly configured, it can accommodate from ten, to
hundreds of thousands of users.

Our [reference architectures](https://docs.gitlab.com/ee/administration/reference_architectures/){:data-ga-name="Reference architecture"}{:data-ga-location="body"} can range from a default single-node installation to more
complex clustered setup with different components for availability. We also provide increasing capabilities for availability, scaling, and data replication as customers upgrade to [GitLab Starter, Premium and Ultimate](https://about.gitlab.com/pricing/#self-managed){:data-ga-name="Pricing"}{:data-ga-location="body"}.

It should be noted that our Omnibus distribution provides a reliable service even on a single server without any special configuration. 
As your organization grows, however, GitLab has the flexibility to expand according to your business needs. 

For example:

- Growth in headcount might mean you’ll need to allocate additional resources to your existing installation.
- You may have strict uptime requirements which call for High Availability (HA) solutions and/or zero-downtime upgrades.
- Expanding into new geographical regions means that your teams need performant access to GitLab.
- Your business may require plans for quick restoration of service in the case of a disaster.

All solutions come with a trade-off between cost/complexity and uptime. 
Each availability component comes with its complexity which requires domain knowledge 
to successfully set up and maintain. With this in mind, you should thoroughly analyze the benefits
of a solution against its costs and your team's readiness. It is important that you always choose something that you have experience with. 

For example:

- Database backups requires knowledge of data restoration to ensure prompt recovery.
- A clustered setup requires knowledge of traffic load balancing and scaling data horizontally.
- Implementing cross-site replication and disaster recovery needs regular failover and failback testing to ensure readiness.

A lack of experience with the underlying technologies may prevent you from achieving the desired uptime 
and a badly implemented solution can cause more downtime than it solves.

Properly configured, GitLab can address all of the above cases.

For technical implementation details, see our
[reference architectures documentation](https://docs.gitlab.com/ee/administration/reference_architectures/){:data-ga-name="Documentation"}{:data-ga-location="body"}.

## Please get in touch

Helping you choose the configuration that is right for your business is something we take very seriously at GitLab. The information we provide here is a rough guide designed to help you get a feel for the required resources and expertise required to scale GitLab appropriately. When it comes to your specific situation, we prefer to assess it in its context. We strongly suggest you get in touch with us before setting it up. Support for HA and Geo are included with [GitLab Premium and Ultimate](https://about.gitlab.com/pricing/){:data-ga-name="Pricing"}{:data-ga-location="body"}. If you have any questions please [contact us](https://about.gitlab.com/sales/){:data-ga-name="Contact us"}{:data-ga-location="body"}.
