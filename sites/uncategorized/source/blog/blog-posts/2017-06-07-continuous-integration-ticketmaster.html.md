---
title: "How GitLab CI supported Ticketmaster's ramp up to weekly mobile releases"
author: Jeff Kelsey
guest: true
author_twitter: jeffkelsey
categories: engineering
image_title: '/images/blogimages/tm-cover-image-small.jpg'
description: "Ticketmaster Android developer Jeff Kelsey shares why GitLab CI was a game changer for his team."
twitter_image: '/images/blogimages/tm-cover-image-small.jpg'
tags: customers, CI/CD, user stories
---

It's always been a goal for the Ticketmaster mobile team to get to weekly releases. In the first half of this year we were able to accomplish it, delivering new versions
of both the Android and iOS app on a weekly basis since February. We've seen the positive impact on our fans, and it was even easier than we thought –
making our entire application development process that much better.

But it didn't start out this way...

<!-- more -->

![review-2](/images/blogimages/ticketmaster-assets/Review2.png "Most user-friendly ticketing app"){: .shadow}*<small>A faster, more consistent release cycle leads to a better fan experience for users of the Ticketmaster Apps.</small>*{: .text-center}

There comes a time in every engineer’s career when a part of your tech stack no longer passes the “smell test." Usually, there is some sort of dramatic event where something that was generally accepted as “isn’t the best, but it works” changes to “this is now a problem.” For me and the Ticketmaster mobile team, this event happened with our Jenkins-based CI pipeline in February.

We were about to release the newest version of our Android app, but there was a mistake in the build. We had forgotten to increment the Android versionCode, meaning we would need to update and create a new binary file to upload to the store. It was the end of the day, a sunny afternoon quickly fading to darkness in Hollywood. By now it was 6pm PST, and everyone was eager to leave.

"No problem," I thought. I can build the release locally in under three minutes, provide the file to the QA team, and we can all get on our way.

“Won’t help us,” responded my high-standard and exceptional QA team.

“All releases need to come from CI for consistency.” They were right. Local builds would not be safe for production. What if something about my machine’s configuration introduced an issue?

“Ok, so how long does it take for the release build to get created through our Jenkins CI pipeline?” I asked, figuring the time couldn’t be worse than 30 minutes.

“It takes two hours,” came the response. Sigh… Going to be a late night.

![sysiphus](/images/blogimages/ticketmaster-assets/sysiphus.gif "Sysiphus"){: .shadow}

*<small>Our old CI pipeline</small>*{: .text-center}

## GitLab CI to save the day (in a day!)

Two… hours…  For a minor change. Now I can’t lay all the blame on Jenkins. Some of this may have been our own fault, generating too many build flavors, forcing clean rebuilds in between steps and running extra tests for deprecated features. But, it was clear we needed to change and get better at CI. Jenkins was always a bit clunky for the last few years. Weighed down by plugins and years of legacy development, it was also difficult for us to update the Jenkins machines with new SDKs, and we had to rely on other teams to assist us. We clearly needed a fresh start.

We had been using GitLab at Ticketmaster for several years for code review and visually browsing our git history, so it made sense that trying to utilize [GitLab’s new CI tools](/features/continuous-integration/) would be worth a shot. I started with a helpful Android [blog post for setting up GitLab CI from Greyson Parrelli](http://www.greysonparrelli.com/post/setting-up-android-builds-in-gitlab-ci-using-shared-runners/).

But I soon ran into a problem. At Ticketmaster we use Amazon ECR for our [Docker](https://aws.amazon.com/docker/) container registry rather than GitLab repos, like in the tutorial. With the help of Kraig Amador, Tim Nichols, and others at Ticketmaster, I learned how to push my Docker container image to Amazon ECR and pull it down for each Android build in GitLab CI. The final results were a marked improvement:

![gitlab-ci](/images/blogimages/ticketmaster-assets/Gitlab8min.png 'GitLab CI in 8 minutes')*<small>Our GitLab CI build and test takes under 8 minutes to build, test, and publish artifacts.</small>*{: .text-center}

Less than eight minutes total from commit to build, test and generate artifacts. We can use Gradle and the SonarQube plugin to help us calculate code quality with every commit to our codebase, giving us more valuable information in addition to passing failing tests to evaluate all of our merge requests. This gives our team numbers to measure and make goals against.

And we could see everything in one place, in GitLab. The iOS team had a more complicated pipeline, but they quickly followed with their own, running their tests on local runners. Since February we have had weekly releases of our mobile apps, and GitLab CI has been a huge part of our success over the past few releases.

## From GitLab artifact to weekly releases

![weekly-release](/images/blogimages/ticketmaster-assets/WeeklyReleases.png "Weekly Releases"){: .shadow}*<small>GitLab CI has helped us get to weekly releases with more consistent adoption of new releases.</small>*{: .text-center}

With the benefit of faster cycle time, and faster releases, we have seen other benefits. Since each release has a smaller change set, our crash-free rates and store ratings have improved. We have less time waiting for build and spend more time improving the quality of our products. Our fans are getting features into their hands more quickly and benefit from a higher-quality and a consistently improving product. The CI analytics available on GitLab are an additional scoreboard for our team to optimize and improve into the future.

Now, whenever we integrate new SDKs into our mobile apps, we are helping other teams get their SDK’s set up in GitLab CI to push integrated builds to our suite of integration and functional tests as a part of our process. We are [getting to innovation faster](https://tech.ticketmaster.com/2016/11/08/getting-to-innovation-faster/).

Things were looking pretty scrappy for our CI pipeline only a few months ago. Now it is a whole different ballgame. If your team is looking for a way to breathe fresh life into a legacy CI pipeline, I suggest taking a look at GitLab CI. It has been a real game changer for our mobile team at Ticketmaster.

![review-1](/images/blogimages/ticketmaster-assets/Review1.png "Ticketmaster Mobile Review 1"){: .shadow}
![review-3](/images/blogimages/ticketmaster-assets/Review3.png "Ticketmaster Mobile Review 2"){: .shadow}

### About the Author

Jeff Kelsey is the Lead Engineer for Ticketmaster's Android development team. Find him on twitter [@jeffkelsey](https://twitter.com/jeffkelsey).
