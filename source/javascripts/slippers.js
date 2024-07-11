import Vue from 'vue/dist/vue.min.js'
import Slippers from 'slippers-ui/dist/slippersComponents.common.js'

// Enable Vue devtools for development environments
if (process.env.NODE_ENV === 'development') {
    Vue.config.devtools = true;
}

// Register Slipper components with Vue
Object.keys(Slippers).forEach(name => {
    Vue.component(name, Slippers[name]);
})

// If Cookiebot does not exist on this page, we should be able to listen for `DOMContentLoaded` to initialize the Slippers vue instances
// But if Cookiebot does exist, we can't rely on that event. Instead, we can listen for `CookiebotOnLoad`, which fires with `window.load` 
// or we can listen for `CookiebotOnDecline`, which will cover us when people do not provide cookie consent, but our Vue still needs to initialize.
// https://www.cookiebot.com/en/developer/
document.addEventListener('DOMContentLoaded', function () {
    initializeSlippersVueInstances();
});

document.addEventListener('CookiebotOnLoad', function () {
    initializeSlippersVueInstances();
});

document.addEventListener('CookiebotOnDecline', function () {
    initializeSlippersVueInstances()
});

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