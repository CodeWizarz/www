---
title: "Announcing GitLab for DevSecOps"
author: Erica Lindberg
author_gitlab: erica
author_twitter: EricaLindberg_
categories: company
image_title: '/images/blogimages/integrated.jpg'
description: "GitLab brings development, security, and operations into a single application."
tags: GitLab, DevSecOps
cta_button_text: 'Integrate security and development with GitLab'
cta_button_link: '/solutions/dev-sec-ops/'
twitter_text: "GitLab brings dev, sec, and ops into a single application"
featured: yes
postType: corporate
---

[DevOps](/topics/devops/) adoption continues to mature, and as organizations get better at breaking down silos in the development and delivery process to ship software faster, security is moving to the forefront. In fact, [Forrester predicted that 2019 would be the year of security](https://www.forrester.com/report/Predictions+2019+DevOps/-/E-RES144579): “Many organizations have succeeded in automating continuous release and deployment for some applications but face increasing risk from lack of governance and fragmented toolchains.”

[DevSecOps](/topics/devsecops/) is the natural next iteration of DevOps and today we are excited to announce that we are bringing developers, operations professionals, and the security team together in the first single application for the entire DevSecOps lifecycle. Building upon the [security features](/features/#secure) we’ve added over the past 12 months (SAST, DAST, dependency scanning, and container scanning), we’ve also released Auto Remediation, Security Dashboards, and will release [Security Approvals](https://gitlab.com/gitlab-org/gitlab-ee/issues/9928) in 12.1, creating an application with security and compliance built in. Additionally, we’ve expanded our operations capabilities: In addition to our Kubernetes-native integrations and multicloud deployment support, we’ve added [Feature Flags](/direction/release/feature_flags/), an [Operations Dashboard](https://docs.gitlab.com/ee/user/operations_dashboard/), and will release [Incident Management](/direction/service_management/incident_management/) in 12.1.  

<!-- blank line -->
<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/zRUwU6ZE-QA" frameborder="0" allowfullscreen="true"> </iframe>
</figure>
<!-- blank line -->

With GitLab 12.0, releasing on June 22, we continue to support DevSecOps with the addition of Visual Review Tools, project dependency list, and Merge Trains. As our CEO, [Sid Sijbrandij](/company/team/#sytses), says, “GitLab 12.0 marks a key step in our journey to create an inclusive approach to DevSecOps.” And users are already seeing the benefits:

“We already have a frontend team, an SDK and native app team, an SRE team, and a services team all collaborating on development, security, and operations in GitLab,” said Cillian Dwyer, site reliability engineer, Glympse. “Because we're together, we're able to collaborate and ship faster.”

“As a project, we’re excited to see all of the updates GitLab has made. GitLab makes it easy for us to work on community contributions and CI in general,” said Eduardo Silva, maintainer of [Fluent Bit](https://fluentbit.io/) (a Fluentd sub-project), the cloud native, open source logging solution to unify data collection and consumption.

## DevSecOps in a single application

The [advantages of a single application](/handbook/product/single-application/) are numerous: A single sign-on eliminates the need to request access to each separate tool, context switching is reduced which improves cycle time, and work is tracked in one place so you don’t have to do detective work to find the information you need. According to Forrester’s [Manage Your Toolchain Before It Manages You report](/resources/whitepaper-forrester-manage-your-toolchain/), over 40% of enterprises anticipate improved quality, security, and developer productivity by using an out-of-the-box solution. For security professionals, this means that balancing velocity with security is possible.

Security has traditionally been the “final hurdle” in the development lifecycle, tacked on at the end and often reviewed long after the developer committed their code. When security is separate from the DevOps workflow, it becomes a potential bottleneck to delivery. DevSecOps aims to integrate security best practices in the DevOps workflow to ensure every piece of code is tested upon commit. GitLab takes that a step further by building [security capabilities](/direction/secure/#auto-remediation) into the [CI/CD workflow](/topics/ci-cd/), empowering developers to identify vulnerabilities and remove them early, and by providing the security team with their own dashboard to view items not resolved by the developers.   

![GitLab DevSecOps diagram](/images/secure/security-diagram.svg){: .medium.center}

GitLab integrates and automates security into the CI/CD pipeline.
{: .note.text-center}

The approach is to support decision makers with actionable tools that make it simpler to take the right action and learn from it. Instead of security features automatically blocking a pipeline or preventing a new version from being released to production, users can interact with the tool and perform a risk assessment based on the information provided. When triaging vulnerabilities, users can confirm by creating an issue to solve the problem or dismiss them in the case of false positives.

### Secure features in GitLab

We started our DevSecOps journey by empowering developers to spot potential vulnerabilities while coding by embedding [Static Application Security Testing (SAST)](https://docs.gitlab.com/ee/user/application_security/sast/) and [Dynamic Application Security Testing (DAST)](https://docs.gitlab.com/ee/user/application_security/dast/), [Container Scanning](https://docs.gitlab.com/ee/user/application_security/container_scanning/), and [Dependency Scanning](https://docs.gitlab.com/ee/user/application_security/dependency_scanning/) into the CI/CD pipeline.

![GitLab static application security testing feature](/images/secure/sast.png){: .shadow.medium.center}

Detected vulnerabilities are shown directly in the merge request.
{: .note.text-center}

SAST scans the application source code and binaries to spot potential vulnerabilities before deployment, and DAST analyzes your running web application for runtime vulnerabilities and runs live attacks against the review app. Information is shown directly in the merge request and results are sorted by the priority of the vulnerability.

Likewise, Dependency Scanning and Container Scanning are built into GitLab CI/CD and available as part of [Auto DevOps](https://about.gitlab.com/stages-devops-lifecycle/auto-devops/) to provide security by default. Container Scanning runs a security scan to ensure your environment does not have any known vulnerability. Dependency scanning analyzes external dependencies (e.g. Ruby gem libraries), alerting the developer if vulnerable dependencies need updating. Results are shown in both the merge request and pipeline views.

> “Having automated security scans built into GitLab merge requests spanning across the entire DevOps lifecycle go together perfectly with Rancher and K3s. Our joint customers have more confidence that new vulnerabilities are not being introduced into their code before, during and after deployment.” - Shannon Williams, co-founder at Rancher

The next iteration of our security journey included making GitLab a viable product for the security team by automating what can be automated and ensuring security teams have the view they need to understand the current security status of their applications.

![GitLab Security Dashboard](/images/secure/security-dashboard.png){: .shadow.medium.center}
The group-level Security Dashboard in GitLab gives an overview of vulnerabilities for all projects within the group and sub-groups.
{: .note.text-center}

The [Security Dashboard](https://docs.gitlab.com/ee/user/application_security/security_dashboard/) is available at both the group and product level and can be used as a primary tool for security teams. In addition to providing an overview of security status, the Security Dashboard can be used to start a remediation process and provides data visualizations for easy consumption of performance information.

Finally, we are rapidly iterating on Auto Remediation to automate vulnerability fixes. Auto Remediation aims to automate vulnerability solution flow, and automatically create a fix. The fix is then tested, and if it passes all the tests already defined for the application, it is deployed to production. GitLab can then monitor performances of the deployed app, and revert all the changes in case performances are decreasing dramatically, warning the user about the entire process and reducing the need for manual actions. You can [learn more about Auto Remediation and our progress here](https://gitlab.com/groups/gitlab-org/-/epics/759).

> "By adding automated security processes into code delivery, GitLab is furthering productivity by allowing organizations to focus on getting their applications to market not only quickly but securely. We look forward to continuing to work with GitLab as they build out more capabilities in their application, and help companies using GitLab further their multicloud strategy." - Bassam Tabbara, CEO of Upbound

Overall, with security automated throughout the developer workflow and DevSecOps delivered in a single application, we believe companies will continue to advance the way they deliver code, shortening release cycles and focusing on the innovation they will bring to market. For more information on what shipped with 12.0, watch out for the release post on June 22.

Cover image by [Katie Burkhart](https://unsplash.com/@katieanalyzes) on [Unsplash](https://unsplash.com/photos/ks_e5Rf-Cn0)
{: .note}
