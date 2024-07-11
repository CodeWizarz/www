import Vue from 'vue/dist/vue.min.js'
import { SlpNavigation } from 'be-navigation/dist/be-navigation.umd.min.js'

// eslint-disable-next-line import/no-webpack-loader-syntax
const css = require("!raw-loader!sass-loader!../stylesheets/be-navigation.css.scss").default;
// Enable Vue devtools for development environments
if (process.env.NODE_ENV === 'development') {
    Vue.config.devtools = true;
}

// Grab webIDE and page source paths from the hidden div in footer.html.haml
let webIDE
let pageSource
document.addEventListener('DOMContentLoaded', function() {
  webIDE = document.querySelector('#hidden-web-ide').href
  pageSource = document.querySelector('#hidden-page-source').href
}, false);

// Register the component with Vue
Vue.component('SlpNavigation', SlpNavigation);

// We have to use Web components to keep old Slippers styles out of the new Slippers nav,
// https://about.gitlab.com/blog/2021/05/03/using-web-components-to-encapsulate-css-and-resolve-design-system-conflicts/
(function () {
    if (window.customElements) {
        customElements.define('be-navigation',
            class extends HTMLElement {
                constructor() {
                    super();
                    const template = document.getElementById('be-nav').content;
                    const shadowRoot = this.attachShadow({ mode: 'open' });
                    shadowRoot.innerHTML = `<style>${css}</style>`;
                    shadowRoot.appendChild(template.cloneNode(true));
                    const navigationTarget = shadowRoot.querySelector('#be-nav-target');
                    new Vue({ el: navigationTarget });
                }
            });
    }

    // Capture event in footer for viewing page source and WebIDE
    document.addEventListener('webIDE', () => {
      window.location.href = webIDE
    });
    document.addEventListener('viewPageSource', () => {
      window.location.href = pageSource
    });
    document.addEventListener('navSearch', (event) => { 
      // build a new url using the base (https://about.gitlab.com/) plus the search query 
      window.location.href = `${window.location.origin}/search/?searchText=${event.detail.searchText}`  
    });

    document.addEventListener('searchClick', () => {
        const search = document.querySelector('.js-search')
        search.parentElement.classList.toggle('search-visible')

        if (search.parentElement.classList.contains('search-visible')) {
            setSearchBarDistanceFromTop(search.parentElement);
            setTimeout(() => {
                search.focus()
            }, 350)
        }
        window.addEventListener(
            'resize',
            debounce(() => {
                setSearchBarDistanceFromTop(search.parentElement);
            }, 100),
        );
    });
    function debounce(fn, delay) {
        let timeoutID = null;
        return () => {
            clearTimeout(timeoutID);
            timeoutID = setTimeout(() => {
                fn();
            }, delay);
        }
    }
    function setSearchBarDistanceFromTop(search) {
        const distanceFromTop = document.querySelector('#global-nav')?.getBoundingClientRect().height;
        search.style.top = distanceFromTop + 'px';
    }

    // Since the navigation elements are inside a Shadow DOM,
    // Google Analytics can't access them as expected.
    //
    // The following code registers custom event handlers that GA can listen to,
    // and grab the data we care about.
    // https://gitlab.com/gitlab-com/marketing/digital-experience/buyer-experience/-/issues/774

    const eventName = 'click'
    // Set to false if you don't want to use capture phase
    const useCapture = true
    // Set to false if you want to track all events and not just those in shadow DOM
    const trackOnlyShadowDom = true;

    const callback = function (event) {
        if ('composed' in event && typeof event.composedPath === 'function') {
            // Get the path of elements the event climbed through, e.g.
            // [span, div, div, section, body]
            const path = event.composedPath();
            // Fetch reference to the element that was actually clicked
            const targetElement = path[0];
            // We care about four possible values:
            // data-nav, data-nav-levelone, data-nav-leveltwo, and data-nav-levelthree
            //
            // So find the closest links with those data attributes to the targetElement.
            const navElement = targetElement.closest('[data-nav]');
            const navLevelOneElement = targetElement.closest('[data-nav-levelone]');
            const navLevelTwoElement = targetElement.closest('[data-nav-leveltwo]');
            const navLevelThreeElement = targetElement.closest('[data-nav-levelthree]')

            // We may or may not have navHeader, navLevelOne, navLevelTwo, or navLevelThree data
            let navHeader = null;
            let navLevelOne = null;
            let navLevelTwo = null;
            let navLevelThree = null;

            // If the navElement is not null, then we want to get the info stored in data-nav
            if (navElement) {
                navHeader = navElement.getAttribute('data-nav');
            }

            // If the navLevelOneElement is not null, then we want to get the info stored in data-nav-levelone
            if (navLevelOneElement) {
                navLevelOne = navLevelOneElement.getAttribute('data-nav-levelone');
            }

            // If the navLevelTwoElement is not null, then we want to get the info stored in data-nav-leveltwo
            if (navLevelTwoElement) {
                navLevelTwo = navLevelTwoElement.getAttribute('data-nav-leveltwo');
            }

            // If the navLevelThreeElement is not null, then we want to get the info stored in data-nav-levelthree
            if (navLevelThreeElement) {
                navLevelThree = navLevelThreeElement.getAttribute('data-nav-levelthree');
            }

            // Check if the element is WITHIN the shadow DOM (ignoring the root)
            const shadowFound = path.length ? path.filter(function (i) {
                return !targetElement.shadowRoot && !!i.shadowRoot;
            }).length > 0 : false;

            // If only shadow DOM events should be tracked and the element is not within one, return
            if (trackOnlyShadowDom && !shadowFound) return;

            // If we have a navHeader, navLevelOne, navLevelTwo, or navLevelThree, then we want to track it
            // otherwise, we don't want to track it, so return early
            //
            // Make sure to explicitly check for `null`, in case the actual data is falsy, like `0` or an empty string,
            // in which case we don't necessarily know we should skip it.
            if (navHeader === null && navLevelOne === null && navLevelTwo === null && navLevelThree === null) return;

            // Otherwise, push to the dataLayer
            window.dataLayer.push({
                event: 'custom_event_' + event.type,
                custom_event: {
                    element: targetElement,
                    navHeader: navHeader,
                    navLevelOne: navLevelOne,
                    navLevelTwo: navLevelTwo,
                    navLevelThree: navLevelThree,
                    elementId: targetElement.id || '',
                    elementClasses: targetElement.className || '',
                    elementUrl: targetElement.href || targetElement.action || '',
                    elementTarget: targetElement.target || '',
                    originalEvent: event,
                    inShadowDom: shadowFound
                }
            });
        }
    };

    document.addEventListener(eventName, callback, useCapture);
})()
