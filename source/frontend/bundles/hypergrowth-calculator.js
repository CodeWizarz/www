import Vue from 'vue';
import HypergrowthCalculator from "../components/hypergrowth-calculator/HypergrowthCalculator.vue";

document.addEventListener(
  'DOMContentLoaded',
  () => {

    const calculators = document.querySelectorAll('.hypergrowth-calculator');

    calculators.forEach((el) => {
      new Vue({
        el: el,
        components: {
          HypergrowthCalculator,
        },
        render(createElement) {
          return createElement(HypergrowthCalculator, {});
        },
      })
    });
  }
);
