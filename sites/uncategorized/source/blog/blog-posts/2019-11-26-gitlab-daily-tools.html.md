---
title: "How to improve your daily GitLab experience"
author: Viktor Nagy # if name includes special characters use double quotes "First Last"
author_gitlab: nagyv.gitlab # ex: johndoe
author_twitter: nagyviktor # ex: johndoe
categories: unfiltered
image_title: "/images/blogimages/gitlab-values-cover.png"
description: "Personal tools and tips for a more productive GitLab experience"
tags: inside GitLab, workflow
guest: false # required when the author is not a GitLab Team Member
ee_cta: false # required only if you do not want to display the EE-trial banner
install_cta: false # required only if you do not want to display the 'Install GitLab' banner
postType: content marketing # i.e.: content marketing, product, corporate
---

{::options parse_block_html="true" /}



<!-- Content start here -->

This is a collection of tools and settings I use to create a more productive GitLab experience. 

*Disclaimer: all screenshots are using Firefox's Hungarian language setting.*

## Easy navigation

I use Firefox, but it should work in Chrome too. Basically, after bookmarking a website, you can add a `keyword` to it. This allows for quick navigation.

![Firefox bookmarks with keywords](/images/blogimages/gitlab-daily-tools/firefox-bookmarks.png){: .shadow.medium}

My keyworded navigation includes the following pages:

- `gl-epics` --> [https://gitlab.com/groups/gitlab-org/-/epics?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=group%3A%3Asystem&search=](https://gitlab.com/groups/gitlab-org/-/epics?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=group%3A%3Asystem&search=)
- `gl-issues` --> [https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=group%3A%3Asystem&search=](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=group%3A%3Asystem&search=)
- `gl-product` --> [https://gitlab.com/groups/gitlab-org/-/boards/1342179?label_name[]=group%3A%3Asystem&search=](https://gitlab.com/groups/gitlab-org/-/boards/1342179?label_name[]=group%3A%3Asystem&search=)
- `gl-new` --> [https://gitlab.com/gitlab-org/gitlab/issues/new?issuable_template=Problem_Validation&issue[title]=](https://gitlab.com/gitlab-org/gitlab/issues/new?issuable_template=Problem_Validation&issue[title]=)

## Easy search (complex way)

The quick-links above are nice, but you browser can do even more!
You can actually use the above keywords to pass a search query while you navigate to the given page.

![Search with keywords](/images/blogimages/gitlab-daily-tools/firefox-search.png){: .shadow.medium}

By writing `gl-new This is a new issue` a "new issue" page will open and prefill `This is a new issue` as the title. You can use this pre-fill mechnism to filter the issues, epics lists or a board too.

How can you achieve this? The argument we are passing for `gl-new` can be referenced as `%s` in the final url.
This means that my actual bookmarked urls are the following:

- `gl-epics` --> [https://gitlab.com/groups/gitlab-org/-/epics?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=group%3A%3Asystem&search=%s](https://gitlab.com/groups/gitlab-org/-/epics?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=group%3A%3Asystem&search=%s)
- `gl-issues` --> [https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=group%3A%3Asystem&search=%s](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=group%3A%3Asystem&search=%s)
- `gl-product` --> [https://gitlab.com/groups/gitlab-org/-/boards/1342179?label_name[]=group%3A%3Asystem&search=%s](https://gitlab.com/groups/gitlab-org/-/boards/1342179?label_name[]=group%3A%3Asystem&search=%s)
- `gl-new` --> [https://gitlab.com/gitlab-org/gitlab/issues/new?issuable_template=Problem_Validation&issue[title]=%s](https://gitlab.com/gitlab-org/gitlab/issues/new?issuable_template=Problem_Validation&issue[title]=%s)

*Note:* unfortunately, only simple strings can be searched this way. Adding extra labels does not work.

## Easy search (simple way)

The above is one way to search different sites easily. You can achieve something similar (without bookmarks) by adding
a new search engine for your browser.

![Add a search engine](/images/blogimages/gitlab-daily-tools/firefox-search-engine.png){: .shadow.medium}

I have such search engines added for the GitLab documentation and the GitLab handbook. You can easily add a new search
by right clicking the search bar on the GitLab docs site, and selecting the `Add a keyword for this search` menu option.
Unfortunately, the above does not work for the handbook.

To add handbook search on Firefox, one can use the [Add custom search engine](https://addons.mozilla.org/hu/firefox/addon/add-custom-search-engine/) add-on (you can remove it after adding the engine). On Chrome, you can just add the engine under 
your settings. To search the handbook, I use Google's site search functionality, and my search engine contains the following url: [https://www.google.com/search?q=site%3Ahttps%3A%2F%2Fabout.gitlab.com%2Fhandbook+%s](https://www.google.com/search?q=site%3Ahttps%3A%2F%2Fabout.gitlab.com%2Fhandbook+%s)

## Quick actions made _really_ quick

I often find myself repeating the same actions, such as adding the same labels to multiple issues or assigning issues to myself. When I want to apply a label, I have to manually type most of the label and autocompleting `~"workflow::product validation"` does not help much unfortunately. So I came up with a different solution.

There is a handy browser plugin that allows you to script around any webpage. It's called [TamperMonkey](https://www.tampermonkey.net/). I have created some *VeryQuickActions* using this plugin. 
Do you have a similar `Quick action` line in your GitLab input areas?

![Quick Actions addon](/images/blogimages/gitlab-daily-tools/tm-quickactions.png){: .shadow.medium}

You can get those nice links at the bottom of the filed by [adding its script](https://gitlab.com/gitlab-com/www-gitlab-com/-/snippets/1999778) to TamperMonkey.

Customizing these quick actions is quite easy and does not require advance programming skills.
knowledge. You can open the above script (TamperMonkey) has a built-in editor for this.

If you would like to change the content of these quick links, you can use `TamperMonkey`'s built-in editor. Just look for the following lines:

```js
    const actions = [
        ['/assign me', 'Mine'],
        ['/label ~"group::system"', 'System label'],
        ['/label ~"workflow::problem validation"', 'Problem label'],
        ['/label ~"workflow::solution validation"', 'Solution label'],
        ['/label ~"workflow::validation backlog"', 'Backlog label'],
    ]
```

These lines define the links that will be created. The first item in the lists show what will be included in the description or comment text on GitLab. The second item defines the text on the link.
You can use these as a guideline to create your own.

*Note:* there is still a missing feature I would like to add to this script: I would like to make it easy to assign an issue
to the previously viewed epic.

## Filtering to-do's and checkboxes

While I was on-boarding as a new GitLab team member, I ran a few scripts in the developer console to hide already checked checkboxes in a list and to dim the lines that did not contain my name. Since then, I have found myself needing similar functionality from time to time.

![Filter checkboxes](/images/blogimages/gitlab-daily-tools/tm-filter.png){: .shadow.medium}

On the above image. Which checkboxes are relevant to me?

Again, [the solution is a TamperMonkey script](https://gitlab.com/gitlab-com/www-gitlab-com/-/snippets/1999779). This script adds a small filter button
beside the GitLab search box. Filtering issues leaves (or excludes) only those checkboxes on the page that contain your search term.
If you want to exclude the search term, start your filter with an exclamation mark `!`.

![Filter checkboxes](/images/blogimages/gitlab-daily-tools/tm-filter2.png){: .shadow.medium}

## What are your tips and tricks

We would love to hear your tips and tricks for using GitLab. Feel free to leave them in a comment below.