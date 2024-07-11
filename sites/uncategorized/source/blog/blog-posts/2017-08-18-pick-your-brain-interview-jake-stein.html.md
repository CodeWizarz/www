---
title: "Open source lessons learned: My interview with GitLab’s CEO"
author: Jake Stein
author_twitter:
guest: True
categories: open source
image_title: '/images/blogimages/pyb-jake-stein.jpg'
twitter_image: '/images/tweets/pyb-jake-stein.png'
description: "Stitch CEO and co-founder Jake Stein sits down for a pick your brain meeting with GitLab CEO Sid Sijbrandij."
tags: pick your brain, open source
---
_GitLab CEO Sid Sijbrandij occasionally sits down for a "[pick your brain](/handbook/eba/ceo-scheduling/#pick-your-brain-meetings)"
meeting with people seeking advice on open source, remote work, or discussion of other things related to GitLab._

When we launched Singer, our [open source ETL project](https://www.singer.io/) at [Stitch](https://www.stitchdata.com/), I was looking for advice on the best strategies to make it successful. August Capital is an investor in both Stitch and GitLab, and they were kind enough to introduce me to Sid Sijbrandij, CEO of GitLab. Sid was very generous with his time, and he shared some of his lessons learned about open source.  

<!-- more -->

## GitLab’s unique approach

As I explained Stitch to Sid, he asked a few follow up questions, and then shared information about a plan to build up the GitLab analytics stack. I didn’t set up the call intending to sell, but before it was over, he had added us to the publicly accessible page listing the tools that their team plans to evaluate. Their transparency is very impressive, and it eliminates the friction that can slow down a traditional company.

## Open source adoption

Virtually all of GitLab’s paying customers have come from their open source user base. While GitLab has a large sales team, they are primarily focused on converting users to the paid products rather than getting new GitLab users.  

Over 100,000 organizations use GitLab, and their product and engineering teams are responsible for growing that number. One of most important drivers of that growth has been improving the first run experience and time to value.  

We already had plans to improve the Singer user experience, but Sid encouraged me to take it a step further. The most common use case for Singer, and ETL in general, is pulling data into a database and then visualizing the data. He recommended that we bundle Singer with a PostgreSQL database and an open source visualization tool like Metabase into a easy-to-use package, potentially in a Docker container, which will allow users to get to their end goal much faster.

This was a really interesting idea that had not occurred to our team before. It motivated us to start thinking more holistically about the goals of our open source users, and I’m confident that this will help us grow adoption of Singer.  

## Open source business model

GitLab started as a free, open source tool and later introduced an enterprise edition and the free SaaS version of GitLab.com. Several years later, in April of 2017, they introduced paid tiers on GitLab.com.

We’ve taken a very different path with Stitch. We launched with a freemium SaaS service, and subsequently added an enterprise edition of the SaaS product and the free, open source Singer project.  

I thought that the differences in GitLab’s path might have been due to a philosophical decision about business model sequence, but it was much more practical. GitLab started as an open source project, and a business was created around it only after the project had significant traction. In the early days of the business, on-premises was where all of the usage was, so that’s where they started to charge. The original SaaS product was free so it could get traction and build a network effect. As the SaaS product got better, and as the cost of hosting the ever-growing number of SaaS users increased, they launched paid tiers.  

While Stitch and GitLab had very different beginnings, our business models have evolved in a similar direction. It was great to get the benefit of the lessons that Sid has learned as we chart our own course.  

## About the Guest Author

Jake Stein is the co-founder and CEO of Stitch. Prior to Stitch, Stein was co-founder and COO at RJMetrics, a business intelligence software company that was acquired by Magento in 2016. Before founding RJMetrics, Jake worked at Insight Venture Partners, a software-focused venture capital and private equity firm. He graduated from the Wharton School at the University of Pennsylvania with high honors and concentrations in Finance and Entrepreneurship.
