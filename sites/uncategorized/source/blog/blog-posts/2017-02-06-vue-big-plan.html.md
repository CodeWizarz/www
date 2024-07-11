---
title: "Our big Frontend plan revealed"
author: Jacob Schatz
author_twitter: jakecodes
author_gitlab: jschatz1
categories: engineering
description: "Our long term plan to make GitLab as fast and performant as possible with Vue and webpack."
image_title: '/images/blogimages/vue-big-plan-cover.png'
---

The Frontend at GitLab is getting better and better every day. Today we did two big things, and I'd like to share them with you and our big plans for the future.

<!--more-->

<blockquote style="color: red">
<ul>
  <li>If you use the GDK, then make sure you update it! If you have no idea what I am talking about, then just keep reading.</li>
  <li>Please see the <a href='https://gitlab.com/gitlab-org/gitlab-development-kit/blob/master/doc/update-gdk.md'>documentation</a> for instructions on updating your GDK.</li>
  <li>Please see our <a href='https://gitlab.com/gitlab-org/gitlab-development-kit/blob/master/doc/howto/troubleshooting.md#webpack'>troubleshooting guide</a> for any issues when updating your GDK.</li>
  <li>Feel free to <a href='https://gitlab.com/gitlab-org/gitlab-ce/issues/new'>report</a> any additional issues you find.</li>
</ul>
</blockquote>

## Our big Frontend plan

