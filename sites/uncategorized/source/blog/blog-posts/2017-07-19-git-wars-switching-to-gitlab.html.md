---
title: "Git Wars: Why I'm switching to GitLab"
author: Christopher Watson
author_twitter: iDev0urer
guest: True
categories: engineering
image_title: '/images/blogimages/git-wars-switching-to-gitlab.jpg'
twitter_image: '/images/tweets/git-wars-tweet.png'
description: "New GitLab user Christopher Watson puts us through our paces and weighs up his Git hosting options."
tags: git, open source, user stories
---

It’s a well-known fact: GitHub has the market share when it comes to Git hosting, with Bitbucket following close behind due to their “unlimited private repositories” policy. But what if I told you that those weren’t your only options?

<!-- more -->

Now I have nothing against GitHub. It’s a great tool and I’ve been using it for years. It’s built primarily in a framework I love, Ruby on Rails, and its design is one we’ve all come to tolerate (if not love). With GitHub controlling most of the market share, most open source projects have also found a home there.

All of this being said, I’d be lying if I said that GitHub didn’t have its downsides. If you want private repositories, it’s going to cost you a pretty penny at $25 per month for your first five users, and then $9 per user after that. For comparison's sake, if you have 10 users in your organization it’s going to cost you $80 a month, and that’s a pretty small team. GitHub also has a sordid history when it comes to communicating with the community, implementing new features, and updating its somewhat dated look.

Bitbucket is another beast altogether. Created by the tech conglomerate Atlassian, Bitbucket is their answer to GitHub. Its claim to fame is that you can have unlimited private repositories for free…as long as your team has no more than five people.

This is actually the reason I first started using Bitbucket. However, if you do have more than five people, you’re going to pay, and the quality that you pay for isn’t all that great. I’ve worked on a number of projects on Bitbucket where my team was plagued by slow pulls/pushes, 503 errors when attempting to view a repo, and just overall jankyness. Besides that, their design also leaves a lot to be desired. The new design looks better, but also somehow makes things even more confusing (someone needs to learn the difference between UI and UX). To be completely honest I don’t have anything good to say about Bitbucket, so I’m going to continue.

### So what’s this GitLab thing? Is it the answer to all of our Git hosting woes?

Well yes and no. GitLab is a very good product, but it’s not perfect. It certainly isn’t as fast as GitHub when it comes to pushing and pulling repos. That being said, here are my reasons for switching to GitLab for my personal projects: GitLab is a Git hosting solution with a very large toolset and, objectively, a beautifully designed website (could it still use some work? Yes, but I digress). It is completely free for unlimited users, unlimited private repositories, and full access to most of the awesome features they provide.

Yes, they still have paid tiers for the [enterprise](/enterprise/). You can’t expect them to keep an awesome project like this going without some kind of monetization, but for us little guys you’ll most likely never have to pay. That has got to be music to your ears.

### So you said it has “awesome features.” To what are you referring?

Well, there’s quite a list. Let’s take a look:

1. **Syntax themes!** In case you didn’t get that, I’ll say it again: syntax themes! This has been something that I have been waiting a long time for GitHub to come out with, but GitLab beat them to the punch. We’re still probably a long way away from having custom themes, but the ability to have a dark theme when checking diffs in the browser is awesome.

1. **Registry:** GitLab also has a built-in Docker registry for your projects. This is an amazingly powerful feature for those that want to keep their containers off of the public registry at hub.docker.com, but don’t want to pay for a private service.

1. **Pipelines/GitLab CI:** Continuous integration is a huge time saver and a great way to make sure a pull request isn’t going to break your app. GitLab saves you from having to use an external CI service by having their own CI built right in. Not to say you can’t use an external CI if you want; GitLab has integrations for Jenkins, Bamboo, and much more.

1. **3rd Party Integrations:** As mentioned above, GitLab has 3rd party integrations for several services such as CI, code coverage, messaging, etc. Their Slack integration is great for notifying your team when stuff has been merged into master. I will be honest though, I am sure GitHub has more integrations.

1. **All the features that make GitHub great:** GitLab also ships with Wikis, Markdown-based readmes, etc. You don’t really lose any features by switching, but you gain a ton.

![screengrab](/images/blogimages/git-wars-2.png){: .shadow}<br>

### So if it’s so great, why isn’t everyone using it?

There are a couple of answers to that question. First off, you have the market share factor. GitHub was one of the first Git hosting providers to market and they’ve managed to hold onto that. That means that if you want people to contribute to your project, it helps to have it on GitHub because chances are the people that you want to contribute have an account.

The other answer is related. Comfortability. People are simply comfortable with the tool they know and a lot of people aren’t like me (willing to throw everything out the window because I truly believe that the better product should get my business). This is the same reason so many people are still using Atlassian products. It’s definitely not because of their user interfaces.

### So where should I go from here?

That depends on you. If you’re comfortable getting to know a new way of doing things, I’d suggest you take a look at GitLab. It really is worth the time you’ll put into it.

If you’re already *comfortable* then go ahead and stick with what you know, but at least now you know that there are alternatives.

## About the Author

[Chris Watson](https://twitter.com/idev0urer) is a freelance full-stack developer who occasionally enjoys sharing some of his many opinions with the world. He and his wife currently reside in sunny Arizona.

_This post was originally published on [blog.cwatsondev.com](https://blog.cwatsondev.com/git-wars-why-im-switching-to-gitlab/)._

“[paper battle](https://www.flickr.com/photos/die_ani/9024130/)” by [anika](https://www.flickr.com/photos/die_ani/) is licensed under [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/)
{: .note}
