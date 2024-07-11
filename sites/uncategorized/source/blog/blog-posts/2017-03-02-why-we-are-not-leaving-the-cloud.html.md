---
title: "Why we are not leaving the cloud"
author: Sean Packham
categories: engineering
image_title:
description: What we learned from our community vetting our proposal to leave the cloud.
---

<script>
  var disqus_identifier = '/blog/2017/02/09/why-we-are-not-leaving-the-cloud/';
</script>

Towards the end of 2016 we said we were [leaving the cloud for bare metal](/blog/2016/11/10/why-choose-bare-metal/) and shared our [hardware proposal](https://news.ycombinator.com/item?id=13153031). In December 2016, after receiving hundreds of comments and emails filled with advice and warnings, [Sid and the team decided](https://gitlab.com/gitlab-com/infrastructure/issues/727#note_20044060) to keep GitLab.com in the cloud. The rest of the post summarizes some of the great community support and feedback we received and ends with how we are committed to making GitLab.com fast and stable in the cloud. Our decision was based on  more than what is below but we wanted to give you a good summary of all the interesting things that were shared publicly.

<!-- more -->

## Let's begin on the topic of cost

> When I was at Koding we made a similar move from AWS to bare metal. The costs were amazing. Something like $20k a month for what in AWS would cost $200k. I have been saying for a very long time that once you hit a certain scale AWS no longer makes sense. *[Geraint - GitLab blog: Going bare metal](/blog/2016/11/10/why-choose-bare-metal/#comment-2999631471)*

> We had 140 servers hosted in New York City for 10 years or so, and hosting only was going up and up, and contracts didn't give us flexibility to add cabinets when we needed. We basically had to cancel the previous contract, make a new one, pay for the upgrade, pay for the cabinet setup, etc... At some point, when we had financial trouble paying $14K/month for hosting, we decided to move all our servers from NYC to Tallinn, Estonia, where we built our own a small scale datacenter. As a result, we were able to cut hosting fees x10. *[Dmitri - GitLab blog: Proposed server purchase](/blog/2016/12/11/proposed-server-purchase-for-gitlab-com/#comment-3049071074)*

<div style="font-size: 38px; line-height: 1.2; margin: 45px 0 55px; font-style: italic;">
It's not just the cost of owning and renewing the hardware, it's everything else that comes with it – daenney
</div>

> It's not just the cost of owning and renewing the hardware, it's everything else that comes with it. Designing your network, performance tuning and debugging everything. Suddenly you have a capacity issue, now what b/c you're not likely to have a spare 100 servers racked and ready to go, or be able to spin them up in 2m? Autoscaling? *[daenney - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13153296)*

> Application Architecture is far more important than Cloud vs. Bare Metal. It is just easier and more cost effective to throw more bare metal hardware at the problem than it is cloud instances. For some this does make bare metal the better option. *[mohctp - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13162964)*

> Moving to your own hardware will almost certainly improve performance, reduce incidental downtime, and cut costs substantially. Including hiring more engineers, you might expect total costs to be ~40-50% of what you would have spent on cloud-based services over the first 24 months. If your hardware lifecycle is 36-48 months, you will see large savings beyond 24 months. *[bobf - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13153413)*

> I think they are going to underestimate the cost to GitLab in the long run. When they need to pay for someone to be a 30 minute drive from their DC 24/7/365 after the first outage, when they realize how much spare hardware they are going to want around, etc. *[manacit - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13154057)*

## What About Performance?

> A cloud service providers' biggest responsibilities to its customers are security, durability, availability and performance -- in that order. You guys are vastly underestimating the complexity involved in getting first 3 right. *[mritun - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13155809)*

> Very few teams at Google run on dedicated machines. Those that do are enormous, both in the scale of their infrastructure and in their team sizes. I'm not saying always go with a cloud provider, I'm reiterating that you'd better be certain you need to. *[boulos - Hacker News: Going bare metal](https://news.ycombinator.com/item?id=12941210)*

<div style="font-size: 38px; line-height: 1.2; margin: 45px 0 55px; font-style: italic;">
A company rolling their own system doesn't have to share, and they can optimise specifically for their own requirements – taneq
</div>

> As a cloud provider, though, you're trying to provide shared resources to a group of clients. A company rolling their own system doesn't have to share, and they can optimise specifically for their own requirements. *[taneq - Hacker News: Going bare metal](https://news.ycombinator.com/item?id=12940925)*

> My thinking is that elasticity and recovery from hardware failure, and migration and multi-data center high availability will become concerns. Moving from the cloud to bare metal gives you performance and simplicity, but doesn't give you as many ways of recovering from network interruptions, and hardware failures. *[wpostma - the GitLab blog: Going bare metal](/blog/2016/11/10/why-choose-bare-metal/#comment-3001348957)*

> It sounds like they didn't design for the cloud and are now experiencing the consequences. The cloud has different tradeoffs and performance characteristics from a datacenter. If you plan for that, it's great. Your software will be robust as a result. If you assume the characteristics of a data center, you're likely to run into problems. *[wandernotlost - Hacker News: Going bare metal](https://news.ycombinator.com/item?id=12940082)*

<div style="font-size: 38px; line-height: 1.2; margin: 45px 0 55px; font-style: italic;">
It makes sense to keep GitLab.com as an eat-your-own-dog-food-at-scale environment – jtwaleson
</div>

> It makes sense to keep GitLab.com as an eat-your-own-dog-food-at-scale environment.  If one of their customers that run on-premise has performance issues they can't just say: GitLab.com uses a totally different architecture so you're on your own. They need GitLab.com to be as close as possible to the standard product. *[twaleson on Hacker News: Going bare metal](https://news.ycombinator.com/item?id=12940462)*

> They are moving from cloud to bare metal because of performance while using a bunch of software that are notoriously slow and wasteful. I would optimise the hell out of my stack before commit to a change like this. Building your own racks does not deliver business value and it is extremely error prone process (been there, done that). *[StreamBright - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13153866)*

## Advice on our storage proposals

> __Don't f*ck with storage.__ 32 file servers for 96TB? Same question as with networking re:ceph. What are your failure domains? How much does it cost to maintain the FTEs who can run this thing? *[Spooky23 - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13153860)* - *Spooky23 did warn us "I'm a cranky old person now".*

> I think there might be a pretty big IOPS drop when you switch over to this hardware. You're looking at having approximately 60 7200 RPM drives in this CephFS cluster. Doing the math, if you assume each of those drives can do 100 read and 100 write IOPS, and that you are doing 3x replication on write (plus journal writes), you're not going to get anywhere near the numbers that you want. *[Nicholas - the GitLab blog: Proposed server purchase](/blog/2016/12/11/proposed-server-purchase-for-gitlab-com/#comment-3047537669)*

>I would think that GitLab's workload is mostly random, which would pose a problem for larger drives. The SSDs are a great idea, but I've only seen 8TB drives used when there are 2 to 3 tiers; with 8TB drives being all the way on the bottom. I'm not sure how effective having a single SSD as a cache drive for 24TBs of 8TB disks will be. *[lykron - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13153333)*

## and our choice of 8TB drives

> If you are looking for performance, do not get the 8TB drives. In my experience, drives above 5TB do not have good response times. I don't have hard numbers, but I built a 10 disk RAID6 array with 5TB disks and 2TB disks and the 2TB disks were a lot more responsive. *[lykron - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13153196)*

> Just a few quick notes. I've experience running ~300TB of usable Ceph storage. Stay away from the 8TB drives. Why are you using fat twins? Honestly, what does that buy you? You need more spindles, and fewer cores and memory. With your current configuration, what are you getting per rack unit? *[halbritt - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13153786)*

##  Feedback on our network proposals

>__Don't f*ck with networking.__ Do you have experience operating same or similar workloads on your super micro SDN? Will the CEO of your super micro VAR pickup his phone at 2AM when you call? *[Spooky23 - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13153860)*

> I would not use 10GBase-T since it's designed for desktop use. I suggest ideally 25G SFP28 (AOC-MH25G-m2S2TM) but 10G SFP+ (AOC-MTG-i4S) is OK. The speed and type of the switch needs to match the NIC (you linked to an SFP+ switch that isn't compatible with your proposed 10GBase-T NICs). *[wmf - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13153678)*

> I didn't see it mentioned but what are your plans for the network strategy. Are you planning to run dual-stack IPv4/IPv6 ? IPv4 only? Internal IPv6 only with NAT64 to the public stuff? Hopefully IPv6 shows up somewhere in the stack. It's sad to see big players not using it yet. *[tomschlick - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13153922)*

> Don't fall into the trap of extending VLANs everywhere. You should definitely be routing (not switching) between different routers.
>
> "Should we have a separate network for Ceph traffic?" Yes, if you want your Ceph cluster to remain usable during rebuilds. Ceph will peg the internal network during any sort of rebuild event. *[devicenull - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13153339)*

## What did the community have to say about Ceph?

> I lead a technical operations team that moved our infrastructure from public cloud (~400 instances) to private cloud (~55 physical servers) and finally, to Kubernetes (6 physical servers). We actually run a mix of Kubernetes and OpenStack, putting apps and services in Kubernetes and all data storage in OpenStack. I've done extensive testing with Ceph and while it adds flexibility, you're not going to be able to touch the I/O performance of bare metal local disks for database use. For storage, I like to keep it simple. I rely on the Linux OS running on standard tried-and-true filesystems (ext4 and ZFS) and build redundancy at the software layer. *[Chris - GitLab blog: Proposed server purchase](/blog/2016/12/11/proposed-server-purchase-for-gitlab-com/#comment-3047381500)*

> We had disastrous experiences with Ceph and Gluster on bare metal. I think this says more about the immaturity (and difficulty) of distributed file systems than the cloud per se. *__[codinghorror - Hacker News: Going bare metal](https://news.ycombinator.com/item?id=12940042)__*

> You need to make sure that there is not an architecture that you can build that absolves you of having to run a CephFS cluster. CephFS is cool, but it is a single point of failure right now, and comes with a ton of caveats. Performance and stability will be much improved if you remove the layer of abstraction it creates and write your app to handle some sort of distributed storage system. *[Nicholas - GitLab blog: Proposed server purchase](/blog/2016/12/11/proposed-server-purchase-for-gitlab-com/#comment-3047478761)*

<div style="font-size: 38px; line-height: 1.2; margin: 45px 0 55px; font-style: italic;">
Be very very careful about Ceph hype – late2part
</div>

> Be very very careful about Ceph hype. Ceph is good at redundancy and throughput, but not at IOPS, and Rados IOPS are poor. We couldn't get over 60k random RW IOPS across a 120 OSD cluster with 120 SSDs. *[late2part - GitLab blog: Proposed server purchase](https://news.ycombinator.com/item?id=13154620)*

> If you're using CephFS and everyone else wants to be using other Cloud storage solutions, that would actually put you at a disconnect with your users and leave room for a competitor with the tools and experience to scale out on Cloud storage to come in offering support. *[Rapzid - Hacker News: Going bare metal](https://news.ycombinator.com/item?id=12946174)*

## How would moving to metal affect the GitLab team?

> Your core competency is code, not infrastructure, so striking out to build all of these new capabilities in your team and organization will come at a cost that you can not predict. Looking at total cost of ownership of cloud vs steel isn't as simple as comparing the hosting costs, hardware and facilities. *[ninjakeyboard - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13153779)*

<div style="font-size: 38px; line-height: 1.2; margin: 45px 0 55px; font-style: italic;">
Your core competency is code, not infrastructure – ninjakeyboard
</div>

> Another problem I would say to move to metal is that you lose support. Cloud vendors have entire teams, network, systems, datacenters etc. at your disposal, this is included in the price you are paying. Are you sure you are ready to debug networking issues, systems problems at the level as the cloud vendors? It is a tough job. *[l1x - GitLab blog: Proposed server purchase](/blog/2016/12/11/proposed-server-purchase-for-gitlab-com/#comment-3047353138)*

> I think you're under estimating the number of people required to run your own infrastructure. You need people who can configure networking gear, people swapping out failed NICs/Drives at the datacenter, someone managing vendor relationships, and people doing capacity planning. *[thebyrd-on Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13153644)*

## Let’s just abandon x86 altogether

<div style="font-size: 38px; line-height: 1.2; margin: 45px 0 55px; font-style: italic;">
Why bind yourself to Intel servers? – MBH
</div>

> Why bind yourself to Intel servers? The max CPU-to-Memory bandwidth is 68 GB/s. That's horrible for crunching data fast. IBM's POWER8 systems have servers with 230 GB/s CPU-to-Memory bandwidth, and others with 320 GB/s...
>
> ...POWER8 CPUs have a different architecture than Intel: PPC64, so you may need to recompile some things, or have some Intel systems for workloads that can only run on x86_64. *[MBH - GitLab blog: Proposed server purchase](/blog/2016/12/11/proposed-server-purchase-for-gitlab-com/#comment-3053432409)*

## We all have an opinion

> I've only ever built desktop machines, and this top comment drew a surprising parallel to most help me with my desktop build type posts. Granted, I'm sure as you dig deeper, the reasoning may be much different, but myself being ignorant about a proper server build, it was somehow reassuring to see power and cooling at the top! *[davidbrent - Hacker News: Proposed server purchase](https://news.ycombinator.com/item?id=13154202)*

## We are taking a step back and using a boring solution

We want to scale intelligently and build great software; we don’t want to be an infrastructure company. We are embracing and are excited about solving the challenge of scaling GitLab.com on the cloud, because solving it for us also solved it for the largest enterprises in the world using GitLab on premise.

Most of the scaling headaches have occurred because Git is read-heavy: looking at our Git Read/Write performance chart below, you can see that for about every 300 reads we get 10 writes. We tried to solve this by running CephFS in the cloud but it goes against our value of using the simplest, most  [boring solution](/handbook/#values) for a problem.

![An average of 300 Reads to 10 writes](/images/blogimages/why-we-are-not-leaving-the-cloud-chart.png)

## How are we going to get back to basics?

1. We spread all our storage into [multiple NFS shards](https://gitlab.com/gitlab-com/infrastructure/issues/711) and [dropped CephFS](https://gitlab.com/gitlab-com/infrastructure/issues/817) from our stack.
2. We created [Gitaly](https://gitlab.com/gitlab-org/gitaly) so that we can stop relying on NFS for horizontal scaling and speed up Git access through caching.

[Gitaly](https://gitlab.com/gitlab-org/gitaly) will serve as the single interface for all our Git access throughout our stack. With Gitaly the gitrpc travels over the network and the disk is accessed locally. Instead of all the disk access going over the network. It will also be used to improve our monitoring of Git resource usage to make better decisions; currently we are only sampling processes.

We would love if the community would challenge our use of Gitaly with the same passion they challenged us before. What do you think of the software architecture? Can a caching layer like this scale? What alarm bells are set off? We can’t wait to hear your feedback!

We would like to thank our community, customers, team and board for all their great support – you all make GitLab an incredible product.
