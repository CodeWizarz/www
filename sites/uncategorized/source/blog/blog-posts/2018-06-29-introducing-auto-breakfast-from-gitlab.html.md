---
title: "Introducing Auto Breakfast from GitLab (sort of)"
author: Brendan O'Leary
author_gitlab: brendan
author_twitter: olearycrew
categories: engineering
image_title: '/images/blogimages/auto-breakfast.jpg'
description: "GitLab can't make you breakfast? This is what happens when you tell a GitLab team member whose favorite catchphrase is \"Challenge accepted.\""
ee_cta: false
tags: CI, user stories
twitter_text: 'Introducing Auto Breakfast from @gitlab (sort of)'
---

A big part of [GitLab's culture](/company/culture/) is [saying thanks](/handbook/communication/#say-thanks) to one another for doing a great job. That can be anything from helping with a tough technical problem to simply sharing a nice [coffee chat](/company/culture/all-remote/#coffee-chats) to break up the work day. One day a Sales team member thanked someone from Customer Success for a great demo of [GitLab CI/CD](/features/continuous-integration/). The customer commented afterwards, "Okay, what doesn't GitLab do?"

Plenty of heart-themed emoji reactions followed. We've seen users do some pretty amazing things with GitLab CI/CD, from [ramping up to weekly mobile releases](/blog/2017/06/07/continuous-integration-ticketmaster/) to [automating boring Git operations](/blog/2017/11/02/automating-boring-git-operations-gitlab-ci/), to [saving 90 percent on EC2 costs](/blog/2017/11/23/autoscale-ci-runners/). However, there was one thing we hadn't seen. So in addition to this love, the question also garnered a semi-sarcastic answer:

> It won't make breakfast for you, unfortunately.

Never one to let a Slack conversation go unnoticed, I replied with one of my favorite phrases:

![Challenge Accepted](/images/blogimages/breakfast-challenge.png){: .shadow.center.medium}

I have to admit that the fact that my status was [`:coffee_parrot:`](https://github.com/jmhobbs/cultofthepartyparrot.com/issues/55) could have been related to my enthusiastic reply...

## The challenge

At the time I had only a vague idea of how I would accomplish this. Many suggestions about Internet of Things devices followed my comment. And while a toaster with a version of Linux that will never be patched was intriguing, I wanted to do something bigger.

A few years ago some friends got together and bought me an [Anova Sous Vide](https://anovaculinary.com/), knowing that I loved to cook. What they failed to calculate was that having four kids in eight years was counterproductive to learning the time-tested [French cooking method of sous-vide](https://en.wikipedia.org/wiki/Sous-vide). As such, the tool has not had a whole lot of use in its time.

However, at this point I thought of two things:

1. I love a new sous-vide egg bite offering from a well-known coffee shop
1. The Anova Sous Vide uses [bluetooth low energy (BLE)](https://en.wikipedia.org/wiki/Bluetooth_Low_Energy) to allow you to control it through an app

## The recipe (culinary)

While I did like the egg bites from a coffee shop that shall remain nameless, I don't have them all the time. I would give them a 5- _star_ rating, but they cost a few more _bucks_ then I’d like to spend 😉 So I found a [sous-vide egg bite recipe](https://recipes.anovaculinary.com/recipe/sous-vide-egg-bites-bacon-gruyere) on Anova's website.

## The recipe (technology)

Once I had the recipe, all I needed was to reverse engineer the BLE connection, figure out how to get that to work from the command line, set up a project and get it integrated with GitLab CI/CD... no big deal. Luckily I found a fantastic project called PyCirculate that had already worked out a lot of the BLE connection issues with the Anova. It made me wonder if someone else had automated breakfast before... but I've yet to find them!

![Ingredients...Pinterest picture](/images/blogimages/breakfast-pintrest.png){: .shadow.center.medium}

Now that I had both recipes and all the ingredients, it was time to _*git*_ crackin'... (I can't tell you how happy I was when I thought of that joke.  Did I mention I'm a dad?)

### Setting up the breakfast pipeline

Once I had that project installed and working on my laptop, I uploaded the code to GitLab in the public repository in the [auto-breakfast group](https://gitlab.com/auto-breakfast/eggs/). Next, I installed [GitLab Runner](https://docs.gitlab.com/runner/) on a [RaspberryPi](https://www.raspberrypi.org/). I registered the Pi as a [specific runner](https://docs.gitlab.com/runner/register/) for my project.  I used a [runner tag](https://docs.gitlab.com/ee/ci/runners/configure_runners.html#use-tags-to-control-which-jobs-a-runner-can-run) so that I could ensure the cooking job only ran on a device with a Bluetooth connection.

![Specific runner](/images/blogimages/breakfast-runner.png){: .shadow.small.right.wrap-text}

When I run a pipeline on `auto-breakfast/eggs` it uses the RaspberryPi to execute and thus can create the BLE connection to the Anova. With the click of a button in GitLab, my breakfast pipeline was running. All I had to do was sit back, relax, and let GitLab CI/CD do all the work.

![Auto Breakfast pipeline](/images/blogimages/breakfast-1.JPG){: .shadow.center.medium}

## The results

The egg bites were great! I even modified the recipe with some great Kerrygold Irish whiskey cheddar cheese. However, I would say that it did take a little more effort to get things set up. However, now that it's done, I have a repeatable, single-button way to cook the recipe again (minus the egg cracking and food processing). Just like CI/CD with a `.gitlab-ci.yml` can help make software build and deployment more reliable and repeatable, it can also make a fantastic breakfast 😎

Not pictured: A very messy kitchen and a very perplexed wife.
{: .alert .alert-gitlab-purple}

[Photo](https://unsplash.com/photos/I-ykyShydj0?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) by Leti Kugler on [Unsplash](https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
{: .note}
