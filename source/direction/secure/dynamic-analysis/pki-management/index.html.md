---
layout: markdown_page
title: "Category Vision - PKI Management"
---

## Description

Management of SSL and TLS certificates is a critical part of securing
applications and the infrastructure they run on. Certificates and keys
identify sites as authentic to visitors and other systems. Successful attacks
against them allow attackers to impersonate or severely damage applications
and the companies hosting them.

### Goal

GitLab's goal with PKI Management is to automate the process of
managing, maintaining, and rotating the certificates needed to run your
applications.

In line with our [guiding principles](/direction/govern/#guiding-principles),
we strive to inform you when there is a potential issue, such as expired
certificates or insecure ciphers being used, so that you can take action.
Longer term, our goal is to be able to automatically rotate and update
certificates when these types of issues are detected.

### Roadmap

Maturity epics are linked under the [vision epic](https://gitlab.com/groups/gitlab-org/-/epics/2590)
and will link to individual issues that get us to our maturity goals.

## What's Next & Why

Our [initial MVC](https://gitlab.com/gitlab-org/gitlab/issues/36871) will
focus on identifying if a GitLab deployed
app has an up-to-date SSL certificate in place so that it can safely serve
traffic over HTTPS. Then, if certificates are expired or invalid, we will
notify and alert you so you can take action.

## Competitive Landscape

* [Qualys SSL Labs](http://www.ssllabs.com)
* [ManageEngine Applications Manager](https://www.manageengine.com/)
* [StatusCake](https://www.statuscake.com/)

## Analyst Landscape
Gartner has published a [solution comparison](https://www.gartner.com/en/documents/3909094/solution-comparison-for-pki)
for PKI which describes several vendors and ways to evaluate PKI providers.

## Top Customer Success/Sales Issue(s)

There is no feature available for this category.

## Top Customer Issue(s)

The category is very new, so we still need to engage customers and get
feedback about their interests and priorities in this area.

## Top Vision Item(s)

TODO
