---
title: "GitOps viewed as part of the Ops evolution"
author: Viktor Nagy
author_gitlab: nagyv-gitlab
author_twitter: nagyviktor
categories: engineering
image_title: '/images/unsplash/food-train.jpg'
description: "Examine the evolution that led to GitOps"
tags: DevOps, GitOps
twitter_text: "View GitOps through the lens of Ops evolution."
# featured: no 
postType: product 
related_posts:
  - "/blog/2021/06/10/how-to-get-gitops-right-with-iac-security/"
  - "/blog/2020/12/17/gitlab-for-cicd-agile-gitops-cloudnative/"
  - "/blog/2021/04/27/gitops-done-3-ways/"
  - "/blog/2021/06/09/how-to-protect-your-source-code-with-gitlab-and-jscrambler/"
# merch_banner: merch_eight
---

GitOps is a hot topic in the world of operations, but what does it provide to workflows that we didn’t have already? Looking at the evolution of the operations space, there have been many big changes in the past 20 years, and I argue that [GitOps](/topics/gitops/) is not a change, rather a summary of best practices. So, how do we describe the major phenomenon in Ops over the past 20 years? 
 
Before 2000, the primary approach to operations was to hire a System Administrator or empower Lead Developers to do Ops work. System Administrators knew a lot about networking and server optimisations, and a good sysadmin can do most of their work through code, using Bash, Perl or Python scripts. While every software engineer likely knows at least the basics of shell scripting, even many backend engineers would not be comfortable with the level of bash scripting needed in traditional IT. 
 
Besides bash, there were situations where the infrastructure was managed through graphical user interfaces. Most enterprise IT software shipped with some level of graphical UI. This area was particularly alien to software developers. I first worked as a system administrator at a student house in Hungary. We used Novell tools to manage our network, create backups, and set up workstations. To be successful, I had to learn a lot about the tools and the domain, while my programming skills were pretty minimal.
 
Today, a cloud-native "system administrator" does their job primarily through API calls. The APIs are triggered through some infrastructure as code approaches. Thus, even the sysadmins of today require much more advanced coding skills than they needed 20 years ago. Moreover, codefying your infrastructure enables battle-tested software development best practices, like testing, be introduced in operations, too. 

This is a huge change compared to where we were 20 years ago. What has changed that got us to where we are now and how does it relate to GitOps?

## The story
 
<iframe src='https://cdn.knightlab.com/libs/timeline3/latest/embed/index.html?source=1_ZqRL3FjiRWlwW0Nx6imkrDcCbQtiFV4tJvR1JLiy3s&font=Default&lang=en&initial_zoom=2&height=650' width='100%' height='650' webkitallowfullscreen mozallowfullscreen allowfullscreen frameborder='0'></iframe>
 
### The first signals at Google

