---
title: "Autoscale GitLab CI/CD runners and save 90% on EC2 costs"
author: Max Woolf
author_gitlab:
author_twitter: SubstraktHealth
categories: engineering
guest: true
image_title: '/images/blogimages/autoscale-gitlab-ci-runners.jpg'
twitter_image:
description: "Guest author Max Woolf shows how his team makes big savings with an autoscaling cluster of GitLab CI/CD runners."
tags: user stories, CI/CD
---

At [Substrakt Health](https://substrakthealth.com/), we use continuous integration workers to test our software every time new code is written and pushed, but that computing capacity can be expensive and hard to predict. This tutorial shows you how to set up an autoscaling [cluster of GitLab CI/CD](/topics/ci-cd/) runners using docker-machine and AWS.

<!-- more -->

Code quality is **always** a top priority for us. We want to know that our code works every time and when it stops working we want to know immediately. We use [GitLab CI/CD](/features/continuous-integration/) to run our tests every time we push new code and before every deployment. GitLab CI/CD lets us split this work across multiple servers and scale up and down capacity as required to keep costs down for us. This tutorial will show you how to set up an autoscaling CI/CD cluster for GitLab and save up to 90 percent on costs using AWS EC2 Spot Instances.

GitLab CI/CD allows us to split our jobs across multiple machines. By default, each new worker node requires some setup work to provision and attach it to our GitLab instance, but we can also use the autoscaling mode to provision a single machine and let that machine decide how much capacity is required and then spin up or down further instances as required.

>**A warning**: This tutorial will not be covered entirely by the AWS free usage tier. It’s going to cost money to try this out.

## Creating the spawner

First off, we need a spawner machine. This runs 24/7 and checks that GitLab CI/CD has enough capacity to run the jobs currently in the queue. **It doesn’t run any jobs itself.**

We use Ubuntu 16.04 LTS for our internal tooling, so just create an EC2 instance (*t2.micro* is enough and is included in the free tier.) Setting up VPCs and related subnets is out of the scope of this article, we’ll assume that you’re working in the default VPC. Then we need to install a bunch of software on our machine to set it up.

## Installing gitlab-runner

gitlab-runner is the main software we need to complete this task. Installing it on Ubuntu is really easy.

```
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | sudo bash
```

```
sudo apt-get install gitlab-ci-multi-runner
```

<img src="/images/blogimages/auto-scale-ci-runners-gif.gif" alt="Installing gitlab-runner" style="width: 700px;"/>{: .shadow}

Once you’ve done that, register the runner on your GitLab instance. Do this as you normally would with any other GitLab CI/CD runner but choose **docker+machine** as the runner. Docker Machine is the software required to spin up new virtual machines and install Docker on them.

## Installing Docker Machine

Docker Machine is a handy bit of software that allows one host running Docker to spin up and provision other machines running Docker. Installing it is even easier:

```
curl -L https://github.com/docker/machine/releases/download/v0.12.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
chmod +x /tmp/docker-machine &&
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
```

This will install the docker-machine binary in your PATH.

## Configuring gitlab-runner

By default, gitlab-runner will not work in the autoscaling mode we want. It’ll just run a job by default and then stop. We want to configure this machine to no longer run tests but to spin up new Docker Machines as and when necessary. Open your gitlab-runner config file, usually found in `/etc/gitlab-runner/config.toml` and make some changes. This is our example (with sensitive information removed). Let’s go through some of the important lines.

```
concurrent = 12
check_interval = 0

[[runners]]
  name = "aws-gitlab-runner-spawner"
  limit = 6
  url = "https://git.substrakt.com/ci"
  token = "xxxxx"
  executor = "docker+machine"
  [runners.docker]
    tls_verify = false
    image = "ruby:2.3.1"
    privileged = true
    disable_cache = false
    volumes = ["/cache"]
    shm_size = 0
  [runners.machine]
    IdleCount = 0
    MachineDriver = "amazonec2"
    MachineName = "runner-%s"
    MachineOptions = ["amazonec2-access-key=XXXX", "amazonec2-secret-key=XXXX", "amazonec2-ssh-user=ubuntu", "amazonec2-region=eu-west-2", "amazonec2-instance-type=m4.xlarge", "amazonec2-ami=ami-996372fd", "amazonec2-vpc-id=vpc-xxxxx", "amazonec2-subnet-id=subnet-xxxxx", "amazonec2-zone=a", "amazonec2-root-size=32", "amazonec2-request-spot-instance=true", "amazonec2-spot-price=0.03"]
    IdleTime = 1800
```

```
concurrent = 12
```

This tells GitLab CI/CD that in total, it should attempt to run 12 jobs simultaneously across all child workers.

```
limit = 6
```

This tells GitLab CI/CD that in total, it should use for running jobs a maximum of six worker nodes. You’ll need to tweak this value depending on the resources your jobs need and the resources of your child nodes. There’s no right answer here but generally we found it wasn’t a good idea to have more than the number of CPUs – 1 of jobs running per node but again this is a bit of a ‘finger-in-the-air’ calculation as it really depends on your tech stack.

```
IdleCount = 0
```

This tells GitLab CI/CD not to run any machines constantly (whilst idle). This means when nobody is running a job, or no jobs are queued to spin down all of the worker nodes after an amount of time (IdleTime at the bottom of the file). We power our nodes down after half an hour of no use. This does have the consequence of there being a short wait when we start our day, but it saves us money as we’re not using computing power when it’s not required.

If you're interested in more about how `concurrent`, `limit` and `IdleCount` are defining the maximum number of jobs and nodes that will be used, you can find a more detailed description in Runner's autoscale configuration document: [Autoscaling algorithm and parameters](https://docs.gitlab.com/runner/configuration/autoscale.html#autoscaling-algorithm-and-parameters), [How parameters generate the upper limit of running machines](https://docs.gitlab.com/runner/configuration/autoscale.html#how-concurrent-limit-and-idlecount-generate-the-upper-limit-of-running-machines).

```
MachineOptions = ["amazonec2-access-key=XXXX", "amazonec2-secret-key=XXXX", "amazonec2-ssh-user=ubuntu", "amazonec2-region=eu-west-2", "amazonec2-instance-type=m4.xlarge", "amazonec2-ami=ami-996372fd", "amazonec2-vpc-id=vpc-xxxxx", "amazonec2-subnet-id=subnet-xxxxx", "amazonec2-zone=a", "amazonec2-root-size=32", "amazonec2-request-spot-instance=true", "amazonec2-spot-price=0.03"]
```

This is where the magic happens. This is where we set our options for Docker Machine. It defines the size, type and price of our runners. I’ll run through each of the non-obvious options.

```
amazonec2-vpc-id=vpc-xxxxx & amazonec2-subnet-id=subnet-xxxxx
```

This is the VPC and associated subnet ID. Generally, you’d want this in your default VPC in a public subnet. We run our jobs in a private VPC with internal peering connections to other VPCs due to regulatory constraints.

```
amazonec2-region=eu-west-2
```

This is the AWS region. We run all of our infrastructure in the EU (London) region.

```
amazonec2-instance-type=m4.xlarge
```

This is the size of the instance we want for each of our runners. This setting can have massive implications on cost and it can be a tricky balancing act. Choose too small and your jobs take forever to run due to a lack of resources (more time = more money) but choose too large and you have unused compute capacity which costs you money you don’t need to spend. Again, there’s no right answer here, it’s about what works for your workload. We found m4.xlarge works for us.

## Save up to 90 percent on EC2 costs using Spot Instances

Spot Instances are magic. They allow us to bid for unused capacity in the AWS infrastructure and often can mean that EC2 costs can be dramatically lower. We’re currently seeing discounts of around 85 percent on our EC2 bills due to using Spot Instances. Setting them up for use on GitLab CI/CD is really easy too. There is (of course) a downside. If our bid price for VMs is exceeded, then our instances shut down with only a few minutes notice. But as long as our bid is high enough, this isn’t an issue. Pricing in the spot market is insanely complex but in eu-west-2 at least, prices for m4.large and xlarge instances appear to have been static for months so a bid 10-20 percent higher than the current spot price appears to be a safe bet. Just keep your eyes peeled. The current spot price for an m4.xlarge instance is $0.026. We’ve set our maximum price at $0.03 to give us some wiggle room. At time of writing, the on-demand price is $0.232. The numbers speak for themselves.

>Note: Spot pricing can vary significantly between instance sizes, regions and even availability zones in the same region. This guide assumes that spot pricing won’t vary massively or that you’ve set a good buffer above the current spot price to avoid outages.

```
amazonec2-request-spot-instance=true & amazonec2-spot-price=0.03
```

This tells GitLab CI/CD that instead of just spawning new EC2 instances at full price, that it should request Spot Instances at the current spot price, setting a maximum bid that it should not exceed per hour, in USD (regardless of what currency you’re billed in. We’re billed in GBP, but Spot Instances are still calculated in USD.) The maximum bid is whatever you’re comfortable paying. We tend to set it close to the on-demand price because we’re looking for any discount. As long as we’re not paying more than we otherwise would, it’s fine with us. Your financial constraints may affect your decisions differently.

>Update: From October, AWS will charge in seconds, rather than hours used, making the potential savings even higher for unused partial hours.

We’d love to see how you get along with this so please let us know. You can contact me max [at] substrakthealth [dot] com. For us, it’s saved us time and money and that’s never a bad thing.

## About the Guest Author

Max Woolf is a Senior Developer at Substrakt Health. Based in the UK, they use innovative technology to transform how primary care providers organize and deliver care to patients in a sustainable NHS.

_[Autoscale GitLab CI runners and save 90% on EC2 costs](https://substrakthealth.com/autoscale-gitlab-ci-runners-and-save-90-on-ec2-costs/) was originally published on Substrakt Health's blog._

Cover image by [Sebastien Gabriel](https://unsplash.com/@sgabriel) on Unsplash
{: .note}
