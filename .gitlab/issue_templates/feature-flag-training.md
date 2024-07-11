# Feature Flag And Monitoring Training

[Feature Flags](https://docs.gitlab.com/ee/development/feature_flags/) are used by GitLab engineers in order to roll out changes while
monitoring the impact.

They are **not the same** as the [**Operations > Feature Flag**](https://docs.gitlab.com/ee/operations/feature_flags.html) feature inside of GitLab.

This template is intended to help understand
how and when to use this tool in development.
 
Currently as part of the feature flag process [there is an expectation](https://docs.gitlab.com/ee/development/feature_flags/controls.html#process) that GitLab engineers will monitor their changes with our monitoring tools. 

When the changes are low risk and do not require the [change management process](https://about.gitlab.com/handbook/engineering/infrastructure/change-management/#feature-flags-and-the-change-management-process) the expectation is that the engineer conducting the rollout will monitor their change themselves. This training is also designed to allow GitLab engineers to become aware of and comfortable with the [monitoring](https://about.gitlab.com/handbook/engineering/monitoring/) that is provided by the [Infrastructure department](https://about.gitlab.com/handbook/engineering/infrastructure/).

Regardless of risk assessment, **it is expected that the engineer responsible will follow up with the change in production when the flag is flipped**.

Doing so can lower the likelihood of a production issue and if a production issue does occur we can lower the time they last and impact they have.



## Steps

- [ ] Assign this issue to yourself with the title of Feature Flag Training - First Name Last Name - Q#YYYY
- [ ] [Get access](https://docs.gitlab.com/ee/development/feature_flags/controls.html#access) to control feature flags

## Feature flag

### Read

- [ ] [Starting with Feature Flags in Development](https://docs.gitlab.com/ee/development/feature_flags/#feature-flags-in-gitlab-development)
- [ ] [Controlling feature flags](https://docs.gitlab.com/ee/development/feature_flags/controls.html)
- [ ] [Pete Hodgson & Martin Fowler on Feature Flags](https://martinfowler.com/articles/feature-toggles.html)
- [ ] [Including a feature behind a feature flag in the final release](https://about.gitlab.com/handbook/product-development-flow/feature-flag-lifecycle/#including-a-feature-behind-feature-flag-in-the-final-release)


## Monitoring and Debugging

### Read
- [ ] [GitLab Engineering Monitoring](https://about.gitlab.com/handbook/engineering/monitoring/)
- [ ] [Performance at GitLab](https://docs.gitlab.com/ee/development/performance.html)
- [ ] [GitLab metrics currently being monitored](https://docs.gitlab.com/ee/administration/monitoring/prometheus/gitlab_metrics.html)
- [ ] [Adding Prometheus metrics](https://docs.gitlab.com/ee/development/prometheus_metrics.html)
- [ ] [Logging at GitLab](https://docs.gitlab.com/ee/development/logging.html)

### Watch

### _(Approximately 3 hours)_

- [ ] [Observability at GitLab (Internal)](https://www.youtube.com/watch?v=DVNyH3zQWBo&list=PL05JrBw4t0KpQMEbnXjeQUA22SZtz7J0e) [(Slides)](https://docs.google.com/presentation/d/1F_ngvyiF1v7ibMRoWkaE65I9Z3ZxxT2LGh2RqUj90Q0)
- [ ] [Sentry/Kibana Training (Internal)](https://www.youtube.com/watch?v=o02t3V3vHMs&list=PL05JrBw4t0KpQMEbnXjeQUA22SZtz7J0e)
- [ ] [Sitespeed.io training](https://www.youtube.com/watch?v=6xo01hzW-f4&list=PL05JrBw4t0KpQMEbnXjeQUA22SZtz7J0e)
- [ ] [Intro to monitoring - GitLab Runners](https://www.youtube.com/watch?v=wEcoyC1cE5M&list=PL05JrBw4t0KpQMEbnXjeQUA22SZtz7J0e)
- [ ] [How Gitaly uses prometheus](https://www.youtube.com/watch?v=R6F674Nj3wI&list=PL05JrBw4t0KpQMEbnXjeQUA22SZtz7J0e)
- [ ] [Finding an issue for a specific user in Sentry (Internal)](https://www.youtube.com/watch?v=NPmv43Rnw9A&list=PL05JrBw4t0KpQMEbnXjeQUA22SZtz7J0e)
- [ ] [How to search for an issue in Kibana](https://www.youtube.com/watch?v=fKmwH0aNUQQ&list=PL05JrBw4t0KpQMEbnXjeQUA22SZtz7J0e)
- [ ] [GitLab Performance Toolkit Runthrough on 2019 08 27](https://www.youtube.com/watch?v=HobeuFtfZac&list=PL05JrBw4t0KpQMEbnXjeQUA22SZtz7J0e)
- [ ] [Performance bar demo](https://www.youtube.com/watch?v=WSVHXmh_Guk&list=PL05JrBw4t0KpQMEbnXjeQUA22SZtz7J0e)
- [ ] [How to create Kibana visualizations for checking performance](https://www.youtube.com/watch?v=5oF2rJPAZ-M&list=PL05JrBw4t0KpQMEbnXjeQUA22SZtz7J0e)

**Notes**:

As we increase the use of feature flags, engineers have an opportunity/expectation to use our monitoring that they did not have previously.

The [DORA research program](http://services.google.com/fh/files/misc/dora_research_program.pdf) specifically calls out observability and monitoring as being one of 38 key factors driving effective continuous delivery.

The more comfortable we are using the monitoring and observability tools for our systems, the better our outcomes will be in terms of mean-time-to-recovery, individual contributor awareness of infrastructure and scalability concerns, usage of infrastructure engineers' time, and teams' psychological safety.
