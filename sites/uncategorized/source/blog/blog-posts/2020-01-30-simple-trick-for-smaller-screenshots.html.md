---
title: "One simple trick to make your screenshots 80% smaller"
author: James Ramsay
author_gitlab: jramsay
categories: unfiltered
image_title: '/images/blogimages/png-compression/cover.jpg'
description: "How to compress your screenshots automatically with pngquant and zopfli"
tags: workflow

---

{::options parse_block_html="true" /}



**Updated 2020-02-03:** Added macOS Automator instructions.

I take screenshots every day to share with others in issues, blog posts, email, and
Slack. I like them to be crisp, high resolution, and importantly the image file size
should be as small as possible. Keeping the file size small means they are both
fast to upload and to download. This is particularly important when I am
writing a blog post or documentation.

Below is a quick primer on PNG compression, and instructions for completely
automating the process.

<figure class="video_container">
  <iframe src="https://www.youtube-nocookie.com/embed/_E1f0xXDU3g" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

When you capture a screenshot on your Mac, the image will be saved in the PNG-32
format, with support for 16 million distinct colors and transparency. This means
that the screenshot will perfectly capture every pixel on your screen, but
having four 8-bit channels for red, green, blue and alpha (transparency) for
every pixel makes the file very large. If you're interested, you can verify this
yourself using [pngcheck](http://www.libpng.org/pub/png/apps/pngcheck.html).

In practice, the subjects of my screenshots are buttons and forms, not
photographs.  While you might want 16 million colors for photos, we don't need them for screenshots, so we can take advantage of the PNG-8 format with its more compact 256 color palette.

## Lossy Compression: Color Quantization

The first step is to reduce the color palette of the screenshot. This is a type
of lossy compression called [color
quantization](https://en.wikipedia.org/wiki/Color_quantization), which will
reduce the number of distinct colors in the image. The
[pngquant](https://pngquant.org/) command line utility is the perfect tool for
this job, and if you've used the popular [ImageAlpha](https://pngmini.com/)
tool, you've already used the pngquant library.

```bash
# Install pngquant using Homebrew
brew install pngquant

# Quantize 32-bit RGBA PNG to 8-bit (or smaller) RGBA-palette
# pngquant [number of colors] [options] input.png
#   --skip-if-larger  only save converted file if they're smaller than original
#   --strip           remove optional metadata
#   --ext=.png        set output filename to be same as input filename
#   --force           overwrite existing output files
pngquant 256 --skip-if-larger --strip --ext=.png --force example.png
```

The screenshots below illustrate different levels of palette size reduction.

|PNG-32 (134KB)|256 colors (42KB)|128 colors (39KB)|64 colors (38KB)|
|---|---|---|---|
|[![Source PNG-32](/images/blogimages/png-compression/example.raw.png)](/images/blogimages/png-compression/example.raw.png)|[![256 colors](/images/blogimages/png-compression/example.256.png)](/images/blogimages/png-compression/example.256.png)|[![128 colors](/images/blogimages/png-compression/example.128.png)](/images/blogimages/png-compression/example.128.png)|[![64 colors](/images/blogimages/png-compression/example.64.png)](/images/blogimages/png-compression/example.64.png)|

|32 colors (37KB)|16 colors (29KB)|8 colors (22KB)|4 colors (16KB)|
|---|---|---|---|
|[![32 colors](/images/blogimages/png-compression/example.32.png)](/images/blogimages/png-compression/example.32.png)|[![16 colors](/images/blogimages/png-compression/example.16.png)](/images/blogimages/png-compression/example.16.png)|[![8 colors](/images/blogimages/png-compression/example.8.png)](/images/blogimages/png-compression/example.8.png)|[![4 colors](/images/blogimages/png-compression/example.4.png)](/images/blogimages/png-compression/example.4.png)|

I've observed for most screenshots you can comfortably reduce the color palette
to as few as 64 colors before the difference in image quality becomes noticeable. If you frequently take
screenshots of gradients or more complex images, you may want to stick with 256
colors to avoid noticeable artifacts.

## Lossless Compression: DEFLATE

The PNG image file format uses [DEFLATE](https://en.wikipedia.org/wiki/DEFLATE)
compression internally for an added layer of lossless compression, but most PNG
libraries do not implement aggressive lossless compression. This provides
another opportunity to reduce the file size further.

In 2013, Google released [zopfli](https://github.com/google/zopfli), which
claimed to **improve compression by 3-8% compared to `zlib`**. The trade off for
this improvement: waiting an extra 1-2 seconds. (There is no decompression
penalty when viewing the compressed image).

```bash
# Install zopfli using Homebrew, which includes zopflipng
brew install zopfli

# Optimize PNG compression
# zopflipng [options] input.png output.png
#   -y  do not ask about overwriting files
zopflipng -y example.png example.png
```

Relative to the massive savings from color quantization, improving lossless
compression provides a much smaller reduction, but in the context of pages with
many images these marginal gains do add up to worthwhile savings.

![Chart: file size savings](/images/blogimages/png-compression/chart.png)

## Automation

The trick is to make this happen automatically every time I capture a screenshot
using [Hazel](https://www.noodlesoft.com/) or
[Automator](https://support.apple.com/en-au/guide/automator/welcome/mac). This
allows you to run commands based on file events, like every time a new
screenshot is added to a directory.

A bonus trick, is to create a dedicated Screenshots directory, so that they
don't clutter your desktop. This is also easy:

```bash
# Create a Screenshots directory in the current users Home directory
mkdir -p "$HOME/Screenshots"

# Configure macOS to capture screenshots to this location
# If you want to revert this change, and save screenshots to your desktop,
# instead use "$HOME/Desktop"
defaults write com.apple.screencapture location "$HOME/Screenshots"
```

Using Hazel, add the Screenshots folder where newly captured screenshots will be
created, and create a new rule to compress files when they are added. Combining
the commands above, and using `$1` syntax to access the filename argument passed
by Hazel, the final script is:

```bash
pngquant 64 --skip-if-larger --strip --ext=.png --force "$1"
zopflipng -y "$1" "$1"
```

Alternatively, using Automator, create a new **Folder Action** that receives
notifications from the Screenshots folder. Add a **Run Shell Script** block, and
make sure to **Pass input as arguments**. Combining the commands above, and this
time using `$@` syntax to handle multiple arguments, and absolute paths for
pngquant and zopflipng, the final script is:

```bash
for f in "$@"
do
  /usr/local/bin/pngquant 64 --skip-if-larger --strip --ext=.png --force "$f"
  /usr/local/bin/zopflipng -y "$f" "$f"
done
```

Here's a screenshot of my configuration.

| Hazel | Automator |
|---|---|
| [![Hazel Screenshot Compression Rule](/images/blogimages/png-compression/hazel.png)](/images/blogimages/png-compression/hazel.png) | [![Automator Screenshot Compression Action](/images/blogimages/png-compression/automator.png)](/images/blogimages/png-compression/automator.png) |

My final trick, is to add the Screenshots folder to my Dock for easy access.
This is achieved by dragging the Screenshots folder from Finder to your Dock.

## Summary

The PNG file format is great for screenshots, but the defaults output is too
large for sharing on the internet. Instead of using ImageAlpha and ImageOptim to
compress your screenshots by hand, you can use Hazel to automate this to
regularly yield file size reductions of 80%.

If you know of compression tricks, or alternatives that work on Windows or
Linux, let me know below in the comments!

Cover image by [Emmy Smith](https://unsplash.com/@emsmith) on [Unsplash](https://unsplash.com/photos/LEjEst7lLfU)
{: .note}
