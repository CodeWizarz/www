---
layout: markdown_page
title: "Fulfillment Releases"
description: This is the release page for Fulfillment.
canonical_path: "/direction/fulfillment/releases/"
---

- TOC
{:toc}

# Past Releases

## Milestone 13.9

##### [End of Availability of Bronze/Starter](https://gitlab.com/groups/gitlab-org/-/epics/4838)
{:.no_toc}

https://about.gitlab.com/blog/2021/01/26/new-gitlab-product-subscription-model/

##### [SaaS Billable Members iterations](https://gitlab.com/groups/gitlab-org/-/epics/4547#iteration-opportunities) `Sales` `Support`
{:.no_toc} 

1. Add "Last Activity Date" to the Billable Members API [Issue](https://gitlab.com/gitlab-org/gitlab/-/issues/297291)

##### [Make cancelled subscription more obvious](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/2662) `Sales` `Support`
{:.no_toc}

Customers frequently contact support and sales to request a cancellation of their subscription despite the subscription already being set to cancel at the end of the term. This quick change applies a visual `Cancels in [x] days/weeks/months` label on the subscription record to draw user attention to this detail.

##### [Allow users to renew an expired subscription](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/1393) `Sales` `Support`
{:.no_toc}

As per the Sales/Finance policy of updating customer subscriptions to cancelled and closing the respective Renewal opportunity 30 days after subscription term end date, we should allow the customer to renew their expired subscription within customers.gitlab.com with a 30 day grace period as well.


## Milestone 13.8

##### [Add company size to salesforce account create record](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/2388) `Sales`
{:.no_toc}

Now capturing number of employees for new subscription and passing to SFDC in order to enable individual SMB sales quotas via segmentation and location data.

##### [SaaS Billable Members iterations](https://gitlab.com/groups/gitlab-org/-/epics/4547#iteration-opportunities) `Sales` `Support`
{:.no_toc} 

1. Allow users to search the Seat Usage members list [Issue](https://gitlab.com/gitlab-org/gitlab/-/issues/262875)

##### [Subscription expiration banner not dismissable](https://gitlab.com/gitlab-org/gitlab/-/issues/289925) `Sales` `Support`
{:.no_toc} 


## Milestone 13.7

##### [User cap to limit accidental user overage](https://gitlab.com/groups/gitlab-org/-/epics/4315) [Self-managed] `Sales` `Support`
{:.no_toc}
- Past behaviour: Users were accidentally added to an instance, resulting in unforseen trueups and causing extra work for support and sales and a bad experience for the customer.
- New behaviour: Admins can now set a user cap on their instance. Once the instance has reached the cap, any users trying to join, will be placed in a pending approval state, where they do not count as a licensed seat yet, until they have been approved by the Admin.
- Docs: https://docs.gitlab.com/ee/administration/settings/sign_up_restrictions.html#user-cap 

##### [Automate Auto-Renewal process for billing team in CustomersDot](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/2081) `Finance`
{:.no_toc}

This work will prevent the current manual processing on the part of the finance team which is estimated to save over 100 hours of administrative processing monthly.

##### [Incorrect Max and Users over license counts for non-12 month subscriptions](https://gitlab.com/gitlab-org/gitlab/-/issues/7008) `Sales` `Support`
{:.no_toc}
- Pain Point: The current logic for Max users in self-managed instances doesn't work for subscriptions which are more or less than 12 months in duration. This causes issues for customers and sales in trying to determine if a user overage has occurred.
- Improvement: The Max user logic will be updated to account for the duration of the license term regardless of the actual length.

##### [SaaS Billable Members iterations](https://gitlab.com/groups/gitlab-org/-/epics/4547#iteration-opportunities) `Sales` `Support`
{:.no_toc}

1. We've created a [Seat Usage](https://docs.gitlab.com/ee/subscriptions/gitlab_com/index.html#seat-usage) page as the next iteration in a series of earmarked improvements to our SaaS Billable Members toolset. Group owners can now view a listing of the billable users associated with the root group in the Seat Usage page. [Issue](https://gitlab.com/gitlab-org/gitlab/-/issues/268245)
1. Add email address to Seat Usage table. If the user has elected to make their email address [private](https://docs.gitlab.com/12.10/ee/user/profile/#private-commit-email), we will display _private_, otherwise, we are now displaying email address to group owners via the Seat Usage page. [Issue](https://gitlab.com/gitlab-org/gitlab/-/issues/268265)

##### Self-service purchasing improvements [SaaS]  `Sales` `Support`
{:.no_toc}

1. Allow SaaS customers to manually renew their subscription. [Issue](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/2132)
1. Allow users to Add Seats in-app, from the root group namespace [Issue](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/2305)
1. Allow users to Renew in-app, from the root group namespace [Issue](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/2255)

## Milestone 13.6

##### [Ability to purchase and automatically allocate additional storage](https://gitlab.com/groups/gitlab-org/-/epics/4663) `Sales` `Support` 
{:.no_toc}

- Painpoint: Users are blocked by the 10GB per project storage limit with the only path to unblock being to reduce storage or stand-up a new project.
- Improvement: We are launching the ability to purchase additional storage and GitLab will automatically lift any repo storage limit blocks when additional storage is available
- Docs: We are still working on the formal docs for this feature, so please share our FAQ resources with customers in the meantime.
     1. https://about.gitlab.com/pricing/licensing-faq/#about-supplemental-storage
     1. https://about.gitlab.com/pricing/licensing-faq/#can-i-buy-more-storage

##### [Allow for user growth while an order is processed](https://gitlab.com/gitlab-org/license-gitlab-com/-/issues/184) [Self-managed] `Sales`
{:.no_toc}

- Past behaviour: Some sales-assisted orders take a while to move from start to signed, by the time the order is signed and the license is sent, the instance has already outgrown the original seat count requested. This results in customers needing to place another order for additional seats.
- New behaviour: Now there is a 10% threshold for acceptable user growth during the processing period. The customer will be able to upload the license, even if their users have grown and the system will simply recognise the additional users as trueups to be reconciled at the next sales cycle.

##### [Free GitLab.com namespaces should display the number of seats currently in use](https://gitlab.com/gitlab-org/gitlab/-/issues/260378) `Sales` `Support`
{:.no_toc}

- Painpoint: Customers (and sales) cannot easily identify how many seats a free namespace would be charged for if they enter into a subscription.
- Improvement: This change will list the current billable members count on the parent group's billing page for quick reference when making a "buy" decision.

##### [When pending members are approved by admins, log activity in Audit Events](https://gitlab.com/gitlab-org/gitlab/-/issues/276250) `Sales` `Support`
{:.no_toc}

With the recent addition of [Users pending approval](https://docs.gitlab.com/ee/administration/approving_users.html), we have enabled admins to track who approves members via Audit Events.

##### [Display subscription name and end date for GitLab groups in admin](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/2163) `Support`
{:.no_toc}

An awesome Support Team Contribution which now displays the subscription name and end date in the GitLab Groups page of CustomersDot admin.




## Milestone 13.5

##### [Manual EULA process is now deprecated](https://gitlab.com/groups/gitlab-org/-/epics/4606)  `Sales` `Support`
{:.no_toc}

- Painpoint: Some customers needed to accept the End User License Agreement before a subscription was provisioned. This caused confusion, delays and inefficiency and the customer had to contact Sales or Support to get the product they had already paid for. 
- Improvement: Customers can now accept our terms when they upload their license to their instance. They longer no need to accept a EULA before the license gets generated. 

##### [Provide customers with tools to identify Billable Members](https://gitlab.com/groups/gitlab-org/-/epics/4547)  `Support` `Sales`
{:.no_toc}

1. **Update Users API to include billable members** [Self Managed]
     - Past behavior: There was no easy way to get a list of the billable members on an instance. 
     - New behavior: Self-managed customers are able to get a list of the billable users on their instance. The list of users who take up a license seat should correspond with their billable users count on their Admin dashboard.
     - [Issue](https://gitlab.com/gitlab-org/gitlab/-/issues/36750)
1. **API endpoint for billable members** [SAAS]
     - Past behavior: There was no easy way for a customer to get a list of their billable members on their gitlab.com group 
     - New behavior: Customers can now use the billable members API endpoint to get a list of billable members
     - [Issue](https://gitlab.com/gitlab-org/gitlab/-/issues/217384), [Documentation](https://docs.gitlab.com/ee/api/members.html#list-all-billable-members-of-a-group)
1. **Static UI list of billable members** [SAAS]
     - Past behavior: There was no easy way for a customer to get a list of their billable members on their gitlab.com group.
     - New behavior: Customers can now look at their group's billing page for a list of users that take up a seat on their subscription.
     - [Issue](https://gitlab.com/gitlab-org/gitlab/-/issues/216899)

##### [Compute minutes updates for Free tier subscribers](https://gitlab.com/groups/gitlab-org/-/epics/3510) `Sales` `Support` `Finance`
{:.no_toc}

1. Updated monthly compute minutes allotment for free namespaces to 400
1. Updated the purchase price for additional compute minutes to $10/1000 minutes

##### [Original discounts are no longer available at renewal](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/790) `Sales` `Support` `Finance`
{:.no_toc}

- Past behavior: When new customers purchase with a discount, the discounted pricing was locked inside the customer portal for renewals. Customers could proactively renew on customers portal with the same discount and this resulted in lost revenue. 
- New behavior: With this change, the original discounts are no longer available at renewal; customers will pay full price when renewing via customers.gitlab.com.

##### [All invoices are available in customers.gitlab.com](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/503) `Sales` `Support` `Finance`
{:.no_toc}

- Past behavior: Customers had to request invoices from billing and sales as some invoices were not available to them. 
- New behavior: All invoices should now be available to download and view via customers.gitlab.com

##### [Self-managed Billable Users](https://gitlab.com/gitlab-org/gitlab/-/issues/233823) `Sales` `Support` `Finance`
{:.no_toc}

In self-managed instances, we've changed labels to `Billable Users`where we are explicitly referring to users which are counted as taking up a license seat. This is to reduce confusion around inconsistency in using `Active users` within the admin pages.

##### [Notify admins as instance approaches user limit](https://gitlab.com/gitlab-org/gitlab/-/issues/230608#note_414081154) `Sales` `Support` 
{:.no_toc}

As the self-managed instances approaches the subscribed user limit, we are now sending an email to all admins of the instance to prevent undesired surprise user overages.

##### [Project Bot no longer taking up seat](https://gitlab.com/gitlab-org/gitlab/-/issues/223695) `Sales` `Support`
{:.no_toc}

The Access team recently released a new [Project Access Token feature](https://docs.gitlab.com/ee/user/project/settings/project_access_tokens.html#project-bot-users) which creates a GitLab-generated Bot users. This bot was taking up a license seat in the instance. We have now fixed this and moving forward, Project Bot will no longer take up a license seat. Unfortunately the Max User Count will not update for anyone who was affected by this.

##### [Minimum inactivity period for deactivation](https://gitlab.com/gitlab-org/gitlab/-/issues/201769) `Sales` `Support` 
{:.no_toc}

We've updated the requirement from 180 days to 90 days which allows admin to deactivate users more timely. 

##### [Renewals booked at list](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/790) `Sales`
{:.no_toc}

Renewals processed in customers.gitlab.com are now booking at list price. Prior to this change, the deals were closing at the discounted subscription amount if one was ever provided in the past.

##### Improved SaaS subscription internal administration tools `Sales` `Support` 
{:.no_toc}

1. [Ability to search customers.gitlab.com admin by group name](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/273)
1. [Added "Max Seats Used" to GitLab Groups page on customers.gitlab.com admin](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/1910)



-----
# Upcoming Releases

## Milestone 13.10

##### [SaaS Billable Members iterations](https://gitlab.com/groups/gitlab-org/-/epics/4547#iteration-opportunities) `Sales` `Support`
{:.no_toc} 

1. Allow group owners to remove users from the subscription [Issue](https://gitlab.com/gitlab-org/gitlab/-/issues/217851)
1. Add "Last Activity Date" to the Billable Members UI [Issue](https://gitlab.com/gitlab-org/gitlab/-/issues/33457)

##### [Pass namespace to Salesforce Opportunity and Zuora Subscription](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/1989) `Sales` `Support`
{:.no_toc} 

##### [Ultimate is inaccurately counting guests and users without group/project as using a seat](https://gitlab.com/gitlab-org/gitlab/-/issues/300321) `Sales` `Support`
{:.no_toc} 

##### [Send Group Owners email to make them aware of unlinked subscriptions](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/1887) `Sales` `Support`
{:.no_toc} 

##### [Deprovision expired SaaS subscription upon expiration date](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/2101) `Sales` `Support`
{:.no_toc} 




