---
layout: markdown_page
title: Managing compute minutes FAQ
description: "On this page you can view frequently asked questions for managing compute minutes limits"
canonical_path: "/pricing/faq-compute-minutes/"
---

# Customer FAQ - Managing compute minutes Usage

{:.no_toc}

### On this page

{:.no_toc}

{:toc}

- TOC

## Managing your compute minutes usage

**Note:** The term `CI/CD minutes` is being renamed to `compute minutes`. During this transition, you might see references in the UI and documentation to `CI/CD minutes`, `CI minutes`, `pipeline minutes`, `CI pipeline minutes`, `pipeline minutes quota`, `compute credits`, `compute units`, and `compute minutes`. For more information, see [epic 2150](https://gitlab.com/groups/gitlab-com/-/epics/2150).
{: .note}

**Q. How can I view and manage my compute minutes usage?**

A. A Group Owner can view compute minutes usage on the Usage page in your Group settings page. 

**Q. How can I view and manage my compute minutes usage on public projects?**

A. The compute minutes limit is applicable for public projects on GitLab.com as well. 

**Q. How can I reduce the amount of compute minutes consumed?**

A. There are a few methods to consider to reduce the number of compute minutes consumed:

- Utilize [interruptible](https://docs.gitlab.com/ee/ci/yaml/#interruptible) to abort out of date pipelines;
- Be more selective about when jobs run, for example setting certain jobs to only: run when certain files are changed using [only:changes](https://docs.gitlab.com/ee/ci/yaml/#onlychanges--exceptchanges); and
- Optimize your CI jobs to complete more quickly
- Bring your own runners

Watch this deep dive video on how you can manage your compute minutes usage.

<!-- blank line -->
<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/GrO-8KtIpRA" frameborder="0" allowfullscreen="true"> </iframe>
</figure>
<!-- blank line -->

**Q. What happens if I hit the compute minutes allotted limit and forget to purchase additional compute minutes?**

A. You will not be able to run new jobs and running jobs may be terminated until you purchase additional compute minutes, or until the next month when you receive your monthly allotted compute minutes.

**Q. Do compute minutes purchased during a trial roll into the paid subscription?**

A. Purchased compute minutes will remain on a namespace after the trial completes and will be accessible until they run out.

**Q. Will I be notified before I hit my limit on compute minutes?**

A. You will receive notification banners in-app when your group has less than 30%, 5% or exceeded your total allotted compute minutes.

<table>
 <tr>
 <td>Percentage Remaining
 </td>
 <td>Users Notified
 </td>
 <td>Notification Type
 </td>
 <td>Frequency
 </td>
 </tr>
 <tr>
 <td>30%
 </td>
 <td>Owners
 </td>
 <td>Banner
 </td>
 <td>Permanent
 </td>
 </tr>
 <tr>
 <td>5%
 </td>
 <td>Owners
 </td>
 <td>Banner
 </td>
 <td>Permanent
 </td>
 </tr>
 <tr>
 <td>0%
 </td>
 <td>Owners
 </td>
 <td>Banner
 </td>
 <td>Permanent
 </td>
 </tr>
</table>

**Q. Can I proactively monitor my compute minutes usage?**

A. Yes, you can use the [REST API](https://docs.gitlab.com/ee/api/) on GitLab.com to monitor your compute minutes usage and integrate this into your standard monitoring tools. Here are a few examples for check plugins and Prometheus integrations:

- https://gitlab.com/6uellerBpanda/check_gitlab/-/tree/master#ci-runner-jobs-duration
- https://github.com/mvisonneau/gitlab-ci-pipelines-exporter

**Q. Are compute minutes used on users/customers' own runners accounted into the quota?**

A. No. The compute minutes limit is for jobs using GitLab shared runners. Users/Customers can bring their own runners. compute minutes used on their own runners are not accounted into the limit.

## Purchasing additional compute minutes

**Q. How much does it cost to buy additional compute minutes?**

A. compute minutes per top-level group (or personal namespace) are $10 per 1,000 minutes and it is valid for one year from the date of purchase. compute minutes purchased do not auto-renew. Purchased minutes are only valid for 12 months from the date of purchase or until all minutes are consumed, whichever comes first.

**Q. Will I have different compute minute pricing for Windows and Linux?**

A. No. The pricing is the same regardless of the operating systems.

**Q. How do I purchase additional compute minutes?**

A. See [Purchase additional compute minutes](https://docs.gitlab.com/ee/ci/pipelines/cicd_minutes.html#purchase-additional-cicd-minutes).

## More information

To upgrade to a paid GitLab.com Tier, [purchase online](https://docs.gitlab.com/ee/subscriptions/gitlab_com/) or contact [GitLab Sales](https://page.gitlab.com/ci-minutes.html)

To address your questions and feedback, we have created a space in the [GitLab Community Forum](https://forum.gitlab.com/t/ci-cd-minutes-for-free-tier/40241), which is actively monitored by GitLab Team members and Product Managers involved with this change.
