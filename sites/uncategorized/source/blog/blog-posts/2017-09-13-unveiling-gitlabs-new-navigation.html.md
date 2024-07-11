---
title: "Unveiling GitLab's new navigation"
author: Sarrah Vesselov
author_gitlab: sarrahvesselov
author_twitter: svesselov
categories: company
image_title: '/images/blogimages/unveiling-gitlabs-new-navigation/navigation.jpg'
twitter_image: '/images/blogimages/unveiling-gitlabs-new-navigation/navigation.jpg'
description: "A whole new way to navigate."
ee_cta: false
tags: UX, inside GitLab
---

In 9.4 we took a big step toward [improving our navigation](/blog/2017/07/17/redesigning-gitlabs-navigation/) here at GitLab. After several rounds of research and testing, we released our redesigned navigation under a feature flag. We chose this method so that we could continue implementing improvements discovered in our original research while gathering real-world feedback from our users.

<!-- more -->

## We heard you!

We received an incredible number of responses in the [issue](https://gitlab.com/gitlab-org/gitlab-ce/issues/34917) created to gather feedback. The feedback gave us valuable insight into the many different types of workflows our users have. It reaffirmed some of the decisions made and challenged us to rethink others. Using this feedback, we iterated on the navigation for two release cycles, focusing on the changes that would add the most benefit. Here are some of the high-level additions we made:

### Collapsible sidebar and addition of icons – [#34028](https://gitlab.com/gitlab-org/gitlab-ce/issues/34028)

From the beginning, we knew that the sidebar would need to be collapsible in order to maximize screen space. With the right sidebar present in issues and merge requests, we didn’t want to box you in. The addition of icons enabled us to collapse the sidebar down to a mere 50px.

{: .text-center}
![collapsible menu](/images/blogimages/unveiling-gitlabs-new-navigation/menu-loop.gif){: .shadow}

### Flyout menu – [#34026](https://gitlab.com/gitlab-org/gitlab-ce/issues/34026)

A fly-out menu has been introduced in order to reduce the number of clicks and the time necessary to access a sub-page. Now, if you want to access Issue Boards, there is no need to click on Issues and wait for the initial ‘Issue List’ to load. When hovering over a section with second-level items, the fly-out drop-down menu will appear to offer quick access to those second-level sections.

{: .text-center}
![flyout menu](/images/blogimages/unveiling-gitlabs-new-navigation/flyouts.png){: .shadow}

We've also adjusted the hover color of the menu items after many of you expressed that the intensity of the color was harsh and distracting. The colors changed from purple to whites and grays without sacrificing the overall contrast.

### Dropdown links in top bar – [#35010]( https://gitlab.com/gitlab-org/gitlab-ce/issues/35010)

No more clicking on Projects and waiting for the Projects page to load! In order to provide quicker access to projects, a dropdown has been added to the Projects link in the top bar. The dropdown opens on click, following the behavior of the + button and personal dropdowns in the top bar.

{: .text-center}
![dropdown links](/images/blogimages/unveiling-gitlabs-new-navigation/dropdown-links.png){: .shadow}

The dropdown contains direct links to the different subsections of the Projects dashboard (Your Projects, Starred Projects and Explore projects). Better still, on the right-hand side of the dropdown is a list of your most frequently accessed projects. A search box allows you to navigate to your projects that are not present in the list.

### Navigation color themes – [#35012](https://gitlab.com/gitlab-org/gitlab-ce/issues/35012)

On the subject of colors, one of the most requested features was the ability to change the navigation colors. Previous versions of GitLab allowed users to customize the navigation sidebar with a color theme. Many used this to differentiate between different GitLab instances. The new navigation presented the opportunity to bring back this valuable feature! The default palette will remain indigo, based on the GitLab identity. You will now be able to choose between four additional color schemes; Dark, Light, Blue, and Green.

{: .text-center}
![navigation color themes](/images/blogimages/unveiling-gitlabs-new-navigation/color-theme.png){: .shadow}

### Improved breadcrumbs – [#35269](https://gitlab.com/gitlab-org/gitlab-ce/issues/35269)

We received a lot of feedback on the breadcrumbs. While many of you found them to be helpful, many also found them to be repetitive, inconsistent, and taking up too much overall space. We began by removing GitLab from the start of the breadcrumbs and moving all breadcrumb items onto one line. In order to improve the movement between elements in the breadcrumb, we replaced the slashes with chevrons. We also removed the action buttons from the breadcrumb bar altogether.

{: .text-center}
![action buttons moved](/images/blogimages/unveiling-gitlabs-new-navigation/action-remove.png){: .shadow}

When multiple subgroups are present, we place them inside of an ellipsis button. This reduces the cognitive load while keeping them accessible. For each breadcrumb element, we have fixed the min-width and the max-width to make sure the whole breadcrumb contracts and expands according to the available space.

{: .text-center}
![breadcrumbs](/images/blogimages/unveiling-gitlabs-new-navigation/breadcrumbs.png){: .shadow}

The breadcrumb labels themselves are more consistent and intuitive. A list of the paths and corresponding breadcrumb titles can be found in the [issue description](https://gitlab.com/gitlab-org/gitlab-ce/issues/35269).

### Reduce header height and redesign active/hover/dropdown styles – [#35424]( https://gitlab.com/gitlab-org/gitlab-ce/issues/35424)

We reduced the overall header height to give you as much vertical screen space as possible. By popular request, all global links are shown by default and collapse into the 'More' dropdown as space gets tighter. The header active/hover/dropdown styles have been redesigned with a bold new style and Todo/Issue/MR badges are centered to the icons themselves.

{: .text-center}
![active state](/images/blogimages/unveiling-gitlabs-new-navigation/active-states.png){: .shadow}

{: .text-center}
![notifications](/images/blogimages/unveiling-gitlabs-new-navigation/to-do.png){: .shadow}


## Further iteration

We feel confident that GitLab’s overall navigation has been greatly improved over the last two releases. That is why, as of the 10.0 release, we will remove it from the feature flag and make it the only way to navigate. As always here at GitLab, everything is in draft. We will continue to monitor feedback, test, and iterate.

## Upcoming efforts

Looking forward, the UX team has some big things planned. In addition to improving user flows, we are working hard to increase the overall quality and polish of the UX experience. Stay tuned for a series of blog posts dedicated to explaining our processes as we work on the following key initiatives:

- Change chromatic/full colors to a more harmonious palette [#28614](https://gitlab.com/gitlab-org/gitlab-ce/issues/28614)
- Establish a proper type ramp to improve contrast and readability [#24310](https://gitlab.com/gitlab-org/gitlab-ce/issues/24310)
- Iconography is a powerful visual cue to the user and should reflect our particular sense of style [#32894](https://gitlab.com/gitlab-org/gitlab-ce/issues/32894)
- Architect design process for maintaining master files/symbols team-wide [#26](https://gitlab.com/gitlab-org/gitlab-design/issues/26)
