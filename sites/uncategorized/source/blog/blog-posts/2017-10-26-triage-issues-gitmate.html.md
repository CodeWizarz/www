---
title: "Triage issues in 7 simple steps"
author: Lasse Schuirmann & Sebastian Latacz
author_twitter: gitmate_io
guest: true
categories: culture
image_title: '/images/blogimages/automate-retrospectives.jpg'
description: 'Guest authors Lasse Shuirmann and Sebastian Latacz walk us through how to work through your issue backlog and triage effectively.'
tags: workflow, integrations
---

Actively triaging issues is crucial for keeping an overview on your repository, yet it’s tedious and takes up valuable developer hours. That’s why we summarized seven simple steps to help you triage efficiently.

<!-- more -->

## Preparation

There are three types of issues: questions, bug reports, and feature requests. Define which you want to tackle in your tracker and which you handle elsewhere (you can use different [GitLab Issue Boards](/stages-devops-lifecycle/issueboard/) to help keep different types of issues together). Once this has been done, check each issue with the following scheme:

## 1. Filter noise

Check whether the issue is the type you want in your tracker (as defined in the preparation phase). If not, point the user to the right place or move it to the relevant [issue board](/stages-devops-lifecycle/issueboard/) yourself. For example, indicate that questions will be answered on Stack Overflow or feature requests are best being posted for discussion in the Slack channel. Be friendly; remember the user just provided valuable feedback. Close the issue once you’ve pointed the user to the right place.

## 2. Look for similars

Oftentimes work related to existing issues already exists. Searching your issue tracker for related keywords can bring up a lot of similar issues that can be helpful. Reference the existing issues in the new one.

## 3. Look for duplicates

While you are researching similar topics you might find or remember duplicate issues as well – in that case simply close those (or the new issue) and streamline your efforts in one place.

## 4. Retrieve missing information

Issues are often reported incomplete; critical information like a version number is not given and it turns out that a bug occurred in an unsupported version – ask people for missing information and close issues if that is not provided.

## 5. Label

Label issues so you can find those which are relevant for a particular topic with a filter. Also set labels for states of an issue. For example, putting a `needs-info` label on an issue prevents other people from wasting their time on it.

## 6. Ping related devs

Especially for bigger changes or if it's not obvious how to tackle an issue, you will want to cc developers who are knowledgeable in the area. This can prevent you from running against three walls after each other and make sure all related efforts are coordinated properly.

## 7. Handle stale issues

Every issue has to die. If you're thinking about closing an issue you should probably close it. Also close issues where you have been waiting for an answer for more than 30 days. Be friendly while doing so. The user can always reopen it if needed. This will prevent your tracker from cluttering.

Update 2020-06-29: This post originally included information about automating issue triage using GitMate.io. Please note that GitMate.io was deprecated in January 2019 and references to the project have therefore been removed.
{: .alert .alert-info}

Photo by [Daniele Levis Pelusi](https://unsplash.com/photos/Pp9qkEV_xPk?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/search/photos/automation?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
{: .note}
