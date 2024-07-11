---
title: "An Agile approach to documentation and structure"
author: Goetz Buerkle
author_twitter: unscrewmeapp
categories: open source
image_title: '/images/blogimages/gitlab-loves-open-source.jpg'
description: "Combining flexibility and structure: why we decided to use GitLab.com for all UnscrewMe documentation and code to keep an overview, always find the relevant information quickly, and easily track progress."
guest: true
twitter_text: "An Agile approach to documentation and structure"
tags: agile, open source, user stories
---

With an idea and a name, I was ready to start working more seriously on
[UnscrewMe](http://unscrewme.co.uk/), a simple wine tasting scheduler app. Well, almost ready – to avoid ending up with a
mess of files and folders and stuff scattered across different devices, and
certainly never where I need them, my next objective was to set up a central
location where I could store and organize everything flexibly.

<!-- more -->

## GitLab – selecting simple tools

I wanted to keep the overhead low and the management of the documents simple,
yet extensible enough to cover everything I would need to get started, including
simple lists, longer notes, logo drafts, and also more structured technical
concepts and even invoices.

Being a [Certified Scrum Product Owner](https://www.scrumalliance.org/certifications/practitioners/cspo-certification) and using a [GitLab](/) instance at work, I decided to take advantage of the free private repositories and use GitLab.com for UnscrewMe. This combines the simplicity of “just” storing everything in files and folders, with the advantage of being able to use Markdown for more advanced formatting, including sub headings, nested lists and images. And all information can easily be accessed on any device, either via Git directly or the GitLab.com web interface, which also renders Markdown files nicely.

In addition, project management features of GitLab like [issues](https://docs.gitlab.com/ee/user/project/issues/), [milestones](https://docs.gitlab.com/ee/user/project/milestones/) and
[Issue Boards](/stages-devops-lifecycle/issueboard/) would provide a useful, flexible and lightweight framework to
track my progress. By defining project phases and grouping all open tasks in
various ways, I could get a quick overview of what I would need to do next,
before I could actually launch my Minimum Viable Product (MVP).
Using the full power of GitLab.com, I created a “[Group](https://docs.gitlab.com/ee/user/group/index.html)” and three separate
repositories: one for all the general documentation, one for the actual web
application, and a third for the pre-launch website.

## Defining a flexible structure

You could of course call my folder structure flawed, as it is not always entirely
clear where new content or document should go, but so far it works fine for me.
I started with a high-level view and specified six broad areas:
* ideas – for anything largely creative
* concepts – for more detailed specifications and drafts
* business – for business plans and similar documents focused on the business in general
* roadmap – to define the main steps without immediately looking at all the details
* design – basically, everything that is not text
* finance – for invoices, contracts, etc.

These six folders give me enough structure and flexibility to get started,
without having to think too hard about what should go where.
A couple of years ago, I started prepending most files I create with dates,
like “2017–08–31". I find that adding dates are a useful primary sorting
criteria when trying to get a quick overview, so I stuck with this approach for
my new project as well, even though it might not be the perfect match for all files.

## Google Keep – enabling quick, low-barrier content generation

With a system mainly based on text files, I could use any editor. As I started
using [Google Keep](https://www.google.com/keep/) for personal notes a few
months ago, I knew that it was flexible and reliable enough for my needs.

I do have a subscription for a very stripped-down text editor, but I must admit,
that I don’t like the barely existing interface too much, and started using
Google Keep for many tasks instead. The big benefit of Google Keep, above the
other web services I used to rely on for writing, is the support of writing
notes offline. While these days you mostly have 4G, 3G or wifi anyway, even on
holiday, I did find myself sometimes at events or in places without connectivity.
And then, being able to write something offline, that would automatically be
synchronized as soon as I would be online again, proved rather useful.

The only obvious drawback for me now is, that Google Keep does not support
Markdown for structure and formatting. But as Markdown markup is pretty minimal
and easy to read, this hasn’t been much of a limitation.

The notes editor is simple and fast – I do not really need anything more
advanced or complicated. What I do value though it the possibility to add labels,
just a different name for tags, and colors to notes. That way I can easily
group my project notes together and even find the ones I am looking for quickly
in my main view.

## Visual Studio Code – lightweight editing with Markdown preview and Git support

To get my basic notes from Google Keep into GitLab, I used [Visual Studio Code](https://code.visualstudio.com/).
It is a simple editor with many useful plugins, making editing and checking
Markdown documents very convenient and supporting Git out of the box, which was
pretty much all I needed.

Often, my Google Keep notes require just a little bit of cleanup, before they
are ready to be committed to the Git repository.
As I use GitLab milestones and issues to structure all the work, I could also
take advantage of this when adding documents to the Git repository and making
changes. So I also reference the relevant issues in my commit messages using
[GitLab Flavored Markdown](https://docs.gitlab.com/ee/user/markdown.html#gitlab-flavored-markdown-gfm) syntax.

Next on my todo list was to [create a simple pre-launch website](https://medium.com/unscrewme/claiming-the-name-257b59d979b)
to announce the new service, even before it was built. I did read a few times
that building a pre-launch website before starting to work on the application
code can help to gauge if there even is enough interest for the product. In my
case, I was not too concerned about this aspect, since first and foremost, I
wanted to use my service, therefore by definition it would be worth the effort.

*(I began writing this overview at [Pantry Marylebone](https://www.pantrymarylebone.com/)
and finished it there too, a few days later. I wrote the final paragraphs there
after having had three wines at [108 Brasserie](http://108brasserie.com/) before:
a beautiful and well-balanced 2016 Picpoul de Pinet from Domaine Felines Jourdan
in Languedoc in France, a surprisingly light and smooth 2016 Montepulciano
d’Abruzzo from Il Faggio in Italy and a somewhat harsh and slightly disappointing
2016 Beaujolais Vieilles Vignes par Vincent Fontaine from Domaine de la Rocailler, in France.)*

## About the Guest Author

Goetz Buerkle is currently working to launch UnscrewMe. There are so many wine
tastings happening in London every day – UnscrewMe wants to help Londoners spend
less time searching for wine events and more time tasting interesting wines
instead. [Keep up with the project](http://unscrewme.co.uk/).


*[An Agile approach to documentation and structure](https://medium.com/unscrewme/an-agile-approach-to-documentation-and-structure-5fe4a14a6f2f) was originally published on Medium.*
