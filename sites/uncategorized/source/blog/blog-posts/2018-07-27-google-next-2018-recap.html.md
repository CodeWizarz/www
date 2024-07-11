---
title: "Google Next 2018 Recap"
author: William Chia
author_gitlab: williamchia
author_twitter: thewilliamchia
categories: company
image_title: '/images/blogimages/google-next-2018/melody-meckfessel-gitlab-google-next-keynote.png'
description: "Several GitLab team-members participated in Google Next in San Francisco. Here’s a recap of what went on."
tags: events, google, cloud native, GKE, kubernetes
ee_cta: false
twitter_text: ".@gitlab's recap of #GoogleNext18"
---

## Google Partner Award Winner for Innovative Solution in Developer Ecosystem

Google's Partner Summit kicked off a day before the broader Next conference started. At the summit, we were honored to receive the Google Cloud Partner Award for Innovative Solution in Developer Ecosystem for the [tight integration with GKE](/partners/technology-partners/google-cloud-platform/) we released earlier this year. Of course, we decided to take some fun photos with the cloud logo.

![Sid Sijbrandij and Google execs](/images/blogimages/google-next-2018/sid-sijbrandij-google-execs.jpg){: .shadow.large.center}

![Sid Sijbrandij and Google tech partner team](/images/blogimages/google-next-2018/sid-sijbrandij-google-tech-partner-team.jpg){: .shadow.large.center}

![Eliran Mesika with GitLab's award + GitLab team with award](/images/blogimages/google-next-2018/eliran-mesika-gitlab-google-award-team.jpg){: .large.center}

## Launch partner for GCP Marketplace with Kubernetes Apps

![GCP Marketplace launch partners at Google Next](/images/blogimages/google-next-2018/gcp-marketplace-launch-partners-google-next.jpg){: .shadow.medium.center}

While the GCP Marketplace announcement went out a few days before the show, there was still [a lot of buzz about it at Google Next](https://www.youtube.com/watch?v=C6koWw0r07Y&amp=&t=28m29s). In addition to traditional apps, which deploy VMs on Compute Engine, the new GCP Marketplace now supports Kubernetes apps, which deploy to a Kubernetes cluster running on Google Kubernetes Engine. We were happy to be a launch partner, offering the ability to [install GitLab via the GCP Marketplace](/blog/2018/07/18/install-gitlab-one-click-gcp-marketplace/) on day one.

## Serverless, Knative, and Istio

[Knative](https://cloud.google.com/knative/) and [Istio](https://istio.io/) are two new projects announced during the show that we're excited about. Knative enables "serverless" workloads on Kubernetes while Istio is a service mesh for microservices. Check out [Josh](/company/team/#joshlambert) chatting live with [Sid](/company/team/#sytses) from the show (where Wi-Fi was a bit choppy) about serverless, Knative, and Istio, and how these technologies can potentially tie in with GitLab.

<!-- blank line -->
<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/k1jK4F4NoBw" frameborder="0" allowfullscreen="true"> </iframe>
</figure>
<!-- blank line -->

## Google Cloud Build + GitLab CI/CD

One of the key announcements from the show was the introduction of Google Cloud Build, a CI/CD tool for GCP. Many folks asked us if we saw this as competitive to GitLab CI/CD, and how that would affect our partnership with Google. First and foremost, GitLab supports a multi-cloud strategy. We partner with all of the major cloud vendors to ensure GitLab CI/CD can support multi-cloud deployments. Many cloud vendors have their own CI/CD tooling, like AWS Code Deploy or IBM Cloud Pipelines. For us, Cloud Build is just another point of collaboration. In fact, our own [Josh Lambert](/company/team/#joshlambert) teamed up with [Christopher Sanson](https://www.linkedin.com/in/christophersanson/) to create a GitLab + Google demo for Christopher's session, "CI/CD for Hybrid and Multi-Cloud Customers."

![Christopher Sanson demos GitLab CI/CD with Cloud Build](/images/blogimages/google-next-2018/christopher-sanson-gitlab-cicd.jpg){: .shadow.medium.center}

First, Christopher showed how to use GitLab as your code repo with Cloud Build as your CI/CD connected up via webhooks to Cloud Functions. Here's a link to some [sample code for setting up a Cloud Function to trigger cloud build from GitLab](https://gitlab.com/joshlambert/cloud-function-trigger) if you'd like to try it out yourself.

Then Christopher showed how to use GitLab CI/CD and GitLab container registry while offloading the infrastructure build to Google Cloud Build. Using Google Cloud Build together with GitLab CI/CD is one way to overcome some of the security problems of docker-in-docker (e.g. requires privileged containers). Check out the video below to see it in action. Additionally, here's an example ruby app with a [sample configuration for connecting Gitlab CI/CD to Cloud Build](https://gitlab.com/joshlambert/minimal-ruby-app/merge_requests/1/diffs).  

<!-- blank line -->
<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/IUKCbq1WNWc?start=1324" frameborder="0" allowfullscreen="true"> </iframe>
</figure>
<!-- blank line -->


## GitLab.com is migrating to GCP

![Melody Meckfessel talks GitLab GCP migration during keynote](/images/blogimages/google-next-2018/melody-meckfessel-gitlab-google-next-keynote.png){: .shadow.medium.center}

>"Our friends at GitLab have created a complete open source DevOps stack" - [Melody Meckfessel](https://www.linkedin.com/in/melodymeckfessel/), Vice President of Engineering, Google Cloud Platform

As part of our plans to make GitLab.com a rock solid, enterprise-ready SaaS offering, we are migrating from Azure to Google Cloud Platform. We’ve been carefully planning this migration for many months and are now very close to executing with a target migration date of August 11. Melody Meckfessel talked a bit about our migration during her keynote on Thursday. Check out our previous blog post to read up on the [full details of GitLab’s GCP migration](/blog/2018/07/19/gcp-move-update/).  

<!-- blank line -->
<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/JQPOPV_VH5w?start=1363" frameborder="0" allowfullscreen="true"> </iframe>
</figure>
<!-- blank line -->

## Talking to you

![William, Mike, and Reb in the GitLab booth](/images/blogimages/google-next-2018/william-chia-mike-walsh-gitlab-booth-duo.jpg){: .shadow.large.center}

Of course one of our favorite parts of any trade show is getting to meet our users and customers face to face. We love hearing the palpable excitement when you talk about how GitLab is streamlining your toolchain or easing your move to Kubernetes. We love sharing the story with folks who don’t know yet and seeing their faces light up when we tell them GitLab’s not just a version control solution, but an end-to-end DevOps application with built-in project planning, CI/CD, container registry, monitoring, and more. Google Next ’18 was a great show, and we can’t wait to see you next time! Check out the [full list of events](/events) we’ll be at to find one close to you.
