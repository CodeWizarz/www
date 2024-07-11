---
layout: sec_direction
title: "Category Direction - Fuzz Testing"
description: "GitLab's fuzz testing helps you find security vulnerabilities and bugs that traditional QA misses."
canonical_path: "/direction/secure/dynamic-analysis/fuzz-testing/"
---

- TOC
{:toc}
## Secure

| | |
| --- | --- |
| Stage | [Secure](/direction/secure/) |
| Maturity | [Viable](/direction/maturity/) |
| Content Last Reviewed | `2023-07-18` |

## Description
### Introduction and how you can help

Thank you for visiting this category direction page on Fuzz Testing at GitLab. This page belongs to the Dynamic Analysis group of the Secure stage and is maintained by [Sara Meadzinger](https://gitlab.com/smeadzinger).

This direction page is a work in progress and everyone can contribute:

 - Please comment and contribute in the linked [issues](https://gitlab.com/gitlab-org/gitlab/-/issues?scope=all&state=opened&label_name[]=Category%3AFuzz%20Testing) on this page. Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.
 - Please share feedback directly via email or on a video call. If you're a GitLab user and have direct knowledge of your need for Fuzz Testing, we'd especially love to hear from you.

## Overview
<!-- A good description of what your category is. If there are
special considerations for your strategy or how you plan to prioritize, the
description is a great place to include it. Please include usecases, personas,
and user journeys into this section. -->

Fuzz testing, or fuzzing, is the act of inputting unexpected, malformed, and/or
random data to measure response or stability of an application or service.
This is accomplished by monitoring for unexpected behavior or service / application
crashes. Fuzz testing will find issues that traditional testing and QA methods
typically do not.

The goal of fuzz testing is to discover software defects that need to be addressed
as these defects may lead to (exploitable) vulnerabilities that other QA methods
and security scanning miss. Fuzz testing can
find not only security issues, but also flaws in the business logic of an
application or service.

> GitLab was recently named as a [Challenger in the 2022 Magic Quadrant for Application Security Testing](https://about.gitlab.com/analysts/gartner-ast22/).

### Types of fuzz testing

GitLab offers two types of fuzz testing:
- Coverage-guided fuzz testing
    - Coverage-guided fuzz testing is all about using contextual information
    from source code to better inform fuzz tests as well as to help correlate
    the results of a fuzz testing crash directly to the region of code that was
    vulnerable. This can be thought of as an "inside-out" oriented approach.
    This dramatically improves the cycle time to go from an initial
    fuzz test to a crash to an update to vulnerable areas.

      A large benefit of coverage-guided fuzz testing is that it can be done
      without requiring all development of an app to be completed or for
      a Review App to be created for live testing. Instead, coverage-guided
      fuzz testing can be done iteratively on small parts of the app. A common
      workflow is to extend unit tests to perform fuzz testing on small parts
      of the app until the whole app is completed.
      This means that you can integrate fuzz testing earlier into your SDLC and
      [shift security further left](https://about.gitlab.com/direction/secure/#shift-left-no-more-left-than-that).
      Getting these results sooner means that developers can act on them sooner,
      reducing cycle times.
- Traditional fuzz testing
    - Traditional fuzz testing is a technique that uses a definition of the inputs
    a target application is expecting to better understand
    the Implementation Under Test (IUT). This allows the fuzzer to
    smartly make mutations that are very close to valid,
    in contrast to fuzzers that don't understand the expected inputs of the IUT are.
    In contrast to coverage-guided fuzz testing, this is more of an "outside-in"
    oriented approach.

      Additionally, traditional fuzz testing is able to observe how the behavior of the
      IUT changes to make different decisions for subsequent fuzz tests. For
      example, if a traditional fuzz test notices that a specific type of input
      causes HTTP 500 errors, it could make similar sorts of mutations to find
      errors in the same parts of the app. This approach provides better quality
      of results by inducing more faults and helping to pinpoint where they are
      in the app.

#### Fuzz testing strategies
Fuzz testing can be performed using one of the two [fuzz algorithm strategies](https://resources.infosecinstitute.com/fuzzing-mutation-vs-generation/):
- Mutation → Also known as dumb fuzz testing.  In this strategy, the fuzz testing engine knows nothing about the structure of the input it is creating.  As such, mutation fuzz testing solutions create tests by doing things such as bit flipping and appending additional data.
- Generation → Also known as intelligent fuzz testing.  In this algorithm strategy, the fuzz testing solution understands the inputs and interfaces of the application or service it is fuzz testing.  As such, generation fuzz testing solutions create tests following the state model as well as the input structure of the application allowing for deeper code coverage.

### Benefits of combining behavioral and coverage-guided fuzz testing

GitLab will provide more valuable fuzz testing results by
combining both traditional and coverage-guided fuzz testing techniques. By using
both approaches together, we can find more faults and vulnerabilities than one
approach would find on its own.

Traditional fuzz testing tests what an app _should_ be doing, based on its
published interfaces. Because we also have the source code of the app available
at the time of test, we can use coverage-guided fuzz testing techniques to identify
parts of the app that aren't
mentioned in the publicly facing interfaces. We can also use the
source code of the app to provide context and better understand _why_ the app
is crashing. This allows us to intelligently generate new test cases to reach
other parts of the app's code.

A final, and very important, benefit of
combining the techniques is that because we have context around where in the
code a fault has occurred, we can point users to specific parts of their app
where the fault occurred so it can be fixed. Generally, the process of
determining where in source code a fault occurred is difficult, so allowing
users to immediately see this location is incredibly valuable and will directly
help them to mitigate identified issues.

#### Learn more about fuzz testing
We have created a playlist of videos
that discuss the different types of fuzz testing, techniques, and how to use
fuzz testing called [Fuzzing 101](https://www.youtube.com/playlist?list=PL05JrBw4t0KoYzW1CR-g1rMc9Xgmnhjfe)
that has lots of information you may find useful.

<!-- blank line -->
<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/videoseries?list=PL05JrBw4t0KoYzW1CR-g1rMc9Xgmnhjfe" frameborder="0" allowfullscreen="true"> </iframe>
</figure>
<!-- blank line -->

## Target audience and experience
<!-- An overview of the personas involved in this category. An overview
of the evolving user journeys as the category progresses through minimal,
viable, complete and lovabler maturity levels.-->

### User pain points to address
In a survey GitLab conducted in May 2020, 81% of our respondents said that they think fuzz
testing is important. However, over 60% said that the most difficult part of fuzz testing
is setting it up and integrating it into their CI systems. Because of this difficulty,
only 36% of respondents were actually using fuzz testing.

Despite many people thinking fuzz testing is important, the large number of users
not using it shows that there is an opportunity to give new value with GitLab
if we can help users overcome those initial pain points related to adopting fuzz
testing.

### Target audiences and user personas

There are two primary target audiences for fuzz testing:

1. [Sasha (Software Developer)](/handbook/product/personas/#sasha-software-developer) → Roles like Sasha want to minimize the software defects in the solutions they develop while creating stable and reliable solutions. Software development teams at organizations that develop solutions such as web application firewalls (WAF) or next-generation firewalls (NGFW) need to verify their solutions are ready for their customers.
    - Sasha is a skilled developer but does not have deep experience in fuzz testing. They are busy with developing features for her company and does not have a large amount of time to
    configure and learn the specific details about fuzz testing or how to tune it.
    - They expect to be able to get started quickly and only need to tune settings
    if they want to dig further into getting better fuzz testing results when they have time available.
    - They want to consume results from fuzz testing in a way that makes her next steps clear and makes any issues found easily reproducible so that they can write a patch it.
1. [Amy (Application Security Engineer)](/handbook/product/personas/#amy-application-security-engineer) → Roles like Amy look for vulnerabilities or security flaws within the solution they are testing.  Furthermore, organizations with application security engineers or internal red teams verify new software they internally create or verify solutions they purchase, either software or network security platforms, to confirm they are safe to put onto their production networks.
    - Amy is familiar with fuzz testing and how to use it to find vulnerabilities and bugs in apps. They are responsible for fuzz testing many different applications and drills down into specific
    ones based on how much business risk there is at the time.
    - Amy wants to be able to get initial fuzz testing results easily and then have a way to drill down into the most interesting results as part of their manual security
    research workflow.
    - One aspect of Amy we are learning about is some users are experts at only fuzz testing and others are experts at fuzz testing and other security techniques. We are not sure yet if this is a different persona or different examples of Amy.

There is an additional role which may be included in the target audience.  Product verification (PV) engineers may leverage fuzz testing as part of their unit or regression tests.  If the software development team does not directly handle their unit test creation, a PV engineer may be partnered with a software development team to create and maintain unit tests on behalf of the software development team.

Sasha is the primary persona we will focus on building fuzz testing
for initially. Ensuring they are able to successfully set up and consume the results
of a fuzz test is critical to drive adoption of fuzz testing.

### Principle for guidance
Usability is one of our key areas of emphasis.
We prefer to get 80% of fuzz testing quality while only requiring users like Sasha
to do 20% of the work. Even though better results are possible with more work by
the end-user, we do not want to go in this direction initially since it means users
will get frustrated and not use fuzz testing at all.

In the future, we will focus on building out deeper fuzz testing workflows
to support Sam and the security research they are doing. We will also deepen the
fuzz testing experience so that users like Sasha can easily learn more about fuzz testing
and become a more advanced user without requiring a large amount of time to be invested.
At that point, we will be focusing on getting the 20% of better quality results that
require the 80% of work by end users.

Approaching and prioritizing personas in this way will help us to drive adoption of Fuzz Testing
and address the pain points identified in our research.

### Market segments and organizations who would find value
GitLab believes there are different types of markets and users that will find value
in fuzz testing. To this end, we are prioritizing what use cases and where we want
to focus first. Read more about them in full on our [market segments](/direction/secure/dynamic-analysis/fuzz-testing/market-segments/)
page.

### Existing GitLab users
As we mature fuzz testing, we will work closely with existing GitLab users to
add fuzz testing to their apps. If users already have Source Code Management and
CI/CD set up for their projects, this will make it easy for
them to add fuzz testing to what they already have. It will be more work for a brand
new user to GitLab to add SCM, CI/CD, and our other capabilities in addition to also adding fuzz testing. Getting up and running with the other capabilities can be done quickly with our quick start guides, examples, and creating projects with [AutoDevOps](https://about.gitlab.com/stages-devops-lifecycle/auto-devops/),
but those will be extra steps to complete before adding fuzz testing.

Existing GitLab users who use other Secure scanners will be good candidates
to work with to add fuzz testing. They are already familiar with Secure-related
workflows and how to process vulnerabilities reported as part of the Security
Dashboard. Fuzz testing is a great complement to the other scans that they use.

Focusing on existing users will help us move quicker in getting users onboarded with
fuzz testing and will also help increase our [Stages per User](https://about.gitlab.com/handbook/product/performance-indicators/#stages-per-user-spu) 
metric.

### Technology and Use Cases
In keeping with GitLab's [seed then nurture](https://about.gitlab.com/company/strategy/#seed-then-nurture),
we are focused
on adding support for different technologies, languages, and use cases initially
to ensure fuzz testing can be broadly adopted by all our users. Over time, we
will build deeper experiences and more capabilities where they will be most
impactful.

## Where we are Headed

GitLab's aspirations with fuzz testing is that it becomes a security technique
that all of our users take advantage of to find and fix issues in their apps
before attackers can exploit them.

Since fuzz testing is traditionally difficult to use, our emphasis is on making
fuzz testing an accessible technology that our users can take advantage of without
becoming technical experts in the space nor requiring them to form a dedicated
fuzz testing team.

GitLab will provide its users with application robustness and security visibility testing solutions which validate the entire application stack.
This will be provided by verifying the user’s application or service both while at rest as well as while running.
This will include historical trending and recommendations for next steps to provide peace of mind to our users.

Furthermore, GitLab will provide real-time remediation for user solutions
running in production. This will be possible by analyzing the user issues
found in GitLab Secure and applying “[virtual patches](https://www.owasp.org/index.php/Virtual_Patching_Best_Practices)”
to the user’s production application or service leveraging GitLab Protect. This
will allow your organization to be secure and continue functioning until the
underlying vulnerability can be remediated in your code.

GitLab ultimately envisions our fuzz testing solutions becoming a critical part of
every organization's DevSecOps workflow, whether that is for web APIs, traditional
desktop software, or for hardware devices. Our long-term vision is to
shift fuzz testing solutions left for these use cases and that fuzz testing becomes
a common part of every developer's workflow. We will start with the web API and web
appliation use cases, which are already well supported in GitLab, as part of an
[iterative](/handbook/values/#iteration) approach to delivering fuzz testing.
We will then move into fuzz testing of protocols.

### What's next & why

At the moment, the Fuzz Testing roadmap has been put on hold as we focus our efforts on high-impact projects like browser-based DAST. Once we restart our development efforts, we will update the roadmap with what will be coming up next. We accomplished a lot in the last few months and have delivered improvements such as the Corpus Registry, expanded AFL-based testing, and support for Ruby projects, as well as numerous bug fixes. Instead of adding more features, we will focus more on awareness efforts, since fuzz testing is not as well known as other types of testing, like SAST, Dependency Scanning, or DAST.

We have several longer-term, more strategic objectives we will be focusing on as well. Those are
discussed in more detail in our [longer-term strategy](./long-term-strategy/) page.

### What is Not Planned Right Now
Our initial focus is on [web applications and REST APIs](https://about.gitlab.com/direction/maturity/#application-type-maturity), so we are not focusing on fuzz testing local desktop or mobile applications at this time.

Applications that require special hardware, such as Wireless, Bluetooth, and Automotive-based
fuzz testing, are not where we are focused now. This is because requiring proprietary
hardware is not where GitLab is strong today and makes it more difficult for us to
[quickly iterate](https://about.gitlab.com/handbook/values/#iteration). As we work on protocol
fuzzing support, which generally involves these industries, we will focus on how to interact
with hardware via software but not on actually bringing custom hardware directly into GitLab.

### Maturity Plan

- [Category Vision Epic](https://gitlab.com/groups/gitlab-org/-/epics/2841)
- [Viable to Complete](https://gitlab.com/groups/gitlab-org/-/epics/2844)
- [Complete to Lovable](https://gitlab.com/groups/gitlab-org/-/epics/2845)

## Competitive landscape
<!-- The top two or three competitors, and what the next one or two items we should
work on to displace the competitor at customers, ideally discovered through
[customer meetings](https://about.gitlab.com/handbook/product/product-processes/#customer-meetings). We’re not aiming for feature parity
with competitors, and we’re not just looking at the features competitors talk
about, but we’re talking with customers about what they actually use, and
ultimately what they need.-->

The fuzz testing competitive landscape is composed of both commercial and open source testing solutions.  The following outlines the competitive landscape for fuzz testing solutions:
- Commercial
  - Traditional Fuzz Testing
    - [Synopsys / Codenomicon Defensics](https://www.synopsys.com/software-integrity/security-testing/fuzz-testing.html)
    - [Spirent CyberFlood Advanced Fuzzing](https://www.spirent.com/products/cyberflood)
    - [Beyond Security BeStorm](https://www.beyondsecurity.com/bestorm.html)
    - [ForAllSecure Mayhem](https://www.forallsecure.com/)
  - Coverage-guided Fuzz Testing
    - [FuzzBuzz](https://www.fuzzbuzz.io)
    - [Wallarm FAST](https://wallarm.com/products/fast)
    - [Microsoft Security Risk Detection](https://www.microsoft.com/en-us/security-risk-detection/)
       - Microsoft has a number of other fuzz testing research projects going on. We expect to see these integrated into GitHub in the future at some point.
    - [Code Intelligence](https://www.code-intelligence.com/)
- Open source
  - [Sulley framework](https://github.com/OpenRCE/sulley)
  - [American fuzzy lop](http://lcamtuf.coredump.cx/afl/)
  - [boofuzz](https://github.com/jtpereyda/boofuzz)
  - [OWASP Zed Attack Proxy (ZAP)](https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project)

GitLab already uses OWASP [ZAP](https://github.com/zaproxy/zap-core-help) today to power the DAST capability within the GitLab Secure offerings.
ZAP is a web application security scanner, leveraging a proxy to perform testing, and does not perform protocol-level fuzz testing. 
All fuzz testing by ZAP is performed within the context of the web application being tested.

### Research Projects
We expect to see various research efforts around fuzz testing. These may be led by university groups, innovation teams inside companies, or independent security
researchers. Since research is intended to advance the state of the art, GitLab is open to collaboration on open-source efforts, rather than viewing those
sorts of projects as competitive by default.

### Fuzz Testing Acquisitions
GitLab announced the acquisition of [Fuzzit](https://www.fuzzit.com) and [Peach Tech](http://www.peach.tech)
on June 11, 2020. This immediately enhanced and accelerated our plans for fuzz
testing. Watch the video below to get all the details!

<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/G7pRWDKts_Q" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

## Analyst landscape
<!-- What analysts and/or thought leaders in the space talking about, and how we stay
relevant from their perspective.-->

Analysts consider fuzz testing to be part of Application Security Testing and is generally discussed as part of those reports, rather than as a standalone capability.
There are challenges to make it part of the DevSecOps paradigm, and they are interested to hear more about that.

Gartner wrote "Outsourcing or leveraging managed services to perform fuzzing is the recommendation in the
absence of internal subject matter expertise and staffing." as part of their "Structuring Application Security Practices and
Tools to Support DevOps and DevSecOps" [research](https://www.gartner.com/en/documents/3830131/structuring-application-security-practices-and-tools-to-).
This recommendation is a result of the high-level of manual configuration many fuzzers
need. This is a pain point GitLab should be mindful of as we work on bringing
our own fuzz testing solutions out so that users can be successful without needing
to be a fuzz testing expert nor need to do a large amount of configuration.

Gartner also published their [How to Deploy Application and Perform Application
Security Testing](https://www.gartner.com/en/documents/3982363/how-to-deploy-and-perform-application-security-testing)
where they say "You should reserve fuzzing for non-web applications." We disagree
with this conclusion and think that it comes primarily from the difficulty
normally associated with doing fuzz testing. This underscores the importance
of our emphasis of making fuzz testing straightforward and easy to use.

Additionally, as APIs become more and more of a staple of modern
application development, they should be prioritized for fuzz testing. As one of
the primary interfaces exposed to end-users, fuzz testing can reveal critical bugs
and security issues before they are exposed to the world, despite them not being
traditional web applications.

By combining our fuzz testing solution with our DAST, IAST, and SAST solutions into a GitLab Secure suite, GitLab can be placed into the Gartner [Magic Quadrant for Application Security Testing](https://about.gitlab.com/analysts/gartner-ast22/). This will give GitLab additional exposure as well as show security thought leadership.

Other analyst firms include 451 Research and IDC as they have focused security practices in which GitLab Secure can be highlighted and show leadership.

## Top Vision Item(s)
<!-- What's the most important thing to move your vision forward?-->

- [Coverage-guided fuzz testing corpus management](https://gitlab.com/groups/gitlab-org/-/epics/5017)
- [Open source protocol fuzz testing engine](https://gitlab.com/groups/gitlab-org/-/epics/4933)
- [Protocol fuzz testing integration into GitLab](https://gitlab.com/groups/gitlab-org/-/epics/5116)
- [API fuzz testing integration into Security Dashboard](https://gitlab.com/groups/gitlab-org/-/epics/4484)

## Further Reading
We have several pages that provide more info about our direction for fuzz
testing:

* [Long-term strategy](./long-term-strategy/)
* [Market Segments](./market-segments/)
