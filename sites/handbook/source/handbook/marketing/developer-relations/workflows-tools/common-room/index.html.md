---
layout: handbook-page-toc
title: "Common Room workflows"
---

## On this page
{:.no_toc .hidden-md .hidden-lg}

- TOC
{:toc .hidden-md .hidden-lg}

[Common Room](https://docs.commonroom.io/) is a community growth platform that helps manage, engage, and grow digital communities by integrating data across different platforms, identifying members, and reporting trends and sentiment. 

The [Developer Relations](https://about.gitlab.com/handbook/marketing/developer-relations/) team uses Common Room to aggregate, review, and take action on insights from across our community platforms. It is also used to track trends and community sentiment. 

## Business Cases for Developer Relations

### Supporting GitLab Contributors and Super Users
**DRI**: [Contributor Success team](https://about.gitlab.com/handbook/marketing/developer-relations/contributor-success/)

**Description**:
* Monitor [segments](https://docs.commonroom.io/using-common-room/segments-page) Heroes, Core Team, and MVPs. 
* See what topics are trending and track negative sentiment in those segments.
* Spot potential new contributors based on their activity. 

**KPI**:
* Number of active contributors and engagement rate in each segment.

**Outcome**:
* Better understanding of the activities and interests of our top contributors, super users, and new, potential super users.
* Insight into various types of contributions. 

### Community Engagement Tracking
**DRI**: [Fatima Sarah Khalid](https://gitlab.com/sugaroverflow)

**Description**:
* Review popular discussions across all community platforms. 
* Conduct analysis and reporting by creating custom dashboards or exporting reports.
* Track negative sentiments and trending topics. 

**KPIs**:
* Number of active participants and engagement (posts/comments/reactions) across community platforms.
* Overall sentiment analysis of the community.
* Community response rates.

**Outcome**:
* Understanding the level and types of engagement on our community platforms.
* Highlight popular trends and negative sentiment early.
* Prompt discussions or strategies around low activity or engagement.

### Identifying and Monitoring Keyword Trends for Thought Leadership
**DRI**: [Developer Evangelism](https://about.gitlab.com/handbook/marketing/developer-relations/developer-evangelism/) and [Technical Marketing](https://about.gitlab.com/handbook/marketing/developer-relations/technical-marketing/)

**Description**:
* Track trending keywords and conversations via team alerts. 
* Evaluate the relevance of these keywords to our community and goals.
* Create and update a keyword bank for reference and future content creation for thought leadership.

**KPIs**:
* Number and frequency of trending keywords.

**Outcome**:
* Stay informed about the trending topics within the community.
* Guide content creation based on trending topics and community interest. 

### Identifying Opportunities for Open Source Program
**DRI**: [Bryan Behrenshausen](https://gitlab.com/bbehr)

**Description**: 
* Monitor potential organizations for the [Open Source program](https://about.gitlab.com/handbook/marketing/developer-relations/community-programs/opensource-program/).
* Review the activities, trending keywords, and sentiment of existing partners (via segment) to identify potential collaborations. 

**KPI**:
* Percentage of active participation from existing partner organizations.

**Outcome**:
* Identify potential members and activities for the OSS program.
* Increase the number and quality of collaborations by proactively identifying opportunities.

### Identifying Opportunities for the Startups Expansion Program
**DRI**: [Alex Karsten](https://gitlab.com/akarsten1)

**Description**: 
* Monitor potential organizations for the [Startups program](https://about.gitlab.com/handbook/marketing/developer-relations/community-programs/startups-program/).
* Review the activities, trending keywords, and sentiment of existing partners in Community Programs to identify potential collaborations.

**KPI**:
* Percentage of active participation from existing partner organizations.

**Outcome**:
* Identify potential members and activities based on their activity.
* Increase the number and quality of collaborations by proactively identifying opportunities.

### New Member Onboarding (Discord)
**DRI**: [Fatima Sarah Khalid](https://gitlab.com/sugaroverflow)

**Description**:
* Automatically identify new members in the community and send a welcome message, including key resources and community guidelines. Includes options for an automated follow-up. 

**KPIs**:
* Number of new members onboarded and engagement rates.
* Retention rate of new members.

**Outcome**:
* Smooth transition for new members into the community.
* Potential increase in engagement and retention rates.

## Requesting information from Common Room 

For requests to extract information from Common Room, you can open [a confidential issue in the Developer Evangelism Meta project](https://gitlab.com/gitlab-com/marketing/community-relations/dev-evangelism/de-tmm-meta/-/issues) with the details of your request and assign it to `@sugaroverflow`. The DevRel team can then execute the query and export the report as a PDF to the issue.

Requests can be for the export of information or for setting up [a team alert](https://docs.commonroom.io/using-common-room/team-alerts-page) to Slack. You can learn more about the types of reporting in [Common Room's documentation](https://docs.commonroom.io/using-common-room/reporting-page). 

Here are some request-based business cases:

### Tracking specific customer engagement

**DRI**: [Jordan Chivell](https://gitlab.com/jchivell)

**Description**:
Sales may wish to gain key information or context on a specific customer. They would like to see a customer's interaction patterns in the community - posts, comments, key areas of interest, and any queries they may have raised on our community platforms.

**Outcome**:
* Enhanced understanding of customer behavior within the community.
* Support the sales pipeline generation process by providing key contextual information from the community.

## Accessing Common Room

You can access Common Room through Okta or [bookmark the direct link](https://app.commonroom.io/community/3179-git-lab/home).

Team members who are DRIs for specific business cases that require using Common Room directly will be granted a seat on the platform. Access is provided through Okta. Our contract with Common Room is paid per seat, so seats are limited. 

To request access to Common Room,
1. Add your business case and description to this handbook page. 
2. Once the MR is merged, open an [Access Request](https://about.gitlab.com/handbook/business-technology/end-user-services/onboarding-access-requests/access-requests/) for Common Room using the `Individual_Bulk_Access_Request` template.
Once reviewed and merged, open an Access Request. Link to the business case in the description.
3. In Step 2, for _Justification for this access_, please describe and link to your business case for using Common Room. 

## GitLab Data

Common Room doesn't natively integrate with GitLab.
We have a [custom Ruby script](https://gitlab.com/gitlab-org/developer-relations/gitlab-common-room-api-source)
which runs via a scheduled pipeline to injest data.

## Resources

* Common Room's [getting started documentation](https://docs.commonroom.io/get-started).
* Common Room's [playbooks for nurturing community](https://www.commonroom.io/resources/).