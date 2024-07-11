---
layout: markdown_page
title: "Category Direction - Release Orchestration"
description: Release Orchestration is the ability to coordinate complex releases across projects, in an efficient way that leverages as-code behaviors as much as possible.
---

- TOC
{:toc}

## Release Orchestration

Release Orchestration is the ability to coordinate complex releases, particularly
across projects, in an efficient way that leverages as-code behaviors as much as
possible. We also recognize that there are manual steps and coordination points
involving human decisions throughout software delivery in the enterprise. In these cases, there are teams and release manager roles dedicated to groundguiding these complex enterprise releases, rather than individuals continuously deploying to production.

- [Issue List](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3ARelease%20Orchestration)
- [Overall Vision](/direction/ops/#release)
- [UX Research](https://gitlab.com/gitlab-org/ux-research/-/issues?scope=all&utf8=%E2%9C%93&state=all&label_name[]=Category%3ARelease%20Orchestration) - [Research Insights](https://gitlab.com/gitlab-org/uxr_insights/-/issues?scope=all&utf8=%E2%9C%93&state=all&label_name[]=Category%3ARelease%20Orchestration)
- [Competitive Analysis](https://gitlab.com/groups/gitlab-org/-/epics/2622)
- [Documentation](https://docs.gitlab.com/ee/user/project/releases/index.html)

### Vision

GitLab contains all the necessary tooling for enterprises to orchestrate any complex release. Enterprises are able to plan upcoming launches, garner the necessary approvals, meet organizational compliance requirements, coordinate the entire development lifecycle, and deploy the application to production all from within GitLab. 

All of the people involved with a release are able to use GitLab to perform the necessary manual actions where needed and GitLab can help automate everything else.

GitLab Release Orchestration enables precise deployment of applications of any complexity, making traditional war rooms much more efficient or even unnecessary. Instead, all of the tedious work to step through a launch can be done right within GitLab.

## Manual Processes vs. Automation

At GitLab we believe organizations can accomplish these enterprise grade releases elegantly and effectively with automation. We are a powerful platform that unlocks efficiency within DevOps. As such, we avoid adding manual, non-automated controls to the delivery pipeline. We have completed a competitive analysis of tools that help manage dependencies and advance deployment orchestration in [gitlab&4635](https://gitlab.com/groups/gitlab-org/-/epics/4635). There are many ways GitLab can improve the quality of life for organizations and teams managing deployments. 

A related category in the [Configure stage](/direction/delivery/) describes one approach for users to embrace an [infrastructure as code](/topics/gitops/infrastructure-as-code/) approach to tasks in the category of runbooks. Release Management will be making contributions to this direction as we begin to support more demands for workflows within the GitLab platform. 

### Compliance and Security in the Release Pipeline

Security, compliance, control and governance of the release pipeline is handled as part of [Release Evidence](/direction/release/release_evidence/). Secrets in the pipeline are part of our [Secrets Management](/direction/verify/secrets_management/) category.  Another category for governance and security within GitLab is [Compliance Management](/direction/govern/compliance/compliance-management/), which is inclusive of change management and approval workflows. For governance workflows pertaining to issues and requirements, check out our category of [Requirements Management](/direction/plan/certify/) from the [Plan](/direction/plan/) stage. 

## What's Next & Why

1. [Rename `filepath` parameter in Release REST API](https://gitlab.com/gitlab-org/gitlab/-/issues/273757)
1. [Download/install GitLab release binary via private Homebrew tap](https://gitlab.com/gitlab-org/gitlab/-/issues/375489)
1. [Automatically insert changelog into Release](https://gitlab.com/gitlab-org/gitlab/-/issues/26015)
1. [Group Releases](https://gitlab.com/groups/gitlab-org/-/epics/3561)
1. [Release Notes](https://gitlab.com/groups/gitlab-org/-/epics/2285)

## Maturity Plan

This category is currently at the "Viable" maturity level, and our next maturity target is "Complete" (see our [definitions of maturity levels](/direction/maturity/)).

We believe that expanding interactions from the Release page will progress the maturity to Complete. The Releases page will connect the issues assigned to specific milestone and artifacts generated from a deployment, delivering a single view for a release.

Key deliverables to achieve this are:

- [Add link to runbook in release assets](https://gitlab.com/gitlab-org/gitlab/issues/9427) (Complete)
- [Support More actions in the Release Pages UI](https://gitlab.com/groups/gitlab-org/-/epics/2312) (Complete)
- [Release generation from within `.gitlab-ci.yml`](https://gitlab.com/groups/gitlab-org/-/epics/2510) (Complete)
- [Set a deploy freeze in the UI](https://gitlab.com/gitlab-org/gitlab/issues/24295) (Complete)
- [Update "Create Release" flow to re-use the "Edit Release" form](https://gitlab.com/gitlab-org/gitlab/-/issues/214244) (Complete)
- [Deployer Role in GitLab](https://gitlab.com/groups/gitlab-org/-/epics/4180) (Complete)
- [Associate Group Milestones to Release via API](https://gitlab.com/gitlab-org/gitlab/-/issues/235391)(Complete)
- [Provide a Raw Package Registry for Release Artifacts](https://gitlab.com/groups/gitlab-org/-/epics/4209) (Complete)
- [Add binary assets to Releases](https://gitlab.com/gitlab-org/gitlab/-/issues/36133) (Complete)
- [Associate group milestones to releases](https://gitlab.com/gitlab-org/gitlab/-/issues/121476) (Complete)
- [Support release association to group milestones in UI](https://gitlab.com/gitlab-org/gitlab/-/issues/121476) (Complete)
- [Release analytics at the group level](https://gitlab.com/gitlab-org/gitlab/-/issues/259703) (Complete)
- [Auto changelog for release](https://gitlab.com/groups/gitlab-org/-/epics/4159) (Partial)
- [Group Environments Page](https://gitlab.com/gitlab-org/gitlab/-/issues/241506) 

## Competitive Landscape

Release orchestration tools tend to have great features for managing releases,
as you'd expect; they are built from the ground up as a release management
workflow tool and are very capable in those areas. Our approach to release
orchestration will be a bit different, instead of being workflow-oriented we
are going to approach release orchestration from a publishing point of view.
What this means is instead of building complicated workflows for your releases,
we will focus more on the artifact of the release itself and embedding the
checks and steps into it. 

[Gartner listed GitLab as a challenger in Application Release Orchestration](/blog/2020/01/16/2019-gartner-aro-mq/), 
celebrating the "single product" offering of GitLab as "cloud-native, with a large and rapidly growing customer base". The blurring of the market with the 
convergence of features across various tools in ARO, CI/CS, PaaS, means functionality like AutoDevops and release automation is advantageously positioned to solve 
the problems of more traditional ARO solutions. [Forrester recently listed GitLab as a Strong Performer for the Continous Delivery and Release Automation Wave](https://www.forrester.com/report/The+Forrester+Wave+Continuous+Delivery+And+Release+Automation+Q2+2020/-/E-RES157265), highlighting the advanced controls of release ochestration for cloud native applications. GitLab's ranking as a Forrester Strong Performer is reviewed in a [published blog](https://about.gitlab.com/blog/2020/07/08/forrester-cdra2020/). We are looking forward to administration of releases at scale via [gitlab&3298](https://gitlab.com/groups/gitlab-org/-/epics/3298), where we will re-design the current [Environments Dashboard](https://docs.gitlab.com/ee/ci/environments/environments_dashboard.html) for management of legacy style deployments. Gartner's 2020 Peer Insights' 'Voice of the Customer' synthesized hundreds of reviews and ratings from the perspective of peers to help IT decision makers choose the best solution them. We're excited to be recognized as a "Customers' Choice" for [Application Release Orchestration](https://about.gitlab.com/analysts/gartner-votc20/) based on the qualifications set by Gartner Peer Insights.

![Gartnerpeerinsights](/images/AROcustomerchoice.png "ARO Peer Insights Quadrant")

We have conducted a detailed analysis of XebiaLabs' XL Release offering in ([gitlab#2369](https://gitlab.com/groups/gitlab-org/-/epics/2369)). XL Release's elegance of cross team views, administration of deployments and environments as well as actionable metrics for how Releases are performing are all areas of note. We will be able to compete pointedly by offering [deploy freeze capabilities](https://gitlab.com/gitlab-org/gitlab/issues/24295) and [runbook visibility](https://gitlab.com/gitlab-org/gitlab/issues/9427). Where we will strengthen our approach and confidence in head to head scenarios with XL, will in our next validation tracks. In light of this analysis we aim to improve our experience with environment features like roll backs via ([gitlab#198364](https://gitlab.com/gitlab-org/gitlab/issues/198364)), blue green deployments with ([gitlab#14763](https://gitlab.com/gitlab-org/gitlab/issues/14763)) and support a better view at the group-level in with director-level dashboard for Releases in ([gitlab#3277](https://gitlab.com/gitlab-org/gitlab/issues/3277)). Despite the [merger of XebiaLabs by CollabNet](https://www.businesswire.com/news/home/20200121006172/en/CollabNet-VersionOne-XebiaLabs-Combine-Create-Integrated-Agile), GitLab will continue to thrive as a result of the single platform, single data model. This is especially true as we begin to support more non-technical personas by enhancing the UI experience of release orchestration that many enterprises are interested in. 

Implementing a compelling deployment plan or native runbook offering, such as discussed in [gitlab&4218](https://gitlab.com/groups/gitlab-org/-/epics/4218), will help us more holistically compete with Electric Cloud, as discovered in the competitive analysis conducted in [gitlab&3917](https://gitlab.com/groups/gitlab-org/-/epics/3917).


## Analyst Landscape

Analysts at this time are looking for more quality of life features that make
a difference in people's daily workflows - how does this make my day better?
By introducing features like ([gitlab#26015](https://gitlab.com/gitlab-org/gitlab/issues/26015))
to automatically manage changelogs and release notes as part of releases, we can demonstrate
how our solution is already capable of doing this.

Deploy freezes ([gitlab#24295](https://gitlab.com/gitlab-org/gitlab/issues/24295))
will help compliance teams enforce periods where production needs to remain stable/not change. The 2020 CDRA Wave Analysts featured criteria around scheduling for maintenance windows, which deploy freezes would satisfy. 

Legacy deployment methods, calendar view for deployments and being able to see across a portfolio of releases is becoming more and more relevant as Analysts rank competing solutions like [Digital.ai](https://explore.digital.ai/news-media-coverage/digitalai-named-a-leader-in-gartner-magic-quadrant-for-8th-time-in-a-row) and [Cloudbees](https://www.previous.cloudbees.com/press/cloudbees-named-one-g2%E2%80%99s-top-50-enterprise-products-2020). Better analytics and reporting, such as the CI/CD dashboard in [gitlab#199739](https://gitlab.com/gitlab-org/gitlab/-/issues/199739) and supporting DORA 4 metrics via [gitlab#37139](https://gitlab.com/gitlab-org/gitlab/-/issues/37139), will move the needle for these audiences. Native runbooks, as discussed in [gitlab&4218](https://gitlab.com/groups/gitlab-org/-/epics/4218), are well-positioned to address the need to support non-cloud native deployment plans and are a direct response to rankings on support of legacy deployment methods from the 2020 CDRA Wave. 

## Top Customer Success/Sales Issue(s)

Some customers are looking for deeper seperation of duties and have requested the ability to introduce a new permission setting for allowing specific users or roles to create/edit or delete protected environments in [gitlab#262011](https://gitlab.com/gitlab-org/gitlab/-/issues/262011.)

## Top Customer Issue(s)

Auto-generating release notes from annotated tags via ([gitlab#15563](https://gitlab.com/gitlab-org/gitlab/issues/15563)) can help with automating release orchastration and eliminate redundant work.

## Top Internal Customer Issue(s)

A lot of interest has been expressed in adding the ability to clean up stale environments in the UI ([gitlab#19724](https://gitlab.com/gitlab-org/gitlab/issues/19724)).

## Top Vision Item(s)

This YouTube video on the Release Stage vision, captures a walkthrough of our [3 year mocks](https://gitlab.com/groups/gitlab-org/-/epics/3825) for our broader vision for the release stage:

<!-- blank line -->
<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/UP7Ao4-vibc" frameborder="0" allowfullscreen="true"> </iframe>
</figure>
<!-- blank line -->

We are currently designing and thinking about how to better connect the [Package](/direction/ops/#package) stage with Releases. We are seeing a great use case for adding semantic versioning to Releases as outlined in [gitlab#213838](https://gitlab.com/gitlab-org/gitlab/-/issues/213838), as well improving the [Versioned Dependencies](/direction/versioned-dependencies/) category by implementing better connections between the Release's page of project and the packages created via [gitlab#215390](https://gitlab.com/gitlab-org/gitlab/-/issues/215390).

We have begun investigating the extension of [Merge Trains](https://docs.gitlab.com/ee/ci/pipelines/merge_trains.html) to include final deployment jobs, which are preliminarily called Release Trains, via [gitlab#268246](https://gitlab.com/gitlab-org/gitlab/-/issues/268246).

## What's Next
### Specific issues and epics
1. [Creating a new tag is not clear on new release page](https://gitlab.com/gitlab-org/gitlab/-/issues/367893)
