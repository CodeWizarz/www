import Vue from 'vue';
import DataTeamValueCalculator from "../components/data-team-value-calculator/DataTeamValueCalculator.vue";

document.addEventListener(
  'DOMContentLoaded',
  () => {

    const calculators = document.querySelectorAll('.data-team-value-calculator');

    calculators.forEach((el) => {
      new Vue({
        el: el,
        components: {
          DataTeamValueCalculator,
        },
        render(createElement) {
          return createElement(DataTeamValueCalculator, {});
        },
      })
    });
  }
);
