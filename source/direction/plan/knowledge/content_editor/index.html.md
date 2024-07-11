---
layout: markdown_page
title: "Rich Text Editor Direction"
description: "The rich text editor is a visual Markdown editor designed to make contribution easy for everyone"
canonical_path: "/direction/plan/knowledge/content_editor/"
---

- TOC
{:toc}

## Rich Text Editor

**Content last reviewed on 2023-10-10**

Thanks for visiting the direction page for the rich text editor, a what-you-see-is-what-you-get (WYSIWYG) editor for Markdown content maintained by the [Knowledge](/handbook/product/categories/#knowledge-group) group. The rich text editor is a critical component and cornerstone of the Knowledge group's strategy of contributing toward GitLab as an AllOps platform. More information about the Knowledge group's priorities and direction can be found on the [Knowledge group direction page](/direction/plan/knowledge/) and additional questions can be directed to Matthew Macfarlane, Product Manager in the Plan Stage for Knowledge group ([E-Mail](mailto:mmacfarlane@gitlab.com)).

### What makes the GitLab rich text editor unique?

One aspect that sets GitLab's rich text editor apart is how it preserves the Markdown format. While other editors use intermediate file formats or require saving changes to a database, the GitLab rich text editor reads **and writes** valid Markdown, allowing collaboration from any editor and preserving the Markdown source. 

### Who is it for?

**Everyone!**

For many, writing in Markdown is a barrier to collaboration. We recognize that as GitLab grows, so does the need for a more usable editing experience. Traditionally, we have served developers, but over time, we have begun serving more non-technical users. Remembering the syntax for image references or working with long tables can be tedious, even for those who are relatively experienced with the syntax. Still, Markdown as a common denominator for content enables efficient collaboration in a version-controlled environment. The rich text editor aims to break down these barriers by providing a rich editing experience and an extensible foundation on which we can build custom editing interfaces for things like diagrams, content embeds, media management, and more.

There are many contributors to GitLab for whom writing Markdown is like writing a second language. We don't want to take that super power away from anyone. That's why writing in the rich text editor will support standard Markdown shortcuts. For example, typing `## ` followed by your content will create a rendered Header 2 and let you continue working without removing your fingers from the keyboard.

### Where can I use it?

We started by implementing the rich text editor in the GitLab Wiki, MRs, Issues, and Epics in our 16.2 release. Now we are working to [implementing the rich text editor across the rest of GitLab](https://gitlab.com/groups/gitlab-org/-/epics/10378).

Additionally, we plan to make the rich text editor available in the Web Editor and Web IDE to make it easier for everyone to contribute to Markdown content in a repository. Seamless integration of the rich text editor in the web editing experience will realize nearly all the benefits of the Static Site Editor but we are no longer limiting it to Middleman-based projects configured to use the Static Site Editor. 

### How does it work? 

At a really high level, the rich text editor:

1. Takes the Markdown source and converts the document into nodes on a tree
2. Translates each node to HTML for presentation and editing
3. Provides a WYSIWYG HTML editing experience with custom UI
4. Translates the edited content back to Markdown and apply the changes to the source document 

We have written [comprehensive development guidelines](https://docs.gitlab.com/ee/user/rich_text_editor.html) that explain what's going on under the hood and can help get you up to speed if you're interested in contributing an extension to the rich text editor. 

### What's next? 

Our current focus is on expanding the [use of the rich text editor to edit Markdown across GitLab](https://gitlab.com/groups/gitlab-org/-/epics/7098). We're looking forward to this expansion! We are also beginning [discussions](https://gitlab.com/gitlab-org/gitlab/-/issues/421730) around open sourcing the rich text editor as a standalone and embeddable component. 
