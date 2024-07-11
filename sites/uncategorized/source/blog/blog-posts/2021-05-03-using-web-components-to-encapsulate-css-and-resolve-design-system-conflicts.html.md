---
title: "Using web components to encapsulate CSS and resolve design system conflicts"
author: Tyler Williams
author_gitlab: tywilliams
author_twitter: gitlab
categories: engineering
image_title: '/images/blogimages/slippers-sys.jpg'
description: "How we used web component technologies like the Shadow DOM to make it easy to incrementally adopt our new design system, Slippers."
tags: design, inside GitLab
postType: content marketing
featured: no
related_posts:
  - "/blog/2021/03/05/starting-from-the-start-slippers-design-system/"
  - "/blog/2016/10/20/why-we-chose-vue/"
  - "/blog/2016/06/10/ssg-overview-gitlab-pages-part-2/"
---

## The goal: A new design for the GitLab blog

In March 2021, the [Digital Experience team](/handbook/marketing/digital-experience/) deployed a new and improved design for the GitLab blog. This design change affected more than 1,300 blog posts. It is the largest exercise to date for [our design system, Slippers](https://gitlab.com/gitlab-com/marketing/digital-experience/slippers-ui). It presented challenges due to the age and size of the GitLab blog. We wanted to live up to GitLab's [iteration value](/handbook/values/#iteration): "Do the smallest thing possible and get it out as quickly as possible".

## The major challenge: Incrementally adopting a new design system with conflicting CSS

[Slippers uses Tailwind CSS](https://gitlab-com.gitlab.io/marketing/inbound-marketing/slippers-ui/?path=/story/tailwind-css--page), which comes with its own set of base styles, called [Preflight](https://tailwindcss.com/docs/preflight). Preflight acts like normalizing styles (it's built on top of [modern-normalize](https://github.com/sindresorhus/modern-normalize)), which is useful for new projects, or projects making a full transition. In our case, Preflight is a hurdle because it has to work alongside our existing CSS.

We explored some out-of-the-box solutions, such as enabling the Tailwind [!important configuration](https://tailwindcss.com/docs/configuration#important), or using a [very specific selector strategy](https://tailwindcss.com/docs/configuration#selector-strategy).

We got very close to our desired outcome in both cases, but a problem remained:

Critical legacy components required the old CSS. Those old styles were getting past `!important` and selector strategies because they applied to attributes we had not specified in our Tailwind utilities. Resolving those conflicts would take too much time and manual effort. We wanted a more [efficient](/handbook/values/#efficiency) solution, so we focused on two things: Identifying an ideal state for our CSS and finding a better CSS encapsulation. The goal was to prevent existing styles from affecting new components, and new styles from affecting old components.

## The solution: CSS encapsulation with web components

[Web component technologies](https://developer.mozilla.org/en-US/docs/Web/Web_Components) offered a compelling solution to the requirement that we use the old CSS. We used the [shadow DOM](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_shadow_DOM) to encapsulate CSS. [Templates and slots](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_templates_and_slots) allowed us to use existing HTML, ERB, and HAML templates. [Custom elements](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_custom_elements) brought it all together.

In the [top-level blog template](https://gitlab.com/gitlab-com/www-gitlab-com/-/blob/master/sites/uncategorized/source/includes/cms/blog_post/slippers-blog-post.erb), we placed a [template tag for the blog post markup](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/77190/diffs#5667df8046398e47cb04d02fcc386420afc7ab57_35_28). The `template` tag is valid HTML – meaning our templating engine can process everything inside it. We can use `partial` tags and `yield` as expected and they become part of the template. The output below shows what that looks like (some classes omitted for brevity):

```erb
<template id="slp-blog">
  <main class="slpBlog">
    <header class="slpBlog__header">
      <%= partial "includes/cms/blog_post/slp-blog-avatar", locals: { author: author } %>
      <%= partial "includes/cms/blog_post/slp-tags" %>
      <hr/>
    </header>
    <article class="slpBlog__article">
      <% if current_page.data.image_title %>
        <img alt="" src="<%= current_page.data.image_title %>" width="100%"/>
      <% end %>
      <%= yield %>
    </article>
    <aside class="slpBlog__aside">
      <%= partial "includes/cms/blog_post/slp-social-follow" %>
      <slot name="non-slippers-aside-items"></slot>
    </aside>
    <footer class="slpBlog__footer">
      <hr/>
      <%= partial "includes/cms/blog_post/slp-related-content" %>
      <slot name="non-slippers-footer-items"></slot>
      <hr/>
    </footer>
  </main>
</template>
<script src="/javascripts/slippers-blog.js" type="text/javascript"></script>
```

The top-level template loads [`source/javascripts/slippers-blog.js`](https://gitlab.com/gitlab-com/www-gitlab-com/-/blob/master/source/javascripts/slippers-blog.js) inside the `body` of the document, which blocks rendering until the script finishes loading. `source/javascripts/slippers-blog.js` imports Slippers CSS as a variable [using webpack loader syntax](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/77190/diffs#5b5ceecb366e6e69e99e2bae290c68bae177fc17_0_2). With the CSS stored as a variable, we can inject it into the [custom element definition](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/77190/diffs#5b5ceecb366e6e69e99e2bae290c68bae177fc17_0_6).

Next, we register `slp-blog` as a custom element. When the DOM parses the markup, it will either render the blog post template or, in the rare circumstance our JavaScript didn't load, it will fail. If it fails, we fall back to the [`yield` output in the light DOM](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/77190/diffs#5667df8046398e47cb04d02fcc386420afc7ab57_35_55) to make sure critical content is never lost. In these cases, our static site generator already rendered the template, so the images and text of the blog post remain accessible to the visitor.

Here's what that JavaScript looks like:

```js
import Vue from 'vue/dist/vue.min.js'
import Slippers from 'slippers-ui/dist/slippersComponents.common.js'

// eslint-disable-next-line import/no-webpack-loader-syntax
const css = require("!raw-loader!sass-loader!../stylesheets/slippers.css.scss").default;

// Some event handlers and other requirements omitted for brevity

export function initializeSlippersWebComponent() {
    if (window.customElements) {
        customElements.define('slp-blog',
            class extends HTMLElement {
                constructor() {
                    super();
                    const template = document.getElementById('slp-blog').content;
                    const shadowRoot = this.attachShadow({ mode: 'open' });
                    shadowRoot.innerHTML = `<style>${css}</style>`;
                    shadowRoot.appendChild(template.cloneNode(true));
                }
            });
    }
}
```

If the script successfully loads, the light DOM content generated by our fallback `yield` statement is thrown away when the custom component is rendered. This is why we use an inline script tag beforehand - to avoid a [flash of unstyled content](https://en.wikipedia.org/wiki/Flash_of_unstyled_content#:~:text=A%20flash%20of%20unstyled%20content,before%20all%20information%20is%20retrieved.).

Finally, we can use [slots to render non-Slippers items](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/77190/diffs#5667df8046398e47cb04d02fcc386420afc7ab57_40_59). Slotted elements get CSS from the light DOM, so our preexisting [partials and other included templating](https://gitlab.com/gitlab-com/www-gitlab-com/-/tree/master/sites/uncategorized/source/includes/blog) will still work as expected.

Our custom element and its slots look something like this:

```erb
<slp-blog>
  <%= yield %>
  <div slot="non-slippers-aside-items">
    <%= partial "includes/newsletter-signup.html" %>
  </div>
  <div slot="non-slippers-footer-items">
    <% unless current_page.data.install_cta == false %>
      <%= partial "includes/blog/try" %>
    <% end %>
    <% if ci_environment? %>
      <%= partial "includes/blog/comments" %>
    <% end %>
  </div>
</slp-blog>
```

## Results: Rapid iteration with minimal tradeoffs

Our solution has some tradeoffs:

1. We added complexity to the build process for our blog posts.
1. Web components have wide browser support, but that's only a recent development. The best practices around these tools are still being debated.
1. Technically, we added client-side rendering to our statically generated site, meaning we're giving up some of the static site benefits to achieve our CSS encapsulation.

Those tradeoffs are worth it in the end. We achieved near-perfect CSS encapsulation which allowed us to iterate on Slippers and ship the blog template efficiently. We have reasonable fallbacks in place to preserve critical content for people who can't or won't load JavaScript to read our posts. Web components are the future, and we're excited to use them responsibly.
