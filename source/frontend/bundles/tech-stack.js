import Vue from 'vue';
import TechStackOverview from '../components/tech-stack/TechStackOverview.vue';

document.addEventListener(
  'DOMContentLoaded',
  () =>
    new Vue({
      el: '#js-tech-stack-overview',
      components: {
        TechStackOverview,
      },
      render(createElement) {
        return createElement(TechStackOverview);
      },
    })
);
