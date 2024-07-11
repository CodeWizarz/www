import Vue from 'vue/dist/vue.min.js'
import { SlpFooter } from 'be-navigation/dist/be-navigation.umd.min.js'

// Enable Vue devtools for development environments
if (process.env.NODE_ENV === 'development') {
    Vue.config.devtools = true;
}
// Register the component with Vue
Vue.component('SlpFooter', SlpFooter);

(function () {
    const footerTarget = document.querySelector('#global-footer');

    new Vue({ el: footerTarget });
})()