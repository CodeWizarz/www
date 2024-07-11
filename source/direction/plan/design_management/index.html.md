---
layout: markdown_page
title: "Category Direction - Design Management"
description: "Our goal at GitLab with Design Management is to treat Designers as first-class users within GitLab and support their workflows as good as any product can."
canonical_path: "/direction/plan/design_management/"
---

- TOC
{:toc}

## Design Management

| | |
| --- | --- |
| Stage | [Plan](/direction/plan/) |
| Maturity | [Viable](/direction/maturity/) |
| Content Last Reviewed | `2023-01-16` |

## Introduction

<!-- A good description of what your category is. If there are
special considerations for your strategy or how you plan to prioritize, the
description is a great place to include it. Please include usecases, personas,
and user journeys into this section. -->

**Our goal with Design Management is to give product teams a first-class way to post, discuss and execute on their designs within GitLab. Right now, our feature is only on GitLab issues. We support integrations with major design tools and diagramming tools. Design management will consider the design life cycle from generating ideas, design reviews, design systems, and more.**

- [Issue List](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3ADesign%20Management)
- [Epic List](https://gitlab.com/groups/gitlab-org/-/epics?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3ADesign%20Management)
- [Overall Vision](/direction/plan/)

## Key terminology that helps us segment our roadmap

### Proactive vs Reactive design features

One of the interesting concepts we brainstormed and learned from our analyst conversations was the difference between being proactive or reactive as a designer. Right now, our design management features focus mostly on **reactive design**. 

**Examples of Reactive design work:**
- Attaching designs to issues that were already defined by a PM
- Participating in a workflow or UX research 
- Responding with a UI fix for a bug

**Examples of Proactive design work:**
- Thinking ahead and sketching an idea you had in the shower
- Rough wireframes or flow diagrams of a new concept
- Iterating and posting, then evangelizing the change you came up with
- Showing designs to colleagues for feedback before an issue is created 

### Transient vs Evergreen design features

Design Management at GitLab encompasses two broad areas of features: 

* **1) Transient "Communication-based" features** which have a beginning and end similar to Issues.

  Examples of Transient "Communication-based" Design Management features:
  - Attaching Designs to Issues
  - Visual communication in comments on designs
  - Approvals of Designs
  - Links to prototypes in description of issue
  - Developer handoff with specifications
  - Production Design Inspect to compare the code to the design
  - Issues are closed and Designs are "done"

* **2) Evergreen "Project-based" features** which live as a project or asset on their own. 

  Examples of Evergreen "Project-based" Design Management features
  - Customized Design repositories for backing up native design files
  - Customized Design repositories for connecting local design system files to their live frontend assets
  - Deep linking of assets to original repo files

GitLab is in a unique position to offer both types of Design features because our platform supports issues (collaboration with engineering) and repositories (where the actual code lives).

## Long Term Strategy

Long term, we'll need we need to adapt GitLab to incorporate the design persona as a first class user within the app. From our research, we understand that design workflows are often different from the typical DevOps flow. Many companies that employ "Design First" workflows are often working so far ahead of the DevOps process that we need to consider this as its own ecosystem and key in on. We recognize that this workflow can be quite iterative and often done and presented/approved well ahead of an issue ever being written.

Ideally, GitLab will support the flexibility of any design workflow, while featuring a simplified way to share of Design work. It would allow for independent design deadlines or separate milestones from engineering, and empower the Designer to easily track/follow the issue through to production.

### Typical designer workflow across tools

![Typical designer workflow across tools](images/Typical-designer-workflow.png)

### GitLab vision for a new designer workflow

![Typical designer workflow across tools](images/GitLab-designer-workflow.png)


## Target Audience and Experience
<!-- An overview of the personas involved in this category. An overview
of the evolving user journeys as the category progresses through minimal,
viable, complete and lovable maturity levels.-->

