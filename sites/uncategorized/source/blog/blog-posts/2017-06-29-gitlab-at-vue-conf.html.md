---
title: GitLab was at VueConf 2017!
author: Filipa Lacerda
author_twitter: filipalacerda
author_gitlab: filipa
categories: company
image_title: '/images/blogimages/gitlab-at-vue-conf/cover_image.jpg'
twitter_image:
description: GitLab was at VueConf 2017 sharing how we use Vue.js.
tags: frontend, events
---

Last week I attended [VueConf 2017](https://conf.vuejs.org/) explaining how we, at GitLab, changed from [CoffeeScript](http://coffeescript.org/) to [EcmaScript 6](http://www.ecma-international.org/ecma-262/6.0/) and how we included [Vue.js](https://vuejs.org/) in our stack.

<!-- more -->

VueConf took place in the beautiful city of [Wrocław](https://en.wikipedia.org/wiki/Wroc%C5%82aw) in Poland. Props to [Monterail](https://www.monterail.com/) for putting together such a well-organized conference.

I had the pleasure of meeting all the speakers and organizers and the Vue community is inspiring. Everyone is kind and willing to share their knowledge. Having Evan You personally introduce everyone says a lot about the spirit of this community.

This conference would not have been possible without the help of the sponsors and organizers, thank you [Monterail](https://www.monterail.com/), [Codeship](https://codeship.com/), [Monaca](https://monaca.io/), [Native Script](https://www.nativescript.org/), [Evan You](https://twitter.com/youyuxi) and [Damian Dulisz](https://twitter.com/damiandulisz) for organizing such a great conference!

In the [slides for my talk](https://filipa.gitlab.io/vue_conf_2017/vue_gitlab_2017.pdf), I guide you through our journey from CoffeeScript to ES6 and from jQuery to Vue.js.

## How we use Vue at GitLab

As stated in previous blog posts, we will not rewrite all our code in Vue.js. Instead, we will create several small Vue applications, which is similar to many small Single Page Applications.

In order to help us with state management, we chose a simple architecture and data flow to build our Vue Applications. We have a main Vue component, a service that allows us to get data and a store that saves the data we receive from the service:

![architecture-1](/images/blogimages/gitlab-at-vue-conf/graph_arc_1.png "Vue Application Architecture"){: .shadow}*<small>Vue Application Architecture and Data Flow.</small>*{: .text-center}

We start by adding an element to the DOM in the haml file, and point to a JavaScript file. We take advantage of `data-attributes` to transfer data we only have access in Rails through our Vue application.

```html
  #pipelines-list-vue{ data: {
    endpoint: namespace_project_pipelines_path(@project),
    "help-page-path" => help_page_path(@project),
    "all-path" =>  project_pipelines_path(@project),
    "pending-path" => project_pipelines_path(@projec),
    "ci-lint-path" => ci_lint_path } }

  = webpack_bundle_tag('common_vue')
  = webpack_bundle_tag('pipelines')
```

The next step is to create a bundle file where we are going to mount our application. We can say this is the index file of our application.

```javascript
  import Vue from 'vue';
  import pipelinesComponent from './pipelines.vue';

  document.addEventListener('DOMContentLoaded', () => {
    return new Vue({
      el: '#pipelines-list-vue',

      components: {
        pipelinesComponent,
      },

      render(createElement) {
        return createElement('pipelines-component');
      },
    });
  });
```

We then need to create our store and our service, they are both simple classes. To communicate with our API we use `vue-resource` to help us.
```javascript
  // store.js
  export default class PipelinesStore {
    constructor() {
      this.state.pipelines = [];
    }
    storePipelines(pipelines = []) {
      this.state.pipelines = pipelines;
    }
  }
```

```javascript
  // service.js
  import Vue from 'vue';
  import VueResource from 'vue-resource';

  Vue.use(VueResource);

  export default class PipelinesService {
    constructor(endpoint) {
      this.pipelines = Vue.resource(endpoint);
    }
    getPipelines(data = {}) {
      return this.pipelines.get(data);
    }
    postAction(endpoint) {
      return Vue.http.post(`${endpoint}.json`);
    }
  }
```

The next step is to create our main component where we bind everything together. As soon as the component is created we make a call to the service, and if everything goes well, we tell the store to use the received data. If we get an error we simply show a warning to the user.

Usually we have several smaller components that are used in the main one, that allows us not only to reuse them but also to have readable files.

```vue
<script>
  import Service from 'service';
  import Store from 'store';

  export default {
    data() {
      const dataset = document.querySelector('#pipelines-list-vue').dataset;
      const store = new Store();
      const service = new Service(endpoint);

      return {
        store,
        service,
      };
    },
    created() {
      this.service.getPipelines()
        .then((response) => response.json())
        .then((pipelines) => this.store.storePipelines(pipelines))
        .catch((error) => this.handleError(error));
    },
  };
</script>

<template>
  <table>..</table>
</template>
```
In some places we have more complex cases where we can’t rewrite it all in Vue, and we’ll have to use html and jQuery as well.

For example, in the Pipelines' details page, only the header and the graph are built in Vue.js since are the only ones with real time data.
If we built this page with the architecture explained above, we would need to fetch data from the same endpoint twice, and we need to poll the same endpoint twice, which is not a good idea. To avoid duplicate network calls we created a mediator to act as our main component.

![architecture-2](/images/blogimages/gitlab-at-vue-conf/graph_arc_2.png "Vue Application Architecture with a Mediator"){: .shadow}*<small>A Mediator allows us to reuse the same state between Vue Applications.</small>*{: .text-center}

The mediator not only allows us to avoid duplicate network calls, it also allows us to share state between the two Vue Applications and reduce repeated code. It also has the major advantage that can be easily transformed into a Vue main component if needed.

You can read more about our architecture [here](https://docs.gitlab.com/ee/development/fe_guide/vue.html#vue-architecture). We have documentation explaining [when to use vue at GitLab](https://docs.gitlab.com/ee/development/fe_guide/vue.html#when-to-use-vue-js) and how to do it. We also have a small [style guide for our vue code](https://docs.gitlab.com/ee/development/fe_guide/style/javascript.html#vuejs).

## Future plans for Vue at GitLab
1. The next step is to make sure all our Vue code looks the same and is organized well.
1. Other thing we need to do is to have all components in .vue files. You can see the issue [here](https://gitlab.com/gitlab-org/gitlab-ce/issues/34371).
1. We also need to create reusable components. With all new Vue.js code being added at the same time we ended up with a lot of repeated code in Vue, which we have identified and are currently transforming into reusable components. You can see the issue [here](https://gitlab.com/gitlab-org/gitlab-ce/issues/30286).
1. We need a linter. Vue is currently the only part of our frontend code that does not have a linter yet, although we have a style guide for Vue.js in our documentation. You can see the issue [here](https://gitlab.com/gitlab-org/gitlab-ce/issues/34312).
1. We are currently experimenting adding Vuex to our stack to see if it can help us in more complex areas of our code. The merge request is [here](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/12069).

Hope to see you at the next VueConf! _Na zdrowie!_

[Cover image](https://pixabay.com/en/wroc%C5%82aw-lower-silesia-architecture-1663406/) by [Przemysław Krzak](https://pixabay.com/en/users/przemokrzak-2778444/) is licensed under [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/)
{: .note}
