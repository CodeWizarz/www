---
title: "Our journey in switching to native Unicode emoji"
author: Eric Eastwood
author_gitlab: MadLittleMods
author_twitter: MadLittleMods
categories: engineering
image_title: '/images/blogimages/journey-in-native-unicode-emoji/journey-in-native-unicode-emoji-cover.png'
description: "Unicode is hard. Here's a guide to getting native Unicode Emoji right 👌. Learn more!"
ee_cta: false
twitter_text: "Our journey in switching to native Unicode emoji at @gitlab"
tags: frontend
---

The switch from image-based emoji to native Unicode wasn't a straightforward journey and included many intricacies to get production ready. Support varies widely on each OS, even between the browsers on the OS. We also wanted to support falling back to image-based emoji for environments that do not support everything yet, otherwise people would see black squares (□). As a simple example, most Linux environments do not have Unicode emoji support unless you manually install a font. I consider this blog post the survival manual I wish I had had when implementing native Unicode emoji myself.

## What is Unicode emoji?

Unicode emoji is a universal character encoding standard maintained by the [Unicode Consortium](https://home.unicode.org/basic-info/overview/) and It provides the basis for processing, storing, and interchanging text data in any language. As far as emojis themselves are concerned, this is the encoding system that develops and houses all emojis. Emojis are encoded in the Unicode system based on appearance rather than a specific semantic. 

## Are Unicode emojis compatible with all devices?

The short answer is yes!

All modern software providers have become compatible with Unicode so that data can be transferred freely without corruption, regardless of platform, language, or device. 

Before Unicode, there were multiple character encoding systems to assign numbers to each of the letters and numbers that were used by computers. But these character encoding systems simply couldn’t keep up with the volume of languages using different letters and numbers. The data passing through these different encodings ran the risk of being corrupted due to a lack of sufficient support from a given computer - particularly servers.

And so, a new system was born: Unicode.

## Why move to native Unicode emoji?

We decided to switch to Unicode emoji because it was in line with our decision to use system fonts and it reduces the number of images loaded on a page. You can see the [full discussion in this issue](https://gitlab.com/gitlab-org/gitlab-ce/issues/26371). We were also [interested in](https://gitlab.com/gitlab-org/gitlab-ce/issues/22474) [improving](https://gitlab.com/gitlab-org/gitlab-ce/issues/27250) the award emoji menu (emoji reaction selector) performance, so it would open quickly without an AJAX request and with less janky scrolling.

The first step was to find a way to detect whether a given Unicode emoji is supported. Since new emoji/characters are introduced in new versions/releases of Unicode specifications from the [Unicode Consortium](http://unicode.org/), we can consider every emoji in that version supported if a single emoji in that version tests positively. There are exceptions to assuming support for a whole Unicode version, but we can handle them individually as they come up. Unicode 10 is the current stable release but [Unicode Consortium](http://unicode.org/) is working on finishing up Unicode 11 and starting on Unicode 12 at the moment. The Unicode Consortium has [a full table of emoji here with the representation on various platforms](https://unicode.org/emoji/charts/full-emoji-list.html).


## Testing for native emoji Unicode support

We test an emoji from each Unicode version/release and cache that locally ([`localStorage`](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)) in a support map to look up later whether a given emoji is supported. If the emoji isn't supported we fall back to an image or CSS sprite depending on the situation.

I couldn't find any existing library or JSON document that mapped a given emoji to their respective Unicode version/release, so I created my own project that scrapes [emojipedia](https://emojipedia.org/) and assembles a JSON map, [`emoji-unicode-version`](https://www.npmjs.com/package/emoji-unicode-version) on npm.

To test whether a Unicode emoji works, we render it to a `<canvas>` and inspect the pixels in the exact middle for any color (if it is black, then the test fails). We also have to ensure the emoji renders as a single character because some emoji are made up of multiple characters (see [ZWJ sequences and skin tone modifier sections below](#emoji-made-up-of-multiple-characters)).

When choosing a specific emoji for each version to test, be sure to choose something with color. As an example, I initially chose ⚽ `:soccer:` in the Unicode 5.2 range but since it is a black and white emoji, it always failed so I switched to ⛵ `:sailboat:`.

We invalidate the support map whenever your user-agent changes because emoji support changes when you get a browser or OS update. We also add a manual `GL_EMOJI_VERSION` for busting the cache when we update the support check logic.

You can check out our implementation here, [`app/assets/javascripts/emoji/support/unicode_support_map.js`](https://gitlab.com/gitlab-org/gitlab-ce/blob/ee189fd511e1a2c06f05e0d40e1d0b8875151391/app/assets/javascripts/emoji/support/unicode_support_map.js), [`app/assets/javascripts/emoji/support/is_emoji_unicode_supported.js`](https://gitlab.com/gitlab-org/gitlab-ce/blob/ee189fd511e1a2c06f05e0d40e1d0b8875151391/app/assets/javascripts/emoji/support/is_emoji_unicode_supported.js)


### Rendering emoji to a canvas in Internet Explorer gotchas

When rendering emoji to a `<canvas>`, IE11 didn't like our full font-stack and renders small black and white emoji, which are less than ideal.

The culprit is the `-apple-system` piece 😕

```js
ctx.font = `${fontSize}px -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"`;
```

But if you simply go with the emoji part of the stack, it renders the nice colorful emoji as expected,

```js
ctx.font = `${fontSize}px "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"`;
```

Full font-stack | Small emoji font-stack
--- | ---
[![](/images/blogimages/journey-in-native-unicode-emoji/ie-canvas-full-font-stack.png)](/images/blogimages/journey-in-native-unicode-emoji/ie-canvas-full-font-stack-large.png) | [![](/images/blogimages/journey-in-native-unicode-emoji/ie-canvas-short-font-stack.png)](/images/blogimages/journey-in-native-unicode-emoji/ie-canvas-short-font-stack-large.png)


### Unicode 1.1 emoji not rendering as colorful, fancy glyphs when using full font-stack

We also switched to using a shorter, emoji-only font-stack in CSS to get some of the Unicode 1.1 emoji to render colorfully. Read [more in the issue](https://gitlab.com/gitlab-org/gitlab-ce/issues/29557#note_25544684).

Full font-stack | Small emoji font-stack
--- | ---
![font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";](/images/blogimages/journey-in-native-unicode-emoji/unicode-1-1-full-font-stack.png) | ![font-family: "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";](/images/blogimages/journey-in-native-unicode-emoji/unicode-1-1-short-font-stack.png)


### Render emoji on Canvas at 16px

We use `16px` font size when rendering to the `<canvas>` because mobile Safari (iOS 9.3) will always render at 16px regardless of the font size you specify.

The `32px` pixel example below is rendering at the same size as the `16px` example. If it worked correctly, the `32px` would fill up the empty space.

32px | 16px
--- | ---
<a href="/images/blogimages/journey-in-native-unicode-emoji/16px-font-size-at-32px-large.png"><img srcset="/images/blogimages/journey-in-native-unicode-emoji/16px-font-size-at-32px.png 2x"></a> | <a href="/images/blogimages/journey-in-native-unicode-emoji/16px-font-size-at-16px-large.png"><img srcset="/images/blogimages/journey-in-native-unicode-emoji/16px-font-size-at-16px.png 2x"></a>


## Unicode emoji bounds and baseline positioning is different across platforms

Another issue we ran into when switching is the inconsistency in how emoji vertically align across platforms. The baseline defined in each platform font is different, which makes tweaks to center on one platform throw off another. We didn't find any good solution for perfect vertical centering and opted just to leave it for now. You can read the [full discussion here](https://gitlab.com/gitlab-org/gitlab-ce/issues/33044#note_34375144).

For an in-depth dive into font metrics (not emoji specific), see [*Deep dive CSS: font metrics, line-height and vertical-align*](http://iamvdo.me/en/blog/css-font-metrics-line-height-and-vertical-align) by Vincent De Oliveira (aka iamvdo).


## Emoji fallbacks

We define optional fallbacks for images and CSS sprites directly on the element. In terms of priority, when `data-fallback-css-class` is defined on the emoji element, we opt to use the CSS sprite. We only sprite things like the award emoji menu, which lists every emoji at once and potentially needs to fall back on everything for platforms that don't support Unicode emoji (like Linux).

```html
<gl-emoji data-fallback-src="emoji-xxx.png" data-fallback-css-class="emoji-xxx">
  xxx
</gl-emoji>
```

We use [`document.registerElement()`](https://developer.mozilla.org/en-US/docs/Web/API/Document/registerElement) in order to hook whenever a `<gl-emoji>` is used on the page or created and test whether we need to fall back. We use the deprecated v0 web components `document.registerElement()` over the new v1 [`CustomElementRegistry.define()`](https://developer.mozilla.org/en-US/docs/Web/API/CustomElementRegistry/define) because that only works with ES2015 class syntax and in our case, Babel is transpiling everything which makes that syntax incompatible for now. It is also necessary to use a [`document.registerElement()` polyfill](https://github.com/WebReflection/document-register-element) for browsers that don't support it like Safari.

When we fall back to a CSS sprite, we add the necessary `.emoji-icon` classes to the `<gl-emoji>` tag. These extra CSS classes hide the emoji Unicode content inside so only the background image is visible.

```css
.emoji-icon {
  /* Hide emoji Unicode */
  color: transparent;
  /* Hide emoji Unicode in IE */
  text-indent: -99em;
  /* ... */
}
```

You can check out our [`<gl-emoji>` implementation here](https://gitlab.com/gitlab-org/gitlab-ce/blob/ee189fd511e1a2c06f05e0d40e1d0b8875151391/app/assets/javascripts/behaviors/gl_emoji.js).


## Emoji made up of multiple characters

Some emoji are composed of multiple characters, which can be tricky to work with in JavaScript. [`Array.from`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from), [`String.prototype.codePointAt()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/codePointAt) are all your friends here. There is a great article, [*JavaScript has a Unicode problem*](https://mathiasbynens.be/notes/javascript-unicode) by Mathias Bynens, going into more detail.


#### Zero Width Joiner (ZWJ) sequences

Zero Width Joiner (ZWJ) sequences are composed of multiple emoji characters joined by a ZWJ character `\u{200D}`, `&zwj;`(non-printing character). You can read more about [ZWJ sequences here](http://emojipedia.org/emoji-zwj-sequences/).

👨‍👩‍👧‍👦 `:family_mwgb:`
```
[...'👨‍👩‍👧‍👦']
// ["👨", "‍", "👩", "‍", "👧", "‍", "👦"]
```


#### Skin tone modifier

Skin tone modifiers don't need a ZWJ character to combine with another emoji. You can read more about the [skin tone modifiers here](http://emojipedia.org/modifiers/).

👨🏿 `:man_tone5:`
```
[...'👨🏿']
// ["👨", "🏿"]
```

I opted to test multiple skin tone modifier combos and only if all pass, consider skin tone modifiers supported at least on a basic level. There was still an outlier on macOS 10.12 where they don't have 🏇🏿 `:horse_racing_toneX:` and I added a separate test for it.


## Emoji discrepancies

### Flag emoji

On Windows, all `:flag_xx:` emoji are rendered as two-letter international characters instead of a colorful flag like on the Apple ecosystem.

![](/images/blogimages/journey-in-native-unicode-emoji/flag-emoji-windows.png)

On Android 6, unknown flags are rendered as two-letter international characters.

<img srcset="/images/blogimages/journey-in-native-unicode-emoji/flag-emoji-android-6.png 2x">

On Android 7, unknown flags are rendered as white flags with blue question marks on them.

<img srcset="/images/blogimages/journey-in-native-unicode-emoji/flag-emoji-android-7.png 2x">


### Keycap emoji on Windows

Keycap (digit) emoji are a bit broken on Windows but appear to be fixed on Chrome 57+, 3️⃣4️⃣5️⃣

Browser | result
--- | ---
Chrome 55.0.2883.87 (64-bit) ❌ | ![](/images/blogimages/journey-in-native-unicode-emoji/keycap-chrome-55.0.2883.87.png)
Chrome 56.0.2924.87 (64-bit) ❌ | ![](/images/blogimages/journey-in-native-unicode-emoji/keycap-chrome-56.0.2924.87.png)
Chromium 57.0.2984.0 (64-bit) ✅ | ![](/images/blogimages/journey-in-native-unicode-emoji/keycap-chrome-57.0.2984.0.png)
Chrome 58.0.2999.4 (Official Build) canary (64-bit) ✅ | ![](/images/blogimages/journey-in-native-unicode-emoji/keycap-chrome-58.0.2999.4.png)


### Skin tone splitting from base emoji when width constrained

Starting in Chrome 60+ (maybe 59.1+), the [🤼🏿 `:wrestlers_toneX:` and 🤝🏿 `:handshake_toneX:` emoji started splitting/breaking into separate pieces](https://gitlab.com/gitlab-org/gitlab-ce/issues/37654) (base emoji and skin tone) when their container is width constrained, causing overflow/wrapping.

I created a [bug report on the Chromium tracker](https://bugs.chromium.org/p/chromium/issues/detail?id=764859) but it was closed a "WontFix" because the `wrestlers` and `handshake` emoji are no longer "classified as Emoji_Base" in the new International Components for Unicode (ICU) data which is used in Chrome.

It's understandable that those emoji are re-classified but they should display as two separate characters in all scenarios. The 🤼🏿 `:wrestlers_toneX:` emoji is consistently two characters now but the 🤝🏿 `handshake_toneX` still only splits when width constrained, which is pretty sketchy.

Check the comparison in these screenshots (or [demo for Chrome prior to 59.1](https://codepen.io/MadLittleMods/pen/dZMeXN)),

Windows 10 | macOS
--- | ---
![](/images/blogimages/journey-in-native-unicode-emoji/skin-tone-splitting-windows-10.png) | <img srcset="/images/blogimages/journey-in-native-unicode-emoji/skin-tone-splitting-macos.png 2x">


## Colliding with the object prototype `watch` function

I ran into a small gotcha where some code was looking in an object map for the `watch` ⌚ key. In Firefox, it was pulling [`Object.prototype.watch()`](https://developer.mozilla.org/en-US/docs/Archive/Web/JavaScript/Object.watch) and causing havoc.

```js
const emojiAliases = { foo: 'bar' };

// Expect `undefined` but got some function
emojiAliases['watch']
```

I fixed this code up by using the safe lookup [`Object.prototype.hasOwnProperty`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwnProperty),

```js
const emojiAliases = { foo: 'bar' };

Object.prototype.hasOwnProperty.call(emojiAliases, 'watch')
```

[`Object.prototype.watch()`](https://developer.mozilla.org/en-US/docs/Archive/Web/JavaScript/Object.watch) is now removed in Firefox 58 and the current stable release is Firefox 59.0.2 so you probably won't run into this yourself. But it's still advisable to use `Object.prototype.hasOwnProperty()` for any current/future collisions.


## Things to improve

### Custom emoji

We are working on adding custom emoji (with animated GIF support). You can track [this issue](https://gitlab.com/gitlab-org/gitlab-ce/issues/13931) and see our [current iteration here](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/14609). It's not merged yet because we need to ensure it works with [Geo replication](https://docs.gitlab.com/ee/administration/geo/index.html.


### Server-side rendered fallbacks

To speed up time to visible emoji (TTVE™ 😉) for people that have to fall back to image-based emoji, we could server-side render the fallback straight away.

In order to detect support from the server, on first page visit, we could set a cookie client-side (frontend JavaScript land) based on the unicode support map. Cookies are sent with each request and could be read on the server.

We have some layers of cache on our Markdown rendering which makes this a bit difficult to do as we would need a response for both the `true` and `false` emoji support. Or we could post-process every request and update the rendered markdown HTML accordingly.


### SVG fallbacks

Using the [EmojiOne SVG](https://github.com/emojione/emojione/tree/2.2.7/assets/svg) fallbacks would be a nice step above the `.png` images currently. This would save on bandwidth and we would get nice, crisp fallback emoji.

We could even take it a step further and extract SVGs from the OS specific fonts. For older versions of Windows, we could use the Windows 10 fonts so that everything has the appropriate signature black outline/stroke.

The EmojiOne SVGs fit nicely on macOS, so nothing to really change there.


### Improving performance

Currently, we have to bundle a large `digests.json` file into our JavaScript bundles to get the necessary asset digest hash information to serve fallback images.

For some quick-wins, we can remove those hashes to reduce the file size and serve the JSON payload async. There are some [more ideas in this issue](https://gitlab.com/gitlab-org/gitlab-ce/issues/39000).