The System Administrator era is the initial period where our story starts. As we move forward, the first milestone is in 2003. For our story, two notable events happened during 2003. First, [Google presented Borg](https://research.google/pubs/pub43438/), their internal container management system that later became [Kubernetes](/blog/2021/02/22/gitlab-kubernetes-agent-on-gitlab-com/). Second, Google hired Benjamin Treynor, and the SRE approach started with his collaboration. Let's stop here for a minute to speak about the core aspects of the SRE approach!

[Site Reliability Engineering (SRE)](https://sre.google/) is a software engineering approach to IT operations. Software engineers write software to reach a goal, there is likely a process around delivering the software that includes code reviews and tests, and there are success metrics attached to the delivered output. These success metrics in the context of SRE are called Service Level Indicators, and there are related Service Level Objectives and Service Level Agreements. By applying software engineering practices to operations, the reliability and scalability of the system can be better understood and improved. Moreover, the automations that emerge from the approach enable the development teams to be more efficient as they can often self-serve their requirements.
 
### The public cloud

Let’s continue our story. For many companies around the world, an important development was Amazon Web Services (AWS). AWS launched in 2006 with 3 services: S3, SQS and EC2. Together, these services enabled companies to switch to AWS or to start their business on [AWS infrastructure](/blog/2020/12/15/deploy-aws/). Amazon's market share has made it the leading cloud provider today, and their name is coupled tight with public clouds. As increasing workloads migrated to the cloud, the way of operations had to adapt. 
 
In past years, I've run many interviews with IT operations professionals and asked them about their [infrastructure as code (IaC) practices](/topics/gitops/infrastructure-as-code/). From these interviews, a very strong pattern emerged around IaC adoption. Companies usually switch to IaC as they move their infrastructure to the cloud. Simply, managing dozens of cloud services through a UI is very problematic, and managing them through a single codebase is much more convenient. Together with the move to the cloud, there is a strong push to improve operations practices, and move towards more automated approaches.
 
### The appearance of DevOps

While the struggles of software delivery were well-known by 2009, the SRE approach pioneered at Google was not as widely adopted. As agile started to be formalized in 2000, it seemed that we found a solution to the problem of delivering the built services in front of the user becoming more and more stringent. As a result of many discussions around this topic, Patric Debois coined the term DevOps in 2009. 
 
> DevOps describes the cultural changes required in order to enable high-quality service delivery. The core idea of DevOps is to create a well-oiled process around service delivery by setting shared goals and clear ownerships. The many approaches to DevOps are highlighted by [the 9 types presented as DevOps team topologies](https://web.devopstopologies.com/).
 
Just like many agile techniques existed before agile was formalized, the SRE approach existed before the term DevOps came to be, and it can be considered an implementation of DevOps. There are just as many agile techniques as there are ways to implement DevOps. 
 
### Containers to drive the process

In 2013, several developments were made. O'Reilly published the first book on DevOps, and the operations space got a new tool - docker - which led the way to containerisation and changed our industry tremendously. Containerisation provides a standard way to ship software. Previously, engineers could build a Debian package or a Java jar file. Basically, every technology had its own packaging solution, and there are _many_ technologies. Containers provide a single, standard way to package an application, enabling both developers to own what happens inside the container and infrastructure teams to support developers to ship containers reliably and quickly into production.
 
The idea of containerisation solves another problem, that of stale resources. For a long time, operations had to start different servers for various workloads, dependencies of workloads had to be taken care of, and that led to stale servers and huge inefficiencies, but we did not have a good model around orchestrating the workloads. Apache Mesos was presented in 2009 and Docker Swarm in 2014, indicating innovation in this space. In 2014, Kubernetes was presented as the open source version of Google's Borg system, and it quickly became the leading solution in this area. When released, it already supported docker containers, provided declarative infrastructure management through the Kube API, and came with a reconciliation loop at its core. Basically, the end user describes the expected state and sends it to the system, and Kubernetes tries to reach and maintain that state. Using an API for cloud operations was not new any more, still describing what we want to see, instead of imperatively commanding the system to take specific actions is a novel approach. Moreover, this enables the system to self-heal, as it can always aim at reaching the desired state. Beside better resource utilisation, these are the core values of container orchestrators.

### The summary is GitOps

Our story slowly gets to its end in 2017 when the GitOps term was coined. GitOps provides a summary of what we had already without adding anything new to the picture. Even though the summary was known, this workflow did not have a name yet. The cultural changes required for modern IT operations are described by DevOps and shown in the SRE approach. Automation has been with us since the advent of continuous integration, and new tools like AWS, containers, and Kubernetes enabled it in operations too. Finally, Kubernetes provides a way for the system to take care of itself (more or less), and provides a self-healing aspect of automation. As Gene Kim wrote in the _Phoenix Project_, “The Second Way is about creating the right to left feedback loops”. Coupling this with storing all the code that describes our system in a versioned manner, applying them automatically through a well-defined process, and finally using a self-healing system is what we call GitOps. 

## What does it mean to you
 
At GitLab, our [vision](https://about.gitlab.com/direction/#vision) is to provide a single application for the whole DevSecOps lifecycle. As part of this, GitLab offers one of the leading CI automation tools, and our dedicated [Infrastructure as Code](https://docs.gitlab.com/ee/user/infrastructure) and [Kubernetes Management](https://docs.gitlab.com/ee/user/project/clusters/) enable best practice operations for modern ops teams. We understand that many services are run in legacy infrastructures, where automation is very problematic, and some companies do not have the resources or need to move to Kubernetes. As shown above, the canonical definition of GitOps is not feasible in these situations. Thankfully, the value of GitOps is minor compared to the value of a strong DevOps culture combined with the automation enabled by the target systems.
 
As a result, I encourage everyone to approach GitOps by understanding their current level of DevOps practices as GitOps will emerge naturally from following well-known practices in the DevOps area.
 
Cover image by [Sigmund](https://unsplash.com/@sigmund?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/evolution?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

## Read more on GitOps with GitLab: 

- [GitOps with GitLab: Infrastructure provisioning with GitLab and Terraform](/blog/2021/11/04/gitops-with-gitlab-infrastructure-provisioning/)

- [Here's how to do GitOps with GitLab](/blog/2021/10/21/gitops-with-gitlab/)

- [How to use a push-based approach for GitOps with GitLab scripting and variables](/blog/2021/07/23/how-to-agentless-gitops-vars/)

- [GitOps with GitLab: Connect with a Kubernetes cluster](/blog/2021/11/18/gitops-with-gitlab-connecting-the-cluster/)

