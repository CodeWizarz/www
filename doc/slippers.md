# Slippers

[Slippers](https://gitlab.com/gitlab-com/marketing/inbound-marketing/slippers-ui) is the GitLab marketing design system, built and maintained by [Digital Experience](https://about.gitlab.com/handbook/marketing/digital-experience/#principles-wip). It is maintained in a standalone package, [slippers-ui](https://www.npmjs.com/package/slippers-ui) and imported to this repository as a yarn dependency, bundled by [Webpack](/doc/webpack.md). 

Spreadsheet with the status of Slippers on different pages: https://docs.google.com/spreadsheets/d/17LbEhxQjILJVUOEXclvByjOsA65IRSuNAUeXmGWxUTs/edit?usp=sharing

## Using Slippers in about.gitlab.com

There are three primary use cases for Slippers in about.gitlab.com, and each has its own best practice for implementation. 

1. Slippers as a CSS library alongside Middleman templating (available, preferred)
1. Slippers as Vue.js client-side library (available, use with caution)
1. Slippers and Vue single-file components as a templating language *in addition to* existing Middleman templating (not yet available)

### Slippers as a CSS library alongside Middleman templating

**Use this method when you want to incorporate Slippers styles to existing templates in the website.**

This method is already available from within the existing `www-gitlab-com` repository. If you would like to begin using the Slippers design system in your work on about.gitlab.com, this is the preferred method. It is simpler, more performant, and better for SEO. 

The Slippers package [includes a set of compiled CSS](https://gitlab.com/gitlab-com/marketing/inbound-marketing/slippers-ui/-/blob/master/dist/compiled.css), which is imported in `source/stylesheets/slippers.css.scss` and processed via Webpack. 

The compiled styles are available for use within *any* page within the `handbook` or `uncategorized` directories. 

The actual styles will be maintained and updated through the [design system](https://gitlab.com/gitlab-com/marketing/inbound-marketing/slippers-ui). 

The tradeoff is that you will still have to use HAML/ERB templates, and you will have to write the component markup yourself - which provides some flexibility, but also leaves room for error if you diverge from the design system markup. 

### Slippers as Vue.js client-side library

**Use this method (with caution) when you want to use a stateful and/or data-driven component from Slippers within the existing Middleman templates.**

This method is also available from within the existing `www-gitlab-com` repository. The Slippers package [includes a compiled library of Vue.js components](https://gitlab.com/gitlab-com/marketing/inbound-marketing/slippers-ui/-/blob/master/dist/slippersComponents.common.js), which we consume and register in `source/javascripts/slippers.js`. 

Using this method incurs a performance cost because we have to load Vue.js in a render-blocking way, and the page content won't be immediately available to browsers. This can also hurt our SEO in some ways (although that story is evolving). 

Because of this performance and SEO cost, exercise great caution when using this method. It is best suited for complex, data-driven, reactive components (of which we have few). Still, it can be helpful to make writing interactive and engaging components much easier. 

To use this method, follow these steps: 

1. Include `slippers: true` in the frontmatter of the page or template
1. *Do not* include `slippers.css` in `extra_css`. This will happen automatically with `slippers: true`. 
1. Create or select an element in your template you want to mount the Vue.js instance in. Add `data-vue-target="true"` to its tag. 
1. Use the kebab-cased Slippers component name *inside the data-vue-target="true" element*. 
1. You can use any templating language to pass data to the component. 

#### Example of using Slippers client-side

Say you have some complex vue component that looks like this: 

```vue
// ComplexVueComponent.vue
<template>
  <div>
    <slot></slot>
    <ul v-for="thing in collectionOfThings">
      <li>{{thing}}</li>
    </ul>
  <div> 
</template> 

<script>
export default {
  props: {
    rawData: { 
      type: Object, 
      default: null 
    }
  computed: {
     collectionOfThings: function() {
        return someMethodThatProcesses(rawData)
     }
 }
}
```

If you want to use that in a HAML template, you can write this: 

```haml
-# middleman_template.html.haml 

- raw_data = some_haml_helper_function

%div{"data-vue-target" => "true"}
    %complex-vue-component{"raw-data" => raw_data.to_json} Component slot info here
```

Which will render the following HTML: 

```html
<div data-vue-target="true">
    <complex-vue-component raw-data="{'data': 'some data here'}">Component slot info here</complex-vue-component>
</div>
```

Since the `complex-vue-component` tag is rendered inside a Vue.js instance (which is created via the `data-vue-target="true"` tag), it will be compiled by Vue and the data from HAML will get passed along to the Vue instance to be used, as would any content in the `slot` area (between the open/close tag of the complex component). 

You can accomplish the same output in ERB:

```erb
<%# middleman_template.html.erb %>

@raw_data = some_erb_helper_function

<complex-vue-component raw-data="<%= @raw_data.to_json %>"><%= render nested_erb_template_for_slot %></complex-vue-component>
```

Take note of the call to `<%= render nested_erb_template_for_slot %>`. You can call partials into the `slot` for a Vue component and it will work. Again, use this judiciously, as you will likely incur performance costs and may encounter things like "flash of unstyled content" - which happens before the Vue.js instance is finished rendering. 

#### Tradeoffs and limitations

This approach allows us to reduce markup duplication, since we can write Vue.js components in Slippers, and use those same components even from within templates in about.gitlab.com. But it comes at a performance and SEO cost. 

In addition, mixing the Vue.js components within the templating languages could be confusing for people new to the project (or even ourselves in the future). It adds complexity, and ought to be reserved for cases in which the complexity justifies itself (i.e. the component is so complex that writing it declaratively in Vue.js is more understandable than putting it together in HAML or ERB). 

Another limitation is that JavaScript is required for some page content to work, and we have some possible failure points (read the Cookiebot note in `source/javascripts/slippers.js` as a good example). Avoid putting critical content in these components. 

We should consider this approach as a stopgap measure for when situations truly require it, until we can implement the next option listed below. 

### Slippers and Vue single-file components as a templating language

**This feature is not yet available**. 

Eventually we can enable templating in Middleman via [Vue single file components](https://vuejs.org/v2/guide/single-file-components.html). We can accomplish this within Middleman following a similar approach to the [Eleventy Vue plugin](https://github.com/11ty/eleventy-plugin-vue), which has [similar goals as we do](https://www.netlify.com/blog/2020/09/18/eleventy-and-vue-a-match-made-to-power-netlify.com/). 

We may even be able to import or fork their existing plugin and integrate it with our asset pipeline to start, although there may be a cleaner and more maintainable solution by using Vue's built in [server side rendering](https://ssr.vuejs.org/#what-is-server-side-rendering-ssr). 

The early iterations will likely have limitations (like no client-side JS available in the templates). But we can add functionality iteratively and as needs become clear.

It will be _kind of_ like the [usage in non-Node.js Environment](https://ssr.vuejs.org/guide/non-node.html), but we have the advantage that Middleman allows us to execute [whatever pipeline we like](https://middlemanapp.com/advanced/external-pipeline/), so we can execute a Node process and abstract out some of the tricky bits in that PHP example they have.

There is [an existing issue](https://gitlab.com/gitlab-com/marketing/inbound-marketing/growth/-/issues/918) for this feature. Until we have enough components built in Slippers that we could even make a full template, it's not yet a priority to implement. But it's certainly a good possibility for faster workflows, easier templating, and overall improving the developer experience with Slippers and about.gitlab.com without sacrificing user experience or requiring an SSG migration. 
