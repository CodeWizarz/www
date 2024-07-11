---
title: "Making CI/CD easier with GitLab"
author: Rob Ribeiro
author_twitter: azurelogic
guest: True
categories: engineering
image_title: '/images/blogimages/making-ci-easier-with-gitlab.jpg'
description: "The team at Trek10 tries to consider the need for automation and repeatability with everything they do. One team member gives a crash course in GitLab CI/CD and explains how they use it."
tags: CI/CD, user stories
---

At [Trek10](https://www.trek10.com/), we always try to consider the need for automation and repeatability with everything that we do. That’s why we focus on using tools like CloudFormation, [Serverless](/topics/serverless/), and CI/CD, as well as building other tools. Recently, I was tasked with doing various maintenance tasks on a number of internal tools/projects. Some needed upgrades from Node.js 0.10, some needed code fixes, and most needed CI/CD. Today, we’re just going to focus on the CI/CD part.

<!-- more -->

In spite of my past experience with Jenkins and TeamCity and our team’s experience with AWS (CodePipeline/CodeDeploy), I chose [GitLab CI/CD](/topics/ci-cd/) to standardize these projects. The biggest reason for this choice is history. As a project evolves, its CI/CD configuration may change. If you ever need to go back in time, you may have difficulty deploying again. Since GitLab CI/CD is based on a `.gitlab-ci.yml` config file that is committed with the code, as long as a commit built and deployed then, it stands a pretty good chance of building and deploying now. Being able to tweak CI/CD without leaving my editor was an additional bonus.

### Crash course in GitLab CI/CD

GitLab CI/CD relies on having a `.gitlab-ci.yml` file in the root of your repo. CI/CD for each commit is run against the `.gitlab-ci.yml` that is current for that commit. The fundamental unit of CI/CD for GitLab is a “job”. A job is a construct that runs a bash script against a commit in a particular context. You might have one job to run tests, other jobs to build for staging or production, and other jobs to deploy to particular environments. In the config file, jobs are represented by top level maps (aka “objects”) that are not otherwise “reserved” GitLab CI/CD maps. Examples of reserved top level maps: `image` (Docker image in which your jobs run), `services` (other Docker images that need to run while your jobs run), `before_script` (runs before every `script`), `after_script` (runs after every `script`), `stages` (redefines the stage names and order), `variables` (variables available to all jobs), and `cache` (controls what is cached between CI/CD runs; good for stuff from your package manager).

Every job must belong to a stage (if left out, `test` is the default). Stages are run in a sequence, and all of the jobs in a stage run with max parallelism available. The default stage sequence is: `build`, `test`, `deploy`. Each job also has `before_script`, `after_script`, `variables`, and `cache`. Defining these at a job level will override the top-level configuration. The most important of these is `variables`, because your variables are what make the production deploy job’s context different from the staging deploy job’s context. `variables` is just a map with a bunch of key value pairs. Variables are consumed with a syntax similar to bash: `${myVar}`. There are some limitations that you should know:

* Variables do not support bash variable expansions, substitutions, defaults, etc.
* Variables do not recurse or have a sense of order of evaluation, but top level variables can be used in job level variables. See the following examples:

```
# You CANNOT do this (referencing a sibling variable in the same map)
variables:
    PROD_STAGE_NAME: prod
    PROD_URL: https://thisismywebsite.com/${PROD_STAGE_NAME}
```

```
# You CAN do this (referencing a top-level variable from a job's variables map)
variables:
    PROD_STAGE_NAME: prod

my_job:
    variables:
        STAGE_NAME: ${PROD_STAGE_NAME}
```

```
# But you CANNOT do something like this (nested variables)
variables:
    CURRENT_STAGE: PROD
    PROD_STAGE_NAME: prod

my_job:
    variables:
        STAGE_NAME: ${${CURRENT_STAGE}_STAGE_NAME}
```

That last example gives us a ton of power. We’ll be sure to abuse that as we go.

As mentioned before, jobs run a bash script in a context. So every job must have a `script`. The last big thing that you need is “flow control”. By default, a job will run on every commit. Using the `only`, `except`, and `when` keys allows you to control how jobs are triggered. `only` and `except` accept the following options:

* Branch names, e.g. `master` or `develop`
* Tag names
* JS style RegExp literals to evaluate against branch/tag names
* These special keywords: `api`, `branches`, `external`, `tags`, `pushes`, `schedules`, `triggers`, and `web`
* Using `branches` and `tags` with `only` cause a job to be run for every branch or tag, respectively
* Repo path filters to deal with repo forks

One more important fact: jobs that start with a period character are disabled, e.g.: `.my_disabled_job`

That should be enough to get us started. You can find more [GitLab CI/CD documentation here](https://docs.gitlab.com/ee/ci/). The most useful bit is the `.gitlab-ci.yml` reference found [here](https://docs.gitlab.com/ee/ci/yaml/).

As with any new tool, I got to read and re-read the documentation and make some mistakes getting things right. By the time I was knee-deep in this, I realized there was a need to prevent anyone from having to do this again, myself included. The solution requires two things: a well-designed CI/CD template and a way to get that template into all of your new repositories. Let’s tackle template design next.

### Designing a template

This part is hard to talk about in a completely generic manner. Instead, let’s walk through our use case. Looking at our projects past and present, I could usually bet on these characteristics:

* Deploys to AWS (we are an AWS consultancy after all…)
* Uses Serverless framework with Node.js or Python
* May deploy production to multiple regions
* May deploy different stages to different accounts

In addition, I realized that I needed these other options:

* May need to “disable” dev/staging from doing real work
* May want one dev environment per branch

Finally, we decided on the following deployment strategy:

* Production deploys via tags on `master`
* Staging deploys on commits/merges to `master`
* Dev deploys should work for all other branches (we’re not going to implement this one in this post)

My roots are as a software developer, so making things reusable is a core skill at this point. A good template is going to make it super easy for the intended cases and be fairly adaptable for other uses. Here is the goal:

* One script per stage. That means only one test script, one build script, and one deploy script. Oh, and keep it DRY.
* Jobs should be as similar as possible, and differences should be tweaked by top level variables.

Let’s focus on that single script per stage. We’re not going to cover how to write the deployment script, but we’ll focus on the deploy stage. But let’s say we start with a deployment job like this:

```
deploy:production:
    stage: deploy
    script: |
        # assume ${DEPLOYMENT_ROLE} in AWS
        # install dependencies
        # run serverless deployment with ${STAGE_NAME} ${REGION}
    variables:
        DEPLOYMENT_ROLE: arn:aws:iam::1234567890:role/gitlab-ci-deployment
        STAGE_NAME: prod
        REGION: us-east-1
        ACCOUNT: "1234567890"
    only:
        - tags
```


Now we could copy and tweak this for staging and dev, but that’s not what we’re after. First, let’s break the script off to a reusable chunk and use it in our staging deploy:

```
.deployment_script: &deployment_script
    stage: deploy
    script: |
        # assume ${DEPLOYMENT_ROLE} in AWS
        # install dependencies
        # run serverless deployment with ${STAGE_NAME} ${REGION}

deploy:production:
    <<: *deployment_script
    variables:
        DEPLOYMENT_ROLE: arn:aws:iam::1234567890:role/gitlab-ci-deployment
        STAGE_NAME: prod
        REGION: us-east-1
        ACCOUNT: "1234567890"
        PRODUCTION: "true"
    only:
        - tags

deploy:staging:
    <<: *deployment_script
    variables:
        DEPLOYMENT_ROLE: arn:aws:iam::0987654321:role/gitlab-ci-deployment
        STAGE_NAME: staging
        REGION: us-east-1
        ACCOUNT: "0987654321"
    only:
        - master
```

Using YAML anchors and references, we can inject the script into all of our deployment jobs. Notice that the deployment script is disabled. This is because we don’t want it to run in parallel with all of our intended jobs. We also added a `PRODUCTION` environment variable to just the production deploy to allow our script to pick that up too. If your code knows about this, you can use this to turn on/off production-only features. Now, we can make this cleaner and easier for our developers by pulling all of the `variables` to a top-level variables map at the top of the file:

```
variables:
    PROD_ACCOUNT: "1234567890"
    PROD_STAGE_NAME: prod
    PROD_REGION: us-east-1
    STAGING_ACCOUNT: "0987654321"
    STAGING_STAGE_NAME: staging
    STAGING_REGION: us-east-1

.deployment_script: &deployment_script
    stage: deploy
    script: |
        # assume ${DEPLOYMENT_ROLE} in AWS
        # install dependencies
        # run serverless deployment with ${STAGE_NAME}, ${REGION}, and ${ACCOUNT}

deploy:production:
    <<: *deployment_script
    variables:
        DEPLOYMENT_ROLE: "arn:aws:iam::${PROD_ACCOUNT}:role/gitlab-ci-deployment"
        STAGE_NAME: ${PROD_STAGE_NAME}
        REGION: ${PROD_REGION}
        ACCOUNT: ${PROD_ACCOUNT}
        PRODUCTION: "true"        
    only:
        - tags

deploy:staging:
    <<: *deployment_script
    variables:
        DEPLOYMENT_ROLE: "arn:aws:iam::${STAGING_ACCOUNT}:role/gitlab-ci-deployment"
        STAGE_NAME: ${STAGING_STAGE_NAME}
        REGION: ${STAGING_REGION}
        ACCOUNT: ${STAGING_ACCOUNT}
    only:
        - master
```


Now, that’s looking more reusable, and we have accomplished our second goal of making the jobs very similar and controlled by top-level variables. This makes it easy for anyone who fits the template’s use case perfectly to reuse it. We could easily add the dev environment, but we’ll skip that in favor of illustrating multi-region production deploys:

```
variables:
    PROD_ACCOUNT: "1234567890"
    PROD_STAGE_NAME: prod
    PROD1_REGION: us-east-1
    PROD2_REGION: us-west-2
    STAGING_ACCOUNT: "0987654321"
    STAGING_STAGE_NAME: staging
    STAGING_REGION: us-east-1

.deployment_script: &deployment_script
    stage: deploy
    script: |
        # assume ${DEPLOYMENT_ROLE} in AWS
        # install dependencies
        # run serverless deployment with ${STAGE_NAME}, ${REGION}, and ${ACCOUNT}

.production_variables
    DEPLOYMENT_ROLE: "arn:aws:iam::${PROD_ACCOUNT}:role/gitlab-ci-deployment"
    STAGE_NAME: ${PROD_STAGE_NAME}
    ACCOUNT: ${PROD_ACCOUNT}
    PRODUCTION: "true"    

deploy:production_1: &deploy_production
    <<: *deployment_script
    variables:
        <<: *production_variables
        REGION: ${PROD1_REGION}
    only:
        - tags

deploy:production_2:
    <<: *deploy_production
    variables:
        <<: *production_variables
        REGION: ${PROD2_REGION}        

deploy:staging:
    <<: *deployment_script
    variables:
        DEPLOYMENT_ROLE: "arn:aws:iam::${STAGING_ACCOUNT}:role/gitlab-ci-deployment"
        STAGE_NAME: ${STAGING_STAGE_NAME}
        REGION: ${STAGING_REGION}
        ACCOUNT: ${STAGING_ACCOUNT}
    only:
        - master
```

Notice that we have changed the job names to reflect having multiple regions. In addition, we are making use of YAML anchors and references to copy the entire `deploy:production_1` job into `deploy:production_2` and then we just override the `REGION` variable. This makes adding additional regions super easy.

What’s more useful at this point is that, as long as you have made your script flexible enough, you can now distribute this to your development team as a template. If their project fits the script and configuration perfectly, they should just have to fill in the correct values for the top-level variables and go. For those needing something different, they should hopefully be able to just tweak the script. Now, we just need to solve the problem of making sure that they actually use the template…

### Automatic CI/CD injection with GitLab and AWS Lambda

I was inspired by GitHub’s option to select a .gitignore and license during the repo creation process. What if we could have that for CI? Forking GitLab and figuring out how to hack this in did not sound like a quick or easy thing to do. However, after a little research, I found that we could use a system hook to trigger a Lambda that could inject the desired template via the commit API. This part is not as interesting to read about, so we did one better: we have open sourced this tool so you can deploy it in your environment. Check out the repo [here](https://github.com/trek10inc/gitlab-boilerplate-injector). And if you’re looking for someone to help you implement these and other awesome automations and AWS solutions, we would love to talk to you. Feel free to reach out to us at info@trek10.com for more. Thanks for reading!

## About the Guest Author

Rob has spent his career honing his interpersonal, technical, and problem solving skills. He spent five years in customer service and management, followed by over five years in software development and consulting. He has experience working and consulting for everything from startups to Fortune 500 enterprises in a variety of industries including manufacturing, healthcare, and finance. Rob has earned a MS in Applied Mathematics and Computer Science from Indiana University and a BS in Pharmaceutical Sciences from Purdue University.
