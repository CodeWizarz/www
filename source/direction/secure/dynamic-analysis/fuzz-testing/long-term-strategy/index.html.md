---
layout: sec_direction
title: "Long-Term Strategy - Fuzz Testing"
description: "GitLab's fuzz testing helps you find security vulnerabilities and bugs that traditional QA misses."
canonical_path: "/direction/secure/dynamic-analysis/fuzz-testing/long-term-strategy/"
---

- TOC
{:toc}

This page describes our long-term fuzz testing strategic initiatives. These initiatives
represent our [ambitious](https://about.gitlab.com/handbook/values/#ambitious) goals that
we want to hit, even though they may be difficult to achieve.

## Enable no-setup fuzz testing
We know that one of the friction points users may have is that configuring fuzz testing can be hard. This
means users are likely to give up before they see value out of fuzz testing and get inspired to keep going.
Our long-term goal is to be able to let them enable fuzz testing with no setup, just a click, and immediately
see the value of fuzz testing.

### Use AutoDevOps and DAST to enable no-setup fuzz testing
We have an opportunity to reuse what has already been built in [AutoDevOps](https://docs.gitlab.com/ee/topics/autodevops/)
and [DAST](https://docs.gitlab.com/ee/user/application_security/dast/) to enable fuzz testing for certain 
projects with no configuration.

To do this, we can have AutoDevOps run a DAST scan and record a log of the traffic that it captured during
the DAST scan. We can then pass all these logs from DAST directly to the API fuzz testing engine, which can
use those logs to automatically fuzz test the app without requiring a user to configure or do anything to
get started.

Additionally, this is an incredibly powerful strategy, because as DAST improves over time, it will produce
better logs, which will then directly improve the quality of the fuzz test that is performed.

### Automatically fuzz test the unit and system tests that users already have
We have an opportunity to leverage the app and test code that users already store with GitLab
as part of their everyday work. Rather than require them to manually write fuzz test cases, we can
directly consume their unit tests and create fuzzing jobs from them.

This approach will be a game-changer for our users and GitLab because it will allow users to use
what they already have to immediately start fuzz testing and finding bugs and vulnerabilities. It
will also encourage writing more tests, which is a good software engineering practice in general
but will also drive more usage of other GitLab stages.

## Add value to other GitLab stages
One of GitLab's main advantages over other products is that we provide a [single application](https://about.gitlab.com/handbook/product/single-application/)
for our users. As a result, a longer-term focus area for fuzz testing is being able
to interact and interface with other stages so users get more value out of GitLab as a whole.

### Leverage API fuzz testing's engine in DAST
GitLab's API fuzz testing engine is incredibly powerful in terms of what it can do
when testing an API-based application. DAST has very similar use cases as API fuzz testing,
so a strategic area of focus is improving our DAST offering using the engine that underlies our
API fuzz testing capabilities. This could be used either to augment or replace our use of ZAP
as part of DAST.

### Leverage coverage-guided fuzz testing's correlation for SAST
One aspect that makes GitLab's coverage-guided fuzz testing unique is that it can correlate and
link together
multiple crashes and faults that come from the same source. That way, a user only has to triage one
issue, rather than needing to triage five issues that ultimately all have the same root cause.

We want to find ways to leverage this correlation technology and use it in other scanners, such
as SAST. We have feedback for SAST that users see multiple issues related to the same underlying
code so we can meaningfully improve the experience there with fuzz testing.

