---
title: "Kubernetes & containers, and where cloud native fits in – the basics"
window_title: "What are containers in Kubernetes and where cloud native fits in | GitLab"
author: Rebecca Dodd
author_twitter:
author_gitlab: rebecca
categories: engineering
image_title: '/images/blogimages/containers-kubernetes-basics.jpg'
description: "Brush up on your understanding of these concepts key to modern development."
cta_button_text:
cta_button_link:
twitter_text:
tags: kubernetes, cloud native
---

We throw around terms like Kubernetes, containers, and cloud native with some abandon, but sometimes take it for granted that everyone knows what's what. So here we go...

<!-- more -->

## Container explainer

A container is a method of operating system-based virtualization that allows
you to securely run an application and its dependencies independently without
impacting other containers or the operating system.

Before containers, it was common to use virtual machines (VMs) to provide a safe, sandbox environment in which to test software, within a computer. A container works much like a virtual machine except that, instead of packaging
your code with an operating system, it is run as a Linux process
inside of the kernel. This means that each container only contains the code and dependencies needed to run that specific application, making them smaller and faster to run.

![Containers vs virtual machines vs bare metal](/images/blogimages/containers-vm-bare-metal.png){: .medium.center}

*<small>Containers retain the same repeatability factor as virtual machines, but are much faster and use fewer resources to run.</small>*

## Kuber... what?

Kubernetes is primarily a container scheduler – an open source platform designed to automate your management of application containers, from deploying and scaling to operating.

While virtualization technology statically partitions your servers into smaller VMs, Kubernetes allows you to partition as you go, depending on how much or little resources are needed at the time, scaling up and down as necessary. You can respond quickly and efficiently to customer demand while limiting hardware usage and minimizing disruption to feature rollouts. With container schedulers, the focus shifts from the machine to the service – the machine becomes an ephemeral, disposable element.

What's more, using containers in this way means they are decoupled from the host filesystem and underlying infrastructure, making them portable across clouds and operating systems.

## Containers + Kubernetes <i class="fas fa-arrow-right" aria-hidden="true"></i> cloud native

Which brings us to [cloud native development](/topics/cloud-native/). Cloud native applications embrace a new approach to building and running applications that takes full advantage of the cloud computing model and container schedulers such as Kubernetes.

Not to be confused with running traditional applications in the cloud, cloud native means that applications are purpose-built for the cloud, and consist of loosely coupled services. Applications are re-architected for running in the cloud – shifting the focus away from the machine to the service instead. Cloud native acknowledges that the cloud is about more than just who manages your servers – it is the next step in digital transformation.

By building applications that can run on any cloud, right out of the box, you’re free to migrate and distribute across vendors in line with your budget and business priorities. You also free up developer time – they don’t have to write code to run and scale across a range of cloud infrastructures, so they can focus on improvements and new features.

Sound good? We think so! Visit [about.gitlab.com/kubernetes](/solutions/kubernetes/) to learn more about how GitLab and Kubernetes can get you to cloud native nirvana.

[Cover image](https://unsplash.com/@guibolduc?photo=uBe2mknURG4) by [Guillaume Bolduc](https://unsplash.com/@guibolduc) on Unsplash
{: .note}
