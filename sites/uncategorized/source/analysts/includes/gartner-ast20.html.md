---
layout: markdown_page
title: "Gartner Magic Quadrant for Application Security Testing 2020"
description: "This page shares how Gartner positioned us on the Magic Quadrant and viewed our application testing capabilities in relation to the larger market."
canonical_path: "/analysts/gartner-ast20/"
noindex: true
---
## GitLab is named in the 2020 Gartner Magic Quadrant for Application Security Testing
This page shares how Gartner positioned us on the Magic Quadrant and viewed our application testing capabilities in relation to the larger market and how we're working with that information in our ongoing product evolution.

### Gartner's Key Takeaways on the AST Market at time of report publication

**Market Definition/Description**

In the published document, "Gartner defines the application security testing (AST) market as the buyers and sellers of products and services designed to analyze and test applications for security vulnerabilities."

According to Gartner, "We identify four main AST technologies:
  - Static AST (SAST) technology analyzes an application’s source, bytecode or binary code for security vulnerabilities, typically at the programming and/or testing software life cycle (SLC) phases.
  - Dynamic AST (DAST) technology analyzes applications in their dynamic, running state during testing or operational phases. It simulates attacks against an application (typically web-enabled applications and services and APIs), analyzes the application’s reactions and, thus, determines whether it is vulnerable.
  - Interactive AST (IAST) technology combines elements of DAST simultaneously with instrumentation of the application under test. It is typically implemented as an agent within the test runtime environment (for example, instrumenting the Java Virtual Machine [JVM] or .NET CLR) that observes operation or attacks and identifies vulnerabilities.
  - Software composition analysis (SCA) technology used to identify open-source and third-party components in use in an application, their known security vulnerabilities, and typically adversarial license restrictions."

 Gartner also explains how they see the AST market evolving over time: "Gartner has observed the major driver in the evolution of the AST market is the need to support enterprise DevOps initiatives. Customers require offerings that provide high-assurance, high-value findings while not unnecessarily slowing down development efforts. Clients expect offerings to fit earlier in the development process, with testing often driven by developers rather than security specialists. As a result, this market evaluation focuses more heavily on the buyer’s needs when it comes to supporting rapid and accurate testing capable of being integrated in an increasingly automated fashion throughout the software development life cycle. In addition, Gartner recognizes the growing relevance of containers as an attractive technology for application development, especially for cloud-native applications. We have added support for containers as a factor in the 2020 Magic Quadrant."



### Gartner's take on GitLab at time of report publication

In this report, GitLab is named/positioned as a Niche Player. Gartner defines a Niche Player in the following way: "Niche Players offer viable, dependable solutions that meet the needs of specific buyers. Niche Players fare well when considered for buyers looking for “best of breed” or “best fit” to address a particular business or technical use case that matches the vendor’s focus. Niche Players may address subsets of the overall market. Enterprises tend to pick Niche Players when the focus is on a few important functions, or on specific vendor expertise or when they have an established relationship with the vendor. Niche Players typically focus on a specific type of AST technology or delivery model, or a specific geographic region."


## GitLab's commentary on this report

We are thrilled to be included in the Magic Quadrant for Application Security Testing!

**Validating the importance of security within CI**

