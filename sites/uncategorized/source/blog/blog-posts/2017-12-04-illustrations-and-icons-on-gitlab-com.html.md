---
title: "Inside GitLab: Illustrations and icons on GitLab.com"
author: Hazel Yang
author_gitlab: hazelyang
author_twitter: hazelyuyang
categories: engineering
image_title: '/images/blogimages/illustrations-and-icons/cover-image.jpg'
twitter_image: '/images/blogimages/illustrations-and-icons/cover-image.jpg'
description: "Learn how our UX team creates icons and illustrations."
ee_cta: false
tags: design, UX, inside GitLab
---

In our 10.0 release, we introduced a [new navigation](/blog/2017/09/13/unveiling-gitlabs-new-navigation/) complete with a redesigned color palette and icon set. We replaced [Font Awesome](http://fontawesome.io/icons/) with our own, SVG based, icon system, and we’ve also been hard at work on a series of illustrations to provide consistent visual language and improve our onboarding experience. Read on to find out more about how the UX team goes about creating new icons and illustrations.

<!-- more -->

Illustrations and icons are powerful communication tools. They tell a story where words fail and can facilitate understanding across both language and culture barriers. Replacing text with illustrations and icons can make things clear at a glance. They also open up space and allow the eye to navigate more easily across the interface.

## Illustrations

A common mistake when designing a product is to assume that your users will understand how to use it. In reality, most users need a little help understanding where to start on their journey in order to discover all it has to offer. This is especially true for a product like GitLab, which is brimming with features. To assist users and [improve the onboarding experience](https://gitlab.com/gitlab-org/gitlab-ce/issues/15632), we decided to implement illustrations.

### Defining the style

To begin, we reviewed our product’s existing styles to ensure that the illustrations we created would support a consistent brand experience for the application and our [official site](/).  During this review, we found that the visual design of these two products had diverged. The colors on our official website were vivid and energetic, orange and purple, while the colors of GitLab.com were soft and gentle, grey and white. Blending these two opposing styles into one set of illustrations was not going to be an easy task.

{: .text-center}
![gitlab-websites](/images/blogimages/illustrations-and-icons/gitlab-websites.png)

### Visual consistency

To provide visual consistency across both products, we decided to pick up the primary, orange, and secondary, purple, colors from the official site for use in our illustrations. However, these two colors had a similar chroma and, used without modification, would create a jarring effect. Also, they just didn’t work well with the style of GitLab.com at the time. Our solution for this was to adjust the chroma of the two colors to generate new ones. These new colors played more harmoniously with the existing style of GitLab.com and allowed us to play with color in more creative ways.

{: .text-center}
![color-palettes](/images/blogimages/illustrations-and-icons/color-palettes.png)

### Following GitLab values

[Values](/handbook/values/) are important to us at GitLab. It was essential that our illustrations reflected these values and enhanced the brand experience to create a personal connection with our users. At GitLab we encourage people to maintain a positive attitude. Our illustrations needed to bring out a sense of playfulness, delight, and overall positivity.

{: .text-center}
![positive-illustration](/images/blogimages/illustrations-and-icons/positive-illustration.png){: .shadow}

We quickly found that these illustrations provided value as well as functionality. Used in an empty state, they inform users of features they may not know about and provide valuable onboarding. Used in error messaging, they quickly redirect users and get them back on track.

{: .text-center}
![errors-illustration](/images/blogimages/illustrations-and-icons/404.png){: .shadow}

Diversity and inclusivity are essential to who we are as well. We have users, employees, and community members from many different cultural and geographical backgrounds. We reflected this variety of races, nationalities, and genders in the development of the illustrations for our [UX personas](https://docs.gitlab.com/ee/development/ux_guide/users.html). We chose to use illustrations rather than stock photos. Illustrations make it easy to cover a variety of personas with no need to worry about copyrights.

{: .text-center}
![person-avatars](/images/blogimages/illustrations-and-icons/person-avatars.png){: .shadow}

You can find out more about our illustrations in the [handbook](https://docs.gitlab.com/ee/development/ux_guide/#illustrations).

## Icons

When GitLab was first in development, we chose Font Awesome as the primary icon set. It contained a variety of commonly used icons and was easy to implement. For an early-stage startup, it was a very useful tool.  

As GitLab matured, we needed more and more custom icons. These custom icons were created by our designers and, when mixed in with Font Awesome, led to an inconsistent visual style. Adding to the problem was the fact that we didn’t have a guide for icon usage. The lack of guidance caused [inconsistent](https://gitlab.com/gitlab-org/gitlab-ce/issues/29584) and [duplicated](https://gitlab.com/gitlab-org/gitlab-ce/issues/19751) icon usage to occur frequently. It confused users and had a detrimental effect on usability.


### Creating our icons

It was time to build a consistent visual style and eliminate the confusion by [creating a complete custom icon set](https://gitlab.com/gitlab-org/gitlab-ce/issues/32894). Using distinct and unique iconography offered a powerful way to emphasize our unique personality.

{: .text-center}
![new-icon-set](/images/blogimages/illustrations-and-icons/new-icon-set.png){: .shadow}

Once again, consistency was key here. We gave our icons a thick border and rounded corners. Creating a consistent style between our illustrations and icons strengthened our brand identity by making it memorable and more easily recognizable.

Thick borders also help with accessibility. We were aware that some of our users adjusted their screen to higher resolutions, making an icon with a thin border harder to recognize. For this reason, we went with a `2x` width border.

## The outcome

### More recognizable and consistent visual language

Our new color palette and icons on GitLab.com created a robust and consistent brand experience, making GitLab identifiable at a glance.

### Illustrations for empty states and persona avatars

Many of our empty state illustrations have been implemented, and we continue to develop more. You can see our avatar illustrations on [UX personas](https://docs.gitlab.com/ee/development/ux_guide/users.html).

{: .text-center}
![example-empty-state](/images/blogimages/illustrations-and-icons/example-empty-state-issues.png){: .shadow}

### Icons in contextual navigation and system notes

We have implemented most of our new icons on GitLab.com. You can find them in the [system notes](https://gitlab.com/gitlab-org/gitlab-ce/issues/24784) and [contextual navigation](https://gitlab.com/gitlab-org/gitlab-ce/issues/34027). Font Awesome will soon be completely phased out. We'd like to thank the Font Awesome team, their open source icon set allowed us to get very far, very fast!

{: .text-center}
![example-system-notes](/images/blogimages/illustrations-and-icons/system-notes.png){: .shadow}

{: .text-center}
![example-contextual-nav](/images/blogimages/illustrations-and-icons/contextual-nav-02.png){: .shadow}

### Streamline process with the use of SVGs

All of our illustrations and icons are now exported as SVG files. Our Frontend AC Lead [Tim Zallmann](/company/team/#tpmtim) created [GitLab SVGs](http://gitlab-org.gitlab.io/gitlab-svgs/), a repository to manage all SVG Assets for GitLab. It creates SVG Sprites out of Icons and optimises SVG-based Illustrations. These are then exported to a live preview site. This enables the design team to add new icons and the frontend team to find icons quickly and easily.

{: .text-center}
![screenshot-gitlab-svgs](/images/blogimages/illustrations-and-icons/gitlab-svgs.png){: .shadow}

## Conclusion

You will see GitLab's brand experience and UX design become more consistent and distinctive, and GitLab SVGs will soon be integrated into our [Design Library](https://gitlab.com/gitlab-org/gitlab-design/issues/26) we are working on. Stay tuned!
