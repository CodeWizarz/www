---
title: "On-Calliday: A guide to unsucking your on-call experience"
author: Amanda Folson
author_twitter: Ambassadorawsum
categories: culture
image_title: '/images/blogimages/on-calliday.jpg'
description: "Being on-call can be rough because you're likely losing sleep, which can impact your personal and professional life. Here are some tips on how to make on-call shifts less painful for your team and company."
tags: workflow, remote work, careers
---
In spirit of the rapidly approaching summer-vacation season, here are some tips on how to prevent burnout when scheduling on-call rotations. Although I'm currently a developer advocate, I've been a career developer and worked in DevOps roles, and I'm no stranger to the on-call life.  Here I'll discuss burnout, the pros and cons of different shift lengths, and how to make on-call rotations a little less painful.

<!-- more -->

## Four phases of burnout

First, let's talk about burnout, because this is what we’re trying to prevent.
Especially in tech, people may respond to the demands of their job by staying late to get stuff done, or forgoing vacation days because even the prospect of catching up upon return is daunting. It's worth remembering that work can actually kill you, and there's a lot of stigma around this kind of stress, so it's important to talk about.

These four stages are for employees and employers alike to keep tabs on yourself and your team.

### Caution
You feel like you’re not providing value so you try to prove yourself by working more. You might feel down on yourself.

### Warning
You start to ignore your own needs in favor of working. Sleep, family, and hobbies become secondary priorities to you. You might panic. You work all the time and sleep like crap.

### Danger
This is the point where you need to REALLY start seeking help. Your behavior starts to change at this stage. You might become aggressive or withdraw from serious commitments and social functions, or start engaging in risky behavior. You might be so anxious about all of the work you have to do that you end up not doing anything at all.

### Emergency  
If you’re in this zone you need to seek help immediately. In this stage you might feel empty and engage in even riskier behaviors. Many people are depressed at this stage, and it’s not uncommon for people to have suicidal thoughts.

## How can we make on-call shifts better?

Team members can protect themselves from burnout by making sure everything is in order before their shift. For example, make sure to pay important bills, run errands you’ve been putting off, and do anything else you can to simplify your work week. In terms of making your team work better as a whole, here are some additional best practices you can consider enforcing:

### Don't make the pain in vain
A chance of being woken up in the middle of the night is never going to be amazing. You can do a lot to decrease the likelihood of it. If you have to be woken up, make it worth the pain and make the time count.

### Make the data count
Many companies rely on their on-call employees being woken up, and the buck stops there. They have basic monitoring set up but don’t do anything with the data. You should be auditing the information collected during on-call shifts: do root cause analyses, talk about issues, and look for patterns. If you notice that something happens at 2am every few days, you can dig in and fix that.

### Find the best tool for the job
Many tools exist to help you manage complex scheduling and data aggregation. There are plenty of alternatives, so definitely find one that works for you. Every single one of them is designed to tell you when people are getting woken up and what’s waking them up.

### Keep your staff sharp
Run drills where you knock things over in a controlled environment and practice putting out those fires.

### Learn how to do incident response
You can learn a lot from actual firefighters. I learned a lot from 3 guys at Blackrock, who were actual firefighters turned ops guys who go around teaching ops orgs how to handle incidents better. When there’s a fire, there’s an incident commander, who is in charge of directing everyone else. Rank isn't important here; this person does not have to be manager, they should just be responsible for checking in on everyone for status updates. This person also assigns a scribe to take notes if necessary, although it's better to record calls if you can for better learnings later.

### Implement "you write it, you wear it"
If you do nothing else in this list, do this. The people who are writing the code, deploying the infrastructure, or touching the guts should be involved in the on-call rotation somehow. These are the best people to fix issues - they’re the ones that know it inside and out. If you don’t have these people on-call, I’m going to boldly say you’re doing it wrong.

### Set better schedules
Try to start and end your on-call rotations in the middle of the day to give staff an opportunity to go over any problems or questions they experienced on shift. Starting and ending your shifts mid-week is also ideal, since it avoids many bank holidays. Try never to start or end a shift on a holiday, and if you have to have someone on-call on a holiday, it's important to share the load across the team if you can so that one person isn’t on-call the whole day.

### Make people take vacation (!!!)
On a related note, employers should keep track of how many people are taking vacation and when. Force people to actually take vacation if you need to - this will make the team as a whole healthier and better when on their shift.

## Which shift length is right?

There’s no one-size-fits-all solution to scheduling, but I typically tell people to not do weekly rotations unless they have mature monitoring in place. It’s better to proactively monitor and adjust schedules as needed. Think of schedules as a living calendar that’s flexible and open to improvement, rather than using the “set it and forget it” approach. People are dynamic and their needs change, so your schedule should reflect that. Here are a few examples of common shift length:

### 8 hours
This is great for people who are covering a business day. The shift might start when someone comes in and end when they leave - or up to 3 hours after leaving - before another team takes over. Extend by 3 hours after they leave so that work they did during the day has time to settle. This length is useful for people who are doing deploys during the day as they’re around to fix issues that arise without anyone else getting paged for it.

### 12 hours
This shift length is ideal for people who are covering an overnight. Try "follow-the-sun" rotations, which means exactly what you'd expect: Everyone is on-call during their local business hours. Someone starts at 9am, someone starts at 9pm - this still allows for a hand-off and isn’t in the middle of the night.

### 24 hours
A 24-hour shift is really common and relatively low stress if you have several people on a team. This prevents anyone from having a “rough week” - there's equal opportunity for everyone to have a rough night. The shift is over before you know it.

### 1 week
This is typical for small and large teams, and is great if you want to have longer periods of rest between shifts. If you have 4 people, this schedule means each team member is "off-call" for 3 weeks at a time. However, having a week long shift feels really long, particularly if stuff is on fire multiple nights. This is the schedule most likely to lead to burnout.

As you look at your team's summer schedule, I hope this guide helps ameliorate any dread you have about being on-call. Have any questions I didn't address here? Comment here or tweet me [@AmbassadorAwsum](https://twitter.com/ambassadorawsum).
