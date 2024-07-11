import Vue from 'vue/dist/vue.min.js'
import Slippers from 'slippers-ui/dist/slippersComponents.common.js'

// Enable Vue devtools for development environments
if (process.env.NODE_ENV === 'development') {
    Vue.config.devtools = true;
}

Vue.component('SlpComparisonInfographic', Slippers['SlpComparisonInfographic']);
initializeSlippersVueInstances();

// Find places we specifically want to mount a Vue instance, 
// labeled with `data-vue-target="true"`. Render a new Vue instance there. 
// In case multiple events fired (i.e. both `DOMContentLoaded` and `CookiebotOnLoad` fired),
// check whether or not the target already has a `__vue__` property, 
// which is the Vue instance accessor that Vue DevTools uses, but may change in Vue 3
// https://github.com/vuejs/vue/issues/5621
function initializeSlippersVueInstances() {
    const vueTargets = document.querySelectorAll('[data-vue-target="true"]');
    for (let i = 0; i < vueTargets.length; i++) {
        const target = vueTargets[i]
        if (typeof target.__vue__ === "undefined") {
            new Vue({ el: vueTargets[i] });
        }
    }
}