Design Management is targeted at [product designers](/handbook/product/personas/#presley-product-designer) who collaborate with [product managers](/handbook/product/personas/#parker-product-manager) and [software developers](/handbook/product/personas/#sasha-software-developer).

The **minimal** user journey provides designers with the ability to upload mockups to an issue, and for point of interest discussions to happen on each image. Over time these mockups can be updated to resolve the discussions. As the mockups are changed, new versions will be created to facilitate iteration.

We have achieved the core workflow for a design persona on a GitLab Issue and are considering how to build additional Design Management features targeted at [software developers](/handbook/product/personas/#sasha-software-developer) and [product managers](/handbook/product/personas/#parker-product-manager) to expand our growth. 

## What's Next & Why
<!-- This is almost always sourced from the following sections, which describe top
priorities for a few stakeholders. This section must provide a link to an issue
or [epic](/handbook/product/product-processes/#epics-for-a-single-iteration) for the MVC or first/next iteration in
the category.-->

### Now
Since Design Management has moved to the Product Planning group, we've paused on new development and are reevaluating direction.

### Next
Once work on this category resumes, our focus will be on new expansion themes that will enable more users to use design management:
  1. Personas - Only 0.86% of all GitLab users identify as "Designer". We want to open the design view to more personas by enabling the design view on attachments, repo files, and diagram integrations.
  1. Expand to more stages - Designs on e.g. MRs (highest traffic), epics and the left sidebar.
  1. Integrations - Allowing more tools to push to designs (Figma, Draw.io, Sketch, Adobe XD).


### [Achieved] Goal 1: Moving up to viable maturity

**Dogfood Design Management and get out of Minimal** - We're working on an [internal dogfooding epic](https://gitlab.com/groups/gitlab-org/-/epics/2582) which contains the issues that will help us remove the major pain points that our internal GitLab team has surfaced. This will take us a long way towards viable as these are the biggest usability concerns.

### [Achieved] Goal 2: Growth and Performance Indicators

** [Enable our product analytics](https://gitlab.com/groups/gitlab-org/-/epics/3222)**

** [Integrate with major design tools to support current workflows and increase users](https://gitlab.com/groups/gitlab-org/-/epics/2405)** - We started official [Figma](https://gitlab.com/gitlab-org/gitlab-figma-plugin) and [Sketch](https://gitlab.com/gitlab-org/gitlab-sketch-plugin) projects to work on our plugins.

### Goal 3: Empower more personas

**Next: [Adding drawing and diagram files to the Designs](https://gitlab.com/gitlab-org/gitlab/issues/199694)** - Allow the creation of a diagram or drawing directly inside the browser via an integration. We'll investigate the right ways to "open up the drawing board" to anyone working on an issue.

**Next: [Empower Product Designers and Leaders to easily stay on top of design progress at GitLab](https://gitlab.com/gitlab-org/gitlab/issues/196240)** - Move "Designs" to its own space on the left side menu above Issues. Here we'll see all design updates in real time and map design images to issues in a more seamless and connected flow. Also to consider here would be to allow designs posted without an issue to encourage rapid feedback and turn around on ideas.


### Later

**Later: [Developer Handoff in Review Apps](https://gitlab.com/groups/gitlab-org/-/epics/2406)** - Upgrade the existing Visual Review feature to have original Epic or Issue Designs move forward in the GitLab workflow for visual inspection in the merge request. The Product Designer would be notified and invited to also inspect which would cut down on a lot of back and forth communication that currently happens offline. Empower the Engineer and the Product Designer to compare the original design with live app. Allow them to give visual feedback by attaching comments to dom elements or on an x,y access. For example: Move a transparent overlay of the original design around to check measurements and other visual aspects.

**Later: [Design reviews and approvals](https://gitlab.com/groups/gitlab-org/-/epics/990)** - Once we have more usage of our designs throughout the DevOps flow, add approvals or other checks and balances that may be needed to lock down a design. The first step is to understand how current review and approval processes work outside of GitLab and how we could adapt those to GitLab.

**Later: [Design Management prototyping support](https://gitlab.com/groups/gitlab-org/-/epics/1728)** - currently Design Management only supports static images which are a valuable part of the design process, but may not be able to fully communicate the user experience. Part of enabling communication around that process is to allowing users to create simple click-through prototypes for designs.

**Later: [Git backup of design files](https://gitlab.com/gitlab-org/gitlab/issues/200088)** - When teams share source files such as the Pajamas Sketch file there is a lot of overhead with checking that file in and out of a repo and having a design team share the file. We also would consider LFS (Large file system) and design agencies who may have huge repositories and would only be able to check out just a part of the entire repo for use.

**Later: Live Sketching in Issues** Allow users to draw freehand on a digital whiteboard and see the real time cursor and sketching of other users who are live with them. We think this will enable more "off-the-cuff" brainstorming and foster an in-person experience with colleagues, even if working remote.

**Later: Deep linking of assets** - Imagine seeing an image asset in your repo or within a wiki and being able to click a button to pull down its original artwork from Sketch/Photoshop or beyond. If we achieve git backup of design files, we should be able to create deep links to their source artboards.

**Later: AI to compare Designs to Production**  With the emergence of AI technologies, eventually Design AI could be a part of the CI pipeline to scan for visual changes against the original design, report differences, and recommend changes.

## Competitive Landscape
<!-- The top two or three competitors, and what the next one or two items we should
work on to displace the competitor at customers, ideally discovered through
[customer meetings](/handbook/product/product-processes/#customer-meetings). We’re not aiming for feature parity
with competitors, and we’re not just looking at the features competitors talk
about, but we’re talking with customers about what they actually use, and
ultimately what they need.-->

Within the Design Tools market, each product broadly solves one or more of these problems:

- Approvals and lock down of designs
- Generate developer specifications (Developer handoff)
- Version control
- Visual communication via comments
- UX Research and UI Testing
- Designing and prototyping
- Design System creation and management

The most full featured Design Tools, that are attempting to solve all these problems are:

- [Invision Studio](https://www.invisionapp.com/studio)
- [Figma](https://figma.com)
- [UX Pin](https://www.uxpin.com/)

What is missed in the current market:

- "Production Design Inspect": Visual inspection of frontend code against the original designs on the issue or original prototype with a focus on the fidelity review of the code a developer actually implemented vs. the design they meant to implement
- Tracking and conversion of local design elements to their live Design System counterpart in the repo

Given GitLab's unique strength as the single source of truth for planning and source code, we are well positioned to work with Product Design teams and encourage Product Designers to participate from design iteration through to production:

- Review and collaboration, bringing designers deeper into the tool that they already use to understand what needs to be designed and built, and integrating the design workflow into the planning and development workflow.
- Version control for source code is a core competency of GitLab, with great support for LFS and upcoming native support for large files in Git. Building on this to support versioning of designs and automation with CI is a natural fit.

## Market Research
<!-- This section should link or highlight any relevant market research you've done that justifies our
entry into the market for the particular category. -->

A [competitive analysis](https://docs.google.com/document/d/12o6h6Fm7bAjhW5AK1r-PNhvn0QrQwZncorYNia12e3Q/edit) was also conducted to further understand existing players in the market.

## Business Opportunity
<!-- This section should highlight the business opportunity highlighted by the particular category. -->

### Estimating our CSM for Design Management

We've learned that a typical designer:developer ratio is [1:8](https://techcrunch.com/2017/05/31/here-are-some-reasons-behind-techs-design-shortage/) (at GitLab, our ratio is 1:7).  

Also, we know there are [24M developers worldwide](https://www.statista.com/statistics/627312/worldwide-developer-population/).  

24M / 8 = 3M designers worldwide

If we achieved signing up all of these designers for GitLab, our CSM would be $684M on Premium and $3.6B on Ultimate.

### Growth of other tools

There is a significant opportunity for an application that can successfully engage developers and design teams before and during the DevOps lifecycle. If GitLab integrates with the major design tools such as InVision (5,000,000 users), Sketch (1,000,000 users,) and Figma (1,000,000 users) and adds value in the form of visual developer handoffs, we believe product quality will increase.

## Analyst Landscape
<!-- What analysts and/or thought leaders in the space talking about, what are one or two issues
that will help us stay relevant from their perspective.-->

We've had briefings with Redmonk, Forrester and Gartner. We've validated that we are solving a big problem with our proposal to bring Designers into Devops. We learned that a new potential term for this type of software is: "Digital product design platforms" and we are also considering the term "DesignOps" which might play well with DevOps at GitLab.

## Top Customer Success/Sales issue(s)
<!-- These can be sourced from the CS/Sales top issue labels when available, internal
surveys, or from your conversations with them.-->

No customer issues yet, because the feature is so new

## Top user issue(s)
<!-- This is probably the top popular issue from the category (i.e. the one with the most
thumbs-up), but you may have a different item coming out of customer calls.-->

*  [Visual UML Editor](https://gitlab.com/gitlab-org/gitlab/-/issues/15932)  
*  [Disable Design Management](https://gitlab.com/gitlab-org/gitlab/-/issues/230286)
*  [Enable uploading of PDFs for Design Management](https://gitlab.com/gitlab-org/gitlab/-/issues/230286)
*  [User Journey Mapping](https://gitlab.com/gitlab-org/gitlab/-/issues/10419) 
*  [Make the design management LFS placeholder dismissable](https://gitlab.com/gitlab-org/gitlab/-/issues/231240) 
*  [Rethinking information architecture of Design Management](https://gitlab.com/gitlab-org/gitlab/-/issues/204743)
*  [Show designs on epics](https://gitlab.com/gitlab-org/gitlab/-/issues/204743)

## Top dogfooding issues
<!-- These are sourced from internal customers wanting to [dogfood](/handbook/values/#dogfooding)
the product.-->

*  [Internal dogfooding epic](https://gitlab.com/groups/gitlab-org/-/epics/2582) - this gets us through the major pain points that our internal GitLab team has surfaced
*  [Versioned designs and point of interest discussions](https://gitlab.com/groups/gitlab-org/-/epics/660) - the MVC addresses the most frequent frustrations with the current workflow which involves uploading images in a markdown table.

## Top Vision Item(s)
<!-- What's the most important thing to move your vision forward?-->

*  [Design process automation](https://gitlab.com/groups/gitlab-org/-/epics/991) - version control the source files in a git repo, and push to update the designs attached to issues.
*  [Design Management prototyping support](https://gitlab.com/groups/gitlab-org/-/epics/1728) - static designs don't fully communicate the user experience; adding support for prototypes can further expand collaboration
*  [Design reviews and approvals](https://gitlab.com/groups/gitlab-org/-/epics/990) - like merge requests, designs need reviews and approvals before being approved to proceed.
