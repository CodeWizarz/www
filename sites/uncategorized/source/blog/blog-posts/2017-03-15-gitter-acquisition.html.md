---
title: "Gitter is joining the GitLab team"
author: Sid Sijbrandij
author_gitlab: sytses
author_twitter: sytses
categories: company
image_title: '/images/opengraph/gitter-gitlab-blog-cover.png'
description: We're excited to announce that Gitter has been acquired by GitLab!
twitter_image: '/images/tweets/gitter-gitlab-announcement-twitter.png'
---

Today we have some exciting news to announce: [Gitter](https://gitter.im) has been acquired by [GitLab](https://gitlab.com/)!

<!-- more -->

Since its launch in 2014, Gitter has fast become the place to connect the open source and software development community. Over 800,000 developers have signed up to Gitter, where they can join any of the thousands of chat communities and connect with one another to discuss software and technology.

Community is core to GitLab’s principles. Our [mission is to ensure that everyone can contribute](/company/mission/#mission), and over a thousand developers have contributed to GitLab CE. This acquisition is part of the [our strategic plan](/company/strategy/#sequence) to become the most popular SaaS solution for public repositories. While we are still years away from reaching this goal, we recognize great project chat is an essential element of most open source projects. Gitter is the leading solution and we expect it to grow even larger in the coming years. When the opportunity came to combine forces, we decided to do it.

Gitter will continue to operate as a standalone network, continuing to making its project chat capabilities available to all. Over the coming months, the GitLab integration will be improved to include 'Login with GitLab' and the ability to easily create chat rooms and communities from GitLab groups and projects.

More importantly, we will open source the whole of Gitter, allowing members of the community to contribute and improve the product for everyone!

Gitter has always provided unlimited free chat for public communities, as part of the acquisition, all private conversations will now be free and unlimited too.

The coming years we want to work with the wider community to make Gitter a great help to run open source communities. After open sourcing, we'll focus our attention in adding login with GitLab, GitLab backed Gitter communities, and finishing the Topics feature that is [already released in beta on Gitter](https://gitter.im/gitterHQ/topics). We'll discuss with the wider community what is next after that, for example it could be a feature that helps with maintaining a core team.

To see what this means for you please take a look at the Q&A below and the [blog post from Gitter about this acquisition](http://blog.gitter.im/2017/03/15/gitter-gitlab-acquisition/).

Want to know more about Gitter and GitLab in the future? Sign up for our newsletter to get product updates and announcements, helpful tips and guides, and more delivered to your inbox.

<script src="//page.gitlab.com/js/forms2/js/forms2.min.js"></script>
<div class="newsletter-form" style="width:50%;margin:auto;">
<form id="mktoForm_1328"></form>
<script>
  MktoForms2.loadForm("//page.gitlab.com", "194-VVC-221", 1328, function(form) {
    form.onSuccess(function(values, followUpUrl) {

      form.getFormElem().hide();
      document.getElementById('confirmform').style.visibility = 'visible';

      return false;
    });

  });
</script>
<div id="confirmform" style="visibility:hidden;">
<p style="width:50%;margin:auto;">Thanks for subscribing!</p>
</div>
</div>

## Q&A

**Can I continue to use Gitter with GitHub accounts and projects?**

Absolutely. Login with GitHub and Twitter will continue to work, as well as all of the integrations we have today with GitHub issues and other services. We have had a GitLab integration for a long time, and will improve this by adding the ability to login with your GitLab.com account.

**When do you plan to open-source Gitter?**

We have a little bit of work to do to remove some internal configuration and operating parameters from the Gitter [source code](/stages-devops-lifecycle/source-code-management/). We expect to have this completed and to move the code over to GitLab.com no later than June 2017.

**Will I be able to run my own Gitter instance?**

Gitter will not be shipped as part of GitLab, but once the code is available as open source (MIT License), you will be able to run Gitter on your own infrastructure.

**What about Mattermost, how is this different?**

Gitter was built to be used in the open. We’ve always seen Gitter as a network, or a place where people can come to connect to one another. Team collaboration, whilst possible, has never been a core aspect of the Gitter experience.

Mattermost is a powerful, integrated messaging product for team collaboration - we will continue to ship and recommend using Mattermost for internal team communication.

**How is this different to Slack?**

Many communities have leveraged the Slack API to force it to work for communities. Slack is certainly a great product, but has limitations for large communities and public usage. All of Gitter’s public conversation history is completely unlimited, open, archived and indexed by popular search engines, contributing the public knowledge base of the internet.

**Will there be a GitLab community on Gitter?**

There’s been a community-supported room on Gitter for quite a while, feel free to pop in and say hi. This room isn’t an official support channel and we hope to grow this community over the coming months.