GitLab aspires to the an industry leader with its [Application Security Testing capabilities](https://about.gitlab.com/direction/secure/). We are rapidly pursuing this vision through both internal growth and [acquisition](https://about.gitlab.com/press/releases/2018-01-30-gemnasium-acquisition.html).

We have grown our capabilities quickly by focusing less on reinventing scanners and more on providing the results where they are most useful in the software development lifecycle - to the developer. While security teams typically find vulnerabilities, the developer is in the position to remediate them. GitLab's focus is on empowering the developer to find and fix as much as they can while they are still iterating on the code's development, an approach that is far less expensive and more efficient.

**Enabling the developer**

GitLab's strength is our workflow. Unlike traditional application security tools primarily intended for use by security pros, GitLab security testing capabilities are built into the CI/CD workflows where the developers live. At the same time, GitLab provides security professionals with a dashboard to view items resolved by the developer, across projects. This contextual approach helps each role deal with items that are most important and most relevant to their scope of work within their unique workflow.

Benefits of this approach:

* Meets the developer on their turf; no context switching
* Tests the delta code changes, allowing scans to complete rapidly and iteratively alongside coding efforts
* Provides results before code is merged with others making results accountable with clear cause-and-effect
* Requires no added tools; leverages a tool the developer already uses
* Provides results in the CI pipeline as actionable findings, not as a comment
* Requires no set up with SAST, DAST, Dependency scanning, Container scanning and License Compliance available "out-of-the-box".

Read more about our workflow in the whitepaper: [A Seismic Shift in Application Security](https://about.gitlab.com/resources/whitepaper-seismic-shift-application-security/ )

**SDLC Integration**

In the publication, Gartner's SDLC Integration requirements capture the ability to deeply and seamlessly integrate the AST solution into the SDLC, particularly critical in DevOps environments. They go on to clarify that tools should support integration across multiple types of development environments via APIs and plug-ins.

We believe given that their client readership is comprised of a broad spectrum of enterprise application security professionals that spans traditional and more modern application security requirements, in this evaluation they valued app sec tools that integrate with many development environments types. Because of this, they placed GitLab as a Niche vendor.

Yet what makes us a niche, also makes us the very best solution for the growing number of GitLab users.

**A valuable niche for GitLab users**

While it was true at the time of the assessment that those not using GitLab for CI would find it impractical to use GitLab security scanning, we are working to show how you can use GitLab's security testing even if you are using Jenkins for CI. This would broaden the utility to customers that may be only using GitLab for Source Code Management (SCM).

In addition, recognizing that GitLab customers often have their favorite incumbent scanner, we are working to make it easier for other vendors to more seamlessly integrate their scan results into the GitLab CI pipeline and security dashboard found in the Ultimate tier. WhiteSource is one of the first to do this [integration](https://www.whitesourcesoftware.com/gitlab/) in a way that optimizes benefit to our joint customers.

The lack of an IDE plug-in is less important for our intended audience of GitLab users.  GitLab has our own [web IDE](https://docs.gitlab.com/ee/user/project/web_ide/) within SCM and so we see less need to plug into Visual Studio or Eclipse. We also do not have a spell-check-like functionality because those are typically a scaled down version of SAST. They cannot be relied upon as a scan replacement, and, since we do full SAST plus SCA and DAST right at the point of code commit, catching vulns as they are typed has been less important to our users. We may add it in the future, but haven’t seen the demand for it given our unique workflow.


## Looking forward - We've only just begun!

We agree with Gartner that our features are less mature, our languages more limited than some vendors, and our dashboard not as customizable! Iteration is important at GitLab. We release useful capabilities to the market quickly and then add features quickly, releasing on 22nd each month. We are rapidly maturing our offering. Since the time of Gartner's assessment, (version 12.4), we have added many [new features](https://about.gitlab.com/releases/).

**A couple favorite SAST improvements include:**
* [SAST for React](https://docs.gitlab.com/ee/user/application_security/sast/#supported-languages-and-frameworks),
* [SAST for Kubernetes](https://docs.gitlab.com/ee/user/application_security/sast/#supported-languages-and-frameworks), and
* [SAST with private dependencies](https://docs.gitlab.com/ee/user/application_security/sast/#using-environment-variables-to-pass-credentials-for-private-repositories).

**Beyond SAST, we've added other key capabilities such as:**
* [Offline Environment Support](https://docs.gitlab.com/ee/user/application_security/offline_deployments/) where self-managed installations can use our Secure capabilities in environments with physical barriers or security policies (for example, firewalls) that prevent or limit internet access.
This environment is often referred to as an air-gapped environment.
* [Suggested Solutions for Container Scanning](https://docs.gitlab.com/ee/user/application_security/container_scanning/#solutions-for-vulnerabilities-auto-remediation) to automatically apply a remediation solution via auto-remediation.
* Risk Scores in the [Group Security Dashboard](https://docs.gitlab.com/ee/user/application_security/security_dashboard/#group-security-dashboard) making it easy to quickly target problem projects.

**We have also expanded language coverage via our [technology partnerships](https://about.gitlab.com/handbook/alliances/#interested-in-a-gitlab-technology-partnership).**

A complete list of features released since 12.4 can be found on the [releases page](https://about.gitlab.com/releases/).

In May we plan to launch [Stand-alone Vulnerabilities](https://gitlab.com/groups/gitlab-org/-/epics/634), essentially a re-architecture of how we handle vulnerability findings aimed to help security pros by more easily tracking and reporting vulnerabilities and their status (even to people not using GitLab).

**Transparency**

GitLab's security capabilities [direction](https://about.gitlab.com/direction/secure/)
and product [roadmap](https://about.gitlab.com/direction/secure/#upcoming-releases) are both entirely transparent.
We encourage everyone to contribute! Check out our [upcoming releases](https://about.gitlab.com/direction/secure/#upcoming-releases), and weigh in with upvotes and comments as to how these planned features can be most impactful for you.

**We are also Shifting Right**

In addition to application security testing, GitLab is working to provide the best defensive protection of your cloud-native applications and their operating environments. Check out our [Secure](https://about.gitlab.com/direction/secure/) vision!

**Note:** Gartner, Magic Quadrant for Application Security Testing, Mark Horvath, Dionisio Zumerle, Dale Gardner, 29 April 2020.
{: .note .font-small .margin-top40}

Gartner does not endorse any vendor, product or service depicted in its research publications, and does not advise technology users to select only those vendors with the highest ratings or other designation. Gartner research publications consist of the opinions of Gartner’s research organization and should not be construed as statements of fact. Gartner disclaims all warranties, express or implied, with respect to this research, including any warranties of merchantability or fitness for a particular purpose.
{: .note .font-small}
