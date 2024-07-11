---
layout: sec_direction
title: "Market Segments - Fuzz Testing"
description: "GitLab's fuzz testing helps you find security vulnerabilities and bugs that traditional QA misses."
canonical_path: "/direction/secure/dynamic-analysis/fuzz-testing/market-segments/"
---

- TOC
{:toc}

##  Market segments and organizations who would find value in fuzz testing
We believe that fuzz testing can immediately help certain use cases and segments
more so than others. To this end, we have prioritized the list of use cases
we want to focus on below.

### **Web API providers** 
Web APIs are a natural fit for us to address with fuzz testing. GitLab
has many users with this use case who use our product already. It will be a
short jump for them to add fuzz testing.

Web API providers will already have or can easily create [OpenAPI definitions](https://swagger.io/docs/specification/about/),
[Postman collections](https://www.postman.com/), and [HAR](https://en.wikipedia.org/wiki/HAR_(file_format))
recordings from their existing tests.
This will allow them to add fuzz testing to their apps with minimal effort.

We can lean on our core strengths to bring fuzz
testing to this use case and we will have a large number of existing users
we can start to get feedback from.

Another benefit of this is that GitLab will be able to begin dogfooding
this very quickly, as we publish many web APIs ourselves.
### **Web application providers**
Traditional web based applications are a set of use cases where fuzz
testing can add a lot of value. Similar to APIs, GitLab has many existing
users with the use case we can lean on to get rapid feedback and help us
to iterate quickly.

Users with traditional applications can easily create HAR files for
fuzz testing as part of their normal test suites, with minimal extra steps.
By making it easy to add fuzz testing to web apps, GitLab can encourage
a lot more adoption.
### **Security research and penetration testing teams**
Security research and penetration testing firms generally make use of fuzz testing
in some form or another as part of their test engagements. GitLab has a large
opportunity in this market with our fuzz testing solution to begin working with
these organizations.

<!--
    TODO: Break this out into two sections:
    - one covering sec labs with a mature DevOps workflow and emphasize
    how we can help integrate both fuzzing & DevOps app with Gitlab
    - one covering sec labs that use fuzzing today and have immature DevOps
    practices to show how we can augment what they do today with fuzzing
    and make them more effective with the rest of our product
-->
Specifically, GitLab can provide value with our existing product
to help security firms manage their repositories and pipelines, as part of
a single DevOps application. What will really differentiate us here though
is that our fuzz testing technology will live inside GitLab. This will help these
orgs work more effectively, as opposed to having to use a standalone fuzz
testing product and then being required to manually interface with their SCM tools
to store and update results.
### **Medical device and regulated industries**
GitLab has an opportunity to introduce fuzz testing as a new piece of
technology to the medical device and regulated hardware industry. Because
these devices can cause serious injury if they malfunction, the ability to
find bugs with fuzz testing before they are found in the field will
resonate quite well.

This will be a tougher set of use cases to enter for a number of reasons.
Because these industries are already very regulated, they likely have very
mature workflows, which GitLab would need to find a way to make ourselves
a part of. We have an opportunity to introduce GitLab as a single application
for their whole DevOps lifecycle, which will help these companies move quicker
in addition to providing them fuzz testing, but this will take time.

Because this is a relatively new space for GitLab, we need to be cognizant
of the time needed to enter the space, but it is quite a large opportunity.
To make sure we can move forward iteratively, we will attempt to find an
initial user to work with and make sure we understand the medical and
regulated device use cases and workflows. Once they are successful, we can
then use them as a case study for additional companies.
### **Automotive systems**
Similar to medical devices, introducing fuzz testing as part of automotive
systems is a big opportunity for GitLab. Automotive systems undergo long
testing cycles before deployment into production, which means they can take
advantage of long, "soak-test" fuzz testing sessions to find bugs.

A potential challenge for this use case will be ensuring our fuzz test and GitLab
platform fit the existing technology stacks that automotive manufacturers use.
To ensure that we are successful in this space, we will canvas several different
automotive customers, learn more about their specific technology stacks, and
work closely with one we are compatible with as part of a future iteration.
Based on the results and feedback, we can then decide to either expand into
additional technology stacks or to focus more on the ones we already have.
### **Embedded device manufacturers**
A broad and challenging domain we can bring fuzz testing to is the embedded
device space. These hardware devices typically connect to sensors and control
units over specific interfaces, some of which are not always secured before
being deployed. Fuzz testing can provide the ability to locate these bugs
and vulnerabilities before deploying the devices.

Embedded devices generally will have toolchains that are less commonly used
than web or desktop software, since those toolchains are intended solely
for developing hardware-based applications. This means that fuzz testing will
provide a large amount of value since the platforms have not been as rigorously
tested by as many people, but also will present GitLab a challenge in that
there will be far more choices than we can realistically support.

To ensure we can be successful in this space, we will start with
hardware devices that communicate over channels and protocols that are close
to our existing fuzz testing tools and do not require the use of custom hardware
to communicate. Devices that speak HTTP over a wired or wireless connection
are a good example of what we could quickly target. Devices that use a
proprietary hardware interface with a proprietary protocol GitLab does not
support are a good example of the type of devices we would not attempt to
start with.
