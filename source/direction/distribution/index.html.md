---
layout: markdown_page
title: "Product Direction - Distribution"
description: "The Distribution group's mission is to set companies up for success by making it easy to deploy, maintain, and update a self-managed GitLab instance"
canonical_path: "/direction/distribution/"
---

- TOC
{:toc}

## Overview
GitLab is the engine that powers many software businesses. In a world where success requires developers to move quickly, it is
important to ensure that end users can accomplish their work as quickly as possible, with minimal interruptions, and they have access to the latest and greatest that GitLab has to offer. The Distribution group's mission is to set companies up for success by making it easy to deploy, maintain, and update a self-managed GitLab instance and ensure it is highly available for their users. 

The distribution team is comprised of two groups, Distribution Build and Distribution Deploy.

### What's Next and Why

We are looking to FY24 Q3 for what's next, this includes GitLab milestones 16.3, 16.4 and 16.5.

The Distribution team is working on [getting the Operator production ready](https://gitlab.com/groups/gitlab-org/-/epics/10968). Our immediate goal for the Operator is to finalize the remaining issues that are keeping us from defining the Operator as ready for production use. The Operator continues to be our proposed direction for cloud-native installs due to its many benefits related to upgrade and management features.

Additionally, for Q3, we hope to perform many [essential upgrades](https://gitlab.com/groups/gitlab-org/-/epics/11047) and generally improve our [upgrade process](https://gitlab.com/groups/gitlab-org/-/epics/11042) for dependencies. Recently, we have been slightly delayed in supporting the latest versions of software we depend on, we want to make an effort to remain more current so customers can more quickly access new features from these software dependencies. Included in this focus, will be to improve our ability to easily update these components and craft a new internal [performance indicator for Distribution supporting new software versions](https://gitlab.com/gitlab-org/distribution/team-tasks/-/issues/1316). This not only benefits customers due to the support of new versions but we will hopefully become more efficient in our support, which will decrease the maintenance required, which will open us up to adding more features to roadmap.

Finally, we have seen a rise in pipeline failures in our development process. So for Q3 we need to dedicate more time to [pipeline improvements](https://gitlab.com/groups/gitlab-org/-/epics/10967). This brings similar benefit to our upgrade process, less time spent for our team members dealing with issues related to pipelines, such as false failures, will be more time spent delivering feature value to users.

### Long-term direction

In support of our goals in Distribution related to the best user experience for deploying, maintaining and updating a GitLab instance, we have a few long term projects we have identified to work towards over the next few years. These projects are hypothetical and will be refined with customer feedback and industry need.

- Cloud Native GitLab alignment

The Distribution team has identified the industry is moving towards a cloud first mindset. In the next few years, more and more companies will be making the migration to cloud native infrastructure. This means we want to expand our tools and features related to cloud native infrastructure and when possible migrate complex VM based installations to cloud native GitLab. This also means researching the possibility of offering Omnibus for single node installs only. There are many features and tools made possible with cloud native infrastructure.

- GitLab Upgrade improvements

It is very important that our self-managed users are able to effectively upgrade their instances. At the moment this is largely left to the administrators to manage but in the future we would like to improve the tools for admins and expand the possible functionality. For example, we could work towards automatic upgrades for instances or changing the self-managed upgrade schedule entirely from a monthly release cycles to rolling updates similar to the cadence of GitLab.com. This forward looking project pairs with cloud native alignment because cloud native instances will be able to more easily upgrade with the Operator, but we should extend this functionality to Omnibus if possible. We want to keep all instance sizes in mind for upgrade improvements. This could mean out of the box upgrade scripts for VMs for admins, or an Operator like feature for Omnibus. Upgrades are important because it means users running self-managed instances can more quickly take advantage of features we release, and stay up to date on security.

- Application package size and optimized framework

It will always be crucial to constantly remain up to date on the latest deployment methods and technology related to packaging. Along with technology we will continue to strive towards efficiency improvements related to our package size and setup. Package size and efficiency is important for users and internally. For users, this will reduce the management requirements, cost to run, and internally the time it takes to test. Additionally, more control over how we package GitLab will allow us to respond more quickly to changes in technology. 

- Efficiency improvements

It will always be on our radar to stay on top of our tech debt and efficiency work. As GitLab, both the application and company, scales, it will create additional maintenance requirements, so we need to ensure efficiency remains at the core of everything we do.

### 1 year plan

The Distribution team has a number of projects we hope to complete and make progress on within the year.

- Image cleanup

Within the year we want to progress on cleaning up the images that we provide for users. This is planned to be done in two ways, working towards smaller images, and reducing the total amount of images. Hosting and maintaining these images is costly in infrastructure and engineering time, so any optimizations we make here will be twofold beneficial. This project supports our initiative for continued efficiency and an optimized framework.

- Zero-downtime improvements

This project directly relates to maturing the GitLab Operator and our cloud native deployments. Improving our feature set in zero-downtime will give users the confidence to upgrade more easily and frequently. Also, users who feel effective in their ability to manage GitLab will feel empowered to manage larger user sets, meaning current customers can grow their users with confidence. This project will impact our upgrade improvement plan and cloud native alignment.

- Helm to Operator

Within a year, we would like to see the Operator be the preferred method for cloud native deployments. This will ideally not cause any disruption or need for a migration from our current Helm method, but will give users many more intuitive and interesting features that the Operator framework enables. An Operator brings and "always on" idea, where as Helm performs strictly as a package manager and installation tooling. The Operator will allow users and admins to continually monitor the health of their instance, automatically scaling to demand, and automatic upgrades in the future. Speaking of upgrades, this directly translates to progressively improving our upgrades in cloud native deployments.

- Compliance 

The Distribution team is a large stakeholder in planned compliance work related to security requirements. We will prioritize the completion of this work in the near term and any required maintenance. The relates to cross-portfolio goals for GitLab as a whole. There is some crossover work with the container image cleanup work.

### Distribution Deploy

The focus for the Deploy group of the Distribution team surrounds configuration, deployment, and operation of GitLab as a whole product. The goal is to deliver an intuitive, clear, and frictionless installation experience, followed by smooth, seamless upgrade and maintenance processes for deployments of any scale. We strive to deliver ongoing operational behaviors for scaling, little to zero downtime upgrades, and highly reliable experiences for not only instance administrators but their users.

The Deploy group will move towards an Operator first investment. The [GitLab Operator](https://docs.gitlab.com/operator/) is where the Deploy group is investing much of its development effort, because of the many benefits the Operator will bring in features for running GitLab instances. Near-zero downtime upgrades, advanced metrics and alerting, and deployment auto-pilot essentially are all on the roadmap for Distribution Deploy. We will not deprecate the Helm chart entirely until we have a simple migration experience in place, from Helm to the Operator, and have provided ample notice of the shift.

### Distribution Build

The focus for the Build group of the Distribution team is to ensure the components that make up GitLab are tested, up-to-date, license compliant,  and available for our users’ platforms and architectures. This segment manages the build pipelines, researches support for new services, platforms, and architectures, as well as maintains existing ones. We strive to respond efficiently to build failures, security results, and dependency changes in order to ensure a safe reliable product for our users.

The Build group will continue to build for diverse Omnibus deployments but will work to bring our cloud native builds forward in features and functionality. We will move our cloud native build away from the helm chart, and invest heavily in the GitLab Operator in 2022. The Build group will work on foundation changes to allow for the success of the GitLab Operator implementation. Additional projects for the Build group will include package improvements such as how components are built and work together in the Omnibus project and then paralleling those change in the charts, and repo signing key management via keyring packages. 

Both groups work on the two categories of distribution below.

## Category

### Omnibus

Today we have a mature and easy to use Omnibus based build system, which is the
most common method for deploying a self-managed instance of GitLab. It includes everything a
customer needs to run GitLab all in a single package, and is great for
installing on virtual machines or real hardware. We are committed to making our
package easier to work with, providing a first-class solution for database fault tolerance, and improving the [zero-downtime upgrade](https://docs.gitlab.com/omnibus/update/#zero-downtime-updates) experience.

[Category Vision](/direction/distribution/omnibus/) &middot; [Documentation](https://docs.gitlab.com/omnibus/)

### Cloud-native installation
We also want GitLab to be the best cloud native development tool, and offering a
great cloud native deployment is a key part of that. We are focused on offering
a flexible and scalable container based deployment on Kubernetes and OpenShift.

The Helm charts are currently considered to be at the [Complete maturity level](https://about.gitlab.com/direction/maturity/). We hope to achieve lovable maturity of our cloud-native installation in FY2023 and recommend in on par with our Omnibus package. We also have developed the [GitLab Operator](https://docs.gitlab.com/operator/), which will continue to mature and help our cloud-native installation mature. These epics will be used to define what it will take to get to the next maturity levels and track the work to be done:

[Viable to Complete](https://gitlab.com/groups/gitlab-org/-/epics/2260)

[Complete to Lovable](https://gitlab.com/groups/gitlab-org/-/epics/5796)

[Category Vision](/direction/distribution/cloud_native_installation/) &middot; [Documentation](https://docs.gitlab.com/charts/)