[Vue](https://vuejs.org/) is awesome. I wrote an article a while ago that showed [GitLab's love for Vue](/blog/2016/10/20/why-we-chose-vue/). Today's article is a way to show our plan over the long term to make GitLab as fast and performant as possible with Vue and webpack. We want to make GitLab the easiest to develop for Frontend Developers.

One of the lessons I live by is "It's not _always_ about the tools you use, but **how** you use them."  Saying "we chose Vue", does not imply success. This also means that we could be using Angular or React and have just as awesome of a product. Vue is simply the way there.

How do we plan to use Vue over the long run to make GitLab better, faster, easier and more awesome?

The plan below is a work in progress and very ambitious, but I believe that it will result in a much better frontend for development and performance. This document is also a reference to myself of the things we plan to do here at GitLab's Frontend.

## A healthier Frontend

When I started at GitLab, our stack was (oversimplifying here) Rails with jQuery. It hasn't changed much big picture wise except for Vue. Smaller picture, we've added many linters, better code coverage, and many other great things.

### 1. Rewrite only what you need to

We are not rewriting GitLab's frontend entirely in Vue. That would be a very bad idea. It's not a bad idea for everyone, but it's a bad idea for a startup. It would cost a tremendous amount of time and money. The existing jQuery code (although some say is uncool) has been tested and works very well. There is no need to rewrite functionality that works well, unless there is going to be a major gain.

We also aren't writing every new thing in Vue. You do not need to do this either. But, it would be hard to find some part of the UI that would not benefit from even the simplest parts of Vue.

Examples of this are:

1. The issue page (which shows an individual issue), has a lot of jQuery on it. We won't rewrite now, because it works well. We will rewrite small parts in Vue once we make certain features more real-time. We are currently making the title and description real time.

1. The [Issue Boards](/stages-devops-lifecycle/issueboard/), which [Phil](https://twitter.com/iamphill) wrote, was a perfect candidate for Vue. It was a brand new feature and had lots of reactive parts.

1. The current issue page loads all comments at once and adds lots of event listeners to the page. This page could benefit from Vue for performance reasons. We could make the comment section a Vue app and make the comments a component with the emoji picker as components as well, etc. While we're in there, we'll amp up the UX by allowing you to see the comment you linked to immediately without waiting. There are better ways to show massive amounts of comments so we have to potentially rethink that.

1. The pipelines page rewritten in vue for the arrival of real time updating.

1. The environments was written in Vue.

1. There are many other places where we will be using Vue in the future and where we are already using Vue. Too many to list here.

As you can see, we won't just slap Vue on everything.

### 2. Add in webpack

Rails has this awesome system of grabbing your Ruby libraries and bundling them into your app. `bundle install` will install all the stuff you need from your `Gemfile`. So why does Frontend have to stick all their libraries in the `vendor` directory? Are we not on point enough to have our own library delivery system? The javascript ecosystem has matured since the asset pipeline first arrived, and we now have `npm install` and advanced code bundling tools that we can take advantage of.

By [introducing webpack into the equation (merged and ready for action!)](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/7288) we gain multiple benefits.

1. Javascript libraries aren't being bundled directly with the [GitLab source code](/stages-devops-lifecycle/source-code-management/) or included within gem wrappers. e.g. `jquery-ui` or `bootstrap-rails` are included as a ruby gem and we are at the mercy of the gem maintainer to keep the Javascript library up to date.
1. When code is shared between files, we can make sure we don't load [lodash](https://lodash.com/) twice, for example. If both files load lodash, we should only load the code for lodash once. Not only will lodash not be included twice, but with [tree shaking](https://webpack.js.org/guides/tree-shaking/) only the components of lodash that we use will be included rather than the whole library.
1. We can add [hot module replacement](https://webpack.js.org/concepts/hot-module-replacement/) to make our Vue development quicker. This is a development bonus, as our current development takes loads of time to refresh the page while developing GitLab. Spicy!
1. We can now manage our dependencies properly. This should help a lot of frontenders to contribute to GitLab. Devs won't need to figure out the whole Rails Javascript situation in order to contribute. We can also dictate manually what we want to include.
1. SVGs are going to be huge.
    1. [webpack](https://webpack.js.org/) bundles SVGs directly into our Javascript.
    1. Right now, SVGs live in a specific directory in Rails. We use Rails helpers to pull in SVGs. With webpack we can pull in SVGs one at a time because webpack precompiles assets.
    1. We won't have to fetch SVGs with an HTTP request.
    1. We don't have to do tricky HTML hidden elements which is technical debt.
    1. We don't have to mess around with SVGs in CSS. You cannot change the color of SVGs in CSS.
1. We use a lot of Ruby to solve Javascript and CSS problems. Now we can solve those problems on our own using only frontend tools.
1. Using webpack's [CommonsChunkPlugin](https://webpack.js.org/plugins/commons-chunk-plugin/) we split all of our common vendor libraries into their own separate file. Since these change very infrequently, they can stay cached for a much longer period of time.
1. With webpack's [code splitting](https://webpack.js.org/guides/code-splitting/) feature you can load just the JS you need to boot. Then you do a `require.ensure()` or `System.import()`. With this, we can tell webpack to request only exact JS you need. It keeps the size of the file really small. For example if you have `modal.js` for modals. If someone never uses the modals the code never loads. As soon as someone opens a modal, the JS gets loaded on demand.
1. We can now properly manage our global scope. We can now do a `import x from y` instead of having our scripts pollute the global scope and pass classes around on `window.gl.lol`.
1. We can slim down the our Vue bundles because we can precompile templates and omit the template compiler from our production code. [Evan You](https://twitter.com/youyuxi) (the creator of VueJS) explains this in the [feature overview for Vue 2.0](https://github.com/vuejs/vue/issues/2873):
  > There will be two different builds:
  > - Standalone build: includes both the compiler and the runtime. ...
  > - Runtime only build: since it doesn't include the compiler, you need to either pre-compiled templates in a compile step, or manually written render functions.


### 3. Remove Turbolinks

We used [TurboLinks](https://github.com/turbolinks/turbolinks) in GitLab, but we've recently [removed it](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8570) with the linked merge request, merged on 2017/02/03.

#### What does Turbolinks achieve?

With TurboLinks, clicking a link won't navigate to a new page in the default browser `GET` request way. Instead, Turbolinks will replace the `body` tag of your app with the new content. All your Javascript is loaded one time, when using the asset pipeline. This usually only loads some small HTML and JavaScript. On GitLab, our pages would load an average of 20kb on each page load versus the full JavaScript file size of 800kb+. Turbolinks is a great solution for many projects. When you start introducing slightly more complex Javascript it becomes a pain.
We did speed tests on pages with Turbolinks and without Turbolinks and we found that the pages without Turbolinks performed better. We discovered that Turbolinks works well when you don't have a lot of event listeners to manage. To add to this, we will be able to make our pages even faster in the future because we will divide the Javascript up between pages better with the help of webpack. We were previously writing a lot of extra code to handle all of Turbolink's problems and we can remove that code now.

#### The problem we need to solve

When your JS is loaded one time for multiple pages, events become a major problem. If you are using `gem 'jquery-turbolinks'` as we are, then the `$` `ready` function will fire on every page load even though the page isn't loading in the traditional sense. It's painful to write page specific Javascript without including it for the whole app. We do it and it's fine, but, why? There really isn't a reason for a lot of our JS that needs to be included on every page.

Any external links do load faster so, we need to be careful about performance.

If you aren't careful, your events will get loaded multiple times and thus fire multiple times. For example, take the following code:

```js
$(function(){
  $(document).on('click','.some-element', function(){
    console.log('Click loaded');
  }
});
```

That click event will be loaded on every page and thus fire multiple times every time `.some-element` is clicked.

#### The Solutions
There are a few remedies to this problem. Some are good and some are bad.

1. Don't create events in `$` `ready` callbacks.
2. Use the following stinky solution:

    ```js
    $(document)
    .off('click', '.some-element')
    .on('click'...
    ```

     I call this the `die live` method. Old jQuery code people use to write `die().live()` everywhere. That's the old school jQuery `off().on()`.
3. Write an event manager to be a delegate for all added events.
4. [Remove Turbolinks](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8570) and make sure you load only the code you need on each page.

I am opting for option 4, in order to make our development lives easier and get multiple performance gains.

#### The Bonus

After we remove Turbolinks we can do something really cool. We can have each page live on its own. Then, certain pages can be their own Vue apps. For example, we can make the file browser its own Vue application. The merge request page can be its own application. The code for the file viewer won't need to be loaded on any other page and the same goes for other pages. This is not anything new, this is just basic web development. This is also not a new paradigm, and we would not be the first.

## Conclusion
There is the argument for making the whole site a single page application, but I think this would just be the hardest to maintain and has zero benefits for the performance and the user. Also, there's a higher chance of making GitLab a janky app. For example, the profile page could be potentially very light, and there would be no reason for that if someone is linked directly to the profile page; it should load every single piece of Javascript in our project.

This is just one small step for GitLab and one giant leap for the frontend team. In the future you will see many new cool things coming from our team. This move was one step in that direction.

Questions, suggestions, ideas? Please leave a comment
below or tweet at us [@GitLab](https://twitter.com/gitlab)!
