---
title: "Enabling an open and collaborative course environment with GitLab and the Grav CMS"
author: Paul Hibbitts
author_gitlab:
author_twitter: hibbittsdesign
categories: open source
guest: true
image_title: '/images/blogimages/open-course-environment.jpg'
description: "Guest author Paul Hibbitts shares how he combines GitLab with the flat-file CMS Grav to provide an open, collaborative and flexible environment that partners with his institution's LMS."
tags: open source, collaboration
---

Tech-savvy educators! Do you want to:

- Share your course materials more openly?
- Support collaborative editing by students and fellow educators?
- Deliver a better multi-device experience of your course materials?
- Be able to update your online course materials in as little as 30 seconds?
- And, in general, move beyond the constraints of your current Learning Management System?

<!-- more -->

If this sounds like you, then the combination of an institutionally hosted instance of [GitLab]() and a modern flat-file (no database) Content Management System such as [Grav](https://getgrav.org/) might be your answer!

As an educator and software interaction designer, I am always striving to deliver a better experience for my students, both in person and online. In the past several years this has led me to ‘flipping’ the Learning Management System, where I use an alternative platform instead of the LMS as the primary online environment. Many instructors (including myself) have taken this approach in the past using a traditional platform such as WordPress, but I found significant new benefits from partnering the LMS with a more modern platform that was built to take full advantage of the open and collaborative ecosystem (i.e. Git, GitLab, GitHub, etc.) we now have.

With the above approach, direct links are provided to any appropriate LMS elements and sensitive student data remains in the LMS. Common elements across multiple courses, like calendars, assignments, discussion forums, and grades are still stored in the LMS for single-point access by students. While perhaps not suited for university-wide adoption, this is a very viable and productive approach for individual instructors and their students while we wait for more open and adaptable institutional-level tools to become available.

<img src="/images/blogimages/gitlab-grav-open-course1.png" alt="Open and Collaborative Flipped LMS Approach Using GitLab and the Grav CMS" style="width: 500px;"/>{: .shadow}

*<small>Open and Collaborative ‘Flipped’ LMS Approach Using GitLab and the Grav CMS</small>*

Fortunately, my university ([Simon Fraser University](http://www.sfu.ca/), or SFU, in Burnaby, BC, Canada) also provides an institutionally hosted instance of GitLab which not only gives me an ideal workspace for my online course materials, but also supports single sign-on so my students can easily contribute to these materials as well. By combining GitLab with the modern flat-file CMS Grav, my institution's LMS and a small collection of other open source web apps, I’ve been able to reach more of my desired teaching goals (such as providing an anytime, anywhere performance support tool with real-time chat) for my own courses than by using the LMS as the primary online space. In addition, I’ve made the resulting software open source to also help other instructors reach their own goals – more about this project at the end of this article!

## Why open source software?

The advantages of using open source software in the field of education are well documented elsewhere (see [Open Source Software in Education](http://er.educause.edu/articles/2008/5/open-source-software-in-education)), but from my own viewpoint, the things I value most are: having more control over the software I use, the online communities often found with open software projects, public communication with the team developing the software, and the wide range of ways I can contribute to projects. I’ve also been keenly following several other open source, institutional-level learning ecosystem efforts, such as [ELMSLN](https://www.elmsln.org/) (a platform for building and sustaining innovation in course technologies) and [TSUGI](https://www.tsugi.org/) (a framework for building learning tools).

## Why GitLab?

GitLab meets several key criteria for its use in a learning ecosystem. First, it is open source software itself and secondly, it is possible to install an instance of GitLab on your own server. For universities and colleges this enhances the benefits of being open source in the first place as single sign-on and the storage of sensitive student data remains in the sole control of the institution.

Using GitLab in combination with the [GitHub Desktop application](https://desktop.github.com/) I can also very quickly update my online course sites from my desktop, while at the same time being able to then edit course site materials with any code editor I like. Most importantly, students feel like active course participants when they see they are welcome to suggest changes to the course site, or even just to make corrections to course materials. Everything is of course version controlled, which means as a repository administrator I can easily see each and every change before approving them. For changes not immediately approved I can then start a discussion via GitLab with the author of the proposed change to work out any needed further changes, etc. GitLab brings an industrial-strength software and document collaboration tool into the reach of my fellow university colleagues and students.

## Why Grav CMS?

While looking for an open source platform to support a learning ecosystem I evaluated multiple options, including self-hosting (for full administrative control) WordPress, Concrete5, Moodle and others. I then came across a number of apps under the category of ‘flat-file CMS,’ meaning that content was stored in files instead of a database. I could see that content as files would be a perfect partner for using a web-based Git service (such as GitLab, [GitHub](https://www.github.com/), [GitBook](https://www.gitbook.com/), etc.) to share and collaboratively edit content. With such a partnership, CMS content can be automatically backed up in a straightforward manner, while also tracking all revisions along the way. Digging deeper, I discovered the open source flat-file CMS Grav (by the team behind [RocketTheme](http://www.rockettheme.com/)) used Markdown – the native format for Web-based Git services such as GitLab – for content. Markdown is also an excellent system-independent format to support the ‘5Rs’ of Open Education Resources (Retain, Reuse, Revise, Remix, and Redistribute).

<img src="/images/blogimages/gitlab-grav-open-course2.png" alt="Editing Markdown content in the Grav CMS Admin Panel" style="width: 500px;"/>{: .shadow}

*<small>Editing Markdown content in the Grav CMS Admin Panel</small>*

Grav uses many existing modern standards and open source components, such as the very user-friendly [Twig language](https://twig.symfony.com/) (courtesy of Symfony) instead of pure PHP for theme templating. Grav also supports modular and custom content types, and was designed from the ground-up to be both fast and extensible. In addition, with the creation of the open source Git Sync plugin (by [Trilby Media](https://trilby.media/)) it is now easier than ever to do two-way syncing of Grav content between a production server, Git repository and an optional local development instance. It is even  possible to sync theme files, which determine the actual functionality and presentation of a site, so  educators (or perhaps their tech-savvy students) can directly help other educators needing assistance in additional customization of their Grav sites.

It should be noted that Grav is not a static site generator, but rather a file-based CMS which supports not only dynamic content but also an online Admin Panel.

## CMPT-363 Open Course Hub

For my SFU course CMPT-363 User Interface Design this Fall, I will not only be using GitLab and Grav (hosted on the educationally focused [Reclaim Hosting](https://reclaimhosting.com/)), but also a number of other web apps (also mostly open source) to provide a learning ecosystem to my students. Since Grav itself is open and extensible, I can easily add in Javascript elements for a Livechat (which my students have told me they love) thanks to [Rocket.Chat](https://rocket.chat/), responsive Markdown-based slide embeds thanks to the commercial [Swipe.to](https://www.swipe.to/home) web app, and links to an anonymous course feedback form thanks to [Sandstorm.IO](https://sandstorm.io/) and [Quick Survey](https://github.com/simonv3/quick-survey). To address both various other teaching goals (the LMS actually does some things quite reasonably) and student data privacy concerns, I still use the institutional LMS [Canvas](https://www.canvaslms.com/) by Instructure to support a wide range of course elements such as quizzes, assignment submissions, discussion forums, and gradebook. You can see this multi-device friendly Course Hub in action at [paulhibbitts.net/cmpt-363-173/](http://paulhibbitts.net/cmpt-363-173/).

<img src="/images/blogimages/gitlab-grav-open-course3.png" alt="CMPT-363 Open Course Hub Learning Ecosystem" style="width: 500px;"/>{: .shadow}

*<small>CMPT-363 Open Course Hub Learning Ecosystem</small>*

## The Open Course Hub Project

Based on the [very positive student feedback](https://storify.com/paulhibbitts/flipped-lms) and my own experiences with the 2015 CMPT-363 Course Hub, I decided to release an open source version of a pre-packaged Course Hub with Git Sync the following year (called a Skeleton in Grav-speak, which is a ready-to-run package that includes Grav and all needed theme and example content files). While this package can be installed in [less than a minute](https://www.youtube.com/watch?v=8yyE-LaAa8Y) and fully configured in [under five minutes](https://www.youtube.com/watch?v=jnBig4aGfFg) it is intended for fellow tech-savvy educators to use and further customize as they see fit.

<img src="/images/blogimages/gitlab-grav-open-course4.png" alt="CMPT-363 Open Course Hub Web Page" style="width: 500px;"/>{: .shadow}

*<small>CMPT-363 Open Course Hub Web Page</small>*

What are the exact skills currently expected? In general, you should be comfortable with accessing files on a website server, understand folder hierarchies, be familiar with Markdown (here is a [10-minute Markdown tutorial](https://designedbywaldo.com/en/tools/markdown-tutorial)), and have a working knowledge of using GitLab or GitHub. Being able to use [GitHub Desktop](https://desktop.github.com/) and a desktop code editor like [Atom.io](https://atom.io/) or [Adobe Brackets](http://brackets.io/) will also bring the ability to store a copy of your Grav site content on your local desktop and then selectively edit and push changes back to the Git repository for deployment to your live Grav Course Hub site. Step-by-step install and configuration instructions for the Grav Course Hub are available at [learn.hibbittsdesign.org/coursehub](http://learn.hibbittsdesign.org/coursehub).

This is also my way to give back to the open source community in general, which has been so helpful in the development of my own original CMPT-363 Course Hub. Using Grav and the Git Sync plugin I’ve released several additional Open Education Resources (OER) projects, including the Open Publishing Space, and all of these are available at [learn.hibbittsdesign.org](http://learn.hibbittsdesign.org/).

Questions or comments about using GitLab as an open and collaborative backbone to your learning ecosystem? Please feel free to contact me via email ([paul@hibbittsdesign.org](mailto:paul@hibbittsdesign.org)) or Twitter [@hibbittsdesign](https://twitter.com/hibbittsdesign). You can also read more about my learning ecosystem explorations at [hibbittsdesign.org/blog](http://www.hibbittsdesign.org/blog/).

*Special thanks to the folks at GitLab for the kind offer to provide this guest blog post, and everyone from the Grav community and my Twitter network who provided helpful feedback and comments on the draft versions of this post!*

### About the guest author

Paul Hibbitts has been an interaction design practitioner and educator for over 20 years, and has recently ventured into the world of open source software development thanks to the amazing Grav CMS.


[Cover image](https://unsplash.com/photos/Y94yKEyNjVw) by [chuttersnap](https://unsplash.com/@chuttersnap) on unsplash
{: .note}
