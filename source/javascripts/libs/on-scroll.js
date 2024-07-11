/* global verge */
(function() {
  'use strict';

  // https://tc39.github.io/ecma262/#sec-array.prototype.findIndex
  if (!Array.prototype.findIndex) {
    Object.defineProperty(Array.prototype, 'findIndex', {
      value: function(predicate) {
        // 1. Let O be ? ToObject(this value).
        if (this == null) {
          throw new TypeError('"this" is null or not defined');
        }

        var o = Object(this);

        // 2. Let len be ? ToLength(? Get(O, "length")).
        var len = o.length >>> 0;

        // 3. If IsCallable(predicate) is false, throw a TypeError exception.
        if (typeof predicate !== 'function') {
          throw new TypeError('predicate must be a function');
        }

        // 4. If thisArg was supplied, let T be thisArg; else let T be undefined.
        var thisArg = arguments[1];

        // 5. Let k be 0.
        var k = 0;

        // 6. Repeat, while k < len
        while (k < len) {
          // a. Let Pk be ! ToString(k).
          // b. Let kValue be ? Get(O, Pk).
          // c. Let testResult be ToBoolean(? Call(predicate, T, « kValue, k, O »)).
          // d. If testResult is true, return k.
          var kValue = o[k];
          if (predicate.call(thisArg, kValue, k, o)) {
            return k;
          }
          // e. Increase k by 1.
          k++;
        }

        // 7. Return -1.
        return -1;
      }
    });
  }

  // Scroll helper to wrap scroll events up in one place
  var OnScroll = {
    ticking: false,
    fcn_queue: [],
    last_scroll_y: 0,
    scroll_direction: false,
    support_page_offset: false,
    css1_compat: false,
    scroll_timer: false,
    init: function() {
      OnScroll.setup();
    },
    setup: function() {
      OnScroll.support_page_offset = window.pageYOffset !== undefined;
      OnScroll.css1_compat = ((document.compatMode || "") === "CSS1Compat");
      window.addEventListener('scroll', OnScroll.handleScroll, false);
    },
    // Cross browser scrollY detect based on MDN
    // https://developer.mozilla.org/en-US/docs/Web/API/Window/scrollY
    scrollY: function() {
      return OnScroll.support_page_offset ? window.pageYOffset
        : OnScroll.css1_compat ? document.documentElement.scrollTop
        : document.body.scrollTop;
    },
    scrollBottom: function() {
      return OnScroll.scrollY() + verge.viewportH();
    },
    handleScroll: function() {
      window.clearTimeout(OnScroll.scroll_timer);
      var this_scroll_y = OnScroll.scrollY();
      if ( this_scroll_y > OnScroll.last_scroll_y ) {
        OnScroll.scroll_direction = 'down';
      } else {
        OnScroll.scroll_direction = 'up';
      }
      OnScroll.last_scroll_y = this_scroll_y;
      OnScroll.scroll_timer = window.setTimeout(function() {
        try {
          // No support in IE11
          var scrollend_event = new Event('scrollend');
          document.dispatchEvent(scrollend_event);
        }
        catch(e) { }
      }, 250);
      OnScroll.requestTick();
    },
    requestTick: function() {
      if ( !OnScroll.ticking ) {
        window.requestAnimationFrame(OnScroll.update);
        OnScroll.ticking = true;
      }
    },
    update: function() {
      var i = 0;
      for (; i < OnScroll.fcn_queue.length; i++) {
        OnScroll.fcn_queue[i](OnScroll.last_scroll_y, OnScroll.scroll_direction);
      }
      OnScroll.ticking = false;
    },
    addFunction: function(callback) {
      if (typeof callback === "function") {
        OnScroll.fcn_queue.push(callback);
      }
    },
    removeFunction: function(callback) {
      var index = OnScroll.fcn_queue.findIndex(function(element) { return element === callback; });
      if ( index >= 0 ) {
        OnScroll.fcn_queue.splice(index, 1);
      }
    }
  };
  OnScroll.init();
  window.an_OnScroll = OnScroll;
}());
