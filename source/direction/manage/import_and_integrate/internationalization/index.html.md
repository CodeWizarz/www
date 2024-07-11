---
layout: markdown_page
title: "Category Direction - Internationalization"
description: "As GitLab evolves, we'd like anyone around the world to be able to use the application and contribute to it. Learn more here!"
canonical_path: "/direction/manage/import_and_integrate/internationalization/"
---

- TOC
{:toc}

## Internationalization

| | |
| --- | --- |
| Stage | [Manage](/direction/manage/) |
| Maturity | N/A |
| Content Last Reviewed | `2023-07-27` |

### Introduction and how you can help

Thanks for visiting the direction page for Internationalization in GitLab. This page belongs to the [Import and Integrate](https://about.gitlab.com/handbook/product/categories/#import-and-integrate-group) group of the Manage stage and is maintained by the group's Product Manager, [Magdalena Frankiewicz](https://gitlab.com/m_frankiewicz) ([E-mail](mailto:mfrankiewicz@gitlab.com), [Calendly](https://calendly.com/gitlab-magdalenafrankiewicz/45mins)).

This vision is a collaboration with the community and anyone can contribute. If you'd like to provide feedback or contribute to this vision, please feel free to comment directly on issues and epics at GitLab.com.

* Main [epic](https://gitlab.com/groups/gitlab-org/-/epics/2722) for Internationalization category.

### Mission

As GitLab evolves, we'd like anyone around the world to be able to use the application and contribute to it. Our goal is to translate the GitLab application to many languages. To support this vision, the product should be built with internationalization in mind as the default (e.g. by continually externalizing strings). 

We also would like to localize GitLab for as many countries and regions as possible. To support this vision, in addition to translating the product, we should present data, such as numbers, dates, time, etc. in the locally expected format.

#### Target Languages

The following languages have been identified as our primary targets for translations:
* Spanish
* Chinese (China)
* Russian
* French
* Japanese
* Portuguese (Brazil)
* German
* Korean

These languages have been targeted due to usage (as measured on GitLab.com) and country profile (large number of native speakers and a strong domestic software development industry) however we will continue to support any language community that wants to translate GitLab.

### Maturity Plan

Internationalization is a **non-marketable category**, and is therefore not assigned a maturity level. However, we use [GitLab's Maturity framework](https://about.gitlab.com/direction/maturity/) to visualize the current state of the category and discuss the future roadmap.

The Internationalization category is currently a **Viable** feature in GitLab. Most of the strings are externalized and available for translations. Several languages are mostly translated (Japanese, Chinese, Ukrainian, Spanish). New translations are being merged on a [monthly cadence](https://gitlab.com/groups/gitlab-org/-/epics/3571).  

There is currently no ongoing work on the **Complete** maturity level for Internationalization. This would include [externalizing](https://gitlab.com/groups/gitlab-org/-/epics/4688) all the strings and [automating](https://gitlab.com/gitlab-org/gitlab/-/issues/19896) most of the process for merging new translations.

## What's next & why

Internationalization is a community-driven effort maintained by the [Import and Integrate group](https://about.gitlab.com/handbook/product/categories/#import-and-integrate-group). The Import and Integrate group is currently planning to only work on critical bugs and security fixes for existing Internationalization features.

While no Internationalization improvements are being actively prioritized in the Import and Integrate group, we intend to continue with these key commitments in 2023:
* [Regular monthly import of the latest translations](https://gitlab.com/groups/gitlab-org/-/epics/3571). We have started importing the latest translations from Crowdin on a regular monthly cadence in April 2020 and intend to continue this process until it is fully automated and continuous.
* [Support for the translation community](https://gitlab.com/groups/gitlab-org/-/epics/2722). We have actively engaged the translation community in order to remove roadblocks for contributing to our translation effort. This includes providing active guidance on translation decisions, awarding swag to star contributors and encouraging language communities to increase their translation levels. 
* We encourage and actively support code contributions from the community. If you are interested in contributing to the translation and localization features, please consider issues from [this list](https://gitlab.com/gitlab-org/gitlab/-/issues?sort=updated_desc&state=opened&label_name[]=Category:Internationalization&label_name[]=Seeking+community+contributions), which directly support GitLab's internationalization efforts.

## What is not planned right now

These feature have been discussed, but there are currently no plans to work on them:
* [Confirm that all strings in GitLab are externalized](https://gitlab.com/groups/gitlab-org/-/epics/4298). We've made significant improvements in our ability to detect non-externalized strings; we need to finish this work and are hold a hackathon to complete string externalization in the application.
* [Automate merge of Crowdin translations](https://gitlab.com/gitlab-org/gitlab/-/issues/19896). We need to implement the required changes to remove any manual steps from the Crowdin translations merge process.

The translation of our documentation and contribution guidance has been discussed on several occasions. However, we currently [do not have a goal to include GitLab documentation](https://gitlab.com/gitlab-org/gitlab/-/issues/15471#note_214823504) into our crowd-sourced translation effort. While this would be a valuable resource for our international users, we do not feel that we can ensure the quality, nor the timely updates to our documentation. 

Finally, no significant changes to our Crowdin program are currently planned. Although we may consider hiring a translation company to translate GitLab in the future, internationalization remains a community-driven effort that can only succeed with the involvement of the wider community.

## How you can help

We're always looking for contributions to help us translate GitLab. [Here's how you can help](https://docs.gitlab.com/ee/development/i18n/#how-to-contribute):
1. [Externalize](https://docs.gitlab.com/ee/development/i18n/externalization.html) strings in GitLab. Before we can translate a string, we first need to mark it so the application is able to retrieve an appropriate translation in another language.
1. Contribute translations at [Crowdin](https://translate.gitlab.com/). You can help contribute new translations to a variety of languages and vote up/down on existing translations.
1. Become a [proofreader](https://docs.gitlab.com/ee/development/i18n/proofreader.html). All translations are read by a [proofreader](https://docs.gitlab.com/ee/development/i18n/proofreader.html) before being accepted, and we're always looking for help across a number of languages.

## Current translation status

This is the overall translation level for all target languages:

[![Translation Status](https://badges.crowdin.net/gitlab-ee/localized.svg "Current Status")](https://translate.gitlab.com/) 
